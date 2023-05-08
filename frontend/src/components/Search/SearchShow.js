import React from 'react';
import { useSelector } from "react-redux";
import SearchIndexItem from './SearchIndexItem';

export default function SearchShow() {
    const products = useSelector(state => Object.values(state?.searchResults))
   
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