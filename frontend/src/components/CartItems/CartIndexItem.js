import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { updateCartItem, deleteCartItem } from "../../store/cart";

export default function CartIndexItem({cartItem}) {
    const sessionUser = useSelector((state) => state.session.user);
    const dispatch = useDispatch();
    const [ quantity, setQuantity ] = useState(cartItem.quantity);

    const changeQuantity = (e) => {
        e.preventDefault()
        const id = cartItem.id
        const userId = sessionUser.id
        const productId = cartItem.productId
        const quantity = (parseInt(e.currentTarget.value))
        const newQuantity = {id, userId, productId, quantity}
        setQuantity(e.target.value);
        dispatch(updateCartItem(newQuantity))
    }

    const deleteItem = (e) => {
        e.preventDefault()
        dispatch(deleteCartItem(cartItem.id))
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
                            <div id="infoDiv">Qty: 
                                <select value={quantity} name="quantityCartItem" id="quantityCartItem" onChange={changeQuantity}>
                                    <option value="1">1</option> 
                                    <option value="2">2</option> 
                                    <option value="3">3</option> 
                                    <option value="4">4</option> 
                                    <option value="5">5</option> 
                                    <option value="6">6</option> 
                                    <option value="7">7</option> 
                                    <option value="8">8</option> 
                                    <option value="9">9</option> 
                                    <option value="10">10</option> 
                                </select>
                            </div>
                        </div>
                        <div className="cart-product-price">
                            <p id="product-price-subtotal">${(quantity * cartItem.price).toFixed(2)}</p>
                        </div>
                            <button id="product-remove-button" onClick={deleteItem}>&times;</button>
                    </div>
                </div>
            </div>
    )
}