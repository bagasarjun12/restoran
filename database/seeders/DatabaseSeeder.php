<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $roles = ['manager', 'waitress', 'kasir', 'chef'];
        foreach ($roles as $role) {
            User::create([
                'name' => ucfirst($role), // Nama sesuai role, misal: Manager, Waitress, dll
                'email' => $role . '@example.com', // Email unik untuk tiap role
                'role' => $role,
                'password' => Hash::make('123'), // Hash password '123'
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
