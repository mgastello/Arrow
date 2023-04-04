import React from 'react';
import { useSelector } from 'react-redux';
import { useLocation } from 'react-router';
import ProfileButton from './ProfileButton';
import './Navigation.css';
import LoginFormModal from '../LoginFormModal';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const location = useLocation()

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <ProfileButton user={sessionUser} />
    );
  } else if (location.pathname === '/login' || location.pathname === '/signup') {
    return null
  } else {
    sessionLinks = (
      <>
        <LoginFormModal />
      </>
    );
  }

  return (
    <ul>
      <li>
        {sessionLinks}
      </li>
    </ul>
  );
}

export default Navigation;
