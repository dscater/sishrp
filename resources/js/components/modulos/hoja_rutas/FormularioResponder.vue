<template>
    <div class="row">
        <div class="form-group col-md-6">
            <label
                >Procedencia*:
                <span
                    class="font-weight-normal"
                    v-text="oHojaRuta.procedencia"
                ></span
            ></label>
        </div>
        <div class="form-group col-md-6">
            <label
                >Referencia*:
                <span
                    class="font-weight-normal"
                    v-text="oHojaRuta.referencia"
                ></span
            ></label>
        </div>
        <div class="form-group col-md-4">
            <label
                >Fecha de recepción*:
                <span
                    class="font-weight-normal"
                    v-text="oHojaRuta.fecha_recepcion"
                ></span
            ></label>
        </div>
        <div class="form-group col-md-4">
            <label
                >Horas*:
                <span class="font-weight-normal" v-text="oHojaRuta.hora"></span
            ></label>
        </div>
        <div class="form-group col-md-4">
            <label
                >N° de hojas*:
                <span
                    class="font-weight-normal"
                    v-text="oHojaRuta.nro_hojas"
                ></span
            ></label>
        </div>

        <div class="col-md-12">
            <template v-for="(item, index) in oHojaRuta.destinatarios">
                <DestinatarioShow
                    :nro_destinatario="index + 1"
                    :destinatario="item"
                    :form_errors="errors"
                    @actualizacion="actualizaDestinatario"
                    @eliminacion="actualizaLista"
                ></DestinatarioShow>
            </template>
            <template v-for="(item, index) in listNuevos">
                <Destinatario
                    :accion="'responder'"
                    :index="index"
                    :nro_destinatario="
                        oHojaRuta.destinatarios.length + index + 1
                    "
                    :destinatario="item"
                    :form_errors="errors"
                    @eliminaDestinatario="removerDestinatario"
                ></Destinatario>
            </template>
        </div>
        <div class="col-md-12 mb-3">
            <button
                class="btn btn-success btn-flat btn-block"
                @click="agregarDestinatario()"
            >
                <i class="fa fa-plus"></i> Agregar destinatario
            </button>
        </div>
        <div class="col-md-4">
            <button
                class="btn btn-block btn-primary"
                @click="enviarRegistro()"
                :disabled="disabledEnvio || enviando"
            >
                <i class="fa fa-save"></i> REGISTRAR RESPUESTA(S)
            </button>
        </div>
        <div class="col-md-4">
            <router-link
                :to="{ name: 'hoja_rutas.index' }"
                class="btn btn-block btn-default"
                ><i class="fa fa-arrow-left"></i> Volver</router-link
            >
        </div>
    </div>
</template>
<script>
import Destinatario from "./Destinatario.vue";
import DestinatarioShow from "./DestinatarioShow.vue";
export default {
    components: {
        Destinatario,
        DestinatarioShow,
    },
    props: {
        hoja_ruta: {
            type: Object,
            required: true,
        },
    },
    watch: {
        hoja_ruta(newVal) {
            this.oHojaRuta = newVal;
        },
    },
    data() {
        return {
            oHojaRuta: this.hoja_ruta,
            listNuevos: [],
            errors: [],
            enviando: false,
            disabledEnvio: false,
        };
    },
    computed: {},
    mounted() {
        this.validaNuevos();
    },
    methods: {
        validaNuevos() {
            if (this.listNuevos.length <= 0) {
                this.disabledEnvio = true;
            } else {
                this.disabledEnvio = false;
            }
        },
        enviarRegistro() {
            this.enviando = true;
            if (this.listNuevos.length > 0) {
                try {
                    let url =
                        "/admin/hoja_rutas/responder/" + this.oHojaRuta.id;
                    let config = {
                        headers: {
                            "Content-Type": "multipart/form-data",
                        },
                    };
                    let formdata = new FormData();

                    this.listNuevos.forEach((elem) => {
                        formdata.append("destinatario[]", elem.destinatario);
                        formdata.append("informe[]", elem.informe);
                        formdata.append("asista[]", elem.asista);
                        formdata.append("responda[]", elem.responda);
                        formdata.append("ejecute[]", elem.ejecute);
                        formdata.append("difunda[]", elem.difunda);
                        formdata.append("coordine[]", elem.coordine);
                        formdata.append("ver_antecedente[]",elem.ver_antecedente);
                        formdata.append("acelere_tramite[]",elem.acelere_tramite);
                        formdata.append("para_conocimiento[]",elem.para_conocimiento);
                        formdata.append("archivo[]", elem.archivo);
                        formdata.append("descripcion[]", elem.descripcion);
                        formdata.append("fecha[]", elem.fecha);
                    });

                    axios
                        .post(url, formdata, config)
                        .then((res) => {
                            this.enviando = false;
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                            this.$emit("registroEnviado");
                            this.errors = [];
                        })
                        .catch((error) => {
                            this.enviando = false;
                            if (error.response) {
                                if (error.response.status === 422) {
                                    this.errors = error.response.data.errors;
                                    Swal.fire({
                                        icon: "error",
                                        title: "Error",
                                        html: "¡Tienes errores en el formulario!",
                                        showConfirmButton: false,
                                        timer: 2000,
                                    });
                                }
                                if (
                                    error.response.status === 420 ||
                                    error.response.status === 419 ||
                                    error.response.status === 401
                                ) {
                                    window.location = "/";
                                }
                                if (error.response.status === 500) {
                                    Swal.fire({
                                        icon: "error",
                                        title: "Error",
                                        html: error.response.data.message,
                                        showConfirmButton: false,
                                        timer: 2000,
                                    });
                                }
                            }
                        });
                } catch (e) {
                    this.enviando = false;
                    console.log(e);
                }
            }
        },
        agregarDestinatario() {
            let txtDestinatario = "";
            if (
                this.oHojaRuta.destinatarios.length + this.listNuevos.length ==
                1
            ) {
                txtDestinatario = "SECRETARIA MUNICIPAL ADMINISTRATIVA";
            }
            this.listNuevos.push({
                id: 0,
                hoja_ruta_id: 0,
                destinatario: txtDestinatario,
                informe: 0,
                asista: 0,
                responda: 0,
                ejecute: 0,
                difunda: 0,
                coordine: 0,
                ver_antecedente: 0,
                acelere_tramite: 0,
                para_conocimiento: 0,
                archivo: 0,
                descripcion: "",
                fecha: "",
            });
            this.validaNuevos();
        },
        removerDestinatario(index) {
            this.listNuevos.splice(index, 1);
            this.validaNuevos();
        },
        actualizaDestinatario(item) {
            let index = this.oHojaRuta.destinatarios.findIndex((elem) => {
                return elem.id == item.id;
            });

            this.oHojaRuta.destinatarios[index] = item;
        },
        actualizaLista(id) {
            let index = this.oHojaRuta.destinatarios.findIndex((elem) => {
                return elem.id == id;
            });

            this.oHojaRuta.destinatarios.splice(index, 1);
        },
    },
};
</script>
