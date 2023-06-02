<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Portal - Turismo y Deportes</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label>Turismo*</label>
                                        <el-input
                                            placeholder="Turismo"
                                            :class="{
                                                'is-invalid':
                                                    errors.link_turismo,
                                            }"
                                            v-model="
                                                oPortaldTurismoDeporte.link_turismo
                                            "
                                            clearable
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.link_turismo"
                                            v-text="errors.link_turismo[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>Deportes*</label>
                                        <el-input
                                            placeholder="Turismo"
                                            :class="{
                                                'is-invalid':
                                                    errors.link_deportes,
                                            }"
                                            v-model="
                                                oPortaldTurismoDeporte.link_deportes
                                            "
                                            clearable
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.link_deportes"
                                            v-text="errors.link_deportes[0]"
                                        ></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <el-button
                                        type="primary"
                                        class="bg-primary"
                                        :loading="enviando"
                                        @click="setRegistro()"
                                        >Actualizar información</el-button
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            permisos: localStorage.getItem("permisos"),
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oPortaldTurismoDeporte: {
                id: 0,
                titulo: "",
                descripcion: "",
                archivo: null,
                tipo: "",
            },
            enviando: false,
            errors:[],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getPortaldTurismoDeportes();
    },
    methods: {
        getPortaldTurismoDeportes() {
            let url = "/admin/portal_turismo_deportes";
            axios.get(url).then((res) => {
                this.oPortaldTurismoDeporte = res.data;
            });
        },
        setRegistro() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url =
                    "/admin/portal_turismo_deportes/" +
                    this.oPortaldTurismoDeporte.id;
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "link_turismo",
                    this.oPortaldTurismoDeporte.link_turismo
                        ? this.oPortaldTurismoDeporte.link_turismo
                        : ""
                );
                formdata.append(
                    "link_deportes",
                    this.oPortaldTurismoDeporte.link_deportes
                        ? this.oPortaldTurismoDeporte.link_deportes
                        : ""
                );

                formdata.append("_method", "PUT");
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
                            this.limpiaPortalActividad();
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
    },
};
</script>

<style></style>
