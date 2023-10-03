import React from "react";
import { Link, useParams, useHistory } from "react-router-dom";
import AddToCartModal from "../../AddToCartModal";
import { deleteFavorite, createFavorite } from "../../../store/favorite";
import filledInHeart from '../../../images/filledInHeart.png'
import emptyHeart from '../../../images/emptyHeart.png'
import { useDispatch, useSelector } from "react-redux";
// import { useDispatch, useSelector } from "react-redux";
// import { fetchAllReviews } from "../../../store/review";
// import StarRatings from "react-star-ratings";

export default function ProductIndexItem({ product }) {
    const dispatch = useDispatch()
    const history = useHistory()
    const { departmentName } = useParams()
    const sessionUser = useSelector(state => state?.session.user)
    const favoriteId = useSelector(state => {
        const favoritesArray = Object.values(state?.favorites)
        const matchingFavorite = favoritesArray.find(singleFav => singleFav.productId == product.id);
        return matchingFavorite ? matchingFavorite.id : null;
    })
    // const dispatch = useDispatch()
    // const reviews = useSelector(state => Object.values(state?.reviews))

    // useEffect(() => {
    //     dispatch(fetchAllReviews())
    // }, [dispatch])

    // let sumRating = 0
    // let numReviews = 0

    // if (reviews) {
    //     reviews.forEach((review) => {
    //         if (review && product) {
    //             if (review.productId === product.id) {
    //                 sumRating += review.rating;
    //                 numReviews += 1;
    //             }
    //         }
    //     })
    // }

    // const avgRating = numReviews === 0 ? 0 : sumRating / numReviews;

    const handleFavoriteClick = (e) => {
        e.preventDefault()
        if (!sessionUser) {
            const redirectURL = `/department/${departmentName}`;
            sessionStorage.setItem("redirectURL", redirectURL);
            history.push("/login");
        } else {
            if (favoriteId) {
                dispatch(deleteFavorite(favoriteId))
            } else {
                dispatch(createFavorite({
                    userId: sessionUser.id,
                    productId: product.id
                }))
            }
        }
    }

    return (
        <>
            <div id="product-card">
                <Link to={`/products/${product.id}`}>
                    <img id="product-picture" src={product.pictureUrl} alt="product-img" />
                </Link>
                <div className="product-info-wrapper">
                    <Link to={`/products/${product.id}`}>
                        <div className="product-show-header">
                            <h3 id="product-name">{product.name}</h3>
                            {favoriteId ? (
                                <button className="favorite-page-heart-button" onClick={handleFavoriteClick}><img className="favorites-filled-in-heart" src={filledInHeart} alt="heart" /></button>
                            ) : (
                                <button className="favorite-page-heart-button" onClick={handleFavoriteClick}><img className="favorites-filled-in-heart" src={emptyHeart} alt="heart" /></button>
                            )}
                        </div>
                    </Link>
                    <p id="product-brand">{product.brand}</p>
                    {/* <StarRatings
                    rating={avgRating}
                    starRatedColor="gold"
                    starEmptyColor="lightgray"
                    starDimension="15px"
                    starSpacing="0px"
                /> */}
                    <p id="product-price">${product.price.toFixed(2)}</p>
                    <p id="purchase-online-text-card">When purchased online</p>
                    <p id="free-shipping-text">Free Shipping*</p>
                </div>
                <div className="a2c-button-wrapper">
                    <AddToCartModal product={product} />
                </div>
            </div>
        </>
    )
}