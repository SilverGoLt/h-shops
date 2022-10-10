<template>
    <div @click="purchase()"
        class="purchase cursor-pointer transition-all ease-in-out text-white hover:text-green-500 duration-300 transform flex items-center justify-center w-[328px] h-[84px]">
        <div class="text text-xl">
            <span>Purchase</span>
        </div>
    </div>
</template>

<script lang="ts">
import { useCartStore } from '../store/cart';
import { fetchNui } from '../utils/fetchNui';
import BrushBG from '@/assets/images/brush.svg';

export default {
    name: 'Purchase View',
    setup() {
        const cartStore = useCartStore();

        return {
            cartStore
        }
    },
    data() {
        return {
            brushImg: BrushBG
        }
    },
    methods: {
        purchase() {
            if (this.cartStore.player.cash >= this.cartStore.total) {
                // Send to NUI purchase
                fetchNui('purchase', {})
                    .then((response: boolean) => {
                        if (response) {
                            this.cartStore.emptyCart();
                        }
                    })
                    .catch((error) => {
                        console.error(error);
                    });
            } else {
                console.error('You do not have enough cash to purchase these items!');
            }
        }
    }
}
</script>

<style scoped>
.purchase {
    background: url('../assets/images/brush.svg');
}
</style>