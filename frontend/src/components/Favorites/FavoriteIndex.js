import { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { fetchFavorites } from '../../store/favorite';
import FavoriteIndexItem from './FavoriteIndexItem';
import filledInHeart from '../../images/filledInHeart.png';
import filledInHeartGrayBG from '../../images/filledInHeartGrayBG.png';
import './Favorite.css';

export default function FavoriteIndex() {
    const favorites = useSelector(state => Object.values(state?.favorites))
    // const favoriteId = useSelector(state => {
    //     const favoritesArray = Object.values(state?.favorites);
    //     const matchingFavorite = favoritesArray.find(singleFav => singleFav.productId == productId);
    //     return matchingFavorite ? matchingFavorite.id : null;
    // });
    const dispatch = useDispatch()

    useEffect(() => {
        dispatch(fetchFavorites())
    }, [dispatch])

    return (
        <div className='favorites-page'>
            <div className='favorites-header'>
                <h1 className='favorites-header-heart'><img className='favorites-page-heart' src={filledInHeart} alt='heart' />Favorites</h1>
                <p className='under-header-text'><a className='favorites-page-arrow-link' href='/'>Arrow</a> / Favorites</p>
            </div>
            {favorites.length > 0 ? (
                <div className='all-products-container'>
                    <ul id='all-products'>
                        {favorites.map((favorite) => {
                            return <FavoriteIndexItem key={favorite.id} favorite={favorite} />
                        })}
                    </ul>
                </div>
            ) : (
                <div className='no-favorites'>
                    <img className='no-favorites-heart' src={filledInHeartGrayBG} alt='heart' />
                    <h1 className='no-favorites-title'>Show some love!</h1>
                    <p className='no-favorites-text'>You currently don't have any favorited items. Once you've favorited items that you love or want to keep track of, they will be shown here.</p>
                    <h3 className='no-favorites-bottom-text'>Here are some popular categories to get you started</h3>
                    <div className='category-buttons-wrapper'>
                        <a className='category-buttons' href='/department/pets'>Pets</a>
                        <a className='category-buttons' href='/department/electronics'>Electronics</a>
                        <a className='category-buttons' href='/department/school-office'>School & Office</a>
                        <a className='category-buttons' href='/department/kitchen-dining'>Kitchen & Dining</a>
                    </div>
                </div>
            )}
        </div>
    )
}