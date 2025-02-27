<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function me(){
        $user = Auth::user();
        return response(['data' => $user, 'role' => $user->role]);
    }

    public function login(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();
 
        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        $user->tokens()->delete();
        $user->token = $user->createToken('token')->plainTextToken;

        return response(['data' => $user]);
        // $user->tokens()->delete();
        // return $user->createToken('token')->plainTextToken;
    }

    public function createToken(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $user2 = 'tes';
        $user = User::where('email', $request->email)->first();
 
        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }
        $user->tokens()->delete();
        return $user->createToken('token')->plainTextToken;

        // return "berhasil login";
    }

    public function logout(){
        $user = auth()->user();
        // Revoke all tokens...
        $user->tokens()->delete();
        return response(['message' => 'Logout Berhasil']);
    }

}
