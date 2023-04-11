import React, { useContext, useRef, useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import './Modal.css';

const CartModalContext = React.createContext();

export function CartModalProvider({ children }) {
  const modalRef = useRef();
  const [value, setValue] = useState();

  useEffect(() => {
    setValue(modalRef.current);
  }, [])

  return (
    <>
      <CartModalContext.Provider value={value}>
        {children}
      </CartModalContext.Provider>
      <div ref={modalRef} />
    </>
  );
}

export function Modal({ onClose, children }) {
  const modalNode = useContext(CartModalContext);
  if (!modalNode) return null;

  return ReactDOM.createPortal(
    <div id="modal">
      <div id="modal-background" onClick={onClose} />
      <div id="modal-content">
      <div className='modal-header'>
        <h2 id='modal-h2'>Added to cart</h2>
        <button id='modal-close-button' onClick={onClose}>
            <span id='close-button-text'>&times;</span>
        </button>
      </div>
        {children.map((child, index) => <p key={index} className='tabs'>{child}</p>)}
      </div>
    </div>,
    modalNode
  );
}