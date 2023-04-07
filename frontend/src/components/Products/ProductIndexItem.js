import React from "react";

export default function ProductIndexItem(props) {
    return (
        <>
            <div id="product-card">
                <h3 id="product-name">{props.product.name}</h3>
                <p id="product-price">{props.product.brand}</p>
                <p id="product-price">{props.product.price}</p>
            </div>
        </>
    )
}