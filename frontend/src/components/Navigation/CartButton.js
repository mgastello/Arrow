import React from 'react';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom';

export default function CartButton() {
  const cartItems = useSelector(state => Object.values(state?.cartItems))

  return (
    <>
        <Link to="/cart" id='cart-button-link'>
            <button id='cart-actual-button'>
                <i className="fa-solid fa-cart-shopping" id='cart-icon'></i>
                {cartItems.length > 0 ? (
                  <p className='cart-item-counter'>{cartItems.length}</p>
                ) : (
                  null
                )}
            </button>
        </Link>
    </>
  );
}