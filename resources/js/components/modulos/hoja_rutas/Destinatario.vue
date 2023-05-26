<template>
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3 class="text-md">Destinatario {{ nro_destinatario }}</h3>
                </div>
                <div class="card-body border border-1 border-primary">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>Destinatario*:</label>
                            <el-input
                                v-model="oDestinatario.destinatario"
                                :class="{
                                    'is-invalid': errors.destinatario,
                                }"
                            ></el-input>
                            <span
                                class="error invalid-feedback"
                                v-if="errors.destinatario"
                                v-text="errors.destinatario[0]"
                            ></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label
                                >Informe
                                <input
                                    type="checkbox"
                                    :checked="oDestinatario.informe"
                                    v-model="oDestinatario.informe"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Asista
                                <input
                                    type="checkbox"
                                    :checked="oDestinatario.asista"
                                    v-model="oDestinatario.asista"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Responda
                                <input
                                    type="checkbox"
                                    :checked="oDestinatario.responda"
                                    v-model="oDestinatario.responda"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Ejecute
                                <input
                                    type="checkbox"
                                    :checked="oDestinatario.ejecute"
                                    v-model="oDestinatario.ejecute"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Difunda
                                <input
                                    type="checkbox"
                                    :checked="oDestinatario.difunda"
                                    v-model="oDestinatario.difunda"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Coordine
                                <input
                                    type="checkbox"
                                    :checked="oDestinatario.coordine"
                                    v-model="oDestinatario.coordine"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Ver antecedente
                                <input
                                    type="checkbox"
                                    :checked="
                                        oDestinatario.ver_antecedente == 1
                                    "
                                    v-model="oDestinatario.ver_antecedente"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Acelere trámite
                                <input
                                    type="checkbox"
                                    :checked="
                                        oDestinatario.acelere_tramite == 1
                                    "
                                    v-model="oDestinatario.acelere_tramite"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Para conocimiento
                                <input
                                    type="checkbox"
                                    :checked="
                                        oDestinatario.para_conocimiento == 1
                                    "
                                    v-model="oDestinatario.para_conocimiento"
                            /></label>
                        </div>
                        <div class="col-md-4">
                            <label
                                >Archivo
                                <input
                                    type="checkbox"
                                    :checked="oDestinatario.archivo"
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
                                    'is-invalid': errors.descripcion,
                                }"
                            ></el-input>
                            <span
                                class="error invalid-feedback"
                                v-if="errors.descripcion"
                                v-text="errors.descripcion[0]"
                            ></span>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Fecha*:</label>
                            <input
                                type="date"
                                v-model="oDestinatario.fecha"
                                :class="{
                                    'is-invalid': errors.fecha,
                                }"
                                class="form-control"
                            />
                            <span
                                class="error invalid-feedback"
                                v-if="errors.fecha"
                                v-text="errors.fecha[0]"
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
    data() {
        return {
            oDestinatario: this.destinatario,
            errors: this.form_errors,
        };
    },
    methods: {
        asigna_valor(key) {
            console.log(key);
            console.log(this.oDestinatario[key]);
            this.oDestinatario[key] = this.oDestinatario[key] ? 0 : 1;
            console.log(this.oDestinatario[key]);
        },
    },
};
</script>
<style></style>
