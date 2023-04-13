import React, { useEffect } from 'react';
import { useSelector, useDispatch } from "react-redux";
import { fetchCartItems } from '../../store/cart';
import CartIndexItem from './CartIndexItem';
import './Cart.css'

export default function CartIndex() {
    const cartItems = useSelector(state => Object.values(state?.cartItems))
    const dispatch = useDispatch();
    
    useEffect(()=>{
        dispatch(fetchCartItems())
    }, [dispatch]);

    const totalPrice = cartItems.map(item => item.price).reduce((a, b) => a + b, 0);
    const taxPrice = parseFloat((totalPrice * .08625).toFixed(2))
    const total = (taxPrice + totalPrice).toFixed(2)
   
    return(
            <div className='all-checkout'>
                <div className='left-side-checkout'>
                    <div className='cart-header'>
                        <h1 className='cart-header-text'>Cart</h1>
                        <h2 className='subtotal-text'>${totalPrice} subtotal • {cartItems.length} items</h2>
                    </div>
                    <div className='cart-wrapper'>
                        <div className='all-cart-items-container'>
                            <ul id='all-cart-items'>
                                <div className="cart-items-holder-header">
                                    <h3 id='holder-header-shipping'>Shipping</h3>
                                    <p id='item-count'>{cartItems.length} items</p>
                                </div>
                                {cartItems.map((cartItem) => {
                                    return <CartIndexItem key={cartItem.productId} cartItem={cartItem} />
                                })}
                            </ul>
                        </div>
                    </div>
                </div>
                <div className='right-side-checkout'>
                    <div id='order-summary'>
                        <h1>Order summary</h1>
                    </div>
                    <div id='summary'>
                        <div id='summary-subtotal'>
                            <div id='sub-item'>
                                <p id='summary-subtotal-text'>Subtotal</p>
                                <p id='summary-item-count'>({cartItems.length} items)</p>
                            </div>
                            <div>
                                <p>${totalPrice}</p>
                            </div>
                        </div>
                        <div id='summary-delivery'>
                            <p id='summary-delivery-text'>Delivery</p>
                            <p id='summary-delivery-cost'>Free</p>
                        </div>
                        <div id='tax-cost'>
                            <p id='tax-cost-text'>Estimated Tax</p>
                            <p id='tax-cost-price'>${taxPrice}</p>
                        </div>
                    </div>
                    <div id='summary-total-cost'>
                        <h1>Total</h1>
                        <h1>${total}</h1>
                    </div>
                </div>
            </div>
    )
}