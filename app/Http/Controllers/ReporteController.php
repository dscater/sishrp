<?php

namespace App\Http\Controllers;

use App\Models\CaracteristicaVehiculo;
use App\Models\DetalleOrden;
use App\Models\Faq;
use App\Models\HistorialAccion;
use App\Models\HojaRuta;
use App\Models\Vehiculo;
use App\Models\User;
use App\Models\Visitante;
use App\Models\VistaFecha;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PDF;

class ReporteController extends Controller
{
    public function usuarios(Request $request)
    {
        $filtro =  $request->filtro;
        $usuarios = User::where('id', '!=', 1)->where("tipo", "!=", "VISITANTE")->orderBy("paterno", "ASC")->get();

        if ($filtro == 'Tipo de usuario') {
            $request->validate([
                'tipo' => 'required',
            ]);
            $usuarios = User::where('id', '!=', 1)->where('tipo', $request->tipo)->orderBy("paterno", "ASC")->get();
        }

        $pdf = PDF::loadView('reportes.usuarios', compact('usuarios'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0));

        return $pdf->download('Usuarios.pdf');
    }
    public function hoja_rutas(Request $request)
    {
        $filtro =  $request->filtro;
        $nro =  $request->nro;
        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;
        $hoja_rutas = HojaRuta::all();
        if ($filtro == 'nro' && $nro != '') {
            $hoja_rutas = HojaRuta::where("id", $nro)->get();
        }
        if ($filtro == 'fechas' && $fecha_ini != '' && $fecha_fin != '') {
            $hoja_rutas = HojaRuta::whereBetween("fecha_registro", [$fecha_ini, $fecha_fin])->get();
        }
        $pdf = PDF::loadView('reportes.hoja_rutas', compact('hoja_rutas'))->setPaper('letter', 'portrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0));

        return $pdf->download('HojaRutas.pdf');
    }
}
