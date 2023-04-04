import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Modal } from '../../context/Modal';

function LoginFormModal() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button onClick={() => setShowModal(true)}>Sign In</button>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
            <Link onClick={() => setShowModal(false)} to='/login'>Sign in</Link>
            <br></br>
            <Link onClick={() => setShowModal(false)} to='/signup'>Create Account</Link>
        </Modal>
      )}
    </>
  );
}

export default LoginFormModal;