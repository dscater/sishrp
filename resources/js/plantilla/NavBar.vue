<template>
    <div>
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-primary">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a
                        href="#"
                        class="nav-link text-white"
                        data-widget="pushmenu"
                        role="button"
                        ><i class="fas fa-bars"></i
                    ></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <router-link
                        :to="{ name: 'inicio' }"
                        class="nav-link text-white"
                        >Inicio</router-link
                    >
                </li>
                <!-- <li
                    class="nav-item d-none d-sm-inline-block"
                    v-if="permisos.includes('ventas.create')"
                >
                    <router-link
                        exact
                        :to="{ name: 'ventas.create' }"
                        class="nav-link text-white"
                        >Nueva venta</router-link
                    >
                </li> -->
            </ul>

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a
                        class="nav-link text-white"
                        href="#"
                        role="button"
                        @click.prevent="logout()"
                        v-loading.fullscreen.lock="fullscreenLoading"
                    >
                        <i class="fas fa-power-off"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a
                        class="nav-link text-white"
                        data-widget="fullscreen"
                        href="#"
                        role="button"
                    >
                        <i class="fas fa-expand-arrows-alt"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->
    </div>
</template>

<script>
export default {
    data() {
        return {
            fullscreenLoading: false,
            permisos: localStorage.getItem("permisos"),
        };
    },
    mounted() {
        if (!this.permisos) {
            this.logout();
        }
    },
    methods: {
        logout() {
            this.fullscreenLoading = true;
            axios.post("/logout").then((res) => {
                this.$router.push("/");
                setTimeout(function () {
                    localStorage.clear();
                    location.reload();
                    this.$router.push({ name: "login" });
                }, 500);
            });
        },
    },
};
</script>

<style></style>
