import React, { useEffect } from 'react';
import { useSelector, useDispatch } from "react-redux";
import { useHistory } from 'react-router-dom';
import { fetchCartItems } from '../../store/cart';
import CartIndexItem from './CartIndexItem';
import arrowDog from '../../images/arrowDog.png'
import './Cart.css';

export default function CartIndex() {
    const cartItems = useSelector(state => Object.values(state?.cartItems))
    const sessionUser = useSelector(state => state.session.user);
    const dispatch = useDispatch();
    const history = useHistory()
    const totalItems = cartItems.map(item => item.quantity).reduce((a, b) => a + b, 0);
    const subtotalPrice = cartItems.map(item => item.price * item.quantity).reduce((a, b) => a + b, 0).toFixed(2);
    const subtotalNumber = parseFloat(subtotalPrice)
    const taxPrice = parseFloat((subtotalNumber * .08625).toFixed(2))
    const total = (taxPrice + subtotalNumber)

    const handleClick = () => {
        history.push('/checkout')
    }

    useEffect(() => {
        dispatch(fetchCartItems())
    }, [dispatch]);

    return (
        <>
            {cartItems.length > 0 ? (
                <div className='all-cart'>
                    <div className='left-side-cart'>
                        <div className='cart-header'>
                            <h1 className='cart-header-text'>Cart</h1>
                            {totalItems === 1 ? (
                                <h2 className='subtotal-text'>${subtotalNumber.toFixed(2)} subtotal • {totalItems} item</h2>
                            ) : (
                                <h2 className='subtotal-text'>${subtotalNumber.toFixed(2)} subtotal • {totalItems} items</h2>
                            )}
                        </div>
                        <div className='all-cart-items-container'>
                            <ul id='all-cart-items'>
                                <div className="cart-items-holder-header">
                                    <h3 id='holder-header-shipping'>Shipping</h3>
                                    {totalItems === 1 ? (
                                        <p id='item-count'>{totalItems} item</p>
                                    ) : (
                                        <p id='item-count'>{totalItems} items</p>
                                    )}
                                </div>
                                {cartItems.map((cartItem) => {
                                    return <CartIndexItem key={cartItem.productId} cartItem={cartItem} />
                                })}
                            </ul>
                        </div>
                    </div>
                    <div className='right-side-cart'>
                        <div id='order-summary'>
                            <h1>Order summary</h1>
                        </div>
                        <div id='summary'>
                            <div id='summary-subtotal'>
                                <div id='sub-item'>
                                    <p id='summary-subtotal-text'>Subtotal</p>
                                    {totalItems === 1 ? (
                                        <p id='summary-item-count'>({totalItems} item)</p>
                                    ) : (
                                        <p id='summary-item-count'>({totalItems} items)</p>
                                    )}
                                </div>
                                <div>
                                    <p>${subtotalNumber.toFixed(2)}</p>
                                </div>
                            </div>
                            <div id='summary-delivery'>
                                <p id='summary-delivery-text'>Delivery</p>
                                <p id='summary-delivery-cost'>Free</p>
                            </div>
                            <div id='tax-cost'>
                                <p id='tax-cost-text'>Estimated Tax</p>
                                <p id='tax-cost-price'>${taxPrice.toFixed(2)}</p>
                            </div>
                        </div>
                        <div id='summary-total-cost'>
                            <h1>Total</h1>
                            <h1>${total.toFixed(2)}</h1>
                        </div>
                        <button className='continue-to-checkout-button' onClick={handleClick}>Continue to checkout</button>
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
                                <img className="arrow-dog" src={arrowDog} alt='dog-pic' />
                            </div>
                        ) : (
                            <div>
                                <p id='empty-cart-signin-text'>Have an account? Sign in to start shopping</p>
                                <div id='shop-button'>
                                    <a id="create-text" href='/login'><button id="login-button">Sign in</button></a>
                                </div>
                                <img className="arrow-dog" src={arrowDog} alt='dog-pic' />
                            </div>
                        )}
                    </div>
                </div>
            )}
        </>
    )
}