import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { useParams } from "react-router-dom";
import { fetchProduct } from "../../../store/product";

export default function ProductShow() {
    const dispatch = useDispatch()
    let { productId } = useParams()
    const product = useSelector(state => state.products[productId])
    console.log(product)

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch ,productId])

    return (
        <>
            <div className="product-show-container">
                <div className="product-show-img">
                    <img src={product.pictureUrl} />
                </div>
            </div>
        </>
    )
}