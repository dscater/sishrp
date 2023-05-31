<template>
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary collapsed-card">
                <div class="card-header">
                    <h3 class="card-title text-md">
                        Destinatario {{ nro_destinatario }}:
                        <span v-text="oDestinatario.destinatario"></span>
                    </h3>
                    <div class="card-tools">
                        <button
                            class="btn btn-sm btn-warning"
                            @click="editarDestinatario"
                        >
                            <i class="fa fa-edit"></i>
                        </button>
                        <button class="btn btn-sm btn-danger" @click="eliminarDestinatario">
                            <i class="fa fa-trash"></i>
                        </button>
                        <button
                            type="button"
                            class="btn btn-tool"
                            data-card-widget="collapse"
                        >
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body border border-1 border-primary">
                    <div class="row">
                        <div class="col-md-4">
                            <label
                                >Informe
                                <i
                                    :class="[
                                        oDestinatario.informe == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i
                            ></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Asista
                                <i
                                    :class="[
                                        oDestinatario.asista == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Responda
                                <i
                                    :class="[
                                        oDestinatario.responda == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Ejecute
                                <i
                                    :class="[
                                        oDestinatario.ejecute == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Difunda
                                <i
                                    :class="[
                                        oDestinatario.difunda == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Coordine
                                <i
                                    :class="[
                                        oDestinatario.coordine == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Ver antecedente
                                <i
                                    :class="[
                                        oDestinatario.ver_antecedente == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Acelere trámite
                                <i
                                    :class="[
                                        oDestinatario.acelere_tramite == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Para conocimiento
                                <i
                                    :class="[
                                        oDestinatario.para_conocimiento == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Archivo
                                <i
                                    :class="[
                                        oDestinatario.archivo == 1
                                            ? 'fa fa-check-square text-success text-md'
                                            : 'far fa-square',
                                    ]"
                                ></i>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Descripción:</label>
                            <p v-text="oDestinatario.descripcion"></p>
                        </div>
                        <div class="form-group col-md-4">
                            <label
                                >Fecha:
                                <span
                                    class="font-weight-normal"
                                    v-text="oDestinatario.fecha"
                                ></span
                            ></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <ModalDestinatario
            :muestra_modal="muestra_modal"
            :accion="modal_accion"
            :destinatario="oDestinatario"
            @close="muestra_modal = false"
            @envioModal="actualizaListaDestinatario"
        ></ModalDestinatario>
    </div>
</template>
<script>
import ModalDestinatario from "./ModalDestinatario.vue";
export default {
    components: {
        ModalDestinatario,
    },
    props: {
        destinatario: {
            type: Object,
            default: {
                id: 0,
                hoja_ruta_id: 0,
                destinatario: "",
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
            },
        },
        nro_destinatario: {
            type: Number,
            required: true,
        },
        form_errors: {
            default: [],
        },
    },
    watch: {
        destinatario(newVal) {
            this.oDestinatario = newVal;
        },
        form_errors(newVal) {
            this.errors = newVal;
        },
    },
    mounted() {},
    data() {
        return {
            oDestinatario: this.destinatario,
            errors: this.form_errors,
            modal_accion: "edit",
            muestra_modal: false,
        };
    },
    methods: {
        actualizaListaDestinatario(item) {
            this.oDestinatario = item;
            this.muestra_modal = false;
            this.$emit("actualizacion", this.oDestinatario);
        },
        editarDestinatario() {
            console.log("DESTINATARIO");
            console.log(this.oDestinatario);
            this.modal_accion = "edit";
            this.muestra_modal = true;
        },
        eliminarDestinatario() {
            let id = this.oDestinatario.id;
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<h3>Destintario: ${this.oDestinatario.destinatario}</h3><strong>Esta acción no se podrá deshacer despues de llevarse a cabo</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#dc3545",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post("/admin/hoja_rutas/elimina_destinatario/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.$emit("eliminacion", id);
                            this.filter = "";
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                        })
                        .catch((error) => {
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
                }
            });
        },
    },
};
</script>
<style></style>
