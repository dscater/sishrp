@extends('layouts.principal')
@section('css')
    <style>
        .contenedor_opcion {
            height: 200px;
        }

        .btn_info_secundario {
            height: 100%;
            flex-direction: column;
            box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
            -webkit-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);
        }

        .btn_info_secundario a {
            display: inline-block;
            padding: 12px 24px;
            border: none;
            border-radius: 30px;
            color: #ffffff;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .titulo_opciones {
            width: 100%;
            background: rgba(0, 0, 0, 0.71);
            color: white;
        }
    </style>
@endsection
@section('content')
    <div id="myCarousel" class="carousel slide d-block componente_inicial" data-ride="carousel">
        @if (count($sliders) > 0)
            <!-- Indicadores desde la BD -->
            <ol class="carousel-indicators">
                @foreach ($sliders as $key => $s)
                    @php
                        $active = '';
                        if ($key == 0) {
                            $active = 'active';
                        }
                    @endphp
                    <li data-target="#myCarousel" data-slide-to="{{ $key }}" class="{{ $active }}"></li>
                @endforeach
            </ol>

            <!-- Contenido de los slides -->
            <div class="carousel-inner">
                @foreach ($sliders as $key => $s)
                    @php
                        $active = '';
                        if ($key == 0) {
                            $active = ' active';
                        }
                    @endphp
                    <div class="carousel-item{{ $active }}">
                        <img class="d-block w-100" src="{{ $s->url_imagen }}" alt="Slide {{ $key }}">
                    </div>
                @endforeach
            </div>
        @else
            <!-- Indicadores cuando no hay sliders registrados -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
            </ol>

            <!-- Contenido de los slides -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="{{ asset('imgs/slide01.jpg') }}" alt="Slide 1">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="{{ asset('imgs/slide02.jpg') }}" alt="Slide 2">
                </div>
            </div>
        @endif

        <!-- Controles de navegación -->
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Siguiente</span>
        </a>
    </div>
    <div class="container-fluid mt-2">
        <div class="row">
            <div class="col-md-12">
                <div class="card scrollreveal">
                    <div class="card-body bg_gradient">
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="text-sm text-center font-weight-bold text-white">
                                    BIENVENID@S
                                    A LA PÁGINA OFICIAL DEL
                                    MUNICIPIO DE YACO DE LA PROVINCIA LOAYZA</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card scrollreveal bg_gradient">
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="row">
                                <a href=""class="col-md-12 form-group contenedor_opcion">
                                    <div class="btn_info_secundario"
                                        style="background:url('{{ asset('imgs/gamy.jpeg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center titulo_opciones">GAMY <i
                                                class="fa fa-arrow-right"></i></h5>
                                    </div>
                                </a>
                                <a href="" class="col-md-4 form-group contenedor_opcion">
                                    <div class="btn_info_secundario"
                                        style="background:url('{{ asset('imgs/fondo_noticias.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center titulo_opciones">NOTICIAS <i
                                                class="fa fa-arrow-right"></i></h5>
                                    </div>
                                </a>
                                <a href="" class="col-md-4 form-group contenedor_opcion">
                                    <div class="btn_info_secundario"
                                        style="background:url('{{ asset('imgs/fondo_turismo.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center titulo_opciones">TURISMO <i
                                                class="fa fa-arrow-right"></i></h5>
                                    </div>
                                </a>
                                <a href="" class="col-md-4 form-group contenedor_opcion">
                                    <div class="btn_info_secundario"
                                        style="background:url('{{ asset('imgs/fondo_deportes.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center titulo_opciones">DEPORTES <i
                                                class="fa fa-arrow-right"></i></h5>
                                    </div>
                                </a>
                                <a href="" class="col-md-4 form-group contenedor_opcion">
                                    <div class="btn_info_secundario"
                                        style="background:url('{{ asset('imgs/iglesia.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center titulo_opciones">COMUNICADOS <i
                                                class="fa fa-arrow-right"></i></h5>
                                    </div>
                                </a>
                                <a href="" class="col-md-4 form-group contenedor_opcion">
                                    <div class="btn_info_secundario"
                                        style="background:url('{{ asset('imgs/convocatoria.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center titulo_opciones">CONVOCATORIAS <i
                                                class="fa fa-arrow-right"></i></h5>
                                    </div>
                                </a>
                                <a href="" class="col-md-4 form-group contenedor_opcion"
                                    style="background:url('{{ asset('imgs/actividad.jpg') }}');background-size:cover; background-position:center;">
                                    <div class="btn_info_secundario">
                                        <h5 class="d-block text-center titulo_opciones">ACTIVIDADES <i
                                                class="fa fa-arrow-right"></i></h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 ml-auto mr-auto">
                <div class="card">
                    <div class="card-body scrollreveal">
                        <video src="{{ asset('videos/municipio_yaco.mp4') }}" preload="none" controls
                            style="width:100%;"></video>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
