import React, { useEffect } from "react";
import { Link, Redirect } from "react-router-dom";
import AddToCartModal from "../../AddToCartModal";
import { useDispatch, useSelector } from "react-redux";
import { fetchAllReviews } from "../../../store/review";
import StarRatings from "react-star-ratings";

export default function ProductIndexItem({ product }) {
    const dispatch = useDispatch()
    const reviews = useSelector(state => Object.values(state?.reviews))

    useEffect(() => {
        dispatch(fetchAllReviews())
    }, [dispatch])

    let sumRating = 0
    let numReviews = 0

    if (reviews) {
        reviews.forEach((review) => {
            if (review && product) {
                if (review.productId === product.id) {
                    sumRating += review.rating;
                    numReviews += 1;
                }
            }
        })
    }

    const avgRating = numReviews === 0 ? 0 : sumRating / numReviews;

    return (
        <>
            <div id="product-card">
                <Link to={`products/${product.id}`}>
                    <img id="product-picture" src={product.pictureUrl} alt="product-img" />
                    <h3 id="product-name">{product.name}</h3>
                </Link>
                <p id="product-brand">{product.brand}</p>
                <StarRatings
                    rating={avgRating}
                    starRatedColor="gold"
                    starEmptyColor="lightgray"
                    starDimension="15px"
                    starSpacing="0px"
                />
                <p id="product-price">${product.price.toFixed(2)}</p>
                <p id="purchase-online-text-card">When purchased online</p>
                <p id="free-shipping-text">Free Shipping*</p>
                <AddToCartModal product={product} />
            </div>
        </>
    )
}