import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { updateCartItem } from "../../store/cart";

export default function CartIndexItem({cartItem}) {
    const sessionUser = useSelector((state) => state.session.user)
    const dispatch = useDispatch
    const [ quantity, setQuantity ] = useState(cartItem.quantity)

    const changeQuantity = () => {

    }

    return (
            <div className="cart-items-holder">
                <div className="one-cart-item">
                    <div className="cart-product-img-container">
                        <Link to={`/products/${cartItem.productId}`}>
                            <img className="cart-product-img" src={cartItem.pictureUrl} alt="" />
                        </Link>
                    </div>
                    <div className="cart-product-name-container">
                        <div className="cart-product-info">
                            <Link className="cart-product-link" to={`/products/${cartItem.productId}`}>
                                <p className="cart-product-name">{cartItem.name} - {cartItem.brand}</p>
                            </Link>
                        </div>
                        <div className="cart-product-price">
                            <p>${cartItem.price}</p>
                        </div>
                    </div>
                </div>
            </div>
    )
}