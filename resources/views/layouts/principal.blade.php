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

        #myCarousel {
            position: relative;
            height: 50vh;
            margin-top: 74.8px;
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
            background: rgb(4, 78, 4) !important;
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

        .scrollreveal {
            animation: bounceIn 1s;
            visibility: hidden;
            animation-fill-mode: forwards;
            /* Mantener el estado final de la animación */
        }
    </style>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/plantilla.css') }}">
    @yield('css')
</head>

<body class="sidebar-mini layout-fixed control-sidebar-slide-open layout-navbar-fixed text-sm">
    <div id="app" class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary p-3">
            <a class="navbar-brand" href="/"><img src="{{ asset('imgs/' . $configuracion->first()->logo) }}"
                    alt=""> {{ $configuracion->first()->alias }}</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto bg-success text-md">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Noticias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Turismo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Deportes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}">Iniciar sesión</a>
                    </li>
                </ul>
            </div>
        </nav>
        @yield('content')
    </div>
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/plantilla.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.19/jquery.touchSwipe.min.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <script>
        $(document).ready(function() {
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
                duration: 1000,
                reset: true,
                viewFactor: 0.2,
                afterReveal: function(element) {
                    element.style.visibility = 'visible'; // Mostrar el elemento después de la animación
                }
            });
        });
    </script>

    @yield('scripts')
</body>

</html>
