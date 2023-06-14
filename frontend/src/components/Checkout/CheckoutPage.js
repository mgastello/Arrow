import React from 'react';
import { useSelector } from 'react-redux';
import { Redirect } from "react-router-dom"

export default function CheckoutPage() {
    const sessionUser = useSelector(state => state.session.user);
    const cartItems = useSelector(state => Object.values(state?.cartItems))

    if (!sessionUser) {
        return (
            <Redirect to="/login" />
        )
    } else if (sessionUser && cartItems.length === 0) {
        return (
            <Redirect to="/cart" />
        )
    } else {
        return (
            null
        )
    }
}