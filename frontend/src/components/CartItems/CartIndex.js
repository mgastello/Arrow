import React, { useEffect } from 'react';
import { useSelector, useDispatch } from "react-redux";
import { fetchCartItems } from '../../store/cart';
import CartIndexItem from './CartIndexItem';
import './Cart.css'
import { Link } from 'react-router-dom';

export default function CartIndex() {
    const cartItems = useSelector(state => Object.values(state?.cartItems))
    const sessionUser = useSelector(state => state.session.user);
    const dispatch = useDispatch();
    const totalPrice = cartItems.map(item => item.price).reduce((a, b) => a + b, 0);
    const taxPrice = parseFloat((totalPrice * .08625).toFixed(2))
    const total = (taxPrice + totalPrice).toFixed(2)
    
    useEffect(()=>{
        dispatch(fetchCartItems())
    }, [dispatch]);
   
    return(
        <>
            {cartItems.length > 0 ? (
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
                ) : (
                <div className='no-cart-items-container'>
                    <div className='add-items-box'>
                        <h1 id='empty-cart-text'>Your cart is empty</h1>
                        {sessionUser ? (
                            <div>
                                <p id='empty-cart-signin-text'>Check out what we're featuring now!</p>
                                <div id='shop-button'>
                                    <a id="create-text" href='/'><button id="login-button">Go to homepage</button></a>
                                </div>
                            </div>
                        ) : (
                            <div>
                                <p id='empty-cart-signin-text'>Have an account? Sign in to start shopping</p>
                                <div id='shop-button'>
                                    <a id="create-text" href='/login'><button id="login-button">Sign in</button></a>
                                </div>
                            </div>
                        )}
                    </div>
                </div>
            )}
        </>
    )
}