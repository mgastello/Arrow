import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
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
  
  return (
    <>
      <img src="https://gcdnb.pbrd.co/images/94w9oTDhQpAw.png?o=1" alt=""></img>
      <h1>Create your Arrow account</h1>
      <br></br>
      <form onSubmit={handleSubmit}>
          <input
            type="text"
            value={email}
            placeholder="Email address"
            onChange={(e) => setEmail(e.target.value)}
            // required
            />
            {emailError && <span className="error">Please enter a valid email</span>}
          <input
            type="text"
            value={firstName}
            placeholder="First name"
            onChange={(e) => setFirstName(e.target.value)}
            // required
          />
          {fNameError && <span className="error">Please enter your first name</span>}
          <input
            type="text"
            value={lastName}
            placeholder="Last name"
            onChange={(e) => setLastName(e.target.value)}
            // required
          />
          {lNameError && <span className="error">Please enter your last name</span>}
          <input
            onClick={() => setShowPasswordRequirements(true)}
            type="password"
            value={password}
            placeholder="Create password"
            onChange={(e) => setPassword(e.target.value)}
            // required
          />
          {passwordError && <span className="error">Please enter a valid password</span>}
          {showPasswordRequirements && (
            <div id="password-requirements">
              <div id="requirement-title">
                Must contain:
                <ul id="requirement-body">
                  <li>
                    8-20 characters
                  </li>
                </ul>
              </div>
              <div id="requirement-title">
                And 2 of the following:
                <ul id="requirement-body">
                  <li>Lowercase letters</li>
                  <li>Uppercase letters</li>
                  <li>Numbers</li>
                  <li>Special characters, except {'<'} {'>'}</li>
                </ul>
              </div>
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
        <a target="_blank" rel="noreferrer" id="signup-terms" href="https://www.target.com/login?client_id=ecom-web-1.0.0&
        ui_namespace=ui-default&back_button_action=browser&keep_me_signed_in
        =true&kmsi_default=false&actions=create_session_create_account#:~:text
        =Terms%20%26%20Conditions-,Privacy%20Policy,-Create%20account"
        >
          Privacy Policy
        </a>
        <br></br>
        <button id="signup-create-button" type="submit">Create account</button>
        <br></br>
        <a id="signin" href="/login">Or sign in</a>
      </form>
    </>
  );
}

export default SignupFormPage;