<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HojaRuta extends Model
{
    use HasFactory;

    protected $fillable = [
        "procedencia",
        "referencia",
        "fecha_recepcion",
        "hora",
        "nro_hojas",
        "nro_hoja_ruta",
        "fecha_registro",
    ];
}
