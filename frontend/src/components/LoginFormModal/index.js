import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Modal } from '../../context/Modal';

function LoginFormModal() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button 
        id="nav-signin-button" onClick={() => setShowModal(true)}><img className="account-img" 
        src='https://target.scene7.com/is/content/Target/GUEST_459579d1-8996-4e3c-889a-a975f12c0fd4' 
        alt='Account'/><p className='nav-signin-text'>Sign In</p>
      </button>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
            <Link onClick={() => setShowModal(false)} to='/login' id="modal-items">Sign in</Link>
            <Link onClick={() => setShowModal(false)} to='/signup' id="modal-items">Create Account</Link>
        </Modal>
      )}
    </>
  );
}

export default LoginFormModal;