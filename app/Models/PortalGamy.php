<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PortalGamy extends Model
{
    use HasFactory;

    protected $table = "portal_gamy";

    protected $fillable = [
        "mision",
        "img_mision",
        "vision",
        "img_vision",
        "historia",
        "img_historia",
        "fecha_registro",
    ];

    protected $appends = ["url_img_mision", "url_img_vision", "url_img_historia"];

    public function getUrlImgMisionAttribute()
    {
        if ($this->img_mision) {
            return asset("imgs/gamy/" . $this->img_mision);
        }
        return false;
    }

    public function getUrlImgVisionAttribute()
    {
        if ($this->img_vision) {
            return asset("imgs/gamy/" . $this->img_vision);
        }
        return false;
    }
    public function getUrlImgHistoriaAttribute()
    {
        if ($this->img_historia) {
            return asset("imgs/gamy/" . $this->img_historia);
        }
        return false;
    }
}
