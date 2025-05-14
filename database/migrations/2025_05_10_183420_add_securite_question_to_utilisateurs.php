<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('utilisateurs', function (Blueprint $table) {
            if (!Schema::hasColumn('utilisateurs', 'securite_question_id')) {
                $table->unsignedBigInteger('securite_question_id')->nullable();
                $table->foreign('securite_question_id')->references('id')->on('securite_question')->onDelete('cascade');
            }
            if (!Schema::hasColumn('utilisateurs', 'reponse')) {
                $table->string('reponse')->nullable();
            }
        });
    }

    public function down(): void {
        Schema::table('utilisateurs', function (Blueprint $table) {
            $table->dropForeign(['securite_question_id']);
            $table->dropColumn('securite_question_id');
            $table->dropColumn('reponse');
        });
    }
};
