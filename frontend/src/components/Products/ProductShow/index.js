import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { useParams, useHistory } from "react-router-dom";
import { fetchProduct } from "../../../store/product";
import { fetchReviews } from "../../../store/review";
import AddToCartModal from "../../AddToCartModal";
import StarRatings from "react-star-ratings";
import PageNotFound from "../../404/404";
import ReviewIndexItem from "../../Reviews/ReviewIndexItem";
import "./ProductShow.css";
import { deleteFavorite, fetchFavorites, createFavorite } from "../../../store/favorite";
import { useState } from "react";

export default function ProductShow() {
    const dispatch = useDispatch()
    const history = useHistory()
    const sessionUser = useSelector(state => state.session.user);
    const { productId } = useParams()
    const product = useSelector(state => state?.products[productId])
    const favoriteId = useSelector(state => {
        const favoritesArray = Object.values(state?.favorites);
        const matchingFavorite = favoritesArray.find(singleFav => singleFav.productId == productId);
        return matchingFavorite ? matchingFavorite.id : null;
    });
    const reviews = useSelector(state => Object.values(state?.reviews))
    const [isFavorite, setIsFavorite] = useState(false)

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

    useEffect(() => {
        dispatch(fetchProduct(productId))
        dispatch(fetchReviews(productId))
        if (sessionUser) {
            dispatch(fetchFavorites())
        }
        window.scrollTo(0, 0)
    }, [dispatch, productId, sessionUser])

    useEffect(() => {
        if (favoriteId !== null && favoriteId !== undefined) {
            setIsFavorite(!!favoriteId)
        }
    }, [favoriteId])

    const handleReviewClick = () => {
        if (!sessionUser) {
            const redirectURL = `/products/${productId}/add-review`;
            sessionStorage.setItem("redirectURL", redirectURL);
            history.push("/login");
        } else {
            history.push(`/products/${productId}/add-review`)
        }
    }

    const handleFavoriteClick = () => {
        if (!sessionUser) {
            const redirectURL = `/products/${productId}`;
            sessionStorage.setItem("redirectURL", redirectURL);
            history.push("/login");
        } else {
            if (isFavorite) {
                dispatch(deleteFavorite(favoriteId))
                setIsFavorite(false)
            } else {
                dispatch(createFavorite({
                    userId: sessionUser.id,
                    productId: product.id
                }))
                setIsFavorite(true)
            }
        }
    }

    if (!product) {
        return <PageNotFound />
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
                                <p>${product.price.toFixed(2)}</p>
                            </div>
                            <p id="purchase-online-text">When purchased online</p>
                            <div id="purchase-buttons">
                                <AddToCartModal product={product} />
                            </div>
                        </div>
                    </div>
                    <button onClick={handleFavoriteClick}> FAVORITE </button>
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
                        {numReviews === 1 ? (
                            <p className="review-count">{numReviews} star rating</p>
                        ) : (
                            <p className="review-count">{numReviews} star ratings</p>
                        )}
                    </div>
                    <div id='write-review-button-div'>
                        <button id="create-review-button" onClick={handleReviewClick}>Write a review</button>
                    </div>
                    <p className="matching-reviews-text">We found {numReviews} matching reviews</p>
                    <div className='product-reviews-container'>
                        <ul id='all-product-reviews'>
                            {reviews.reverse().map((review) => {
                                if (product.id === review.productId) {
                                    return <ReviewIndexItem key={review.id} review={review} />
                                } else {
                                    return null
                                }
                            })}
                        </ul>
                    </div>
                </div>
            </>
        )
    }
}