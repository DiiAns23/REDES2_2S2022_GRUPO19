<template>
  <q-page class="flex flex-center">
    <div class="row items-center">
      <img
        width="100"
        src="https://redes2-proyectof1.s3.us-west-2.amazonaws.com/DesarrolloEconomico.jpg"
      />
      <div class="text-h4 text-weight-medium text-blue-grey-9 q-mx-xl">
        DESARROLLO ECONOMICO
      </div>
    </div>
    <div>
      <LineChart
        v-if="showchart"
        :chart-data="dataset"
        :options="options"
        :width="1024"
      />
    </div>
  </q-page>
</template>

<script>
import { defineComponent, ref } from "vue";
import { LineChart } from "vue-chart-3";
import { Chart, registerables } from "chart.js";
import { useStore } from "vuex";

Chart.register(...registerables);

export default defineComponent({
  name: "PageIndex",
  components: {
    LineChart,
  },
  setup() {
    const $store = useStore();
    const showchart = ref(false);
    const dataset = ref({
      datasets: [
        {
          label: "Crecimiento del PBI de UCRON",
          fill: true,
          tension: 0.1,
          borderColor: "rgb(186, 65, 0)",
          backgroundColor: "rgb(186, 65, 0, 0.2)",
          data: [
            { fecha: "1960", pbi: 1043599900 },
            { fecha: "1961", pbi: 1076699900 },
          ],
        },
      ],
    });
    const options = ref({
      responsive: true,
      parsing: {
        xAxisKey: "fecha",
        yAxisKey: "pbi",
      },
    });

    $store.dispatch("GetGraficaData").then((data) => {
      dataset.value = {
        datasets: [
          {
            label: "Crecimiento del PBI de UCRON",
            fill: true,
            tension: 0.1,
            borderColor: "rgb(186, 65, 0)",
            backgroundColor: "rgb(186, 65, 0, 0.2)",
            data: data,
          },
        ],
      };
      showchart.value = true;
    });

    return {
      showchart,
      dataset,
      options,
    };
  },
});
</script>
