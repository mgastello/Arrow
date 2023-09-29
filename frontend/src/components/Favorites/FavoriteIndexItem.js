import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import AddToCartModal from "../AddToCartModal";
import { deleteFavorite } from "../../store/favorite";
import filledInHeart from '../../images/filledInHeart.png'

export default function ProductIndexItem({ favorite }) {
    const dispatch = useDispatch()
    const favoriteId = useSelector(state => {
        const favoritesArray = Object.values(state?.favorites);
        const matchingFavorite = favoritesArray.find(singleFav => singleFav.productId == favorite.productId);
        return matchingFavorite ? matchingFavorite.id : null;
    });

    const removeFavorite = (e) => {
        e.preventDefault()
        dispatch(deleteFavorite(favoriteId))
    }

    return (
        <>
            <div id="product-card">
                <Link to={`/products/${favorite.productId}`}>
                    <img id="product-picture" src={favorite.pictureUrl} alt="product-img" />
                    <div className="product-show-header">
                        <h3 id="product-name">{favorite.name}</h3>
                        <button className="favorite-page-heart-button" onClick={removeFavorite}><img className="favorites-filled-in-heart" src={filledInHeart} alt="heart" /></button>
                    </div>
                </Link>
                <p id="product-brand">{favorite.brand}</p>
                <p id="product-price">${favorite.price.toFixed(2)}</p>
                <p id="purchase-online-text-card">When purchased online</p>
                <p id="free-shipping-text">Free Shipping*</p>
                <AddToCartModal favorite={favorite} />
            </div>
        </>
    )
}