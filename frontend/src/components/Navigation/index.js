import React from 'react';
import { useSelector } from 'react-redux';
import { useLocation } from 'react-router';
import LoggedInModal from './ProfileButton';
import './Navigation.css';
import LoginFormModal from '../LoginFormModal';
import CartButton from './CartButton';
import { NavLink } from 'react-router-dom';
import SearchBar from '../Search/SearchBar';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const location = useLocation()

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
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
        <NavLink to={'/'} id='home-button'>
          <img className='nav-logo' src='https://gcdnb.pbrd.co/images/94w9oTDhQpAw.png?o=1' alt=''></img>
        </NavLink>
      </li>
      <div className='about-links-container'>
          <a href="https://github.com/mgastello/arrow" target='_blank' rel="noreferrer"><img id="about-links" src="https://raw.githubusercontent.com/inc-Majdev/inc-Majdev/main/icons/github.png" alt='' /></a>
          <a href="https://www.linkedin.com/in/michael-gastello-168822260/" target='_blank' rel="noreferrer"><img id="about-links" src="https://www.edigitalagency.com.au/wp-content/uploads/new-linkedin-logo-white-black-png.png" alt='' /></a>
      </div>
      <div className='right-side-nav'>
        <li id='right-side-nav-welcome'>
          {sessionLinks}
        </li>
        <CartButton />
      </div>
    </ul>
  );
}

export default Navigation;
