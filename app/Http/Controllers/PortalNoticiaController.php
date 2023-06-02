<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PortalNoticia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PortalNoticiaController extends Controller
{
    public $validacion = [
        'titulo' => 'required|min:2',
    ];

    public $mensajes = [];

    public function index(Request $request)
    {
        $portal_noticias = PortalNoticia::all();
        return response()->JSON(['portal_noticias' => $portal_noticias, 'total' => count($portal_noticias)], 200);
    }

    public function getPortalNoticias()
    {
        $portal_noticias = PortalNoticia::all();
        return response()->JSON(['portal_noticias' => $portal_noticias, 'total' => count($portal_noticias)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            // crear PortalNoticia
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_portal_noticia = PortalNoticia::create(array_map('mb_strtoupper', $request->except("archivo")));
            if ($request->hasFile("archivo")) {
                $imagenes = ["jpg", "jpeg", "png", "gif", "webp"];
                $file = $request->file("archivo");
                $extension = $file->getClientOriginalExtension();
                $nuevo_portal_noticia->tipo = "ARCHIVO";
                $nom_file = $nuevo_portal_noticia->id . time() . "." . $extension;
                if (in_array($extension, $imagenes)) {
                    $nuevo_portal_noticia->tipo = "IMAGEN";
                }
                $file->move(public_path() . "/files/portal", $nom_file);
                $nuevo_portal_noticia->archivo = $nom_file;
            }
            $nuevo_portal_noticia->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_portal_noticia, "portal_noticias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA NOTICIA',
                'datos_original' => $datos_original,
                'modulo' => 'NOTICIAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_noticia' => $nuevo_portal_noticia,
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

    public function update(Request $request, PortalNoticia $portal_noticia)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_noticia, "portal_noticias");
            $portal_noticia->update(array_map('mb_strtoupper', $request->except("archivo")));
            if ($request->hasFile("archivo")) {
                if ($portal_noticia->archivo != '') {
                    \File::delete(public_path() . "/files/portal/" . $portal_noticia->archivo);
                }
                $imagenes = ["jpg", "jpeg", "png", "gif", "webp"];
                $file = $request->file("archivo");
                $extension = $file->getClientOriginalExtension();
                $portal_noticia->tipo = "ARCHIVO";
                $nom_file = $portal_noticia->id . time() . "." . $extension;
                if (in_array($extension, $imagenes)) {
                    $portal_noticia->tipo = "IMAGEN";
                }
                $file->move(public_path() . "/files/portal", $nom_file);
                $portal_noticia->archivo = $nom_file;
            }
            $portal_noticia->save();
            $datos_nuevo = HistorialAccion::getDetalleRegistro($portal_noticia, "portal_noticias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA NOTICIA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'NOTICIAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_noticia' => $portal_noticia,
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

    public function show(PortalNoticia $portal_noticia)
    {
        return response()->JSON([
            'sw' => true,
            'portal_noticia' => $portal_noticia
        ], 200);
    }

    public function destroy(PortalNoticia $portal_noticia)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_noticia, "portal_noticias");
            if ($portal_noticia->archivo != '') {
                \File::delete(public_path() . "/files/portal/" . $portal_noticia->archivo);
            }
            $portal_noticia->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA NOTICIA',
                'datos_original' => $datos_original,
                'modulo' => 'NOTICIAS',
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
