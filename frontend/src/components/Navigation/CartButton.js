import React from 'react';
import { Link } from 'react-router-dom';

export default function CartButton() {

  return (
    <>
        <Link to="/cart" id='cart-button-link'>
            <button id='cart-actual-button'>
                <i className="fa-solid fa-cart-shopping" id='cart-icon'></i>
            </button>
        </Link>
    </>
  );
}