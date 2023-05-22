<?php

use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\HistorialAccionController;
use App\Http\Controllers\HojaRutaController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PortalActividadController;
use App\Http\Controllers\PortalConvocatoriaController;
use App\Http\Controllers\PortalGamyController;
use App\Http\Controllers\PortalNoticiaController;
use App\Http\Controllers\PortalTurismoDeporteController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

// INICIO
Route::get('/', [InicioController::class, 'index'])->name("inicio");

// LOGIN
Route::get('/login', [LoginController::class, 'index'])->name("login");
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// CONFIGURACIÓN
Route::get('/configuracion/getConfiguracion', [ConfiguracionController::class, 'getConfiguracion']);

Route::middleware(['auth'])->group(function () {
    Route::prefix('admin')->group(function () {
        Route::post('/configuracion/update', [ConfiguracionController::class, 'update']);

        // Usuarios
        Route::post('usuarios/reemplaza_password/{usuario}', [UserController::class, 'reemplaza_password']);
        Route::get('usuarios/getUsuario/{usuario}', [UserController::class, 'getUsuario']);
        Route::get('usuarios/userActual', [UserController::class, 'userActual']);
        Route::get('usuarios/getInfoBox', [UserController::class, 'getInfoBox']);
        Route::get('usuarios/getPermisos/{usuario}', [UserController::class, 'getPermisos']);
        Route::get('usuarios/getEncargadosRepresentantes', [UserController::class, 'getEncargadosRepresentantes']);
        Route::post('usuarios/actualizaContrasenia/{usuario}', [UserController::class, 'actualizaContrasenia']);
        Route::post('usuarios/actualizaFoto/{usuario}', [UserController::class, 'actualizaFoto']);
        Route::resource('usuarios', UserController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Hoja de rutas
        Route::resource('hoja_rutas', HojaRutaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // historial acciones
        Route::resource('historial_accions', HistorialAccionController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // portal gamy
        Route::resource('portal_gamy', PortalGamyController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // portal noticias
        Route::resource('portal_noticias', PortalNoticiaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // portal convocatorias
        Route::resource('portal_convocatorias', PortalConvocatoriaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // portal actividads
        Route::resource('portal_actividads', PortalActividadController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Portal Turismo y deportes
        Route::resource('portal_turismo_deportes', PortalTurismoDeporteController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // REPORTES
        Route::post('reportes/usuarios', [ReporteController::class, 'usuarios']);
    });
});


// ---------------------------------------
Route::get('/administracion/{optional?}', function () {
    return view('app');
})->name('base_path')->where('optional', '.*');
