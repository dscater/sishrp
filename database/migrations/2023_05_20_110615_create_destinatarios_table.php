<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDestinatariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('destinatarios', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("hoja_ruta_id");
            $table->string("destinatario", 255);
            $table->integer("informe");
            $table->integer("asista");
            $table->integer("responda");
            $table->integer("ejecute");
            $table->integer("difunda");
            $table->integer("coordine");
            $table->integer("ver_antecedente");
            $table->integer("acelere_tramite");
            $table->integer("para_conocimiento");
            $table->integer("archivo");
            $table->text("descripcion");
            $table->date("fecha");
            $table->timestamps();

            $table->foreign("hoja_ruta_id")->on("hoja_rutas")->references("id")->onDelete("cascade");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('destinatarios');
    }
}
