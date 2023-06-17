import React from "react";
import { useSelector } from "react-redux";
import "./OrderConfirmation.css"

export default function OrderConfirmed() {
    const sessionUser = useSelector(state => state.session.user)


    return (
        <>
            <div className="order-page-top">
                <div className="thank-you-wrapper">
                    <div>
                        <img className="thank-you-images" src="https://gcdnb.pbrd.co/images/61yrUk4Qfu2Q.png?o=1" alt="arrow-brand" />
                        <h1 className="thank-you-text">Thanks for your order!</h1>
                    </div>
                    <div className="confirmation-updates">
                        <p className="updates-text">We won't send confirmations and order updates to </p>
                        <h2>{sessionUser.email}</h2>
                    </div>
                    <div className="order-changes">
                        <h3 className="order-changes-header">Need to make changes? Act fast!</h3>
                        <p className="order-changes-text">We process orders quickly, so you’ll want to visit your order details page as soon as possible.</p>
                    </div>
                </div>
            </div>
            <div className="order-page-bottom">
                this is the bottom of the page
            </div>
        </>
    )
}