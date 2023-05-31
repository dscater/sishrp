<template>
    <div class="row">
        <div class="form-group col-md-6">
            <label>Procedencia*:</label>
            <el-input
                type="text"
                placeholder="Procedencia"
                :class="{
                    'is-invalid': errors.procedencia,
                }"
                v-model="oHojaRuta.procedencia"
                cleareable
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.procedencia"
                v-text="errors.procedencia[0]"
            ></span>
        </div>
        <div class="form-group col-md-6">
            <label>Referencia*:</label>
            <el-input
                type="text"
                placeholder="Referencia"
                :class="{
                    'is-invalid': errors.referencia,
                }"
                v-model="oHojaRuta.referencia"
                cleareable
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.referencia"
                v-text="errors.referencia[0]"
            ></span>
        </div>
        <div class="form-group col-md-4">
            <label>Fecha de recepción*:</label>
            <input
                type="date"
                :class="{
                    'is-invalid': errors.fecha_recepcion,
                }"
                class="form-control"
                v-model="oHojaRuta.fecha_recepcion"
            />
            <span
                class="error invalid-feedback"
                v-if="errors.fecha_recepcion"
                v-text="errors.fecha_recepcion[0]"
            ></span>
        </div>
        <div class="form-group col-md-4">
            <label>Horas*:</label>
            <input
                type="time"
                :class="{
                    'is-invalid': errors.hora,
                }"
                class="form-control"
                v-model="oHojaRuta.hora"
            />
            <span
                class="error invalid-feedback"
                v-if="errors.hora"
                v-text="errors.hora[0]"
            ></span>
        </div>
        <div class="form-group col-md-4">
            <label>N° de hojas*:</label>
            <el-input
                type="text"
                placeholder="N° de hojas"
                :class="{
                    'is-invalid': errors.nro_hojas,
                }"
                v-model="oHojaRuta.nro_hojas"
                cleareable
            >
            </el-input>
            <span
                class="error invalid-feedback"
                v-if="errors.nro_hojas"
                v-text="errors.nro_hojas[0]"
            ></span>
        </div>

        <div class="col-md-12">
            <template v-for="(item, index) in oHojaRuta.destinatarios">
                <Destinatario
                    v-if="accion == 'nuevo'"
                    :key="index"
                    :nro_destinatario="index + 1"
                    :index="index"
                    :destinatario="item"
                    :form_errors="errors"
                ></Destinatario>
                <DestinatarioShow
                    v-else
                    :nro_destinatario="index + 1"
                    :destinatario="item"
                    :form_errors="errors"
                ></DestinatarioShow>
            </template>
        </div>
        <div class="col-md-4">
            <button
                class="btn btn-block btn-primary"
                v-html="txtBotton"
                :disabled="enviando"
                @click="enviarRegistro()"
            ></button>
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
        accion: {
            type: String,
            default: "nuevo",
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
            errors: [],
            enviando: false,
        };
    },
    computed: {
        txtBotton() {
            return this.accion == "nuevo"
                ? '<i class="fa fa-save"></i> REGISTRAR'
                : '<i class="fa fa-edit"></i>ACTUALIZAR';
        },
    },
    mounted() {
        console.log(this.oHojaRuta);
        if (
            this.oHojaRuta.destinatarios.length == 0 &&
            this.accion == "nuevo"
        ) {
            this.oHojaRuta.destinatarios.push({
                id: 0,
                hoja_ruta_id: 0,
                destinatario: "ALCALDE",
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
        }
    },
    methods: {
        enviarRegistro() {
            this.enviando = true;
            try {
                let url = "/admin/hoja_rutas";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "procedencia",
                    this.oHojaRuta.procedencia ? this.oHojaRuta.procedencia : ""
                );
                formdata.append(
                    "referencia",
                    this.oHojaRuta.referencia ? this.oHojaRuta.referencia : ""
                );
                formdata.append(
                    "fecha_recepcion",
                    this.oHojaRuta.fecha_recepcion
                        ? this.oHojaRuta.fecha_recepcion
                        : ""
                );
                formdata.append(
                    "hora",
                    this.oHojaRuta.hora ? this.oHojaRuta.hora : ""
                );
                formdata.append(
                    "nro_hojas",
                    this.oHojaRuta.nro_hojas ? this.oHojaRuta.nro_hojas : ""
                );

                if (this.accion == "nuevo") {
                    formdata.append(
                        "destinatario",
                        this.oHojaRuta.destinatarios[0].destinatario
                            ? this.oHojaRuta.destinatarios[0].destinatario
                            : ""
                    );
                    formdata.append("informe",this.oHojaRuta.destinatarios[0].informe);
                    formdata.append("asista",this.oHojaRuta.destinatarios[0].asista);
                    formdata.append("responda",this.oHojaRuta.destinatarios[0].responda);
                    formdata.append("ejecute",this.oHojaRuta.destinatarios[0].ejecute);
                    formdata.append("difunda",this.oHojaRuta.destinatarios[0].difunda);
                    formdata.append("coordine",this.oHojaRuta.destinatarios[0].coordine);
                    formdata.append("ver_antecedente",this.oHojaRuta.destinatarios[0].ver_antecedente);
                    formdata.append("acelere_tramite",this.oHojaRuta.destinatarios[0].acelere_tramite);
                    formdata.append("para_conocimiento",this.oHojaRuta.destinatarios[0].para_conocimiento);
                    formdata.append("archivo",this.oHojaRuta.destinatarios[0].archivo);
                    formdata.append(
                        "descripcion",
                        this.oHojaRuta.destinatarios[0].descripcion
                            ? this.oHojaRuta.destinatarios[0].descripcion
                            : ""
                    );
                    formdata.append(
                        "fecha",
                        this.oHojaRuta.destinatarios[0].fecha
                            ? this.oHojaRuta.destinatarios[0].fecha
                            : ""
                    );
                }

                if (this.accion == "edit") {
                    url = "/admin/hoja_rutas/" + this.oHojaRuta.id;
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
                        this.$emit("registroEnviado");
                        this.errors = [];
                    })
                    .catch((error) => {
                        this.enviando = false;
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
