import React, { useEffect } from 'react';
import { useSelector, useDispatch } from "react-redux";
import { fetchProducts } from '../../../store/product';
import ProductIndexItem from './ProductIndexItem';
import './ProductIndex.css';

export default function ProductIndex() {
    const products = useSelector(state => Object.values(state?.products))
    const dispatch = useDispatch();
    
    useEffect(()=>{
        dispatch(fetchProducts())
    }, [dispatch]);
   
    return(
        <>
            <div className='all-products-container'>
                <ul id='all-products'>
                    {products.map((product) => {
                        return <ProductIndexItem key={product.id} product={product} />
                    })}
                </ul>
            </div>
        </>
    )
}