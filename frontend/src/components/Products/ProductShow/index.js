import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { useParams } from "react-router-dom";
import { fetchProduct } from "../../../store/product";
import "./ProductShow.css"

export default function ProductShow() {
    const dispatch = useDispatch()
    const { productId } = useParams()
    const product = useSelector(state => state?.products[productId])

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch, productId])

    if (!product) {
        return null
    } else {
        return (
            <>
                <div className="product-page">
                    <h1 className="product-show-name">{product.name}</h1>
                    <div className="product-wrapper">
                        <div className="product-show-container">
                            <img id="show-img" src={product.pictureUrl} alt="product-img" />
                        </div>
                        <div className="product-show-info">
                            <div className="product-show-price">
                                {/* <p>${product.price}</p> */}
                                <p>${product.price.toFixed(2)}</p>
                            </div>
                            <p id="purchase-online-text">When purchased online</p>
                            <div id="purchase-buttons">
                                <button id="quantity-button">
                                    <p>Qty</p>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div className="product-details-container">
                        <h2 id="details-header">About this item</h2>
                        <div id="details-subheader-container">
                            <h3 id="details-subheader">Details</h3>
                        </div>
                        <br></br>
                        <div id="details-body">
                            <h3 id="description-header">Description</h3>
                            <p id="description-body">{product.description}</p>
                        </div>
                        <br></br>
                    </div>
                </div>
            </>
        )
    }
}