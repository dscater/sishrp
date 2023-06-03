<template>
    <div class="row" id="contenedor_actividads">
        <div
            class="col-md-12"
            style="max-height: 60vh; overflow: auto"
            v-for="item in listActividads"
            :key="item.id"
        >
            <b-skeleton-wrapper :loading="loading">
                <template #loading>
                    <b-card>
                        <b-skeleton width="85%"></b-skeleton>
                        <b-skeleton width="55%"></b-skeleton>
                        <b-skeleton width="70%"></b-skeleton>
                    </b-card>
                </template>
                <article class="card mb-2 col-md-12">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <img
                                v-if="item.tipo == 'IMAGEN'"
                                :src="item.url_archivo"
                                alt="Image"
                                style="max-width: 80%; object-fit: cover"
                                class="card-img-top"
                            />
                        </div>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">{{ item.titulo }}</h4>
                        <p class="card-text">
                            {{ item.descripcion }}
                        </p>
                        <a
                            v-if="item.tipo != 'IMAGEN'"
                            align="center"
                            role="button"
                            tabindex="0"
                            :href="item.url_archivo"
                            target="_blank"
                            class="btn btn-primary"
                            ><i class="fa fa-download"></i> Descargar archivo
                            adjunto</a
                        >
                    </div>
                </article>
            </b-skeleton-wrapper>
        </div>
        <div class="col-md-12">
            <b-pagination
                v-model="current_page"
                :total-rows="totalRows"
                :per-page="per_page"
                aria-controls="contenedor_actividads"
                class="mt-1"
                align="center"
            ></b-pagination>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            listActividads: [],
            per_page: 1,
            current_page: 1,
            totalRows: 0,
            loading: false,
        };
    },
    watch: {
        current_page(newVal) {
            this.current_page = newVal;
            this.getActividads();
        },
    },
    mounted() {
        this.getActividads();
    },
    methods: {
        getActividads() {
            this.loading = true;
            axios
                .get("/actividads/lista?page=" + this.current_page)
                .then((response) => {
                    this.totalRows = response.data.portal_actividads.total;
                    this.listActividads = response.data.portal_actividads.data;
                    this.loading = false;
                });
        },
    },
};
</script>
<style></style>
