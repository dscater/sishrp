<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>HojaRutas</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1cm;
            margin-bottom: 1cm;
            margin-left: 1cm;
            margin-right: 1cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            font-size: 0.63em;
            word-wrap: break-word;
        }

        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            width: 200px;
            height: 90px;
            top: -20px;
            left: -20px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 15px;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14pt;
        }

        .texto {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: normal;
            font-size: 0.85em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        table thead tr th {
            padding: 3px;
            font-size: 0.7em;
        }

        table tbody tr td {
            padding: 3px;
            font-size: 0.75em;
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 250px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .p_cump {
            color: red;
            font-size: 1.2em;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .green {
            background: #2E86C1;
            color: white;
        }

        .txt_rojo {}

        .img_celda img {
            width: 45px;
        }

        .nueva_pagina {
            page-break-after: always;
        }

        .p1 {
            padding: 5px;
        }

        .bordeado {
            border: solid 1px black;
            border-radius: 10px;
        }

        .info {
            font-size: 0.8em;
        }

        .texto_info {
            margin-bottom: 1px;
            margin-top: 1px;
        }

        .table_info {
            border-collapse: separate;
            border-spacing: 3px 0px;
        }

        .table_info thead {
            background: white;
        }

        .table_info thead tr th,
        .table_info tbody tr td {
            text-align: center;
            border: solid 1px black;
            border-radius: 5px;
        }

        .table_info2 {
            border-collapse: separate;
            border-spacing: 2px 0px;
        }

        .table_info2 thead {
            background: white;
        }

        .table_info2 thead tr th,
        .table_info2 tbody tr td {
            border: solid 1px black;
            border-radius: 5px;
        }

        .table_info3 {
            border-collapse: separate;
            border-spacing: 1px 1px;
        }

        .table_info3 thead {
            background: white;
        }

        .table_info3 thead tr th,
        .table_info3 tbody tr td {
            border: solid 1px black;
            border-radius: 5px;
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    @php
        $contador = 0;
    @endphp
    @foreach ($hoja_rutas as $hr)
        <div class="encabezado">
            <div class="logo">
                <img src="{{ asset('imgs/' . $configuracion->first()->logo) }}">
            </div>
            <h2 class="titulo">
                {{ $configuracion->first()->razon_social }}
            </h2>
            <h4 class="texto">HOJA DE RUTA</h4>
            <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
        </div>
        <div class="bordeado info">
            <p class="p1 texto_info"><strong>Procedencia: </strong>{{ $hr->procedencia }}</p>
            <p class="p1 texto_info"><strong>Referencia: </strong>{{ $hr->referencia }}</p>
        </div>
        <table class="table_info" style="margin-top: 8px;">
            <thead>
                <tr>
                    <th>FECHA DE RECEPCIÓN</th>
                    <th>HORAS</th>
                    <th>N° DE HOJAS</th>
                    <th>N° DE HOJA DE RUTA</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{ date('d/m/Y', strtotime($hr->fecha_recepcion)) }}</td>
                    <td>{{ date('H:i', strtotime($hr->hora)) }}</td>
                    <td>{{ $hr->nro_hojas }}</td>
                    <td>{{ $hr->nro_hoja_ruta }}</td>
                </tr>
            </tbody>
        </table>
        @php
            $cont = 1;
        @endphp
        @foreach ($hr->destinatarios as $des)
            <table class="table_info2" style="margin-top:7px;">
                <tbody>
                    <tr>
                        <td width="25%"><strong>DESTINATARIO {{ $cont++ }}</strong></td>
                        <td>{{ $des->destinatario }}</td>
                    </tr>
                </tbody>
            </table>
            <table class="table_info2" style="margin-bottom:0px;margin-top:3px;">
                <tbody>
                    <tr>
                        <td width="70%" style="text-align: center;"><strong>INSTRUCCIÓN</strong></td>
                        <td width="30%" style="text-align: center;"><strong>FIRMA</strong></td>
                    </tr>
                </tbody>
            </table>
            <table class="table_info3" style="margin-top:0px;">
                <tbody>
                    <tr>
                        <td width="16%">Informe</td>
                        <td class="centreado" width="10%">{!! $des->informe == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                        <td class="centreado" width="44%" rowspan="10">{{ $des->descripcion }}</td>
                        <td rowspan="9"></td>
                    </tr>
                    <tr>
                        <td>Asista</td>
                        <td class="centreado">{!! $des->asista == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Responda</td>
                        <td class="centreado">{!! $des->responda == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Ejecute</td>
                        <td class="centreado">{!! $des->ejecute == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Difunda</td>
                        <td class="centreado">{!! $des->difunda == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Coordine</td>
                        <td class="centreado">{!! $des->coordine == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Ver antecedente</td>
                        <td class="centreado">{!! $des->ver_antecedente == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Acelere tramite</td>
                        <td class="centreado">{!! $des->acelere_tramite == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Para conocimiento</td>
                        <td class="centreado">{!! $des->para_conocimiento == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                    </tr>
                    <tr>
                        <td>Archivo</td>
                        <td class="centreado">{!! $des->archivo == 1 ? '<img src="' . asset('imgs/check.png') . '" width="20px">' : '' !!}</td>
                        <td><strong>Fecha: </strong>{{ date('d/m/Y', strtotime($des->fecha)) }}</td>
                    </tr>
                </tbody>
            </table>
        @endforeach
        @php
            $contador++;
        @endphp
        @if ($contador < count($hoja_rutas))
            <div class="nueva_pagina"></div>
        @endif
    @endforeach
</body>

</html>
