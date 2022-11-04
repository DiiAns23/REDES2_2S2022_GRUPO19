<template>
  <q-layout view="lHh Lpr lFf">
    <q-header style="background-color: transparent">
      <q-toolbar style="background-color: white" class="justify-center">
        <div class="row justify-evenly" style="max-width: 1024px">
          <div class="row items-center q-mx-lg">
            <q-btn to="/" color="blue-grey-8" flat icon="home" label="Home" />
          </div>
          <div class="row items-center q-mx-lg">
            <q-btn
              to="/administradores"
              color="blue-grey-8"
              flat
              label="Administradores"
            />
            <q-btn
              to="/desarrolladores"
              color="blue-grey-8"
              flat
              label="Desarrolladores"
            />
            <q-btn
              v-if="dominio"
              to="/desarrollo-economico"
              color="blue-grey-8"
              flat
              label="Desarrollo Ecónomico"
            />
            <q-btn
              v-else
              to="/funcion-publica"
              color="blue-grey-8"
              flat
              label="Función Pública"
            />
            <!-- <q-btn-dropdown flat label="Departamentos" color="blue-grey-8">
              <q-list>
                <q-item to="/funcion-publica" clickable v-close-popup>
                  <q-item-section side>
                    <q-icon name="apartment" />
                  </q-item-section>
                  <q-item-section>
                    <q-item-label class="text-weight-medium text-blue-grey-8">
                      FUNCIÓN PUBLICA
                    </q-item-label>
                  </q-item-section>
                </q-item>
                <q-item to="/desarrollo-economico" clickable v-close-popup>
                  <q-item-section side>
                    <q-icon name="insights" />
                  </q-item-section>
                  <q-item-section>
                    <q-item-label class="text-weight-medium text-blue-grey-8">
                      DESARROLLO ECONÓMICO
                    </q-item-label>
                  </q-item-section>
                </q-item>
              </q-list>
            </q-btn-dropdown> -->
          </div>

          <div class="text-blue-grey-8 row items-center q-mx-lg">
            <div>UCRON - {{ servername }}</div>
          </div>
        </div>
      </q-toolbar>
    </q-header>

    <q-page-container class="row justify-center bg-wave">
      <div style="max-width: 1024px">
        <router-view />
      </div>
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent } from "vue";
import { useStore } from "vuex";

export default defineComponent({
  name: "MainLayout",
  setup() {
    const $store = useStore();

    $store.dispatch("GetVersion");

    return {
      servername: $store.state.servername,
      dominio: $store.state.dominio,
    };
  },
});
</script>

<style scoped>
.bg-wave {
  background: url("~assets/wave.svg") no-repeat center bottom fixed;
}
</style>
