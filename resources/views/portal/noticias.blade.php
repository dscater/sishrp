@extends('layouts.principal')
@section('css')
    <style>
        .card-title {
            font-size: 1.5rem;
            margin-bottom: 0.75rem;
            font-weight: 500;
            line-height: 1.2;
        }

        .card-text {
            margin-top: 0;
            margin-bottom: 1rem;

        }
    </style>
@endsection
@section('content')
    <div class="container-fluid componente_inicial">
        <div class="row">
            <div class="col-md-12">
                <div class="card scrollreveal">
                    <div class="card-body bg_gradient">
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="text-sm text-center font-weight-bold text-white">
                                    NOTICIAS/CONVOCATORIAS/ACTIVIDADES</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="text-sm text-center font-weight-bold text-white">NOTICIAS</h3>
                    </div>
                    <div class="card-body">
                        <Noticias></Noticias>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="text-sm text-center font-weight-bold text-white">CONVOCATORIAS</h3>
                    </div>
                    <div class="card-body">
                        <Convocatorias></Convocatorias>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="text-sm text-center font-weight-bold text-white">ACTIVIDADES</h3>
                    </div>
                    <div class="card-body">
                        <Actividades></Actividades>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection
