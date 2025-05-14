<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SecuriteQuestionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('securite_question')->insert([
            ['question' => 'What is your mother’s maiden name?'],
            ['question' => 'What was the name of your first pet?'],
            ['question' => 'What was the make of your first car?'],
            ['question' => 'What is your favorite book?'],
            ['question' => 'What city were you born in?']
        ]);
    }
}
