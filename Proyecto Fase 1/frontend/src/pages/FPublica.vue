<template>
  <q-page class="flex flex-center column items-center">
    <div class="row items-center q-my-xl">
      <img
        style="border-radius: 100%"
        width="100"
        src="https://redes2-proyectof1.s3.us-west-2.amazonaws.com/FuncionPublica.jpg"
      />
      <div class="text-h4 text-weight-medium text-blue-grey-9 q-mx-xl">
        Función Pública
      </div>
    </div>
    <div class="row justify-evenly">
      <div v-for="funcion in funciones" :key="funcion.nombre">
        <q-card class="q-ma-xs" style="max-width: 250px">
          <img :src="funcion.enlace" />
          <q-card-section>
            <div class="text-h6">{{ funcion.nombre }}</div>
          </q-card-section>
          <q-card-section>
            {{ funcion.descripcion }}
          </q-card-section>
        </q-card>
      </div>
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
    const funciones = ref({});

    $store.dispatch("GetFunciones").then((data) => {
      funciones.value = data;
    });

    return {
      funciones,
    };
  },
});
</script>
