import React, { useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import SearchIndexItem from './SearchIndexItem';
import "./search.css"
import { fetchSearchResults } from '../../store/search'

export default function SearchShow() {
    const dispatch = useDispatch()
    const products = useSelector(state => Object.values(state?.searchResults))
    const searchText = decodeURIComponent(window.location.pathname.split('=')[1]);

    useEffect(() => {
        dispatch(fetchSearchResults(searchText))
    }, [dispatch, searchText])
   
    return(
        <>
            <h1 className='search-page-header'>{products.length} results for "{searchText}"</h1>
            <div className='search-products-container'>
                <ul id='all-products'>
                    {products.map((product) => {
                        return <SearchIndexItem key={product.id} product={product} />
                    })}
                </ul>
            </div>
        </>
    )
}
