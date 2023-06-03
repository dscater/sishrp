<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PortalConvocatoria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PortalConvocatoriaController extends Controller
{
    public $validacion = [
        'titulo' => 'required|min:2',
    ];

    public $mensajes = [];

    public function index(Request $request)
    {
        $portal_convocatorias = PortalConvocatoria::all();
        return response()->JSON(['portal_convocatorias' => $portal_convocatorias, 'total' => count($portal_convocatorias)], 200);
    }

    public function lista(Request $request)
    {
        $portal_convocatorias = PortalConvocatoria::paginate(1);
        return response()->JSON(['portal_convocatorias' => $portal_convocatorias, 'total' => count($portal_convocatorias)], 200);
    }

    public function getPortalConvocatorias()
    {
        $portal_convocatorias = PortalConvocatoria::all();
        return response()->JSON(['portal_convocatorias' => $portal_convocatorias, 'total' => count($portal_convocatorias)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            // crear PortalConvocatoria
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_portal_convocatoria = PortalConvocatoria::create(array_map('mb_strtoupper', $request->except("archivo")));
            if ($request->hasFile("archivo")) {
                $imagenes = ["jpg", "jpeg", "png", "gif", "webp"];
                $file = $request->file("archivo");
                $extension = $file->getClientOriginalExtension();
                $nuevo_portal_convocatoria->tipo = "ARCHIVO";
                $nom_file = $nuevo_portal_convocatoria->id . time() . "." . $extension;
                if (in_array($extension, $imagenes)) {
                    $nuevo_portal_convocatoria->tipo = "IMAGEN";
                }
                $file->move(public_path() . "/files/portal", $nom_file);
                $nuevo_portal_convocatoria->archivo = $nom_file;
            }
            $nuevo_portal_convocatoria->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_portal_convocatoria, "portal_convocatorias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA CONVOCATORIA',
                'datos_original' => $datos_original,
                'modulo' => 'CONVOCATORIAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_convocatoria' => $nuevo_portal_convocatoria,
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

    public function update(Request $request, PortalConvocatoria $portal_convocatoria)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_convocatoria, "portal_convocatorias");
            $portal_convocatoria->update(array_map('mb_strtoupper', $request->except("archivo")));
            if ($request->hasFile("archivo")) {
                if ($portal_convocatoria->archivo != '') {
                    \File::delete(public_path() . "/files/portal/" . $portal_convocatoria->archivo);
                }
                $imagenes = ["jpg", "jpeg", "png", "gif", "webp"];
                $file = $request->file("archivo");
                $extension = $file->getClientOriginalExtension();
                $portal_convocatoria->tipo = "ARCHIVO";
                $nom_file = $portal_convocatoria->id . time() . "." . $extension;
                if (in_array($extension, $imagenes)) {
                    $portal_convocatoria->tipo = "IMAGEN";
                }
                $file->move(public_path() . "/files/portal", $nom_file);
                $portal_convocatoria->archivo = $nom_file;
            }
            $portal_convocatoria->save();
            $datos_nuevo = HistorialAccion::getDetalleRegistro($portal_convocatoria, "portal_convocatorias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA CONVOCATORIA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CONVOCATORIAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_convocatoria' => $portal_convocatoria,
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

    public function show(PortalConvocatoria $portal_convocatoria)
    {
        return response()->JSON([
            'sw' => true,
            'portal_convocatoria' => $portal_convocatoria
        ], 200);
    }

    public function destroy(PortalConvocatoria $portal_convocatoria)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_convocatoria, "portal_convocatorias");
            if ($portal_convocatoria->archivo != '') {
                \File::delete(public_path() . "/files/portal/" . $portal_convocatoria->archivo);
            }
            $portal_convocatoria->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA CONVOCATORIA',
                'datos_original' => $datos_original,
                'modulo' => 'CONVOCATORIAS',
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
