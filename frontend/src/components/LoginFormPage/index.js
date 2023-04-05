import React, { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect } from 'react-router-dom';
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

  function demo_login(e) {
    e.preventDefault()
    dispatch(
      sessionActions.login({ email: 'demo@user.io', password: 'password1'})
    )
  }

  return (
    <>
      <img className='login-img' src='https://gcdnb.pbrd.co/images/94w9oTDhQpAw.png?o=1' alt=''></img>
      <h1 className="login-page-title">Sign into your Arrow account</h1>
      <form className="login-page-form" onSubmit={handleSubmit}>
        <ul className='login-errors'>
          {errors.map(error => <li key={error}>The provided credentials were invalid</li>)}
        </ul>
        <input
          className="login-input-field"
          id='email'
          type="text"
          value={email}
          placeholder="Email"
          onChange={(e) => setEmail(e.target.value)}
        />
        <input
          className="login-input-field"
          id='password'
          type="password"
          value={password}
          placeholder="Password"
          onChange={(e) => setPassword(e.target.value)}
        />
        <button id="login-button" type="submit">Sign in</button>
      </form>
      <br></br>
        <a href='/signup' id="create-account-text"><button id="create-account-button">Create your Arrow account</button></a>
      <p className='separator-text'>Or</p>
      <button className='demo-login' onClick={demo_login}>Sign in as demo user</button>
      <br></br>
      <p className="login-fine-print">By signing in, you agree to the following:</p>
      <a className='' target="_blank" rel="noreferrer" href='https://www.target.com/login?client_id=ecom-web-1.0.0&ui_namespace
      =ui-default&back_button_action=browser&keep_me_signed_in=true&kmsi_default
      =false&actions=create_session_signin#:~:text=Target%20terms%20and%20conditions'
      id="login-terms"
      >Arrow terms and conditions</a>
      <br></br>
      <a target="_blank" rel="noreferrer" href='https://www.target.com/login?client_id=ecom-web-1.0.0&ui_namespace
      =ui-default&back_button_action=browser&keep_me_signed_in=true&kmsi_default
      =false&actions=create_session_signin#:~:text=Target%20privacy%20policy'
      id="login-terms"
      >Arrow privacy policy</a>
      <div id='banner'>
        <img src="https://gcdnb.pbrd.co/images/JcdiJ1s7wrRY.png?o=1" alt="EMPLpic" />
      </div>
    </>
  );
}

export default LoginFormPage;
