@extends('layouts.principal')
@section('css')
    <style>
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
                                <h2 class="text-sm text-center font-weight-bold text-white">GAMY</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="text-sm text-center font-weight-bold text-white">MISIÓN</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @php
                                $col1 = 'col-md-12';
                                $col2 = '';
                                if ($portal_gamy->img_mision != '') {
                                    $col1 = 'col-md-4';
                                    $col2 = 'col-md-8';
                                }
                            @endphp
                            <p class="{{ $col2 }}">{{ $portal_gamy->mision }}</p>
                            @if ($portal_gamy->img_mision != '')
                                <div class="{{ $col1 }}">
                                    <img src="{{ $portal_gamy->url_img_mision }}" alt="Imagen" width="100%">
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="text-sm text-center font-weight-bold text-white">VISIÓN</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @php
                                $col1 = 'col-md-12';
                                $col2 = '';
                                if ($portal_gamy->img_vision != '') {
                                    $col1 = 'col-md-4';
                                    $col2 = 'col-md-8';
                                }
                            @endphp
                            <p class="{{ $col2 }}">{{ $portal_gamy->vision }}</p>
                            @if ($portal_gamy->img_vision != '')
                                <div class="{{ $col1 }}">
                                    <img src="{{ $portal_gamy->url_img_vision }}" alt="Imagen" width="100%">
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="text-sm text-center font-weight-bold text-white">HISTORIA</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @php
                                $col1 = 'col-md-12';
                                $col2 = '';
                                if ($portal_gamy->img_historia != '') {
                                    $col1 = 'col-md-4';
                                    $col2 = 'col-md-8';
                                }
                            @endphp
                            <p class="{{ $col2 }}">{{ $portal_gamy->historia }}</p>
                            @if ($portal_gamy->img_historia != '')
                                <div class="{{ $col1 }}">
                                    <img src="{{ $portal_gamy->url_img_historia }}" alt="Imagen" width="100%">
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection
