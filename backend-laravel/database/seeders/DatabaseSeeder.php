<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Product;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Create demo user
        User::create([
            'name' => 'Ahmed',
            'email' => 'ahmed@gmail.com',
            'password' => Hash::make('ahmed123'),
        ]);

        // Create sample products
        Product::create([
            'name' => 'Selada',
            'price' => 5000,
            'description' => 'Selada segar untuk salad',
        ]);

        Product::create([
            'name' => 'Kangkung',
            'price' => 3000,
            'description' => 'Kangkung hijau segar',
        ]);
    }
}
