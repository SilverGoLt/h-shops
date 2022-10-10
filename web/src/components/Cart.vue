<template>
    <div class="main">
        <Transition name="fade">
            <div v-if="cartStore.items.length > 0" class="cart-container flex flex-col space-y-12 items-start">
                <div class="header flex flex-col">
                    <span class="text-3xl text-white">Your Cart</span>
                    <span class="text-white">Total Price: ${{ cartStore.total }}</span>
                </div>
                <div class="items">
                    <TransitionGroup name="list">
                        <CartItem v-for="item in cartStore.items" :key="item.name" :item="item" />
                    </TransitionGroup>
                </div>
                <div class="purchase">
                    <Purchase />
                </div>
            </div>
        </Transition>
    </div>
</template>

<script lang="ts">
import CartItem from '@/components/CartItem.vue';
import { useCartStore } from '../store/cart';
import Purchase from '@/components/Purchase.vue';

export default {
    name: 'Cart View',
    components: {
        CartItem,
        Purchase
    },
    data() {
        return {
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

<style scoped>
.fade-enter-active,
.fade-leave-active {
    transition: all 0.5s ease-in-out;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
}

.list-enter-active,
.list-leave-active {
  transition: all 0.5s ease;
}
.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateX(-30px);
}
</style>