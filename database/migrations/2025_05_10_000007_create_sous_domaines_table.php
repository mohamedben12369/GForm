<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('sous_domaines', function (Blueprint $table) {
               $table->id();
            $table->string('code', 10)->unique();
            $table->string('description', 255)->nullable();
            $table->unsignedBigInteger('domaine_code');
            $table->foreign('domaine_code')->references('id')->on('domaines')->onDelete('cascade');
            $table->timestamps();
            $table->unsignedBigInteger('axes_id');

            $table->foreign('axes_id')
                  ->references('id')
                  ->on('axes')
                  ->onDelete('cascade');
        });
    }
    
    public function down(): void {
     
            Schema::table('sous_domaines', function (Blueprint $table) {
                $table->dropForeign(['axes_id']);
                $table->dropColumn('axes_id');
                $table->dropForeign(['domaine_code']);
                $table->dropColumn('domaine_code');
            });

        Schema::dropIfExists('sous_domaines');
    }
};
