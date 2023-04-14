import csrfFetch from "./csrf";

export const RECEIVE_CART_ITEMS = 'cart_items/RECEIVE_CART_ITEMS'
export const RECEIVE_CART_ITEM = 'cart_items/RECEIVE_CART_ITEM'
export const REMOVE_CART_ITEM = 'cart_items/REMOVE_CART_ITEM'

export const receiveCartItems = (cartItems) => ({
    type: RECEIVE_CART_ITEMS,
    cartItems
})

export const receiveCartItem = (cartItem) => ({
    type: RECEIVE_CART_ITEM,
    cartItem
})

export const removeCartItem = (cartItemId) => ({
    type: REMOVE_CART_ITEM,
    cartItemId
})

export const fetchCartItems = () => async dispatch => {
    const res = await csrfFetch('/api/cart_items');
    const data = await res.json();
    return dispatch(receiveCartItems(data))
}

export const fetchCartItem = (cartItemId) => async dispatch => {
    const res = await csrfFetch(`/api/cart_items/${cartItemId}`);
    const data = await res.json();
    return dispatch(receiveCartItem(data.cartItem))
}

export const createCartItem = (cartItem) => async dispatch => {
    const res = await csrfFetch('/api/cart_items', {
        method: 'POST',
        body: JSON.stringify(cartItem),
        headers: { 'Content-Type': 'application/json'}
    })
    const data = await res.json()
    return dispatch(receiveCartItem(data.cartItem))
}

export const updateCartItem = (cartItem) => async dispatch => {
    const res = await csrfFetch(`/api/cart_items/${cartItem.id}`, {
        method: 'PATCH',
        body: JSON.stringify(cartItem),
        headers: { 'Content-Type': 'application/json'}
    })
    const data = await res.json()
    return dispatch(receiveCartItem(data.cartItem))
}

export const deleteCartItem = (cartItemId) => async dispatch => {
    await csrfFetch(`/api/cart_items/${cartItemId}`, {
        method: 'DELETE'
    })
    return dispatch(removeCartItem(cartItemId))
}

// export const deleteCartItem = (cartItemId) => async dispatch => {
//     const res = await csrfFetch(`/api/cart_items/${cartItemId}`, {
//         method: 'DELETE'
//     })
//     const data = await res.json()
//     dispatch(fetchCartItems(data))
//     return res
// }

export default function cartItemsReducer(state = {}, action) {
    switch (action.type) {
        case RECEIVE_CART_ITEM:
            return { ...state, [action.cartItem.id]: action.cartItem }
        case RECEIVE_CART_ITEMS:
            return { ...state, ...action.cartItems }
        case REMOVE_CART_ITEM:
            const newState = { ...state }
            delete newState[action.cartItemId]
            return newState
        default:
            return state
    }
}