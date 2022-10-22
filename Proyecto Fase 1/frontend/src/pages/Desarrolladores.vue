<template>
  <q-page class="flex flex-center">
    <div v-for="dev in devs" :key="dev.numero">
      <q-card class="q-ma-sm" style="max-width: 250px">
        <q-card-section>
          <div class="text-h6">{{ dev.nombre }}</div>
          <div class="text-subtitle2">{{ dev.carnet }}</div>
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
    const devs = ref({});

    $store.dispatch("GetDesarrolladores").then((data) => {
      devs.value = data;
    });

    return {
      devs,
    };
  },
});
</script>
