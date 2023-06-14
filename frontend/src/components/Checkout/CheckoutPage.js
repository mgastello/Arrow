import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect } from "react-router-dom"
import { fetchCartItems } from '../../store/cart';

export default function CheckoutPage() {
    const dispatch = useDispatch()
    const sessionUser = useSelector(state => state.session.user);
    const cartItems = useSelector(state => Object.values(state?.cartItems))
    const totalItems = cartItems.map(item => item.quantity).reduce((a, b) => a + b, 0);
    const subtotalPrice = cartItems.map(item => item.price * item.quantity).reduce((a, b) => a + b, 0).toFixed(2);
    const subtotalNumber = parseFloat(subtotalPrice)
    const taxPrice = parseFloat((subtotalNumber * .08625).toFixed(2))
    const total = (taxPrice + subtotalNumber)
    const [ loading, setLoading ] = useState(true)

    useEffect(() => {
        dispatch(fetchCartItems())
        setTimeout(() => {
            setLoading(false)
        }, 50)
    }, [dispatch])

    if (loading) {
        return (
            <div>loading...</div>
        )
    }

    if (!sessionUser) {
        return (
            <Redirect to="/login" />
        )
    } else if (cartItems.length === 0) {
        debugger
        return (
            <Redirect to="/cart" />
        )
    } else {
        return (
            <div className='left-side-checkout'>
                <div className='checkout-items'>
                    <div className='checkout-items-header'>
                        <h1 className='cart-header-text'>Cart</h1>
                        <h2 className='subtotal-text'>${subtotalNumber.toFixed(2)} subtotal • {totalItems} items</h2>
                    </div>
                    <div className='cart-wrapper'>
                        <div className='all-cart-items-container'>
                            <ul id='all-cart-items'>
                                <div className="cart-items-holder-header">
                                    <h3 id='holder-header-shipping'>Shipping</h3>
                                    <p id='item-count'>{totalItems} items</p>
                                </div>
                                {/* {cartItems.map((cartItem) => {
                                    return <CartIndexItem key={cartItem.productId} cartItem={cartItem} />
                                })} */}
                            </ul>
                        </div>
                    </div>
                </div>
                <div className='checkout-user-info'>

                </div>
                <div className='checkout-payment'>

                </div>
            </div>
        )
    }
}