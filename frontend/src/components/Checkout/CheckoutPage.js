import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from 'react-router-dom';
import { Redirect } from "react-router-dom"
import { fetchCartItems, deleteCartItem } from '../../store/cart';
import cart from '../../images/cart.png';
import shippingBox from '../../images/shippingBox.png'
import arrowScroll from '../../images/arrowScroll.png'
import arrowRedcard from '../../images/arrowRedcard.png'
import moment from 'moment';
import "./CheckoutPage.css";

export default function CheckoutPage() {
    const dispatch = useDispatch()
    const history = useHistory()
    const sessionUser = useSelector(state => state.session.user);
    const cartItems = useSelector(state => Object.values(state?.cartItems))
    const totalItems = cartItems.map(item => item.quantity).reduce((a, b) => a + b, 0);
    const subtotalPrice = cartItems.map(item => item.price * item.quantity).reduce((a, b) => a + b, 0).toFixed(2);
    const subtotalNumber = parseFloat(subtotalPrice)
    const taxPrice = parseFloat((subtotalNumber * .08625).toFixed(2))
    const discount = parseFloat((subtotalNumber * .05).toFixed(2))
    const total = (taxPrice + subtotalNumber - discount)
    const [loading, setLoading] = useState(true)

    const getArrivalDate = () => {
        const currentDate = moment();
        const arrivalDate = currentDate.add(5, 'days');
        return arrivalDate.format('ddd, MMM D');
    };

    const handleCheckoutClick = (e) => {
        e.preventDefault();
        cartItems.forEach(cartItem => {
            dispatch(deleteCartItem(cartItem.id))
        })
        localStorage.setItem('hasPurchased', 'true')
        history.push('/order-confirmed')
    }

    useEffect(() => {
        dispatch(fetchCartItems())
        setTimeout(() => {
            setLoading(false)
        }, 200)
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
        return (
            <Redirect to="/cart" />
        )
    } else {
        return (
            <div className='all-checkout'>
                <div className='left-side-checkout'>
                    <div className='checkout-items'>
                        <div className='all-cart-items-container'>
                            <ul id='all-cart-items'>
                                <div className='checkout-items-wrapper'>
                                    <div className='checkout-items-header'>
                                        <div>
                                            <img className="arrow-box-img" src={cart} alt='shopping-cart' />
                                        </div>
                                        <div className='checkout-items-header-words'>
                                            <div>
                                                <h1 className='checkout-items-header-text'>Cart</h1>
                                                {totalItems === 1 ? (
                                                    <h2 className='checkout-items-subtotal-text'>${subtotalNumber.toFixed(2)} subtotal • {totalItems} item</h2>
                                                ) : (
                                                    <h2 className='checkout-items-subtotal-text'>${subtotalNumber.toFixed(2)} subtotal • {totalItems} items</h2>
                                                )}
                                            </div>
                                            <div className="checkout-page-edit-button">
                                                <a className='checkout-page-edit-button-word' href='/cart'>Edit</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 id='checkout-arrives-by'>Arrives by {getArrivalDate()}</h3>
                                <div className='checkout-page-imgs-wrapper'>
                                    {cartItems.map((cartItem) => {
                                        return (
                                            <img className="checkout-page-item-imgs" src={cartItem.pictureUrl} alt="item-pic" />
                                        )
                                    })}
                                </div>
                            </ul>
                        </div>
                        <div className='checkout-user-info'>
                            <ul id='all-cart-items'>
                                <div className='checkout-items-wrapper'>
                                    <div className='checkout-items-header'>
                                        <div>
                                            <img className="arrow-box-img" src={shippingBox} alt='arrow-shipping-box' />
                                        </div>
                                        <div className='checkout-items-header-words'>
                                            <h1 className='checkout-items-header-text'>Shipping Address</h1>
                                        </div>
                                    </div>
                                </div>
                                <div className='user-info-wrapper'>
                                    <p className='user-info'>{sessionUser.firstName} {sessionUser.lastName}</p>
                                    <p className='user-info'>90 5th Ave</p>
                                    <p className='user-info'>New York, NY, 10011</p>
                                    <p className='user-info'>845-253-5164</p>
                                    <p className='default-address-box'>Default address</p>
                                </div>
                                <div className='checkout-page-imgs-wrapper'>
                                </div>
                            </ul>
                        </div>
                        <div className='checkout-payment'>
                            <ul id='all-cart-items'>
                                <div className='checkout-items-wrapper'>
                                    <div className='checkout-items-header'>
                                        <div className='payment-items-header-words'>
                                            <h1 className='checkout-items-header-text'>Payment</h1>
                                        </div>
                                    </div>
                                </div>
                                <div className='payment-info-wrapper'>
                                    <img className="arrow-box-img" src={arrowRedcard} alt='arrow-redcard-img' />
                                    <p className='payment-info'>RedCard Debit *5678</p>
                                </div>
                                <div className='checkout-page-imgs-wrapper'>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div className='right-side-checkout'>
                    <div className='checkout-items'>
                        <div className='all-checkout-items-container'>
                            <ul id='all-checkout-items'>
                                <div className='summary-wrapper'>
                                    <div className='checkout-items-header'>
                                        <div>
                                            <img className="arrow-box-img" src={arrowScroll} alt='summary-scroll' />
                                        </div>
                                        <div className='checkout-items-header-words'>
                                            <h1 className='checkout-items-header-text'>Order summary</h1>
                                        </div>
                                    </div>
                                </div>
                                <div className='summary-subtotal-wrapper'>
                                    <div className='summary-subtotal-container'>
                                        <div className='summary-subtotal-text'>
                                            <div className='order-summary-text'>
                                                <p>Subtotal</p>
                                                {totalItems === 1 ? (
                                                    <p className='order-summary-item-amount'>({totalItems} item)</p>
                                                ) : (
                                                    <p className='order-summary-item-amount'>({totalItems} items)</p>
                                                )}
                                            </div>
                                            <div>
                                                <p>${subtotalNumber.toFixed(2)}</p>
                                            </div>
                                        </div>
                                        <div className='summary-discounts-text'>
                                            <p>Discounts</p>
                                            <p className='discount-price'>-${discount.toFixed(2)}</p>
                                        </div>
                                        <p className='redcard-discount-text'>RedCard 5% Discount</p>
                                        <div className='checkout-delivery-text'>
                                            <p>Delivery</p>
                                            <p className='checkout-delivery-free'>Free</p>
                                        </div>
                                        <div className='checkout-tax-text'>
                                            <p>Estimated tax</p>
                                            <p>${taxPrice.toFixed(2)}</p>
                                        </div>
                                    </div>
                                </div>
                                <div className='checkout-total-price'>
                                    <div className='checkout-total-price-container'>
                                        <h1 className='checkout-total-text'>Total</h1>
                                        <h1 className='checkout-total-text'>${total.toFixed(2)}</h1>
                                    </div>
                                </div>
                                <div className='checkout-summary-payment'>
                                    <div className='checkout-summary-payment-container'>
                                        <img className="arrow-box-img" src={arrowRedcard} alt='arrow-redcard-img' />
                                        <div className='checkout-summary-payment-text'>
                                            <h3>${total.toFixed(2)}</h3>
                                            <p className='checkout-summary-payment-info'>RedCard Debit *5678</p>
                                        </div>
                                    </div>
                                </div>
                                <p className='checkout-terms'>By placing an order, you agree to Arrow’s <a className='checkout-links' href='https://www.target.com/c/terms-conditions/-/N-4sr7l' target="_blank" rel="noreferrer">terms</a> and
                                    <a className='checkout-links' href='https://www.target.com/c/target-privacy-policy/-/N-4sr7p' target="_blank" rel="noreferrer"> privacy policy</a></p>
                                <button className='place-order-button' onClick={handleCheckoutClick}>Place your order</button>
                                <p className='order-confirmation-text'>Order confirmation and updates will not be emailed to {sessionUser.email}</p>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}