import React from "react";
import { Route, Switch } from "react-router-dom";
import Navigation from "./components/Navigation";
import LoginFormPage from "./components/LoginFormPage";
import SignupFormPage from "./components/SignupFormPage";
import ProductIndex from "./components/Products/ProductsIndex";
import ProductShow from "./components/Products/ProductShow";

function App() {
  return (
    <>
      <div>
        <Navigation />
      </div>
        <Switch>
          <Route exact path='/'>
            <ProductIndex />
          </Route>

          <Route path="/login">
            <LoginFormPage />
          </Route>

          <Route path="/signup">
            <SignupFormPage />
          </Route>

          <Route path ="/products/:productId">
            <ProductShow />
          </Route>
        </Switch>
    </>
  );
}

export default App;
