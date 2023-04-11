import React from 'react';
import { useSelector } from 'react-redux';
import { useLocation } from 'react-router';
// import ProfileButton from './ProfileButton';
import './Navigation.css';
import LoginFormModal from '../LoginFormModal';
import { NavLink } from 'react-router-dom';
import LoggedInModal from './ProfileButton';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const location = useLocation()

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      // <ProfileButton user={sessionUser} />
      <LoggedInModal user={sessionUser} />
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
    <ul id='nav'>
      <li>
        <NavLink to={'/'}>
          <img className='nav-logo' src='https://gcdnb.pbrd.co/images/94w9oTDhQpAw.png?o=1' alt=''></img>
        </NavLink>
      </li>
      <li>
        {sessionLinks}
      </li>
    </ul>
  );
}

export default Navigation;
