import React, { useState } from 'react';
import { Modal } from '../../context/Modal';
import { useDispatch } from 'react-redux'
import { Link } from 'react-router-dom';
import emptyHeart from '../../images/emptyHeart.png'
import * as sessionActions from '../../store/session';

function LoggedInModal({user}) {
  const [showModal, setShowModal] = useState(false);
  const dispatch = useDispatch()
  // const history = useHistory()

  const logout = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logout());
    // history.push("/")
  };

  return (
    <>
      <button 
        id="nav-signin-button" onClick={() => setShowModal(true)}><img className="account-img" 
        src='https://target.scene7.com/is/content/Target/GUEST_459579d1-8996-4e3c-889a-a975f12c0fd4' 
        alt='Account'/><p className='nav-signin-text'>Hi, {user.firstName}</p>
      </button>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
            <li id="logged-in-modal-items"><img className='modal-heart' src={emptyHeart} alt='heart'/>Favorites</li>
            <Link to='/' onClick={logout} className='logged-in-modal-button' id='modal-items'>Sign out</Link>
            {/* <Link onClick={() => setShowModal(false)} to='/favorites' id="logged-in-modal-items">Favorites</Link> */}
        </Modal>
      )}
    </>
  );
}

export default LoggedInModal;