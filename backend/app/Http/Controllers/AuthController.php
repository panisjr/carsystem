<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
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
        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }
    public function signUp(Request $request)
    {
        // Check if an existing user with the provided email and deactivated status exists
        $existingDeactivatedUser = User::where('email', $request->email)->where('status', 'deactivated')->first();

        // Check if an existing user with the provided email and active status exists
        $existingActiveUser = User::where('email', $request->email)->where('status', 'active')->first();

        if ($existingActiveUser) {
            // If an active user with the provided email exists, return an error response
            return response()->json([
                'success' => false,
                'message' => 'A user with this email already exists and is active.',
            ], 422);
        }

        if ($existingDeactivatedUser) {
            // If a deactivated user with the provided email exists, create a new account using the same email
            $userData = $request->only(['firstname', 'middlename', 'lastname', 'email', 'contact', 'password', 'role']);

            // Create new user without validation
            $user = User::create($userData);

            return response()->json([
                'success' => true,
                'message' => 'User created successfully',
                'data' => $user,
            ]);
        }

        // If no deactivated user with the provided email exists and there's no active user, perform the regular validation

        $validator = Validator::make($request->all(), [
            'firstname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|not_regex:/[^\x00-\x7F]+/|max:255',
            'middlename' => 'nullable|regex:/^[A-Z]\.$/|not_regex:/[^\x00-\x7F]+/|max:2',
            'lastname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|max:255',
            'email' => 'required|email|max:255|unique:users',
            'contact' => ['string', 'regex:/^09\d{9}$/', 'max:11'], // Regular expression for Philippine number starting with 09
            'password' => 'required|string|min:8|max:20|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]*$/|not_regex:/[^\x00-\x7F]+/',
            'confirm_password' => 'required|string|same:password',
            'role' => ['required', Rule::in(['Admin', 'Customer'])],
        ]);


        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed! Make sure to fill the fields properly.',
                'errors' => $validator->errors(),
            ], 422);
        }

        // Only include fields that should be stored in the database
        $userData = $request->only(['firstname', 'middlename', 'lastname', 'email', 'contact', 'password', 'role']);

        // Create new user
        $user = User::create($userData);

        return response()->json([
            'success' => true,
            'message' => 'User created successfully',
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
        $user = JWTAuth::user();
        return response()->json([
            'access_token' => $token,
            'user'=>$user,
            'token_type' => 'bearer',
            'expires_in' => JWTAuth::factory()->getTTL() * 60
        ]);
    }
}
