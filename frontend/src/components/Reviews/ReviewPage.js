import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useParams } from "react-router-dom";
import { createReview } from "../../store/review";

export default function ReviewPage () {
    const dispatch = useDispatch()
    const history = useHistory()
    const productId = useParams()
    const sessionUser = useSelector(state => state.session.user);
    const product = useSelector(state => state?.products[productId])
    const [ title, setTitle ] = useState("")
    const [ body, setBody ] = useState("")
    const [ rating, setRating ] = useState("")
    const [ displayName, setDisplayName ] = useState("")

    const handleClick = () => {
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
        
       </div>
    )
}