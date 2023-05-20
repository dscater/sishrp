<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePortalGamyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('portal_gamy', function (Blueprint $table) {
            $table->id();
            $table->text("mision");
            $table->string("img_mision", 255)->nullable();
            $table->text("vision");
            $table->string("img_vision", 255)->nullable();
            $table->text("historia");
            $table->string("img_historia", 255)->nullable();
            $table->date("fecha_registro");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('portal_gamy');
    }
}
