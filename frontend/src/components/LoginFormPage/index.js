import React, { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect, NavLink } from 'react-router-dom';
import './LoginForm.css'

function LoginFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({ email, password }))
      .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
  }

  return (
    <>
      <img src='https://gcdnb.pbrd.co/images/94w9oTDhQpAw.png?o=1' alt=''></img>
      <h1>Sign into your Arrow account</h1>
      <form onSubmit={handleSubmit}>
        <ul className='login-errors'>
          {errors.map(error => <li key={error}>The provided credentials were invalid</li>)}
        </ul>
        <input
          className="input-field"
          type="text"
          value={email}
          placeholder="Email"
          onChange={(e) => setEmail(e.target.value)}
          // required
        />
        <input
          className="input-field"
          type="password"
          value={password}
          placeholder="Password"
          onChange={(e) => setPassword(e.target.value)}
          // required
        />
        <button className="login-button" type="submit">Sign in</button>
      </form>
      <br></br>
      <NavLink exact to='/signup'>
        <button className="create-account-button">Create your Arrow account</button>
      </NavLink>
      <br></br>
      <p>By signing in, you agree to the following:</p>
      <a target="_blank" href='https://www.target.com/login?client_id=ecom-web-1.0.0&ui_namespace
      =ui-default&back_button_action=browser&keep_me_signed_in=true&kmsi_default
      =false&actions=create_session_signin#:~:text=Target%20terms%20and%20conditions'
      id="login-terms"
      >Arrow terms and conditions</a>
      <br></br>
      <a target="_blank" href='https://www.target.com/login?client_id=ecom-web-1.0.0&ui_namespace
      =ui-default&back_button_action=browser&keep_me_signed_in=true&kmsi_default
      =false&actions=create_session_signin#:~:text=Target%20privacy%20policy'
      id="login-terms"
      >Arrow privacy policy</a>
    </>
  );
}

export default LoginFormPage;