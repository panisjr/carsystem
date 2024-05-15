<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth:api', ['except' => ['login']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function signIn()
    {

        $credentials = request(['email', 'password']);

        // Fetch all users with the provided email
        $users = User::where('email', $credentials['email'])->get();

        // Check if there's an Active user
        $activeUser = $users->firstWhere('status', 'Active');
        // Check if any user with the email exists
        if ($users->isEmpty()) {
            return response()->json([
                'status' => false,
                'code' => 404,
            ]);
        }
        if (!$activeUser) {
            // If no Active user found
            return response()->json([
                'status' => false,
                'code' => 403,
            ]);
        }
        // Attempt login with the credentials
        try {
            if (!JWTAuth::attempt($credentials)) {
                return response()->json([
                    'status' => false,
                    'code' => 402,
                ]);
            }
        } catch (JWTException $e) {
            $response['status'] = 0;
            $response['code'] = 500;
            $response['message'] = 'Could not create token';
            return response()->json($response);
        }

        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }
    public function signUp(Request $request)
    {
        // Check if an existing user with the provided email and deactivated status exists
        $existingDeactivatedUser = User::where('email', $request->email)->where('status', 'deactivated')->first();
        // Check if an existing user with the provided email and Active status exists
        $existingActiveUser = User::where('email', $request->email)->where('status', 'Active')->first();
        // Perform the regular validation
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|not_regex:/[^\x00-\x7F]+/|max:255',
            'middlename' => 'nullable|regex:/^[A-Z]\.$/|not_regex:/[^\x00-\x7F]+/|max:2',
            'lastname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|max:255',
            'email' => 'required|email|regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
            'contact' => 'required|string|max:11|regex:/^09\d{9}$/', // Regular expression for Philippine number starting with 09
            'password' => 'required|string|min:8|max:20|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]*$/|not_regex:/[^\x00-\x7F]+/',
            'confirm_password' => 'required|string|same:password',
            'role' => ['required', Rule::in(['Admin', 'Customer'])],
            'profileFile' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust validation rules as per your requirements
        ]);
        if ($existingActiveUser) {
            // If an Active user with the provided email exists, return an error response
            return response()->json([
                'success' => false,
                'message' => 'A user with this email already exists and is Active.',
            ], 422);
        }
        if ($existingDeactivatedUser) {
            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation failed Make sure to fill the .',
                    'errors' => $validator->errors(),
                ], 422);
            }
            // Store the file
            $uploadedFile = $request->file('profileFile');

            // Check if a file was uploaded
            if ($uploadedFile !== null) {
                // Process the file if it exists
                $fileName = time() . '_' . $uploadedFile->getClientOriginalName();
                $filePath = $uploadedFile->storeAs('uploads', $fileName);
            } else {
                // If no file was uploaded, set the file path to null or an empty string
                $filePath = null; // Or you can set it to an empty string depending on your requirements
            }

            // Only include fields that should be stored in the database
            $userData = $request->only(['firstname', 'middlename', 'lastname', 'email', 'contact', 'password', 'role']);
            // Add the file path to the user data
            $userData['profileFile'] = $filePath;
            // Create new user
            $user = User::create($userData);
            return response()->json([
                'file_path' => $filePath,
                'success' => true,
                'message' => 'User created successfully.',
                'data' => $user,
            ]);
        }
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed Make sure to fill the fields.',
                'errors' => $validator->errors(),
            ], 422);
        }
        $uploadedFile = $request->file('profileFile');

        // Check if a file was uploaded
        if ($uploadedFile !== null) {
            // Process the file if it exists
            $fileName = time() . '_' . $uploadedFile->getClientOriginalName();
            $filePath = $uploadedFile->storeAs('uploads', $fileName);
        } else {
            // If no file was uploaded, set the file path to null or an empty string
            $filePath = null; // Or you can set it to an empty string depending on your requirements
        }

        // Only include fields that should be stored in the database
        $userData = $request->only(['firstname', 'middlename', 'lastname', 'email', 'contact', 'password', 'role']);
        // Add the file path to the user data
        $userData['profileFile'] = $filePath;
        // Create new user
        $user = User::create($userData);
        return response()->json([
            'file_path' => $filePath,
            'success' => true,
            'message' => 'User created successfully.',
            'data' => $user,
        ]);
    }
    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }
    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();
        return response()->json(['message' => 'Successfully logged out']);
    }
    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(JWTAuth::refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        // Extract user data from the token
        $user = JWTAuth::user();

        // Calculate token expiration time (in seconds)
        $expiration = JWTAuth::factory()->getTTL() * 60; // Convert minutes to seconds

        // Return the JWT token as a string and set it in a cookie
        return response()->json([
            'access_token' => $token,
            'expires_in' => $expiration,
            'user' => $user,
            'token_type' => 'bearer',
        ])->cookie('access_token', $token, $expiration, null, null, false, true);
    }
}
