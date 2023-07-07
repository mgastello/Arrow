import React, { useEffect } from 'react';
import { useDispatch } from "react-redux";
import { fetchProducts } from '../../../store/product';
import './ProductIndex.css';

export default function ProductIndex() {
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch]);

    return (
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