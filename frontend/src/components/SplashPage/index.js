import React, { useEffect } from 'react';
import { useDispatch } from "react-redux";
import { useHistory } from 'react-router-dom';
import { fetchProducts } from '../../store/product';
import arrowHomePage from '../../images/arrowHomePage.jpg';
import pets from '../../images/pets.jpg';
import householdEssentials from '../../images/householdEssentials.jpg';
import './SplashPage.css';
import { Link } from 'react-router-dom/cjs/react-router-dom';

export default function ProductIndex() {
    const dispatch = useDispatch();
    const history = useHistory();

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch]);

    const handleClick = () => {
        history.push('/department/office-supplies')
    }

    return (
        <div className='homepage'>
            <div className='top-home-page'>
                <button className='home-page-button' onClick={handleClick}>
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
            <div className='categories-buttons'>
                <div>
                    <button className='category-button'><Link to='/department/household-essentials'><img className='category-button-imgs' src={householdEssentials} alt='petsImage' /></Link></button>
                    <p className='categories-title'>Household Essentials</p>
                </div>
                <div>
                    <button className='category-button'><Link to='/department/office-supplies'><img className='category-button-imgs' src={pets} alt='petsImage' /></Link></button>
                </div>
                <div>
                    <button className='category-button'><Link to='/department/electronics'><img className='category-button-imgs' src={pets} alt='petsImage' /></Link></button>
                </div>
                <div>
                    <button className='category-button'><Link to='/department/sports-and-outdoors'><img className='category-button-imgs' src={pets} alt='petsImage' /></Link></button>
                </div>
                <div>
                    <button className='category-button'><Link to='/department/apple'><img className='category-button-imgs' src={pets} alt='petsImage' /></Link></button>
                </div>
                <div>
                    <button className='category-button'><Link to='/department/pets'><img className='category-button-imgs' src={pets} alt='petsImage' /></Link></button>
                </div>
            </div>
        </div>
    )
}