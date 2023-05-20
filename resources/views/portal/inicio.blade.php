@extends('layouts.principal')
@section('css')
    <style>
        .btn_info_secundario {
            display: flex;
            justify-content: center;
            align-content: center;
            align-items: center;
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
    </style>
@endsection
@section('content')
    <div id="myCarousel" class="carousel slide d-block" data-ride="carousel">
        <!-- Indicadores -->
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
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="text-sm text-center font-weight-bold">BIENVENID@S
                                    A LA PÁGINA OFICIAL DEL
                                    MUNICIPIO DE YACO DE LA PROVINCIA LOAYZA</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card scrollreveal">
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-4 form-group">
                                    <div class="p-4 btn_info_secundario"
                                        style="background:url('{{ asset('imgs/fondo_noticias.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center">NOTICIAS</h5>
                                        <a href="" class="d-block text-center btn-success text-md rounded-circle p-2"
                                            style="width: 90px;">
                                            <img src="{{ asset('imgs/news.png') }}" alt="" loading="lazy"><br>
                                            Ver
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="p-4 btn_info_secundario"
                                        style="background:url('{{ asset('imgs/fondo_turismo.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center">TURISMO</h5>
                                        <a href="" class="d-block text-center btn-success text-md rounded-circle p-2"
                                            style="width: 90px;">
                                            <img src="{{ asset('imgs/map.png') }}" alt="" loading="lazy"><br>
                                            Ver
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="p-4 btn_info_secundario"
                                        style="background:url('{{ asset('imgs/fondo_deportes.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center">DEPORTES</h5>
                                        <a href="" class="d-block text-center btn-success text-md rounded-circle p-2"
                                            style="width: 90px;">
                                            <img src="{{ asset('imgs/soccer.png') }}" alt="" loading="lazy"><br>
                                            Ver
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="p-4 btn_info_secundario"
                                        style="background:url('{{ asset('imgs/iglesia.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center">COMUNICADOS</h5>
                                        <a href="" class="d-block text-center btn-success text-md rounded-circle p-2"
                                            style="width: 90px;">
                                            <img src="{{ asset('imgs/comunicado.png') }}" alt="" loading="lazy"><br>
                                            Ver
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <div class="p-4 btn_info_secundario"
                                        style="background:url('{{ asset('imgs/convocatoria.jpg') }}');background-size:cover; background-position:center;">
                                        <h5 class="d-block text-center">CONVOCATORIAS</h5>
                                        <a href="" class="d-block text-center btn-success text-md rounded-circle p-2"
                                            style="width: 90px;">
                                            <img src="{{ asset('imgs/comunicado.png') }}" alt=""
                                                loading="lazy"><br>
                                            Ver
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group"
                                    style="background:url('{{ asset('imgs/actividad.jpg') }}');background-size:cover; background-position:center;">
                                    <div class="p-4 btn_info_secundario">
                                        <h5 class="d-block text-center">ACTIVIDADES</h5>
                                        <a href="" class="d-block text-center btn-success text-md rounded-circle p-2"
                                            style="width: 90px;">
                                            <img src="{{ asset('imgs/reunion.png') }}" alt=""><br>
                                            Ver
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card scrollreveal">
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <strong>CONTACTOS</strong>
                                </div>
                                <div class="col-md-12 text-center">
                                    <a href="" class="btn btn-primary"><i class="fab fa-facebook"></i>
                                        Facebook</a>
                                    <a href="" class="btn btn-success"><i class="fab fa-whatsapp-square"></i>
                                        Whatsapp</a>
                                    <a href="" class="btn btn-info"><i class="fab fa-twitter-square"></i>
                                        Twitter</a>
                                    <a href="" class="btn btn-primary"><i class="fab fa-linkedin"></i>
                                        Linkedin</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
