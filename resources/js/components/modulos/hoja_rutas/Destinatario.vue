<template>
    <div class="row">
        <div class="col-md-12">
            <div class="card card-success">
                <div class="card-header">
                    <h3 class="text-md card-title">
                        Destinatario {{ nro_destinatario }}
                    </h3>

                    <div class="card-tools">
                        <button
                            v-if="accion == 'responder'"
                            class="btn btn-danger"
                            @click="eliminaDestinatario(index)"
                        >
                            <i class="fa fa-trash"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body border border-1 border-success">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Destinatario*:</label>
                            <el-input
                                v-model="oDestinatario.destinatario"
                                :class="{
                                    'is-invalid':
                                        errors['destinatario' + '.' + index],
                                }"
                            ></el-input>
                            <span
                                class="error invalid-feedback"
                                v-if="errors['destinatario' + '.' + index]"
                                v-text="errors['destinatario' + '.' + index][0]"
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
                                    v-model="oDestinatario.para_conocimiento"
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
                                    'is-invalid':
                                        errors['descripcion' + '.' + index],
                                }"
                            ></el-input>
                            <span
                                class="error invalid-feedback"
                                v-if="errors['descripcion' + '.' + index]"
                                v-text="errors['descripcion' + '.' + index][0]"
                            ></span>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Fecha*:</label>
                            <input
                                type="date"
                                v-model="oDestinatario.fecha"
                                :class="{
                                    'is-invalid': errors['fecha' + '.' + index],
                                }"
                                class="form-control"
                            />
                            <span
                                class="error invalid-feedback"
                                v-if="errors['fecha' + '.' + index]"
                                v-text="errors['fecha' + '.' + index][0]"
                            ></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
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
        index: {
            type: Number,
            required: true,
        },
        nro_destinatario: {
            type: Number,
            required: true,
        },
        form_errors: {
            default: [],
        },
        accion: {
            type: String,
            default: "nuevo",
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
    data() {
        return {
            oDestinatario: this.destinatario,
            errors: this.form_errors,
        };
    },
    methods: {
        eliminaDestinatario(index) {
            this.$emit("eliminaDestinatario", index);
        },
    },
};
</script>
<style></style>
