<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('utilisateurs', function (Blueprint $table) {
            $table->id();
            $table->string('image')->nullable(); 
            $table->string('prenom', 50);
            $table->string('nom', 50);
            $table->string('email', 50)->unique();
            $table->string('tel', 10)->unique();
            $table->date('date_de_naissance');
            $table->unsignedBigInteger('role_id')->nullable();
            
            $table->foreign('role_id')->references('id')->on('roles')->onDelete('cascade');
            $table->string('reponse')->nullable();
            $table->timestamps();
            $table->boolean('is_active')->default(true);
            $table->string('password');
        });
    }

    public function down(): void {
        Schema::dropIfExists('utilisateurs');
    }
};
