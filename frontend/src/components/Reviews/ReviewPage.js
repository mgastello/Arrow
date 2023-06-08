import React, { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useParams } from "react-router-dom";
import { createReview } from "../../store/review";
import { fetchProduct } from "../../store/product";
import StarRatings from "react-star-ratings";
import './ReviewPage.css'

export default function ReviewPage() {
    const { productId } = useParams()
    const dispatch = useDispatch()
    const history = useHistory()
    const sessionUser = useSelector(state => state.session.user);
    const product = useSelector(state => state?.products[productId])
    const [errors, setErrors] = useState([]);
    const [title, setTitle] = useState("")
    const [body, setBody] = useState("")
    const [rating, setRating] = useState()
    const [displayName, setDisplayName] = useState("")
    const displayNameRef = useRef(null);
    const ratingRef = useRef(null);
    const titleRef = useRef(null);
    const bodyRef = useRef(null);
    const titleError = errors.find(error => error.includes("Title"))
    const bodyError = errors.find(error => error.includes("Body"))
    const ratingError = errors.find(error => error.includes("Rating"))
    const displayNameError = errors.find(error => error.includes("display"))

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch, productId])

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        dispatch(createReview({
            review: {
                authorId: sessionUser.id,
                productId: product.id,
                title,
                body,
                rating,
                displayName
            }
        }))
            .then(() => {
                history.push(`/products/${productId}`)
            })
            .catch(async (res) => {
                let data;
                try {
                    data = await res.clone().json();
                } catch {
                    data = await res.text();
                }
                if (data?.errors) setErrors(data.errors);
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
            }
            )
        // if (!errors) {
        //     history.push(`/products/${productId}`);
        // }
    }
    const handleCancel = () => {
        history.push(`/products/${productId}`)
    }

    const handleDisplayNameClick = (e) => {
        e.preventDefault()
        displayNameRef.current.focus();
    }

    const handleRatingClick = (e) => {
        e.preventDefault()
        ratingRef.current.focus();
    }

    const handleTitleClick = (e) => {
        e.preventDefault()
        titleRef.current.focus();
    }

    const handleBodyClick = (e) => {
        e.preventDefault()
        bodyRef.current.focus();
    }

    if (product) {
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
                                ref={displayNameRef}
                                className="display-name-input"
                            />
                            {displayNameError && <span id="error">Please enter a display name that does not contain special characters (must be less than 25 characters)</span>}
                            <div className="rating-wrapper">
                                <h1 className="rating-text" ref={ratingRef}>First, rate this item</h1>
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
                                    {rating && <h3>Thanks for rating this item!</h3>}
                                </div>
                            </div>
                            <h1 className="write-review-text">Write your review</h1>
                            {errors.length > 0 && <p className="review-following-text">review the following...</p>}
                            <div className="review-page-errors">
                                {displayNameError && <button onClick={handleDisplayNameClick} className="review-page-single-error">please enter a display name</button>}
                                {ratingError && <button onClick={handleRatingClick} className="review-page-single-error">please rate the item</button>}
                                {titleError && <button onClick={handleTitleClick} className="review-page-single-error">please enter a review title</button>}
                                {bodyError && <button onClick={handleBodyClick} className="review-page-single-error">please enter review text</button>}
                            </div>
                            <br></br>
                            <input
                                type="text"
                                value={title}
                                placeholder="Review title"
                                onChange={(e) => setTitle(e.target.value)}
                                ref={titleRef}
                                className="title-input"

                            />
                            {titleError && <span id="error">Please enter a review title (must be less than 200 characters)</span>}
                            <p className="summarize-text">summarize your thoughts in a short headline</p>
                            <textarea
                                type="text"
                                value={body}
                                placeholder="Provide a brief description"
                                onChange={(e) => setBody(e.target.value)}
                                ref={bodyRef}
                                className="description-input"
                            />
                            {bodyError && <span id="error">Reviews must be at least 20 characters</span>}
                            <p className="desc-requirements">Minimum length is 20 characters.</p>
                            <p className="submit-fine-print">By submitting, I agree to the review guidelines</p>
                        </div>
                    </div>
                    <div className="review-page-buttons">
                        <button className="review-page-cancel-button" onClick={handleCancel}>Cancel</button>
                        <button className="review-page-submit-button" type="submit" onSubmit={handleSubmit}>Submit review</button>
                    </div>
                </form>
            </div>
        )
    } else {
        return (
            <div>Loading...</div>
        )
    }
}