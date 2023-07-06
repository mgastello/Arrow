import React, { useEffect } from 'react';
import { useSelector, useDispatch } from "react-redux";
import { fetchProducts } from '../../../store/product';
import ProductIndexItem from './ProductIndexItem';
import './ProductIndex.css';

export default function ProductIndex() {
    const products = useSelector(state => Object.values(state?.products))
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch]);

    return (
        // <>
        //     <div className='all-products-container'>
        //         <ul id='all-products'>
        //             {products.map((product) => {
        //                 return <ProductIndexItem key={product.id} product={product} />
        //             })}
        //         </ul>
        //     </div>
        // </>
        <div className='homepage'>
            <div className='top-home-page'>
                <h1 className='top-homepage-header'>Summer Spending</h1>
            </div>
            <div className='bottom-home-page'>
                <h1 className='featured-categories-header'>Featured categories</h1>
            </div>
        </div>
    )
}