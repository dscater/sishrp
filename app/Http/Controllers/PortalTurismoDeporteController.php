<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PortalTurismoDeporte;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PortalTurismoDeporteController extends Controller
{
    public function index()
    {
        $existe = PortalTurismoDeporte::first();
        if (!$existe) {
            $existe = PortalTurismoDeporte::create([
                "link_turismo" => "https://www.google.com/",
                "link_deportes" => "https://www.google.com/"
            ]);
        }
        return response()->JSON($existe);
    }

    public function update(PortalTurismoDeporte $portal_turismo_deporte, Request $request)
    {
        $request->validate([
            "link_turismo" => "required",
            "link_deportes" => "required",
        ], [
            "link_turismo.required" => "Este campo es obligatorio",
            "link_deportes.required" => "Este campo es obligatorio",
        ]);

        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_turismo_deporte, "portal_turismo_deportes");
            $portal_turismo_deporte->update($request->all());
            $datos_nuevo = HistorialAccion::getDetalleRegistro($portal_turismo_deporte, "portal_turismo_deportes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ EL LINK DE TURISMO Y DEPORTES',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'TURISMO Y DEPORTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_turismo_deporte' => $portal_turismo_deporte,
                'msj' => 'El registro se actualizó de forma correcta'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
