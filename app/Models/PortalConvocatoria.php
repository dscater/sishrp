<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PortalConvocatoria extends Model
{
    use HasFactory;

    protected $fillable = [
        "titulo",
        "descripcion",
        "archivo",
        "tipo",
        "fecha_registro",
    ];

    protected $appends = ["url_archivo"];

    public function getUrlArchivoAttribute()
    {
        if ($this->archivo != "") {
            return asset("files/portal/" . $this->archivo);
        }
        return false;
    }
}
