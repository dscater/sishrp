<template>
    <div
        class="modal fade"
        :class="{ show: bModal }"
        id="modal-default"
        aria-modal="true"
        role="dialog"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                        @click="cierraModal"
                    >
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>Destinatario*:</label>
                                <el-input
                                    v-model="oDestinatario.destinatario"
                                    :class="{
                                        'is-invalid': errors['destinatario'],
                                    }"
                                ></el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['destinatario']"
                                    v-text="errors['destinatario'][0]"
                                ></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label
                                    >Informe
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="oDestinatario.informe"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Asista
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="oDestinatario.asista"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Responda
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        :checked="
                                            parseInt(oDestinatario.responda) ==
                                            1
                                        "
                                        v-model="oDestinatario.responda"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Ejecute
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="oDestinatario.ejecute"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Difunda
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="oDestinatario.difunda"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Coordine
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        :checked="
                                            parseInt(oDestinatario.coordine) ==
                                            1
                                        "
                                        v-model="oDestinatario.coordine"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Ver antecedente
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="oDestinatario.ver_antecedente"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Acelere trámite
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="oDestinatario.acelere_tramite"
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Para conocimiento
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="
                                            oDestinatario.para_conocimiento
                                        "
                                /></label>
                            </div>
                            <div class="col-md-4">
                                <label
                                    >Archivo
                                    <input
                                        type="checkbox"
                                        :true-value="1"
                                        :false-value="0"
                                        v-model="oDestinatario.archivo"
                                /></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>Descripción*:</label>
                                <el-input
                                    type="textarea"
                                    autoresize
                                    v-model="oDestinatario.descripcion"
                                    :class="{
                                        'is-invalid': errors['descripcion'],
                                    }"
                                ></el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['descripcion']"
                                    v-text="errors['descripcion'][0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Fecha*:</label>
                                <input
                                    type="date"
                                    v-model="oDestinatario.fecha"
                                    :class="{
                                        'is-invalid': errors['fecha'],
                                    }"
                                    class="form-control"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors['fecha']"
                                    v-text="errors['fecha'][0]"
                                ></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-between">
                    <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        @click="cierraModal"
                    >
                        Cerrar
                    </button>
                    <el-button
                        type="primary"
                        class="bg-primary"
                        :loading="enviando"
                        @click="setRegistroModal()"
                        >{{ textoBoton }}</el-button
                    >
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        muestra_modal: {
            type: Boolean,
            default: false,
        },
        accion: {
            type: String,
            default: "nuevo",
        },
        destinatario: {
            type: Object,
            default: {
                id: 0,
                nombre: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
        destinatario(newVal) {
            this.oDestinatario = newVal;
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR REGISTRO";
            } else {
                return "MODIFICAR REGISTRO";
            }
        },
        textoBoton() {
            if (this.accion == "nuevo") {
                return "Registrar";
            } else {
                return "Actualizar";
            }
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            bModal: this.muestra_modal,
            enviando: false,
            oDestinatario: this.destinatario,
            errors: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
    },
    methods: {
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = "/admin/destinatarios";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "destinatario",
                    this.oDestinatario.destinatario
                        ? this.oDestinatario.destinatario
                        : ""
                );
                formdata.append("informe", this.oDestinatario.informe);
                formdata.append("asista", this.oDestinatario.asista);
                formdata.append("responda",this.oDestinatario.responda);
                formdata.append("ejecute", this.oDestinatario.ejecute);
                formdata.append("difunda", this.oDestinatario.difunda);
                formdata.append("coordine",this.oDestinatario.coordine);
                formdata.append("ver_antecedente",this.oDestinatario.ver_antecedente);
                formdata.append("acelere_tramite",this.oDestinatario.acelere_tramite);
                formdata.append("para_conocimiento",this.oDestinatario.para_conocimiento);
                formdata.append("archivo", this.oDestinatario.archivo);
                formdata.append("descripcion",this.oDestinatario.descripcion? this.oDestinatario.descripcion: "");
                formdata.append(
                    "fecha",
                    this.oDestinatario.fecha ? this.oDestinatario.fecha : ""
                );
                if (this.accion == "edit") {
                    url =
                        "/admin/hoja_rutas/actualiza_destinatario/" +
                        this.oDestinatario.id;
                    formdata.append("_method", "PUT");
                }
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
                        this.oDestinatario = res.data.destinatario;
                        console.log(this.oDestinatario);
                        this.$emit("envioModal", this.oDestinatario);
                        this.errors = [];
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
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
        },
        cargaImagen(e) {
            this.destinatario.foto = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaDestinatario() {
            this.errors = [];
            this.oDestinatario.destinatario = "";
            this.oDestinatario.informe = 0;
            this.oDestinatario.asista = 0;
            this.oDestinatario.responda = 0;
            this.oDestinatario.ejecute = 0;
            this.oDestinatario.difunda = 0;
            this.oDestinatario.coordine = 0;
            this.oDestinatario.ver_antecedente = 0;
            this.oDestinatario.acelere_tramite = 0;
            this.oDestinatario.para_conocimiento = 0;
            this.oDestinatario.archivo = "";
            this.oDestinatario.descripcion = "";
            this.oDestinatario.fecha = "";
        },
    },
};
</script>

<style></style>
