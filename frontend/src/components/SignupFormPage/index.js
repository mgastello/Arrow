import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";

function SignupFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);

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
      <h1>Create your Arrow account</h1>
      <form onSubmit={handleSubmit}>
        <ul>
          {errors.map(error => <li key={error}>{error}</li>)}
        </ul>
          <input
            type="text"
            value={email}
            placeholder="Email address"
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            type="text"
            value={firstName}
            placeholder="First Name"
            onChange={(e) => setFirstName(e.target.value)}
            required
          />
          <input
            type="text"
            value={lastName}
            placeholder="Last Name"
            onChange={(e) => setLastName(e.target.value)}
            required
          />
          <input
            type="password"
            value={password}
            placeholder="Create password"
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        <div>By creating an account, you are agreeing to the Arrow terms &
        conditions and Arrow privacy policy, including receipt of Arrow
        exclusive email offers and promotions. To manage your marketing choices
        please access the Choice section of the Arrow Privacy Policy or call
        Arrow Guest Relations.
        </div>
        <a href="https://www.target.com/c/terms-conditions/-/N-4sr7l">
          Terms & Conditions
        </a>
        <a href="https://www.target.com/login?client_id=ecom-web-1.0.0&
        ui_namespace=ui-default&back_button_action=browser&keep_me_signed_in
        =true&kmsi_default=false&actions=create_session_create_account#:~:text
        =Terms%20%26%20Conditions-,Privacy%20Policy,-Create%20account"
        >
          Privacy Policy
        </a>
        <a href="/login">Or sign in</a>
        <button type="submit">Create account</button>
      </form>
    </>
  );
}

export default SignupFormPage;