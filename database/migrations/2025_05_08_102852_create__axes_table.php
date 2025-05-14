<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
       // Types de sous domaines = axes HARDSKILLS
        // Types de sous domaines = axes DE SOFTSKILLS
      //.....

Schema::create('axes', function (Blueprint $table) {
    $table->id();
    $table->string('nom');
    $table->text('description')->nullable();
    $table->timestamps();
});
 Schema::create('domaines', function (Blueprint $table) {
                $table->id(); // Use the default 'id' as the primary key
                $table->string('nom')->unique();
                $table->timestamps();
            });     
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('domaines');
        Schema::dropIfExists('axes');
    }
};
