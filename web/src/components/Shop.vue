<template>
    <div class="shop-container flex flex-row space-x-12 font-chiniser">
        <div class="shop-items flex flex-col space-y-5">
            <div class="shop-header flex flex-col">
                <span class="text-[40px] text-yellow-500">Valentine</span>
                <span class="text-xl text-white">General Store</span>
            </div>
            <div class="items">
                <Item v-for="item in items" :key="item.name" :item="item" @click="cartStore.addItem({
                    name: item.name,
                    price: item.price,
                    quantity: 1,
                    total: item.price,
                    item: item.item
                })" />
            </div>
        </div>
        <div v-show="cartStore.items.length > 0" class="cart">
            <Cart />
        </div>
    </div>
</template>

<script lang="ts">
import Item from '@/components/Item.vue';
import Cart from '@/components/Cart.vue';
import { useCartStore } from '../store/cart';

export default {
    name: 'Shop View',
    components: {
        Item,
        Cart,
    },
    data() {
        return {
            items: [
                {
                    name: 'Water',
                    item: 'water',
                    price: 5,
                },
                {
                    name: 'Beef',
                    item: 'beef',
                    price: 5,
                },
                {
                    name: 'Bandage',
                    item: 'bandage',
                    price: 1,
                },
            ],
        }
    },
    setup() {
        const cartStore = useCartStore();

        return {
            cartStore
        }
    }
}
</script>