<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Hoja de Ruta</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="text-md">
                                            Nueva Hoja de Ruta
                                        </h3>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <Formulario
                                    :hoja_ruta="oHojaRuta"
                                    @registroEnviado="enviarIndex"
                                ></Formulario>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import Formulario from "./Formulario.vue";
export default {
    components: {
        Formulario,
    },
    data() {
        return {
            permisos: localStorage.getItem("permisos"),
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oHojaRuta: {
                id: 0,
                procedencia: "",
                referencia: "",
                fecha_recepcion: "",
                hora: "",
                nro_hojas: "",
                nro_hoja_ruta: "",
                fecha_registro: "",
                destinatarios: [],
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
    },
    methods: {
        limpiaHojaRuta() {
            this.oHojaRuta.hoja_ruta = "";
            this.oHojaRuta.descripcion = "";
        },
        enviarIndex() {
            console.log("AA");
            this.$router.push({ name: "hoja_rutas.index" });
            console.log("BB");
        },
    },
};
</script>

<style></style>
