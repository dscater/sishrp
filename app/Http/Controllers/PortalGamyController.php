<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\PortalGamy;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PortalGamyController extends Controller
{
    public $validacion = [
        'mision' => 'required|min:2',
        'vision' => 'required|min:2',
        'historia' => 'required|min:2',
    ];

    public $mensajes = [];

    public function index(Request $request)
    {
        $portal_gamys = PortalGamy::all();
        return response()->JSON(['portal_gamys' => $portal_gamys, 'total' => count($portal_gamys)], 200);
    }

    public function getPortalGamys()
    {
        $portal_gamys = PortalGamy::all();
        return response()->JSON(['portal_gamys' => $portal_gamys, 'total' => count($portal_gamys)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            // crear PortalGamy
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_portal_gamy = PortalGamy::create(array_map('mb_strtoupper', $request->except("img_vision", "img_mision", "img_historia")));

            if ($request->hasFIle("img_mision")) {
                $file = $request->file("img_mision");
                $nom_file = $nuevo_portal_gamy->id . time() . "." . $file->getClientOriginalExtension();
                $file->move(public_path() . "/imgs/gamy", $nom_file);
                $nuevo_portal_gamy->img_mision = $nom_file;
            }
            if ($request->hasFIle("img_vision")) {
                $file = $request->file("img_vision");
                $nom_file = $nuevo_portal_gamy->id . time() . "." . $file->getClientOriginalExtension();
                $file->move(public_path() . "/imgs/gamy", $nom_file);
                $nuevo_portal_gamy->img_vision = $nom_file;
            }
            if ($request->hasFIle("img_historia")) {
                $file = $request->file("img_historia");
                $nom_file = $nuevo_portal_gamy->id . time() . "." . $file->getClientOriginalExtension();
                $file->move(public_path() . "/imgs/gamy", $nom_file);
                $nuevo_portal_gamy->img_historia = $nom_file;
            }
            $nuevo_portal_gamy->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_portal_gamy, "portal_gamys");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO EL PORTAL GAMY',
                'datos_original' => $datos_original,
                'modulo' => 'PORTAL GAMY',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_gamy' => $nuevo_portal_gamy,
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

    public function update(Request $request, PortalGamy $portal_gamy)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_gamy, "portal_gamys");
            $portal_gamy->update(array_map('mb_strtoupper', $request->except("img_mision", "img_vision", "img_historia")));

            if ($request->hasFIle("img_mision")) {
                if ($portal_gamy->img_mision != "") {
                    \File::delete(public_path() . "imgs/gamy/" . $portal_gamy->img_mision);
                }
                $file = $request->file("img_mision");
                $nom_file = $portal_gamy->id . time() . "." . $file->getClientOriginalExtension();
                $file->move(public_path() . "/imgs/gamy", $nom_file);
                $portal_gamy->img_mision = $nom_file;
            }
            if ($request->hasFIle("img_vision")) {
                if ($portal_gamy->img_vision != "") {
                    \File::delete(public_path() . "imgs/gamy/" . $portal_gamy->img_vision);
                }
                $file = $request->file("img_vision");
                $nom_file = $portal_gamy->id . time() . "." . $file->getClientOriginalExtension();
                $file->move(public_path() . "/imgs/gamy", $nom_file);
                $portal_gamy->img_vision = $nom_file;
            }
            if ($request->hasFIle("img_historia")) {
                if ($portal_gamy->img_historia != "") {
                    \File::delete(public_path() . "imgs/gamy/" . $portal_gamy->img_historia);
                }
                $file = $request->file("img_historia");
                $nom_file = $portal_gamy->id . time() . "." . $file->getClientOriginalExtension();
                $file->move(public_path() . "/imgs/gamy", $nom_file);
                $portal_gamy->img_historia = $nom_file;
            }
            $portal_gamy->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($portal_gamy, "portal_gamys");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ EL PORTAL GAMY',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PORTAL GAMY',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'portal_gamy' => $portal_gamy,
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

    public function show(PortalGamy $portal_gamy)
    {
        return response()->JSON([
            'sw' => true,
            'portal_gamy' => $portal_gamy
        ], 200);
    }

    public function destroy(PortalGamy $portal_gamy)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($portal_gamy, "portal_gamys");
            $portal_gamy->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ EL PORTAL GAMY',
                'datos_original' => $datos_original,
                'modulo' => 'PORTAL GAMY',
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
