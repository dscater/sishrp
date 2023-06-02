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
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.mision,
                                    }"
                                    >Misión*</label
                                >
                                <el-input
                                    type="textarea"
                                    autosize
                                    placeholder="Misión"
                                    :class="{ 'is-invalid': errors.mision }"
                                    v-model="portal_gamy.mision"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.mision"
                                    v-text="errors.mision[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.img_mision,
                                    }"
                                    >Imagen de misión</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{ 'is-invalid': errors.img_mision }"
                                    ref="file_mision"
                                    @change="cargaImagen('img_mision', $event)"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.img_mision"
                                    v-text="errors.img_mision[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.vision,
                                    }"
                                    >Visión*</label
                                >
                                <el-input
                                    type="textarea"
                                    autosize
                                    placeholder="Visión"
                                    :class="{ 'is-invalid': errors.vision }"
                                    v-model="portal_gamy.vision"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.vision"
                                    v-text="errors.vision[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.img_vision,
                                    }"
                                    >Imagen de misión</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{ 'is-invalid': errors.img_vision }"
                                    ref="file_vision"
                                    @change="cargaImagen('img_vision', $event)"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.img_vision"
                                    v-text="errors.img_vision[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.historia,
                                    }"
                                    >Historia*</label
                                >
                                <el-input
                                    type="textarea"
                                    autosize
                                    placeholder="Historia"
                                    :class="{ 'is-invalid': errors.historia }"
                                    v-model="portal_gamy.historia"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.historia"
                                    v-text="errors.historia[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.img_historia,
                                    }"
                                    >Imagen de misión</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.img_historia,
                                    }"
                                    ref="file_historia"
                                    @change="
                                        cargaImagen('img_historia', $event)
                                    "
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.img_historia"
                                    v-text="errors.img_historia[0]"
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
        portal_gamy: {
            type: Object,
            default: {
                id: 0,
                mision: "",
                img_mision: null,
                vision: "",
                img_vision: null,
                historia: "",
                img_historia: null,
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
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "NUEVO REGISTRO";
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
            errors: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
    },
    methods: {
        cargaImagen(key, event) {
            this.portal_gamy[key] = null;
            this.portal_gamy[key] = event.target.files[0];
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = "/admin/portal_gamys";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "mision",
                    this.portal_gamy.mision ? this.portal_gamy.mision : ""
                );
                formdata.append(
                    "img_mision",
                    this.portal_gamy.img_mision
                        ? this.portal_gamy.img_mision
                        : ""
                );
                formdata.append(
                    "vision",
                    this.portal_gamy.vision ? this.portal_gamy.vision : ""
                );
                formdata.append(
                    "img_vision",
                    this.portal_gamy.img_vision
                        ? this.portal_gamy.img_vision
                        : ""
                );
                formdata.append(
                    "historia",
                    this.portal_gamy.historia ? this.portal_gamy.historia : ""
                );
                formdata.append(
                    "img_historia",
                    this.portal_gamy.img_historia
                        ? this.portal_gamy.img_historia
                        : ""
                );

                if (this.accion == "edit") {
                    url = "/admin/portal_gamys/" + this.portal_gamy.id;
                    formdata.append("_method", "PUT");
                }
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        this.enviando = false;
                        if (res.data.sw) {
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 1500,
                            });
                            this.limpiaPortalGamy();
                            this.$emit("envioModal");
                            this.errors = [];
                            if (this.accion == "edit") {
                                this.textoBtn = "Actualizar";
                            } else {
                                this.textoBtn = "Registrar";
                            }
                        } else {
                            Swal.fire({
                                icon: "info",
                                title: "Atención",
                                html: res.data.msj,
                                showConfirmButton: false,
                                timer: 2000,
                            });
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
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaPortalGamy() {
            this.errors = [];
            this.portal_gamy.mision = "";
            this.portal_gamy.img_mision = null;
            this.portal_gamy.vision = "";
            this.portal_gamy.img_vision = null;
            this.portal_gamy.historia = "";
            this.portal_gamy.img_historia = null;
        },
    },
};
</script>

<style></style>
