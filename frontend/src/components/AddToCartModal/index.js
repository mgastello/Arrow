import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { CartModal } from '../../context/CartModal';
import * as cartActions from '../../store/cart'
import { useHistory } from 'react-router-dom';

function AddToCartModal({product}) {
  const [showModal, setShowModal] = useState(false);
  const dispatch = useDispatch()
  const sessionUser = useSelector(state => state.session.user);
  const history = useHistory()

  const addToCart = () => {
    if (!sessionUser) {
      history.push('/login')
    } else {
      setShowModal(true)
      dispatch(cartActions.createCartItem({
        userId: sessionUser.id,
        productId: product.id,
        quantity: 1
      }));
    }
  };

  return (
    <>
        <button id="add-to-cart-button" onClick={addToCart}>Add to cart</button>
      {showModal && (
        <CartModal onClose={() => setShowModal(false)}>
            <h3 className="cart-modal-items" id='2day-text'>2-day shipping</h3>
            <div id='a2c-product'>
                <img className="cart-modal-items" id='cart-pic' src={product.pictureUrl} alt='' />
                <h4 className="cart-modal-items" id='cart-name'>{product.name}</h4>
            </div>
        </CartModal>
      )}
    </>
  );
}

export default AddToCartModal;