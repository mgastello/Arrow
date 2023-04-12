import React, { useState } from 'react';
import { CartModal } from '../../context/CartModal';

function AddToCartModal({product}) {
  const [showModal, setShowModal] = useState(false);
  console.log(product)

  return (
    <>
        <button id="add-to-cart-button" onClick={() => { console.log('button clicked'); setShowModal(true)}}>Add to cart</button>
      {showModal && (
        <CartModal onClose={() => setShowModal(false)}>
            <h3 className="cart-modal-items" id='2day-text'>2-day shipping</h3>
            <div id='a2c-product'>
                <img className="cart-modal-items" id='cart-pic' src={product.pictureUrl} />
                <h4 className="cart-modal-items" id='cart-name'>{product.name}</h4>
            </div>
        </CartModal>
      )}
    </>
  );
}

export default AddToCartModal;