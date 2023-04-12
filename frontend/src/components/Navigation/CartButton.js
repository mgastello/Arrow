import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux'
import { Link } from 'react-router-dom';
import { fetchCartItems } from '../../store/cart';
import * as cartActions from '../../store/session';

function CartButton({user}) {
  const dispatch = useDispatch()

  useEffect(() => {

  })

//   const removeItem = (e) => {
//     e.preventDefault();
//     dispatch(sessionActions.logout());
//   };

  return (
    <>
      <Link to="/cart" id='cart-button-link'>
        <i class="fa-solid fa-cart-shopping" id='cart-icon'></i>
      </Link>
    </>
  );
}

export default CartButton;