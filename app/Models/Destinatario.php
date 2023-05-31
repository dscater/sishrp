<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

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

    protected $appends = ["elimina", "edita"];

    public function getEliminaAttribute()
    {
        if (Auth::user()->tipo == 'SUPER USUARIO') {
            return "si";
        }

        if (Auth::user()->user_id == $this->user_id) {
            return "si";
        }

        return "no";
    }

    public function getEditaAttribute()
    {
        if (Auth::user()->tipo == 'SUPER USUARIO') {
            return "si";
        }

        if (Auth::user()->user_id == $this->user_id) {
            return "si";
        }

        return "no";
    }
}
