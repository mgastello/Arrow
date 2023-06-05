import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useParams } from "react-router-dom";
import { createReview } from "../../store/review";

export default function ReviewPage() {
    const dispatch = useDispatch()
    const history = useHistory()
    const { productId } = useParams()
    const sessionUser = useSelector(state => state.session.user);
    const product = useSelector(state => state?.products[productId])
    const [title, setTitle] = useState("")
    const [body, setBody] = useState("")
    const [rating, setRating] = useState("")
    const [displayName, setDisplayName] = useState("")

    const handleSubmit = () => {
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

    return (
        <div className="review-page-container">
            <form onSubmit={handleSubmit}>
                <div className="product-review-img">
                    <img id="show-img" src={product.pictureUrl} alt="product-img" />
                </div>
                <div className="review-form">
                    <h1>Review this item</h1>
                    <p>{product.name}</p>
                    <input
                        type="text"
                        value={displayName}
                        placeholder="Display name"
                        onChange={(e) => setDisplayName(e.target.value)}
                        className="display-name-input"
                    />
                    <h1>First, rate this item</h1>
                    <h1>Write your review</h1>
                    <input
                        type="text"
                        value={title}
                        placeholder="Review title"
                        onChange={(e) => setTitle(e.target.value)}
                        className="title-input"
                    />
                    <p>summarize your thoughts in a short headline</p>
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
                <button type="submit" onClick={handleSubmit}>Submit review</button>
            </form>
        </div>
    )
}