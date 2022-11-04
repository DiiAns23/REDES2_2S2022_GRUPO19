<template>
  <q-page class="flex flex-center">
    <div v-for="admin in admins" :key="admin.numero">
      <q-card class="q-ma-sm" style="max-width: 250px">
        <img :src="admin.imagen" />
        <q-card-section>
          <div class="text-h6">{{ admin.nombre }}</div>
          <div class="text-subtitle2">{{ admin.puesto }}</div>
        </q-card-section>
        <q-card-section>
          {{ admin.descripcion }}
        </q-card-section>
      </q-card>
    </div>
  </q-page>
</template>

<script>
import { defineComponent, ref } from "vue";
import { useStore } from "vuex";

export default defineComponent({
  name: "PageIndex",
  setup() {
    const $store = useStore();
    const admins = ref({});

    $store.dispatch("GetAdministradores").then((data) => {
      admins.value = data;
    });

    return {
      admins,
    };
  },
});
</script>
