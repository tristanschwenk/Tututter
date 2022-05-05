export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'App',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '@/assets/css/tabler.min.css'
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    {src: "~/Tabler/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js", mode: "client"}
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    '@nuxtjs/composition-api/module'
  ],

  scriptSetup: {
    reactivityTransform: true
  },

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/auth'
  ],

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  },

  router: {
    middleware: ['auth']
  },

  auth: {
    redirect: {
      login: '/auth/sign-in',
      logout: '/',
      callback: '/auth/sign-in',
      home: '/'
    },
    strategies: {
      local: {
        token: {
          property: 'token',
          global: true,
          required: true,
          type: 'Bearer'
        },
        user: {
          property: 'user',
          autoFetch: true
        },
        endpoints: {
          login: { url: '/users/sign_in', method: 'post' },
          logout: { url: '/users/sign_out', method: 'delete' },
          user: { url: '/users/current', method: 'get' }
        }
      }
    }
  },

  axios: {
    host: "localhost",
    port: 8080,
    prefix: '/api'
  }
}
