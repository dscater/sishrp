import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
    routes: [
        // INICIO
        {
            path: "/administracion/inicio",
            name: "inicio",
            component: require("./components/Inicio.vue").default,
        },

        // LOGIN
        {
            path: "/administracion/login",
            name: "login",
            component: require("./Auth.vue").default,
        },

        // Usuarios
        {
            path: "/administracion/usuarios/perfil/:id",
            name: "usuarios.perfil",
            component: require("./components/modulos/usuarios/perfil.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/usuarios",
            name: "usuarios.index",
            component: require("./components/modulos/usuarios/index.vue")
                .default,
        },

        // Hoja de rutas
        {
            path: "/administracion/hoja_rutas",
            name: "marcas.index",
            component: require("./components/modulos/hoja_rutas/index.vue")
                .default,
        },

        // portal_gamy
        {
            path: "/administracion/portal_gamy",
            name: "marcas.index",
            component: require("./components/modulos/portal_gamy/index.vue")
                .default,
        },

        // sliders
        {
            path: "/administracion/sliders",
            name: "marcas.index",
            component: require("./components/modulos/sliders/index.vue")
                .default,
        },

        // portal_noticias
        {
            path: "/administracion/portal_noticias",
            name: "portal_noticias.index",
            component: require("./components/modulos/portal_noticias/index.vue")
                .default,
        },

        // portal_convocatorias
        {
            path: "/administracion/portal_convocatorias",
            name: "portal_convocatorias.index",
            component:
                require("./components/modulos/portal_convocatorias/index.vue")
                    .default,
        },

        // portal_actividads
        {
            path: "/administracion/portal_actividads",
            name: "portal_actividads.index",
            component:
                require("./components/modulos/portal_actividads/index.vue")
                    .default,
        },

        // Configuración
        {
            path: "/administracion/configuracion",
            name: "configuracion",
            component: require("./components/modulos/configuracion/index.vue")
                .default,
            props: true,
        },

        // Reportes
        {
            path: "/administracion/reportes/usuarios",
            name: "reportes.usuarios",
            component: require("./components/modulos/reportes/usuarios.vue")
                .default,
            props: true,
        },
        // PÁGINA NO ENCONTRADA
        {
            path: "/administracion*",
            component: require("./components/modulos/errors/404.vue").default,
        },
    ],
    mode: "history",
    linkActiveClass: "active",
});