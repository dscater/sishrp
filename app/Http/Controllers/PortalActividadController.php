<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PortalActividad;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PortalActividadController extends Controller
{
    public $validacion = [
        'titulo' => 'required|min:2',
    ];

    public $mensajes = [];

    public function index(Request $request)
    {
        $portal_actividads = PortalActividad::all();
        return response()->JSON(['portal_actividads' => $portal_actividads, 'total' => count($portal_actividads)], 200);
    }

    public function getPortalActividads()
    {
        $portal_actividads = PortalActividad::all();
        return response()->JSON(['portal_actividads' => $portal_actividads, 'total' => count($portal_actividads)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            // crear PortalActividad
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_portal_actividad = PortalActividad::create(array_map('mb_strtoupper', $request->except("archivo")));
            if ($request->hasFile("archivo")) {
                $imagenes = ["jpg", "jpeg", "png", "gif", "webp"];
                $file = $request->file("archivo");
                $extension = $file->getClientOriginalExtension();
                $nuevo_portal_actividad->tipo = "ARCHIVO";
                $nom_file = $nuevo_portal_actividad->id . time() . "." . $extension;
                if (in_array($extension, $imagenes)) {
                    $nuevo_portal_actividad->tipo = "IMAGEN";
                }
                $file->move(public_path() . "/files/portal", $nom_file);
                $nuevo_portal_actividad->archivo = $nom_file;
            }
            $nuevo_portal_actividad->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_portal_actividad, "portal_actividads");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA ACTIVIDAD',
                'datos_original' => $datos_original,
                'modulo' => 'ACTIVIDADES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_actividad' => $nuevo_portal_actividad,
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

    public function update(Request $request, PortalActividad $portal_actividad)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_actividad, "portal_actividads");
            $portal_actividad->update(array_map('mb_strtoupper', $request->except("archivo")));
            if ($request->hasFile("archivo")) {
                if ($portal_actividad->archivo != '') {
                    \File::delete(public_path() . "/files/portal/" . $portal_actividad->archivo);
                }
                $imagenes = ["jpg", "jpeg", "png", "gif", "webp"];
                $file = $request->file("archivo");
                $extension = $file->getClientOriginalExtension();
                $portal_actividad->tipo = "ARCHIVO";
                $nom_file = $portal_actividad->id . time() . "." . $extension;
                if (in_array($extension, $imagenes)) {
                    $portal_actividad->tipo = "IMAGEN";
                }
                $file->move(public_path() . "/files/portal", $nom_file);
                $portal_actividad->archivo = $nom_file;
            }
            $portal_actividad->save();
            $datos_nuevo = HistorialAccion::getDetalleRegistro($portal_actividad, "portal_actividads");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA ACTIVIDAD',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'ACTIVIDADES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_actividad' => $portal_actividad,
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

    public function show(PortalActividad $portal_actividad)
    {
        return response()->JSON([
            'sw' => true,
            'portal_actividad' => $portal_actividad
        ], 200);
    }

    public function destroy(PortalActividad $portal_actividad)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_actividad, "portal_actividads");
            if ($portal_actividad->archivo != '') {
                \File::delete(public_path() . "/files/portal/" . $portal_actividad->archivo);
            }
            $portal_actividad->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA ACTIVIDAD',
                'datos_original' => $datos_original,
                'modulo' => 'ACTIVIDADES',
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
