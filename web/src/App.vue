<template>
  <div v-show="show" class="main-container h-screen bg-black bg-opacity-20 w-full p-24 flex flex-1 flex-start items-start">
    <Shop />
  </div>
</template>

<script>
import Shop from '@/components/Shop.vue';

export default {
  name: 'App',
  components: {
    Shop
  },
  data() {
    return {
      show: false,
    }
  },
  methods: {
  },
  mounted() {
    window.addEventListener('message', (event) => {
      const data = event.data;
      console.log(JSON.stringify(data, null, 2));
      if (data.type === 'enable') {
        this.show = true;
      }
    })
  }
}
</script>

<style>
@tailwind base;
@tailwind components;
@tailwind utilities;
</style>