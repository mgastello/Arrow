import React, { useState, useEffect } from "react";
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';

function ProfileButton({ user }) {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  
  const openMenu = () => {
    if (showMenu) return;
    setShowMenu(true);
  };
  
  useEffect(() => {
    if (!showMenu) return;

    const closeMenu = () => {
      setShowMenu(false);
    };

    document.addEventListener('click', closeMenu);
  
    return () => document.removeEventListener("click", closeMenu);
  }, [showMenu]);

  const logout = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logout());
  };

  return (
    <>
      <button className="welcome-button" onClick={openMenu}>
        <img className="account-img" 
        src='https://target.scene7.com/is/content/Target/GUEST_459579d1-8996-4e3c-889a-a975f12c0fd4' 
        alt='Account'/>
        <p className="welcome-text">Hi, {user.firstName}</p>
      </button>
      {showMenu && (
        <ul className="profile-dropdown">
          <li>
            <button onClick={logout}>Log Out</button>
          </li>
        </ul>
      )}
    </>
  );
}

export default ProfileButton;