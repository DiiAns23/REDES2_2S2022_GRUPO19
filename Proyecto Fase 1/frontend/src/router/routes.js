const routes = [
  {
    path: "/",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      { path: "", component: () => import("pages/Index.vue") },
      {
        path: "administradores",
        component: () => import("pages/Administradores.vue"),
      },
      {
        path: "desarrolladores",
        component: () => import("pages/Desarrolladores.vue"),
      },
      {
        path: "funcion-publica",
        component: () => import("pages/FPublica.vue"),
      },
      {
        path: "desarrollo-economico",
        component: () => import("pages/DEconomico.vue"),
      },
    ],
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("pages/Error404.vue"),
  },
];

export default routes;
