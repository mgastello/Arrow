import React from "react";
import { Route, Switch } from "react-router-dom";
import LoginFormPage from "./components/LoginFormPage";
import Navigation from "./components/Navigation";
import ProductIndex from "./components/Products";
import SignupFormPage from "./components/SignupFormPage";

function App() {
  return (
    <>
      <Navigation />
        <Switch>
          <Route exact path='/'>
            <ProductIndex />
          </Route>
        </Switch>
        <Switch>
          <Route path="/login">
            <LoginFormPage />
          </Route>
          <Route path="/signup">
            <SignupFormPage />
          </Route>
        </Switch>
    </>
  );
}

export default App;
