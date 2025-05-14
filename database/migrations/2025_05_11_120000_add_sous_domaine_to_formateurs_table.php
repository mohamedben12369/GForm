<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('formateurs', function (Blueprint $table) {
            if (!Schema::hasColumn('formateurs', 'sous_domaine_id')) {
                $table->string('sous_domaine_id', 10)->nullable();
                $table->foreign('sous_domaine_id')->references('code')->on('sous_domaines')->onDelete('cascade');
            }
        });

        Schema::create('formateur_sousdomaine', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('formateur_id');
            $table->string('sous_domaine_id', 10);
            $table->foreign('formateur_id')->references('id')->on('formateurs')->onDelete('cascade');
            $table->foreign('sous_domaine_id')->references('code')->on('sous_domaines')->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::table('formateurs', function (Blueprint $table) {
            $table->dropForeign(['sous_domaine_id']);
            $table->dropColumn('sous_domaine_id');
        });

        Schema::dropIfExists('formateur_sousdomaine');
    }
};
