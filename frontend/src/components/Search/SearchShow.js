import React, { useEffect } from 'react';
import { useSelector, useDispatch } from "react-redux";
import { fetchProducts } from '../../store/product';
import SearchIndexItem from './SearchIndexItem';

export default function SearchShow() {
    const products = useSelector(state => Object.values(state?.searchResults))
    const dispatch = useDispatch();
    
    // useEffect(()=>{
    //     dispatch(fetchProducts())
    // }, [dispatch]);
   
    return(
        <>
            <div className='all-products-container'>
                <ul id='all-products'>
                    {products.map((product) => {
                        return <SearchIndexItem key={product.id} product={product} />
                    })}
                </ul>
            </div>
        </>
    )
}