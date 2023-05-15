import csrfFetch from "./csrf";

export const RECEIVE_REVIEWS = 'reviews/RECEIVE_REVIEWS'
export const RECEIVE_REVIEW = 'reviews/RECEIVE_REVIEW'
export const REMOVE_REVIEW = 'reviews/REMOVE_REVIEW'

export const receiveReviews = (reviews) => ({
    type: RECEIVE_REVIEWS,
    reviews
})

export const receiveReview = (review) => ({
    type: RECEIVE_REVIEW,
    review
})

export const removeReview = (reviewId) => ({
    type: REMOVE_REVIEW,
    reviewId
})

export const fetchReviews = (productId) => async dispatch => {
    const res = await csrfFetch(`/api/products/${productId}/reviews`);
    const data = await res.json();
    return dispatch(receiveReviews(data))
}

export const fetchReview = (reviewId) => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${reviewId}`);
    const data = await res.json();
    return dispatch(receiveReview(data.review))
}

export const createReview = (review) => async dispatch => {
    const res = await csrfFetch('/api/reviews', {
        method: 'POST',
        body: JSON.stringify(review),
        headers: { 'Content-Type': 'application/json'}
    })
    const data = await res.json()
    return dispatch(receiveReview(data.review))
}

export const updateReview = (review) => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${review.id}`, {
        method: 'PATCH',
        body: JSON.stringify(review),
        headers: { 'Content-Type': 'application/json'}
    })
    const data = await res.json()
    return dispatch(receiveReview(data.review))
}

export const deleteReview = (reviewId) => async dispatch => {
    await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE'
    })
    return dispatch(removeReview(reviewId))
}