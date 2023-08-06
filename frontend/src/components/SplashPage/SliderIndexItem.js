import React from "react";
import { useHistory } from "react-router-dom";
import AddToCartModal from "../AddToCartModal";
import './SplashPage.css'

export default function ProductIndexItem({ product }) {
    const history = useHistory()

    const handleClick = () => {
        history.push(`/products/${product.id}`)
    }

    return (
        <>
            <div className="slider-single-product">
                <button onClick={handleClick} className="slider-product-card">
                    <img className="slider-product-picture" src={product.pictureUrl} alt="product-img" />
                    <div className="slider-product-card-text">
                        <p className="slider-product-price">${product.price.toFixed(2)}</p>
                        <h3 className="slider-product-name">{product.name}</h3>
                    </div>
                </button>
                <AddToCartModal product={product} />
            </div>
        </>
    )
}