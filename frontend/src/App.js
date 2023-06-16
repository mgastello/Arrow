import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Navigation from './components/Navigation';
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from './components/SignupFormPage';
import ProductIndex from './components/Products/ProductsIndex';
import ProductShow from './components/Products/ProductShow';
import CartIndex from './components/CartItems/CartIndex';
import PageNotFound from './components/404/404';
import SearchShow from './components/Search/SearchShow';
import ReviewPage from './components/Reviews/ReviewPage';
import CheckoutPage from './components/Checkout/CheckoutPage';
import OrderConfirmed from './components/OrderConfirmed/OrderConfirmed';

function App() {
  return (
    <>
        <Switch>
          <Route exact path='/'>
            <Navigation />
            <ProductIndex />
          </Route>

          <Route path='/login'>
            <LoginFormPage />
          </Route>

          <Route path='/signup'>
            <SignupFormPage />
          </Route>

          <Route exact path='/products/:productId'>
            <Navigation />
            <ProductShow />
          </Route>

          <Route path='/cart'>
            <Navigation />
            <CartIndex />
          </Route>

          <Route path='/search'>
            <Navigation />
            <SearchShow />
          </Route>

          <Route exact path='/products/:productId/add-review'>
            <Navigation />
            <ReviewPage />
          </Route>

          <Route exact path='/checkout'>
            <Navigation />
            <CheckoutPage />
          </Route>

          <Route path='/order-confirmed'>
            {/* <Navigation /> */}
            <OrderConfirmed />
          </Route>

          <Route path='*'>
            <PageNotFound />
          </Route>
        </Switch>
    </>
  );
}

export default App;
