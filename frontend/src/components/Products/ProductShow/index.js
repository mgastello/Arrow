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
            <div className="product-show-container">
                <h1 className="product-show-name">
                    <h1>{product.name}</h1>
                </h1>
                <div className="product-show-img">
                    <img src={product.pictureUrl} alt="product-img" />
                </div>
                <div className="product-show-info">
                    <div className="product-show-brand">
                        <h1>{product.brand}</h1>
                    </div>
                    <div className="product-show-description">
                        <h1>{product.description}</h1>
                    </div>
                    <div>
                        <p>{product.price}</p>
                        {/* <p>{product.price.toFixed(2)}</p> */}
                    </div>
                </div>
            </div>
        )
    }
}