import csrfFetch from "./csrf";

export const RECEIVE_FAVORITES = 'favorites/RECEIVE_FAVORITES'
export const RECEIVE_FAVORITE = 'favorites/RECEIVE_FAVORITE'
export const REMOVE_FAVORITE = 'favorites/REMOVE_FAVORITE'

export const receiveFavorites = (favorites) => ({
    type: RECEIVE_FAVORITES,
    favorites
})

export const receiveFavorite = (favorite) => ({
    type: RECEIVE_FAVORITE,
    favorite
})

export const removeFavorite = (favoriteId) => ({
    type: REMOVE_FAVORITE,
    favoriteId
})

export const fetchFavorites = () => async dispatch => {
    const res = await csrfFetch('/api/favorites');
    const data = await res.json();
    return dispatch(receiveFavorites(data))
}

export const fetchFavorite = (favoriteId) => async dispatch => {
    const res = await csrfFetch(`/api/favorites/${favoriteId}`);
    const data = await res.json();
    return dispatch(receiveFavorite(data.favorite))
}

export const createFavorite = (favorite) => async dispatch => {
    const res = await csrfFetch('/api/favorites', {
        method: 'POST',
        body: JSON.stringify(favorite),
        headers: { 'Content-Type': 'application/json' }
    })
    const data = await res.json()
    return dispatch(receiveFavorite(data.favorite))
}

export const deleteFavorite = (favoriteId) => async dispatch => {
    await csrfFetch(`/api/favorites/${favoriteId}`, {
        method: 'DELETE'
    })
    return dispatch(removeFavorite(favoriteId))
}

export default function favoritesReducer(state = {}, action) {
    switch (action.type) {
        case RECEIVE_FAVORITE:
            return { ...state, [action.favorite.id]: action.favorite }
        case RECEIVE_FAVORITES:
            return { ...state, ...action.favorites }
        case REMOVE_FAVORITE:
            const newState = { ...state }
            delete newState[action.favoriteId]
            return newState
        default:
            return state
    }
}