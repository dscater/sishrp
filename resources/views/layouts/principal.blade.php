@inject('configuracion', 'App\Models\Configuracion')
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $configuracion->first()->alias }}</title>
    <style>
        #app {
            background-color: none;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        a.navbar-brand img {
            height: 100%;
            max-height: 50px;
            width: 100%;
            max-width: 50px;
        }

        .nav-item {
            display: flex;
            align-items: center;
        }

        .componente_inicial {
            margin-top: 79.8px !important;
        }

        #myCarousel {
            position: relative;
            height: 50vh;
        }

        .carousel-inner {
            height: 100%;
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        .carousel-item {
            height: 100%;
            position: relative;
        }

        .carousel-item img {
            /* object-fit: cover; */
            width: 100%;
            height: 100%;
        }


        nav.navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 999;
        }

        .nav-link.active {
            font-weight: 600;
            font-size: 1.09em;
        }

        body {
            position: relative;
            height: 100%;
        }

        @keyframes bounceIn {
            0% {
                transform: scale(0.1);
                opacity: 0;
            }

            60% {
                transform: scale(1.2);
                opacity: 1;
            }

            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        /* .scrollreveal {
            animation: bounceIn 1s;
            visibility: hidden;
            animation-fill-mode: forwards;
        } */

        .bg_gradient {
            background: linear-gradient(135deg, #003366, #006633);
        }

        /* loader */
        .loader {
            position: fixed;
            display: flex;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.619);
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100vw;
            z-index: 999999;
        }

        .loader::after {
            content: "";
            display: block;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 6px solid #ccc;
            border-top-color: #555;
            animation: spin 1s infinite linear;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/plantilla.css') }}">
    @yield('css')
</head>

<body class="text-sm">
    <div class="loader">
        <div class="spinner"></div>
    </div>
    <div id="app" class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary p-3">
            <a class="navbar-brand" href="/"><img src="{{ asset('imgs/' . $configuracion->first()->logo) }}"
                    alt=""> {{ $configuracion->first()->alias }}</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            @inject('o_portal_turismo_deportes', 'App\Models\PortalTurismoDeporte')

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto bg-success text-md">
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('/') ? 'active' : '' }}"
                            href="{{ route('inicio') }}">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('gamy') ? 'active' : '' }}"
                            href="{{ route('gamy') }}">Gamy</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('noticias') ? 'active' : '' }}"
                            href="{{ route('noticias') }}">Noticias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" target="_blank"
                            href="{{ $o_portal_turismo_deportes->first() ? $o_portal_turismo_deportes->first()->link_turismo : 'https://www.google.com/' }}">Turismo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" target="_blank"
                            href="{{ $o_portal_turismo_deportes->first() ? $o_portal_turismo_deportes->first()->link_deportes : 'https://www.google.com/' }}">Deportes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}">Iniciar sesión</a>
                    </li>
                </ul>
            </div>
        </nav>
        @yield('content')
        @include('portal.contactos')
    </div>
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/plantilla.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.19/jquery.touchSwipe.min.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <script>
        $(document).ready(function() {
            setTimeout(() => {
                $(".loader").hide();
            }, 200);
            // Inicializar el slider de Bootstrap
            $('#myCarousel').carousel();

            // Habilitar el deslizamiento táctil
            $('#myCarousel').swipe({
                swipe: function(event, direction, distance, duration, fingerCount, fingerData) {
                    if (direction === 'left') {
                        $(this).carousel('next');
                    } else if (direction === 'right') {
                        $(this).carousel('prev');
                    }
                },
                allowPageScroll: 'vertical'
            });

            ScrollReveal().reveal('.scrollreveal', {
                distance: '20px',
                duration: 1500,
                reset: false,
                viewFactor: 0.3,
                afterReveal: function(element) {
                    element.style.visibility = 'visible'; // Mostrar el elemento después de la animación
                }
            });
        });
    </script>

    @yield('scripts')
</body>

</html>
