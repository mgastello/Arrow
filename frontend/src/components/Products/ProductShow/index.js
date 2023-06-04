import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { useParams } from "react-router-dom";
import { fetchProduct } from "../../../store/product";
import { fetchReviews } from "../../../store/review";
import AddToCartModal from "../../AddToCartModal";
import StarRatings from "react-star-ratings"
import "./ProductShow.css";

export default function ProductShow() {
    const dispatch = useDispatch()
    const { productId } = useParams()
    const product = useSelector(state => state?.products[productId])
    const reviews = useSelector(state => Object.values(state?.reviews))

    let sumRating = 0
    let numReviews = 0

    if (reviews) {
        reviews.forEach((review) => {
            if(review && product){
                if (review.productId === product.id){
                    sumRating += review.rating;
                    numReviews += 1;
                }
            }
        })
    }

    const avgRating = numReviews === 0 ? 0 : sumRating / numReviews;

    useEffect(() => {
        dispatch(fetchProduct(productId))
        dispatch(fetchReviews(productId))
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
                                {/* <button id="quantity-button">
                                    <p>Qty</p>
                                </button> */}
                                {/* <button id="add-to-cart-button">Add to cart</button> */}
                                <AddToCartModal product={product} />
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
                <div className="product-review-container">
                    <h1 className="reviews-header">Guest Ratings & Reviews</h1>
                    <h1 className="reviews-avg-rating-num">{avgRating.toFixed(1)}</h1>
                    <StarRatings
                        rating={avgRating}
                        starRatedColor="gold"
                        starEmptyColor="lightgray"
                        starDimension="30px"
                        starSpacing="2px"
                    />
                    <p className="review-count">{numReviews} star ratings</p>
                </div>
            </>
        )
    }
}