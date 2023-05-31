<?php

namespace App\Http\Controllers;

use App\Models\Destinatario;
use App\Models\HistorialAccion;
use App\Models\HojaRuta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HojaRutaController extends Controller
{
    public $validacion = [
        "procedencia" => "required|min:2",
        "referencia" => "required|min:2",
        "fecha_recepcion" => "required|date",
        "hora" => "required|date_format:H:i",
        "nro_hojas" => "required|numeric|min:1"
    ];

    public $mensajes = [
        "destinatario.required" => "El campo destinatario es obligatorio",
        "descripcion.required" => "El campo descripción es obligatorio",
        "fecha.required" => "El campo fecha es obligatorio",
    ];

    public function index(Request $request)
    {
        $hoja_rutas = HojaRuta::with("ultimo_destinatario")->get();
        return response()->JSON(['hoja_rutas' => $hoja_rutas, 'total' => count($hoja_rutas)], 200);
    }

    public function getHojaRutas()
    {
        $hoja_rutas = HojaRuta::all();
        return response()->JSON(['hoja_rutas' => $hoja_rutas, 'total' => count($hoja_rutas)], 200);
    }

    public function store(Request $request)
    {
        $this->validacion["destinatario"] = "required|min:2";
        $this->validacion["descripcion"] = "required|min:2";
        $this->validacion["fecha"] = "required|date";
        $request->validate($this->validacion, $this->mensajes);

        DB::beginTransaction();
        try {
            // crear HojaRuta
            $request["fecha_registro"] = date("Y-m-d");
            $request["nro_hoja_ruta"] = HojaRuta::getNroHojaRuta();
            $request["user_id"] = Auth::user()->id;
            $nueva_hoja_ruta = HojaRuta::create(array_map('mb_strtoupper', $request->all()));

            $nueva_hoja_ruta->destinatarios()->create([
                "destinatario" => mb_strtoupper($request->destinatario),
                "informe" => $request->informe,
                "asista" => $request->asista,
                "responda" => $request->responda,
                "ejecute" => $request->ejecute,
                "difunda" => $request->difunda,
                "coordine" => $request->coordine,
                "ver_antecedente" => $request->ver_antecedente,
                "acelere_tramite" => $request->acelere_tramite,
                "para_conocimiento" => $request->para_conocimiento,
                "archivo" => $request->archivo,
                "descripcion" => mb_strtoupper($request->descripcion),
                "fecha" => $request->fecha,
                "user_id" => $request->user_id
            ]);

            $datos_original = HistorialAccion::getDetalleRegistro($nueva_hoja_ruta, "hoja_rutas");
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
                'hoja_ruta' => $nueva_hoja_ruta,
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

    public function responder(HojaRuta $hoja_ruta, Request $request)
    {
        $validacion = [
            "destinatario.*" => "required|min:2",
            "descripcion.*" => "required|min:2",
            "fecha.*" => "required|date",
        ];
        $mensajes = [
            "destinatario.*.required" => "El campo destinatario es requerido",
            "descripcion.*.required" => "El campo descripción es requerido",
            "destinatario.*.min" => "El campo destinatario debe tener al menos 2 caracteres",
            "descripcion.*.min" => "El campo descripción debe tener al menos 2 caracteres",
            "fecha.*.required" => "El campo fecha es requerido",
            "fecha.*.date" => "El campo fecha debe tener un formato valido",
        ];
        $request->validate($validacion, $mensajes);

        DB::beginTransaction();
        try {
            $destinatario = $request->destinatario;
            $informe = $request->informe;
            $asista = $request->asista;
            $responda = $request->responda;
            $ejecute = $request->ejecute;
            $difunda = $request->difunda;
            $coordine = $request->coordine;
            $ver_antecedente = $request->ver_antecedente;
            $acelere_tramite = $request->acelere_tramite;
            $para_conocimiento = $request->para_conocimiento;
            $archivo = $request->archivo;
            $descripcion = $request->descripcion;
            $fecha = $request->fecha;

            foreach ($destinatario as $key => $value) {
                $nuevo_destinatario = $hoja_ruta->destinatarios()->create([
                    "destinatario" => mb_strtoupper($value),
                    "informe" => $informe[$key],
                    "asista" => $asista[$key],
                    "responda" => $responda[$key],
                    "ejecute" => $ejecute[$key],
                    "difunda" => $difunda[$key],
                    "coordine" => $coordine[$key],
                    "ver_antecedente" => $ver_antecedente[$key],
                    "acelere_tramite" => $acelere_tramite[$key],
                    "para_conocimiento" => $para_conocimiento[$key],
                    "archivo" => $archivo[$key],
                    "descripcion" => mb_strtoupper($descripcion[$key]),
                    "fecha" => $fecha[$key],
                    "user_id" => Auth::user()->id
                ]);
                $datos_original = HistorialAccion::getDetalleRegistro($nuevo_destinatario, "destinatarios");
                HistorialAccion::create([
                    'user_id' => Auth::user()->id,
                    'accion' => 'CREACIÓN',
                    'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN DESTINATARIO EN UNA HOJA DE RUTA',
                    'datos_original' => $datos_original,
                    'modulo' => 'HOJA DE RUTAS',
                    'fecha' => date('Y-m-d'),
                    'hora' => date('H:i:s')
                ]);
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'hoja_ruta' => $hoja_ruta,
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
            'hoja_ruta' => $hoja_ruta->load("destinatarios")
        ], 200);
    }

    public function destroy(HojaRuta $hoja_ruta)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($hoja_ruta, "hoja_rutas");
            $hoja_ruta->destinatarios()->delete();
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

    public function actualiza_destinatario(Destinatario $destinatario, Request $request)
    {
        $request->validate([
            "destinatario" => "required|min:2",
            "descripcion" => "required|min:2",
            "fecha" => "required|date",
        ]);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($destinatario, "destinatarios");
            $destinatario->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($destinatario, "destinatarios");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'DESTINATARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'destinatario' => $destinatario,
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

    public function elimina_destinatario(Destinatario $destinatario)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($destinatario, "destinatarios");
            $destinatario->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN DESTINATARIO DE UNA HOJA DE RUTA',
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
