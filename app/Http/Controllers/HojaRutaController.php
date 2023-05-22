<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\HojaRuta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HojaRutaController extends Controller
{
    public $validacion = [
        'hoja_ruta' => 'required|min:2',
    ];

    public $mensajes = [];

    public function index(Request $request)
    {
        $hoja_rutas = HojaRuta::all();
        return response()->JSON(['hoja_rutas' => $hoja_rutas, 'total' => count($hoja_rutas)], 200);
    }

    public function getHojaRutas()
    {
        $hoja_rutas = HojaRuta::all();
        return response()->JSON(['hoja_rutas' => $hoja_rutas, 'total' => count($hoja_rutas)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            // crear HojaRuta
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_hoja_ruta = HojaRuta::create(array_map('mb_strtoupper', $request->all()));

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_hoja_ruta, "hoja_rutas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA HOJA DE RUTA',
                'datos_original' => $datos_original,
                'modulo' => 'HOJA DE RUTAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'hoja_ruta' => $nuevo_hoja_ruta,
                'msj' => 'El registro se realizó de forma correcta',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function update(Request $request, HojaRuta $hoja_ruta)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($hoja_ruta, "hoja_rutas");
            $hoja_ruta->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($hoja_ruta, "hoja_rutas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA HOJA DE RUTA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'HOJA DE RUTAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'hoja_ruta' => $hoja_ruta,
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

    public function show(HojaRuta $hoja_ruta)
    {
        return response()->JSON([
            'sw' => true,
            'hoja_ruta' => $hoja_ruta
        ], 200);
    }

    public function destroy(HojaRuta $hoja_ruta)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($hoja_ruta, "hoja_rutas");
            $hoja_ruta->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA HOJA DE RUTA',
                'datos_original' => $datos_original,
                'modulo' => 'HOJA DE RUTAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'msj' => 'El registro se eliminó correctamente'
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
