import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { deleteReview } from "../../store/review"
import StarRatings from "react-star-ratings";
import moment from "moment";

export default function ReviewIndexItem({ review }) {
    const sessionUser = useSelector((state) => state.session.user);
    const dispatch = useDispatch();

    const deleteUserReview = (e) => {
        e.preventDefault()
        dispatch(deleteReview(review.id))
    }

    return (
        <div className="single-review-container">
            <div className="review-top-line">
                <h1 className="single-review-title">{review.title}</h1>
                {sessionUser.id === review.authorId && (
                    <button id="delete-review-button" onClick={deleteUserReview}><i class="fa-regular fa-trash-can"></i></button>
                )}
            </div>
            <StarRatings
                rating={review.rating}
                starRatedColor="gold"
                starEmptyColor="lightgray"
                starDimension="15px"
                starSpacing="0px"
            />
            <p className="single-review-display-name">{review.displayName} - {moment(review.createdAt).fromNow()}</p>
            <p className="single-review-body">{review.body}</p>
            {/* {sessionUser.id === review.authorId && (
                <button id="delete-review-button" onClick={deleteUserReview}><i class="fa-regular fa-trash-can"></i></button>
            )} */}
        </div>
    )
}