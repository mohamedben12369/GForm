<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('formation_formateur', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('formation_id');
            $table->unsignedBigInteger('formateur_id');
$table->timestamps();

            // Clés étrangères
            $table->foreign('formation_id')->references('id')->on('formations')->onDelete('cascade');
            $table->foreign('formateur_id')->references('id')->on('formateurs')->onDelete('cascade');
        });
    }

    public function down(): void {
        Schema::dropIfExists('formation_formateur');
    }
};
