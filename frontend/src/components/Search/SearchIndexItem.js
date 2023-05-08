import React from "react";
import { Link } from "react-router-dom";
import AddToCartModal from "../AddToCartModal";

export default function SearchIndexItem({product}) {
    return (
        <>
            <div id="product-card">
                <Link to={`/products/${product.id}`}>
                    <img id="product-picture" src={product.pictureUrl} alt="product-img"/>
                    <h3 id="product-name">{product.name}</h3>
                </Link>
                <p id="product-brand">{product.brand}</p>
                <p id="product-price">${product.price.toFixed(2)}</p>
                <p id="purchase-online-text-card">When purchased online</p>
                <p id="free-shipping-text">Free Shipping*</p>
                <AddToCartModal product={product}/>
            </div>
        </>
    )
}