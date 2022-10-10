<template>
    <div class="item-container w-[328px] h-[84px] px-8 flex flex-row items-center justify-between space-x-5">
        <div class="left flex flex-row items-center space-x-5">
            <div class="item-icon w-[46px]">
                <img :src="`https://cfx-nui-ox_inventory/web/build/images/${item.item}.png`" />
            </div>
            <div class="span flex -space-y-2 text-white flex-col">
                <span class="item-name text-2xl">{{ item.name }}</span>
                <span class="item-price text-lg">${{ item.price }}.00</span>
            </div>
        </div>
        <div class="right pr-10">
            <div class="purchase w-[32px] flex items-center cursor-pointer justify-center h-[32px] text-white">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4 cart transition-all ease-in-out">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                </svg>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { IItem } from '../types/Item';
import BrushCart from '@/assets/images/brush_cart.svg';

export default {
    name: 'Item',
    props: {
        item: {
            type: Object as () => IItem,
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
}
</script>

<style scoped>
.item-container {
    background: url('../assets/images/brush.svg');
}

.purchase {
    background: url('../assets/images/brush_cart.svg');
}

.purchase:hover > .cart {
    transform: scale(1.1);
    color: #2CAA00;
}
</style>