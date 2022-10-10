<template>
    <div class="item-container w-[328px] h-[84px] px-8 flex flex-row items-center justify-between space-x-5">
        <div class="left flex flex-row items-center space-x-5">
            <div class="item-icon w-[46px]">
                <img :src="`https://cfx-nui-ox_inventory/web/build/images/${item.item}.png`" />
            </div>
            <div class="span flex -space-y-2 text-white flex-col">
                <span class="item-name text-2xl">{{ item.name }}</span>
                <span class="item-price text-lg">${{ item.total }}.00</span>
            </div>
        </div>
        <div class="quantity text-white">
            <span>{{ item.quantity }}x</span>
        </div>
        <div class="right pr-10">
            <div 
                @click="cartStore.removeItem(item.name)"
                class="remove w-[32px] flex items-center cursor-pointer justify-center h-[32px] text-white">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4 icon transition-all ease-in-out">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import BrushCart from '@/assets/images/brush_cart.svg';
import { useCartStore, CartItem } from '../store/cart';

export default {
    name: 'Item',
    props: {
        item: {
            type: Object as () => CartItem,
            required: true
        }
    },
    data() {
        return {
            brushCart: BrushCart
        }
    },
    methods: {
    },
    mounted() {
    },
    setup() {
        const cartStore = useCartStore();

        return {
            cartStore
        }
    }
}
</script>

<style scoped>
.item-container {
    background: url('../assets/images/brush.svg');
}

.remove {
    background: url('../assets/images/brush_cart.svg');
}

.remove:hover> .icon {
    transform: scale(1.5);
    color: #cf0023;
}
</style>