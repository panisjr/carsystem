<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule; // Import Rule class for validation
use Illuminate\Support\Facades\Validator; // Import Validator class for validation
use App\Models\User;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    protected $user;

    public function __construct()
    {
        $this->user = new User();
    }

    public function getUsers()
    {
        return $this->user->all();
    }
    public function getTotal()
    {
        $totalUsers = User::count();
        $totalCars = Car::count();
        return response()->json(['totalUsers' => $totalUsers ,'totalCars' => $totalCars]);
    }
    public function todayRegisteredUsersCount()
    {
        $today = Carbon::now()->toDateString();
        $count = User::whereDate('created_at', $today)->count();
        return response()->json(['count' => $count]);
    }

    public function store(Request $request)
    {
        // Check if an existing user with the provided email and Deactivated status exists
        $existingDeactivatedUser = User::where('email', $request->email)->where('status', 'Deactivated')->first();

        // Check if an existing user with the provided email and Active status exists
        $existingActiveUser = User::where('email', $request->email)->where('status', 'Active')->first();

        if ($existingActiveUser) {
            // If an Active user with the provided email exists, return an error response
            return response()->json([
                'success' => false,
                'message' => 'A user with this email already exists and is Active.',
            ], 422);
        }

        if ($existingDeactivatedUser) {
            // If a Deactivated user with the provided email exists, create a new account using the same email
            $userData = $request->only(['firstname', 'middlename', 'lastname', 'email', 'contact', 'password', 'role', 'profile']);

            // Create new user without validation
            $user = User::create($userData);
            // Fetch the ID from the created user
            return response()->json([
                'success' => true,
                'message' => 'User created successfully.',
                'data' => $user,
            ]);
        }

        // If no Deactivated user with the provided email exists and there's no Active user, perform the regular validation

        $validator = Validator::make($request->all(), [
            'firstname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|not_regex:/[^\x00-\x7F]+/|max:255',
            'middlename' => 'nullable|regex:/^[A-Z]\.$/|not_regex:/[^\x00-\x7F]+/|max:2',
            'lastname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|max:255',
            'email' => 'required|email|regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
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
        // Validate the request
        $request->validate([
            'file' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust validation rules as per your requirements
        ]);

        // Store the file
        $uploadedFile = $request->file('file');
        $fileName = time() . '_' . $uploadedFile->getClientOriginalName();
        $filePath = $uploadedFile->storeAs('uploads', $fileName);

        // Only include fields that should be stored in the database
        $userData = $request->only(['firstname', 'middlename', 'lastname', 'email', 'contact', 'password', 'role']);

        // Add the file path to the user data
        $userData['profile'] = $filePath;

        // Create new user
        $user = User::create($userData);

        return response()->json([
            'file_path' => $filePath,
            'success' => true,
            'message' => 'User created successfully.',
            'data' => $user,
        ]);
    }

    public function show(string $id)
    {
        $user = $this->user->find($id);

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $user,
        ]);
    }
    public function updateUser(Request $request, string $id)
    {
        $user = $this->user->findOrFail($id);
        // Check if the user being updated is the currently authenticated user
        if (Auth::id() == $user->id) {
            // Logout the user
            Auth::logout();
            return response()->json([
                'success' => false,
                'message' => 'You cannot update your own account. You have been logged out.',
            ], 401);
        }

        $validator = Validator::make($request->all(), [
            'firstname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|not_regex:/[^\x00-\x7F]+/|max:255',
            'middlename' => 'nullable|regex:/^[A-Z]\.$/|not_regex:/[^\x00-\x7F]+/|max:2',
            'lastname' => 'required|regex:/^[a-zA-Z\s\-\.]+$/|not_regex:/[^\x00-\x7F]+/|max:255',
            'email' => 'required|email|regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
            'contact' => 'required|string|max:11|regex:/^09\d{9}$/', // Regular expression for Philippine number starting with 09
            'role' => ['required', Rule::in(['Admin', 'Customer'])],
            'profileFile' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Adjust validation rules as per your requirements
        ]);
        // Check if email already exists
        if (User::where('email', $request->email)->where('id', '!=', $id)->exists()) {
            return response()->json([
                'success' => false,
                'message' => 'Email already exists!',
            ], 422);
        }
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed! Make sure to fill the fields properly.',
                'errors' => $validator->errors(),
            ], 422);
        }
        // Store the file
        $uploadedFile = $request->file('profileFile'); // Ensure this matches the key used in formData.append in Angular
        $fileName = time() . '_' . $uploadedFile->getClientOriginalName(null);
        $filePath = $uploadedFile->storeAs('uploads', $fileName);
        // Only include fields that should be stored in the database
        $userData = $request->fill(['firstname', 'middlename', 'lastname', 'email', 'contact', 'password', 'role', 'profileFile']);
        // Add the file path to the user data
        $userData['profileFile'] = $filePath;
        // Create new user
        $userData->save();

        return response()->json([
            'success' => true,
            'message' => 'User Updated successfully',
            'data' => $user,
        ]);
    }
    public function deleteUser(string $id)
    {
        $user = $this->user->find($id);

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found',
            ], 404);
        }

        // Retrieve the ID of the currently logged-in user using your preferred method
        // For example, if you store the user ID in the session:
        $currentUserId = session()->get('user_id');

        if ($user->id === $currentUserId) {
            return response()->json([
                'success' => false,
                'message' => 'User cannot delete their own account',
            ], 403);
        }

        $user->delete();

        return response()->json([
            'success' => true,
            'message' => 'User Deleted Successfully',
            'data' => $user
        ]);
    }

    public function deactivate(Request $request, string $id)
    {
        // Find the user by ID
        $user = $this->user->findOrFail($id);

        // Check if the user was found
        if ($user) {
            // Check if the user is being Deactivated and there is an Active user with the same email
            if ($user->status === "Deactivated" && User::where('email', $user->email)->where('status', 'Active')->exists()) {
                return response()->json([
                    'success' => false,
                    'message' => 'You must delete the existing email with status of Active first before reactivating the user.',
                ], 422);
            }

            // Toggle the user's status
            $user->status = $user->status === "Active" ? "Deactivated" : "Active";

            // Save the updated user
            $user->save();

            return response()->json([
                'success' => true,
                'message' => 'User ' . ($user->status === "Active" ? 'Active' : 'Deactivated') . ' successfully!',
                'data' => $user,
            ]);
        }

        // If the user was not found, return a 404 response
        return response()->json([
            'success' => false,
            'message' => 'User not found',
        ], 404);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        // Fetch all users with the provided email
        $users = User::where('email', $credentials['email'])->get();

        // Check if any user with the email exists
        if ($users->isEmpty()) {
            $response['status'] = 0;
            $response['code'] = 404;
            $response['message'] = 'Email not found';
            return response()->json($response);
        }
        // Check if there's an Active user
        $activeUser = $users->firstWhere('status', 'Active');

        if (!$activeUser) {
            // If no Active user found
            $response['status'] = 0;
            $response['code'] = 403; // Forbidden status code
            $response['message'] = 'No Active user found with this email';
            return response()->json($response);
        }
        // Attempt login with the credentials
        try {
            if (!JWTAuth::attempt($credentials)) {
                $response['status'] = 0;
                $response['code'] = 401;
                $response['message'] = 'Email or Password is Incorrect';
                return response()->json($response);
            }
        } catch (JWTException $e) {
            $response['status'] = 0;
            $response['code'] = 500;
            $response['message'] = 'Could not create token';
            return response()->json($response);
        }

        $user = auth()->user();
        $token = JWTAuth::fromUser($user);

        $response['data'] = [
            'id' => $user->id,
            'token' => $token,
            'role' => $user->role,
            'firstname' => $user->firstname,
            'status' => $user->status
        ];
        $response['status'] = 1;
        $response['code'] = 200;
        $response['message'] = 'Login Successfully';
        return response()->json($response);
    }

    // Store History
    public function history(Request $request)
    {
        $validatedData = $request->validate([
            'action' => 'required| string',
            'user_id' => 'required| integer',
            'accountID' => 'required| integer',
            'accountFirst' => 'required| string',
            'accountLast' => 'required| string',
            'accountRole' => 'required| string',
        ]);

        DB::table('history')->insert([
            'action_type' => $validatedData['action'],
            'user_id' => $validatedData['user_id'],
            'account_id' => $validatedData['accountID'],
            'account_first' => $validatedData['accountFirst'],
            'account_last' => $validatedData['accountLast'],
            'account_role' => $validatedData['accountRole'],
            'created_at' => now()->format('M d, Y - h:i A'), // Optional: Use current timestamp
        ]);
        // Return a success response
        return response()->json(['message' => 'Action logged successfully'], 200);
    }
    public function getHistory()
    {
        // Fetch history history from the database
        $history = DB::table('history')->orderBy('created_at', 'desc')->get();
        $totalHistory = DB::table('history')->count();

        return response()->json(['history' => $history, 'totalHistory' => $totalHistory]);
    }
    // Delete History
    public function deleteHistory(string $id)
    {
        $history = DB::table('history')->find($id);

        if (!$history) {
            return response()->json([
                'status' => false,
                'message' => 'History not found.'
            ], 404);
        }
        DB::table('history')->where('id', $id)->delete();
        return response()->json([
            'status' => false,
            'message' => 'History Delete Successfully!'
        ], 200);
    }
    // Delete All History
    public function deleteAllHistory()
    {
        try {
            DB::table('history')->delete();
            return response()->json([
                'status' => true,
                'message' => "All History Deleted Successfully!"
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => 'Failed to delete all history records.'
            ], 500);
        }
    }
}
