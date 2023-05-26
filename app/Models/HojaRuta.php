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
        "user_id"
    ];

    public function destinatarios()
    {
        return $this->hasMany(Destinatario::class, 'hoja_ruta_id');
    }

    public static function getNroHojaRuta()
    {
        $nro = 1;
        $last = HojaRuta::orderBy("nro_hoja_ruta", "asc")->get()->last();
        if ($last) {
            $nro = (int)$last->nro_hoja_ruta + 1;
        }
        return $nro;
    }
}
