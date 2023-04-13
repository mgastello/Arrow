import React from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

export default function CartIndexItem({cartItem}) {
    const cartItems = useSelector(state => Object.values(state?.cartItems))
    console.log(cartItems.length)
    return (
        <>
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
        </>
        // <>
        //     <div id="product-card">
        //         <Link to={`products/${product.id}`}>
        //             <img id="product-picture" src={product.pictureUrl} alt="product-img"/>
        //             <h3 id="product-name">{product.name}</h3>
        //         </Link>
        //         <p id="product-brand">{product.brand}</p>
        //         <p id="product-price">${product.price.toFixed(2)}</p>
        //         <p id="purchase-online-text-card">When purchased online</p>
        //         <p id="free-shipping-text">Free Shipping*</p>
        //     </div>
        // </>
    )
}