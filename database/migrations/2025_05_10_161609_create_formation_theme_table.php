<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('formation_theme', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('formation_id');
            $table->unsignedBigInteger('theme_id');

            // Clés étrangères
            $table->foreign('formation_id')->references('id')->on('formations')->onDelete('cascade');
            $table->foreign('theme_id')->references('idtheme')->on('theme_formations')->onDelete('cascade');
        });
    }

    public function down(): void {
        Schema::dropIfExists('formation_theme');
    }
};
