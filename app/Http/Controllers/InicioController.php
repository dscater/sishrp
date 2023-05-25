<?php

namespace App\Http\Controllers;

use App\Models\Slider;
use Illuminate\Http\Request;

class InicioController extends Controller
{
    public function index()
    {
        $sliders = Slider::all();
        return view("portal.inicio", compact("sliders"));
    }
}
