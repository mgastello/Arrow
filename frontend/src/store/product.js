import csrfFetch from "./csrf"

export const RECEIVE_PRODUCTS = 'products/RECEIVE_PRODUCTS'
export const RECEIVE_PRODUCT = 'products/RECEIVE_PRODUCT'

export const receiveProducts = (products) => ({
    type: RECEIVE_PRODUCTS,
    products
})

export const receiveProduct = (product) => ({
    type: RECEIVE_PRODUCT,
    product
})

export const fetchProducts = () => async dispatch => {
    const res = await csrfFetch('/api/products');
    const data = await res.json();
    return dispatch(receiveProducts(data))
}

export const fetchProduct = (productId) => async dispatch => {
    const res = await csrfFetch(`/api/products/${productId}`);
    const data = await res.json();
    return dispatch(receiveProduct(data))
}

export default function productsReducer(state = {}, action) {
    switch (action.type) {
        case RECEIVE_PRODUCTS:
            return { ...state, ...action.products }
        case RECEIVE_PRODUCT:
            return { ...state, [action.product.id]: action.product }
        default:
            return state
    }
}