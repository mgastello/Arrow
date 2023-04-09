import React from "react";
import { Link } from "react-router-dom";

export default function ProductIndexItem(props) {
    return (
        <>
            <div id="product-card">
                <Link to={`products/${props.product.id}`}>
                    <img id="product-picture" src={props.product.pictureUrl} />
                    <h3 id="product-name">{props.product.name}</h3>
                </Link>
                <p id="product-brand">{props.product.brand}</p>
                <p id="product-price">${props.product.price.toFixed(2)}</p>
            </div>
        </>
    )
}