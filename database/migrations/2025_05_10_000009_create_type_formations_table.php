<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('type_formations', function (Blueprint $table) {
            $table->id();
            $table->string('nom', 100);
            $table->string('type_document')->nullable();
            $table->timestamps();
            
        });
    }

    public function down(): void {
        Schema::dropIfExists('type_formations');
    }
};
