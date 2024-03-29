import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
import arrowLogo from '../../images/arrowLogo.png';
import arrowBanner from '../../images/arrowBanner.png';
import checkmark from '../../images/checkmark.png';
import passedCheckmark from '../../images/passedCheckmark.png';
import xMark from '../../images/xMark.png';
import './SignupForm.css'

function SignupFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);
  const [showPasswordRequirements, setShowPasswordRequirements] = useState(false)
  const emailError = errors.find(error => error.includes("Email"))
  const fNameError = errors.find(error => error.includes("First"))
  const lNameError = errors.find(error => error.includes("Last"))
  const passwordError = errors.find(error => error.includes("Password"))

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    return dispatch(sessionActions.signup({ firstName, lastName, email, password }))
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

  const validPwLength = /^.{8,20}$/.test(password);
  const hasLowercaseLetter = /[a-z]/.test(password)
  const hasUppercaseLetter = /[A-Z]/.test(password)
  const hasNumber = /[0-9]/.test(password)
  const hasSpecialChar = /[!@#$%^&*()_+{}|:"?~=[\]\\;',./]/.test(password);


  const invalidChars = /[<>]/.test(password)

  const validPassword = (validPwLength && hasLowercaseLetter && hasUppercaseLetter && !invalidChars) ||
    (validPwLength && hasLowercaseLetter && hasNumber && !invalidChars) ||
    (validPwLength && hasLowercaseLetter && hasSpecialChar && !invalidChars) ||
    (validPwLength && hasUppercaseLetter && hasNumber && !invalidChars) ||
    (validPwLength && hasUppercaseLetter && hasSpecialChar && !invalidChars) ||
    (validPwLength && hasNumber && hasSpecialChar && !invalidChars)

  return (
    <>
      <img className="signup-img" src={arrowLogo} alt='arrow-logo'></img>
      <h1 className="signup-h1">Create your Arrow account</h1>
      <br></br>
      <form className="login-page-form" onSubmit={handleSubmit}>
        <input
          type="text"
          value={email}
          placeholder="Email address"
          onChange={(e) => setEmail(e.target.value)}
          className="signup-input"
        />
        {emailError && <span id="error">Please enter a valid email</span>}
        <input
          type="text"
          value={firstName}
          placeholder="First name"
          onChange={(e) => setFirstName(e.target.value)}
          className="signup-input"
        />
        {fNameError && <span id="error">Please enter your first name</span>}
        <input
          type="text"
          value={lastName}
          placeholder="Last name"
          onChange={(e) => setLastName(e.target.value)}
          className="signup-input"
        />
        {lNameError && <span id="error">Please enter your last name</span>}
        <input
          onFocus={() => setShowPasswordRequirements(true)}
          type="password"
          value={password}
          placeholder="Create password"
          onChange={(e) => setPassword(e.target.value)}
          className="signup-input"
        />
        {passwordError && <span id="error">Please enter a valid password</span>}
        {showPasswordRequirements && (
          <div id="password-requirements">
            {!validPassword ? (
              <>
                <div id="requirement-title">
                  Must contain:
                  <ul id="requirement-body">
                    {!validPwLength ? (
                      <li id="reqs">8-20 characters</li>
                    ) : (
                      <li id="passed-reqs"><img className='req-checkmark' src={checkmark}  alt='checkmark' />8-20 characters</li>
                    )}
                  </ul>
                </div>
                <div id="requirement-title">
                  And 2 of the following:
                  <ul id="requirement-body">
                    {!hasLowercaseLetter ? (
                      <li id="reqs">Lowercase letters</li>
                    ) : (
                      <li id="passed-reqs"><img className='req-checkmark' src={checkmark}  alt='checkmark' />Lowercase letters</li>
                    )}
                    {!hasUppercaseLetter ? (
                      <li id="reqs">Uppercase letters</li>
                    ) : (
                      <li id="passed-reqs"><img className='req-checkmark' src={checkmark}  alt='checkmark' />Uppercase letters</li>
                    )}
                    {!hasNumber ? (
                      <li id="reqs">Numbers</li>
                    ) : (
                      <li id="passed-reqs"><img className='req-checkmark' src={checkmark}  alt='checkmark' />Numbers</li>
                    )}
                    {password.includes('>') || password.includes('<') ? (
                      <li id='failed-reqs'><img className='req-x-mark' src={xMark} alt='x-mark' />Do not use: {'<'} {'>'}</li>
                    ) : !hasSpecialChar ? (
                      <li id="reqs">Special characters, except {'<'} {'>'}</li>
                    ) : (
                      <li id="passed-reqs"><img className='req-checkmark' src={checkmark} alt='checkmark' />Special characters, except {'<'} {'>'}</li>
                    )}
                  </ul>
                </div>
              </>
            ) : (
              <p id="passed-reqs"><img className="passed-checkmark" src={passedCheckmark} alt='checkmark' />Your password is ready to go!</p>
            )}
          </div>
        )}
        <div className="fine-print">By creating an account, you are agreeing to the Arrow terms &
          conditions and Arrow privacy policy, including receipt of Arrow
          exclusive email offers and promotions. To manage your marketing choices
          please access the Choice section of the Arrow Privacy Policy or call
          Arrow Guest Relations.
        </div>
        <br></br>
        <a target="_blank" rel="noreferrer" id="signup-terms" href="https://www.target.com/c/terms-conditions/-/N-4sr7l">
          Terms & Conditions
        </a>
        <br></br>
        <a target="_blank" rel="noreferrer" id="signup-terms" href="https://www.target.com/c/target-privacy-policy/-/N-4sr7p">
          Privacy Policy
        </a>
        <br></br>
        <button id="login-button" type="submit">Create account</button>
        <br></br>
        <a id="signin" href="/login">Or sign in</a>
      </form>
      <div className='banner-container'>
        <div id='banner'>
          <img src={arrowBanner} alt="EMPLpic" />
        </div>
      </div>
    </>
  );
}

export default SignupFormPage;