<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;

    protected $fillable = ["imagen"];

    protected $appends = ["url_imagen"];

    public function getUrlImagenAttribute()
    {
        return $this->imagen && trim($this->imagen != "") ? asset("imgs/sliders/" . $this->imagen) : asset("imgs/sliders/default.png");
    }
}
