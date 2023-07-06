import React, { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect, useHistory } from 'react-router-dom';
import arrowLogo from '../../images/arrowLogo.png';
import './LoginForm.css';

function LoginFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);
  const history = useHistory()

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({ email, password }))
      .then(() => {
        const redirectURL = sessionStorage.getItem("redirectURL");
        if (redirectURL) {
            history.replace(redirectURL);
            sessionStorage.removeItem("redirectURL");
        } else {
            history.push("/");
        }
      })
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

  function demoLogin(e) {
    e.preventDefault()
    dispatch(
      sessionActions.login({ email: 'demo@user.io', password: 'password1'})
    )
    const redirectURL = sessionStorage.getItem("redirectURL");

    if (redirectURL) {
        history.replace(redirectURL);
        sessionStorage.removeItem("redirectURL");
    } else {
        history.push("/");
    }

  }

  return (
    <>
      <img className='login-img' src={arrowLogo} alt='arrow-logo'></img>
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
      <div id='create-button-div'>
        <a id="create-text" href='/signup'><button id="create-account-button">Create your Arrow account</button></a>
      </div>
      <p className='separator-text'>Or</p>
      <button className='demo-login' onClick={demoLogin}>Sign in as demo user</button>
      <br></br>
      <p className="login-fine-print">By signing in, you agree to the following:</p>
      <div>
        <a id="login-terms" target="_blank" rel="noreferrer" href='https://www.target.com/c/terms-conditions/-/N-4sr7l'
        >Arrow terms and conditions</a>
      </div>
      <br></br>
      <div>
        <a id="login-terms" target="_blank" rel="noreferrer" href='https://www.target.com/c/target-privacy-policy/-/N-4sr7p'
        >Arrow privacy policy</a>
      </div>
      <div className='banner-container'>
        <div id='banner'>
          <img src="https://gcdnb.pbrd.co/images/JcdiJ1s7wrRY.png?o=1" alt="EMPLpic" />
        </div>
      </div>
    </>
  );
}

export default LoginFormPage;
