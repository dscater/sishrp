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
                                    <div class="col-md-3">
                                        <router-link
                                            v-if="
                                                permisos.includes(
                                                    'hoja_rutas.create'
                                                )
                                            "
                                            class="btn btn-primary btn-flat btn-block"
                                            :to="{ name: 'hoja_rutas.create' }"
                                        >
                                            <i class="fa fa-plus"></i>
                                            Nuevo
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <b-col lg="10" class="my-1">
                                        <b-form-group
                                            label="Buscar"
                                            label-for="filter-input"
                                            label-cols-sm="3"
                                            label-align-sm="right"
                                            label-size="sm"
                                            class="mb-0"
                                        >
                                            <b-input-group size="sm">
                                                <b-form-input
                                                    id="filter-input"
                                                    v-model="filter"
                                                    type="search"
                                                    placeholder="Buscar"
                                                ></b-form-input>

                                                <b-input-group-append>
                                                    <b-button
                                                        class="bg-primary"
                                                        variant="primary"
                                                        :disabled="!filter"
                                                        @click="filter = ''"
                                                        >Borrar</b-button
                                                    >
                                                </b-input-group-append>
                                            </b-input-group>
                                        </b-form-group>
                                    </b-col>
                                    <div class="col-md-12">
                                        <b-overlay
                                            :show="showOverlay"
                                            rounded="sm"
                                        >
                                            <b-table
                                                :fields="fields"
                                                :items="listRegistros"
                                                show-empty
                                                stacked="md"
                                                responsive
                                                :current-page="currentPage"
                                                :per-page="perPage"
                                                @filtered="onFiltered"
                                                empty-text="Sin resultados"
                                                empty-filtered-text="Sin resultados"
                                                :filter="filter"
                                            >
                                                <template #cell(detalle)="row">
                                                    <b-button
                                                        size="sm"
                                                        variant="primary"
                                                        @click="
                                                            row.toggleDetails
                                                        "
                                                    >
                                                        {{
                                                            row.detailsShowing
                                                                ? "Ocultar"
                                                                : "Ver"
                                                        }}
                                                        Detalles
                                                    </b-button>
                                                </template>
                                                <template #row-details="row">
                                                    <b-card>
                                                        <ul>
                                                            <li>
                                                                Informe:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .informe ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Asista:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .asista ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Responda:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .responda ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Ejecute:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .ejecute ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Difunda:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .difunda ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Coordine:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .coordine ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Ver antecedente:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .ver_antecedente ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Acelere trámite:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .acelere_tramite ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Para
                                                                conocimiento:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .para_conocimiento ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                            <li>
                                                                Archivo:
                                                                <span
                                                                    ><i
                                                                        :class="[
                                                                            row
                                                                                .item
                                                                                .ultimo_destinatario
                                                                                .archivo ==
                                                                            1
                                                                                ? 'fa fa-check-square'
                                                                                : 'far fa-square',
                                                                        ]"
                                                                    ></i
                                                                ></span>
                                                            </li>
                                                        </ul>
                                                        <strong
                                                            >Descripción:</strong
                                                        >
                                                        <span
                                                            v-text="
                                                                row.item
                                                                    .ultimo_destinatario
                                                                    .descripcion
                                                            "
                                                        ></span
                                                        ><br />
                                                        <strong>Fecha:</strong>
                                                        <span
                                                            v-text="
                                                                row.item
                                                                    .ultimo_destinatario
                                                                    .fecha
                                                            "
                                                        ></span
                                                        ><br />
                                                    </b-card>
                                                </template>

                                                <template
                                                    #cell(fecha_registro)="row"
                                                >
                                                    {{
                                                        formatoFecha(
                                                            row.item
                                                                .fecha_registro
                                                        )
                                                    }}
                                                </template>

                                                <template #cell(accion)="row">
                                                    <div
                                                        class="row justify-content-between"
                                                    >
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-success"
                                                            class="btn-flat btn-block"
                                                            title="Pdf"
                                                            @click="
                                                                pdf(row.item)
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-file-pdf"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-primary"
                                                            class="btn-flat btn-block"
                                                            title="Responder"
                                                            @click="
                                                                responderHoja(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-file-signature"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-warning"
                                                            class="btn-flat btn-block"
                                                            title="Editar registro"
                                                            @click="
                                                                editarRegistro(
                                                                    row.item
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-edit"
                                                            ></i>
                                                        </b-button>
                                                        <b-button
                                                            size="sm"
                                                            pill
                                                            variant="outline-danger"
                                                            class="btn-flat btn-block"
                                                            title="Eliminar registro"
                                                            @click="
                                                                eliminaHojaRuta(
                                                                    row.item.id,
                                                                    row.item
                                                                        .nro_hoja_ruta +
                                                                        ' | ' +
                                                                        row.item
                                                                            .procedencia +
                                                                        ' | ' +
                                                                        row.item
                                                                            .referencia +
                                                                        ' | ' +
                                                                        row.item
                                                                            .fecha_recepcion
                                                                )
                                                            "
                                                        >
                                                            <i
                                                                class="fa fa-trash"
                                                            ></i>
                                                        </b-button>
                                                    </div>
                                                </template>
                                            </b-table>
                                        </b-overlay>
                                        <div class="row">
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="ml-auto my-1"
                                            >
                                                <b-form-select
                                                    align="right"
                                                    id="per-page-select"
                                                    v-model="perPage"
                                                    :options="pageOptions"
                                                    size="sm"
                                                ></b-form-select>
                                            </b-col>
                                            <b-col
                                                sm="6"
                                                md="2"
                                                class="my-1 mr-auto"
                                                v-if="perPage"
                                            >
                                                <b-pagination
                                                    v-model="currentPage"
                                                    :total-rows="totalRows"
                                                    :per-page="perPage"
                                                    align="left"
                                                ></b-pagination>
                                            </b-col>
                                        </div>
                                    </div>
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
            search: "",
            listRegistros: [],
            showOverlay: false,
            fields: [
                {
                    key: "nro_hoja_ruta",
                    label: "N° de hoja de ruta",
                    sortable: true,
                },
                { key: "procedencia", label: "Procedencia", sortable: true },
                { key: "referencia", label: "Referencia", sortable: true },
                {
                    key: "fecha_recepcion",
                    label: "Fecha de recepción",
                    sortable: true,
                },
                { key: "hora", label: "Hora", sortable: true },
                { key: "nro_hojas", label: "N° de hojas", sortable: true },
                {
                    key: "ultimo_destinatario.destinatario",
                    label: "Último destinatario",
                    sortable: true,
                },
                { key: "detalle", label: "Detalle", sortable: true },
                { key: "accion", label: "Acción" },
            ],
            loading: true,
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oHojaRuta: {
                id: 0,
                hoja_ruta: "",
                descripcion: "",
            },
            currentPage: 1,
            perPage: 5,
            pageOptions: [
                { value: 5, text: "Mostrar 5 Registros" },
                { value: 10, text: "Mostrar 10 Registros" },
                { value: 25, text: "Mostrar 25 Registros" },
                { value: 50, text: "Mostrar 50 Registros" },
                { value: 100, text: "Mostrar 100 Registros" },
                { value: this.totalRows, text: "Mostrar Todo" },
            ],
            totalRows: 10,
            filter: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getHojaRutas();
    },
    methods: {
        // Seleccionar Opciones de Tabla
        editarRegistro(item) {
            this.$router.push({
                name: "hoja_rutas.edit",
                params: { id: item.id },
            });
        },
        responderHoja(item) {
            this.$router.push({
                name: "hoja_rutas.responder",
                params: { id: item.id },
            });
        },
        // Listar HojaRutas
        getHojaRutas() {
            this.showOverlay = true;
            this.muestra_modal = false;
            let url = "/admin/hoja_rutas";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios
                .get(url, {
                    params: { per_page: this.per_page },
                })
                .then((res) => {
                    this.showOverlay = false;
                    this.listRegistros = res.data.hoja_rutas;
                    this.totalRows = res.data.total;
                });
        },
        eliminaHojaRuta(id, descripcion) {
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<strong>${descripcion}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#dc3545",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post("/admin/hoja_rutas/" + id, {
                            _method: "DELETE",
                        })
                        .then((res) => {
                            this.getHojaRutas();
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
        pdf(item) {
            let config = {
                responseType: "blob",
            };
            let oReporte = {
                filtro: "nro",
                nro: item.id,
                fecha_ini: "",
                fecha_fin: "",
            };
            axios
                .post("/admin/reportes/hoja_rutas", oReporte, config)
                .then((res) => {
                    this.errors = [];
                    this.enviando = false;
                    let pdfBlob = new Blob([res.data], {
                        type: "application/pdf",
                    });
                    let urlReporte = URL.createObjectURL(pdfBlob);
                    window.open(urlReporte);
                })
                .catch(async (error) => {
                    let responseObj = await error.response.data.text();
                    responseObj = JSON.parse(responseObj);
                    console.log(error);
                    this.enviando = false;
                    if (error.response) {
                        if (error.response.status === 422) {
                            this.errors = responseObj.errors;
                        }
                        if (
                            error.response.status === 420 ||
                            error.response.status === 419 ||
                            error.response.status === 401
                        ) {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                html: responseObj.message,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                            window.location = "/";
                        }
                    }
                });
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length;
            this.currentPage = 1;
        },
        limpiaHojaRuta() {
            this.oHojaRuta.hoja_ruta = "";
            this.oHojaRuta.descripcion = "";
        },
        formatoFecha(date) {
            return this.$moment(String(date)).format("DD/MM/YYYY");
        },
    },
};
</script>

<style></style>
