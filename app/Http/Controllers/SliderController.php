<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SliderController extends Controller
{
    public $validacion = [
        'imagen' => 'required|image|mimes:png,jpg,jpeg|max:4096',
    ];

    public $mensajes = [];

    public function index(Request $request)
    {
        $sliders = Slider::all();
        return response()->JSON(['sliders' => $sliders, 'total' => count($sliders)], 200);
    }

    public function getSliders()
    {
        $sliders = Slider::all();
        return response()->JSON(['sliders' => $sliders, 'total' => count($sliders)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            // crear Slider
            $nuevo_slider = new Slider();
            $archivo = $request->file("imagen");
            $nombre_archivo = "s" . time() . "." . $archivo->getClientOriginalExtension();
            $nuevo_slider->imagen = $nombre_archivo;
            $nuevo_slider->save();
            $archivo->move(public_path() . "/imgs/sliders", $nombre_archivo);

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_slider, "sliders");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN SLIDER',
                'datos_original' => $datos_original,
                'modulo' => 'SLIDERS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'slider' => $nuevo_slider,
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

    public function update(Request $request, Slider $slider)
    {
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($slider, "sliders");
            $archivo = $request->file("imagen");
            $nombre_archivo = "s" . time() . "." . $archivo->getClientOriginalExtension();
            $slider->imagen = $nombre_archivo;
            $slider->save();

            \File::delete(public_path() . "/imgs/sliders/" . $slider->imagen);
            $archivo->move(public_path() . "/imgs/sliders", $nombre_archivo);

            $datos_nuevo = HistorialAccion::getDetalleRegistro($slider, "sliders");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN SLIDER',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'SLIDERS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'slider' => $slider,
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

    public function show(Slider $slider)
    {
        return response()->JSON([
            'sw' => true,
            'slider' => $slider
        ], 200);
    }

    public function destroy(Slider $slider)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($slider, "sliders");
            \File::delete(public_path() . "/imgs/sliders/" . $slider->imagen);
            $slider->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN SLIDER',
                'datos_original' => $datos_original,
                'modulo' => 'SLIDERS',
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
