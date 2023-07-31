import React, { useEffect } from 'react';
import { useDispatch } from "react-redux";
import { fetchProducts } from '../../../store/product';
import './ProductIndex.css';
import arrowHomePage from '../../../images/arrowHomePage.jpg'

export default function ProductIndex() {
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch]);

    return (
        <div className='homepage'>
            <div className='top-home-page'>
                <button className='home-page-button'>
                    <img className='home-page-img' src={arrowHomePage} alt='' />
                    <div className='home-page-text'>
                        <h1 className='home-page-h1'>Ace the first day</h1>
                        <br></br>
                        <p className='home-page-p'>Grab their gear & get it fast with always-free Shipping</p>
                        <br></br>
                        <button className='ready-for-school-button'>Ready for School</button>
                    </div>
                </button>
            </div>
            <div className='bottom-home-page'>
                <h1 className='featured-categories-header'>Featured categories</h1>
            </div>
        </div>
    )
}