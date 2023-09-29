import React, { useEffect } from "react";
import { useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import arrowBrand from '../../images/arrowBrand.png';
import arrowTruck from '../../images/arrowTruck.png';
import "./OrderConfirmation.css";

export default function OrderConfirmed() {
    const sessionUser = useSelector(state => state.session.user)
    const hasPurchased = localStorage.getItem('hasPurchased')

    useEffect(() => {
        return () => {
            localStorage.removeItem('hasPurchased')
        }
    }, [])

    if (sessionUser && hasPurchased === 'true') {
        return (
            <>
                <div className="order-page-top">
                    <div className="thank-you-wrapper">
                        <div>
                            <img className="thank-you-images" src={arrowBrand} alt="arrow-brand" />
                            <h1 className="thank-you-text">thank you for your order!</h1>
                        </div>
                        <div className="confirmation-updates">
                            <p className="updates-text">We won't send confirmations and order updates to</p>
                            <h2>{sessionUser.email}</h2>
                        </div>
                        <div className="order-changes">
                            <p className="order-changes-text">Need to make changes? Visit your order details page as soon as possible. You won't be able to edit your order once it
                            starts processing.</p>
                        </div>
                    </div>
                </div>
                <div className="order-page-bottom">
                    <div className="confirmation-shipping-details-wrapper">
                        <div className="shipping-details-header">
                            <img className="arrow-truck" src={arrowTruck} alt="arrow-truck" />
                            <h1 className="shipping-details-title">Shipping details</h1>
                        </div>
                        <div className="confirmation-user-info">
                            <p>{sessionUser.firstName} {sessionUser.lastName}</p>
                            <p>90 5th Ave</p>
                            <p>New York, NY, 10011</p>
                        </div>
                    </div>
                </div>
            </>
        )
    } else {
        return (
            <Redirect to="/login" />
        )
    }
}