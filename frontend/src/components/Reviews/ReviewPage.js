import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useParams } from "react-router-dom";
import { createReview } from "../../store/review";
import { fetchProduct } from "../../store/product";
import StarRatings from "react-star-ratings";
import './ReviewPage.css'

export default function ReviewPage() {
    const dispatch = useDispatch()
    const history = useHistory()
    const { productId } = useParams()
    const sessionUser = useSelector(state => state.session.user);
    const product = useSelector(state => state?.products[productId])
    const [errors, setErrors] = useState([]);
    const [title, setTitle] = useState("")
    const [body, setBody] = useState("")
    const [rating, setRating] = useState()
    const [displayName, setDisplayName] = useState("")

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        dispatch(createReview({
            authorId: sessionUser.id,
            productId: product.id,
            title,
            body,
            rating,
            displayName
        }))
        history.push(`/products/${productId}`);
    }

    const handleCancel = () => {
        history.push(`/products/${productId}`)
    }

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch, productId])

    return (
        <div className="review-page-container">
            <form onSubmit={handleSubmit} className="review-page-form">
                <div className="review-wrapper">
                    <div className="product-review-img">
                        <img id="review-page-img" src={product.pictureUrl} alt="product-img" />
                    </div>
                    <div className="review-form">
                        <h1 className="review-page-header">Review this item</h1>
                        <p className="review-page-product-name">{product.name}</p>
                        <input
                            type="text"
                            value={displayName}
                            placeholder="Display name"
                            onChange={(e) => setDisplayName(e.target.value)}
                            className="display-name-input"
                        />
                        <div className="rating-wrapper">
                            <h1 className="rating-text">First, rate this item</h1>
                            <div className="review-form-rating">
                                <StarRatings
                                    isSelectable={true}
                                    rating={rating}
                                    changeRating={(rating) => setRating(rating)}
                                    starRatedColor="gold"
                                    starHoverColor="gold"
                                    starEmptyColor="lightgray"
                                    numberOfStars={5}
                                    name='rating'
                                    starDimension='30px'
                                    starSpacing='0'
                                />
                            </div>
                        </div>
                        <h1 className="write-review-text">Write your review</h1>
                        <input
                            type="text"
                            value={title}
                            placeholder="Review title"
                            onChange={(e) => setTitle(e.target.value)}
                            className="title-input"
                        />
                        <p className="summarize-text">summarize your thoughts in a short headline</p>
                        <input
                            type="text"
                            value={body}
                            placeholder="Provide a brief description"
                            onChange={(e) => setBody(e.target.value)}
                            className="title-input"
                        />
                        <div>
                            <p>Minimum length is 20 characters.</p> {/* add link */}
                        </div>
                        <p>By submitting, I agree to the review guidelines</p> {/* add link */}
                    </div>
                </div>
                <button onClick={handleCancel}>Cancel</button>
                <button type="submit" onClick={handleSubmit}>Submit review</button>
            </form>
        </div>
    )
}