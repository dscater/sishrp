<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Destinatario extends Model
{
    use HasFactory;
    protected $fillable = [
        "hoja_ruta_id",
        "destinatario",
        "informe",
        "asista",
        "responda",
        "ejecute",
        "difunda",
        "coordine",
        "ver_antecedente",
        "acelere_tramite",
        "para_conocimiento",
        "archivo",
        "descripcion",
        "fecha",
        "user_id"
    ];
}
