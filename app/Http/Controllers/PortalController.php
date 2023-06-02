<?php

namespace App\Http\Controllers;

use App\Models\PortalGamy;
use Illuminate\Http\Request;

class PortalController extends Controller
{
    public function gamy()
    {
        $portal_gamy = PortalGamy::first();
        return view("portal.gamy", compact("portal_gamy"));
    }
}
