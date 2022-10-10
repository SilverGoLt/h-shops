import { defineStore } from 'pinia'

export interface CartItem {
    item: string,
    name: string,
    quantity: number,
    price: number,
    total: number
}

interface IPlayer {
    cash: number
}

export const useCartStore = defineStore('cart', {
    state: () => ({
        items: [] as CartItem[],
        player: {} as IPlayer
    }),

    getters: {
        total(): number {
            return this.items.reduce((total, item) => total + item.total, 0)
        }
    },

    actions: {
        addItem(item: CartItem) {
            const existing = this.items.find(i => i.item === item.item)

            if (existing) {
                existing.quantity += item.quantity
                existing.total += item.price
            } else {
                this.items.push(item)
            }
        },
        removeItem(name: string) {
            const item = this.items.find(i => i.name === name)
            if (item) {
                if(item.quantity > 1) {
                    item.quantity -= 1
                    item.total -= item.price
                } else {
                    this.items.splice(this.items.indexOf(item), 1)
                }
            }
        },
        emptyCart() {
            this.items = []
        },
        setBalance(cash: number) {
            this.player.cash = cash
        }
    }
})
