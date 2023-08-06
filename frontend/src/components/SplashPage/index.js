import React, { useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { useHistory, Link } from 'react-router-dom';
import { fetchProducts } from '../../store/product';
import arrowHomePage from '../../images/arrowHomePage.jpg';
import pets from '../../images/pets.jpg';
import householdEssentials from '../../images/householdEssentials.jpg';
import apple from '../../images/apple.jpg';
import sportsAndOutdoors from '../../images/sportsAndOutdoors.jpg';
import kitchenAndDining from '../../images/kitchenAndDining.jpg';
import electronics from '../../images/electronics.jpg';
import furniture from '../../images/furniture.jpg';
import videoGames from '../../images/videoGames.jpg';
import baby from '../../images/baby.jpg';
import schoolAndOffice from '../../images/schoolAndOffice.jpg';
import toys from '../../images/toys.jpg';
import health from '../../images/health.jpg';
import SliderIndexItem from './SliderIndexItem.js'
import './SplashPage.css';

export default function ProductIndex() {
    const dispatch = useDispatch();
    const history = useHistory();
    const schoolProducts = useSelector(state => 
        Object.values(state?.products).filter(product => product.department.includes('school office'))
    );

    // const filterProducts = (allProducts) => {
    //     return allProducts.filter(product => {
    //         return product.department.includes('school office');
    //     });
    // };

    // const schoolProducts = filterProducts(allProducts)

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch]);

    const handleClick = () => {
        history.push('/department/school-office')
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
                <div className='trending-slider'>
                    <div className='trending-title-wrapper'>
                        <h1 className='trending-title'>Trending for back to school</h1>
                    </div>
                    <div>
                        <ul className='slider-products'>
                            {schoolProducts.map((product) => {
                                return <SliderIndexItem key={product.id} product={product} className='slider-single-product'/>
                            })}
                        </ul>
                    </div>
                </div>
            </div>
            <div className='bottom-home-page'>
                <h1 className='featured-categories-header'>Featured categories</h1>
                <div className='categories-buttons'>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/household-essentials'><img className='category-button-imgs' src={householdEssentials} alt='householdImage' /></Link></button>
                        <p className='categories-title'>Household Essentials</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/apple'><img className='category-button-imgs' src={apple} alt='appleImage' /></Link></button>
                        <p className='categories-title'>Apple</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/sports-outdoors'><img className='category-button-imgs' src={sportsAndOutdoors} alt='sportsImage' /></Link></button>
                        <p className='categories-title'>Sports & Outdoors</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/kitchen-dining'><img className='category-button-imgs' src={kitchenAndDining} alt='kitchenImage' /></Link></button>
                        <p className='categories-title'>Kitchen & Dining</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/electronics'><img className='category-button-imgs' src={electronics} alt='electronicsImage' /></Link></button>
                        <p className='categories-title'>Electronics</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/pets'><img className='category-button-imgs' src={pets} alt='petsImage' /></Link></button>
                        <p className='categories-title'>Pets</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/furniture'><img className='category-button-imgs' src={furniture} alt='furnitureImage' /></Link></button>
                        <p className='categories-title'>Furniture</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/video-games'><img className='category-button-imgs' src={videoGames} alt='videoGamesImage' /></Link></button>
                        <p className='categories-title'>Video Games</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/school-office'><img className='category-button-imgs' src={schoolAndOffice} alt='suppliesImage' /></Link></button>
                        <p className='categories-title'>School & Office</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/baby'><img className='category-button-imgs' src={baby} alt='babyImage' /></Link></button>
                        <p className='categories-title'>Baby</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/toys'><img className='category-button-imgs' src={toys} alt='toysImage' /></Link></button>
                        <p className='categories-title'>Toys</p>
                    </div>
                    <div className='category-button-wrapper'>
                        <button className='category-button'><Link to='/department/health'><img className='category-button-imgs' src={health} alt='healthImage' /></Link></button>
                        <p className='categories-title'>Health</p>
                    </div>
                </div>
            </div>
        </div>
    )
    // return (
    //     <div className='homepage'>
    //         <div className='top-home-page'>
    //             <button className='home-page-button' onClick={handleClick}>
    //                 <img className='home-page-img' src={arrowHomePage} alt='' />
    //                 <div className='home-page-text'>
    //                     <h1 className='home-page-h1'>Ace the first day</h1>
    //                     <br></br>
    //                     <p className='home-page-p'>Grab their gear & get it fast with always-free Shipping</p>
    //                     <br></br>
    //                     <button className='ready-for-school-button'>Ready for School</button>
    //                 </div>
    //             </button>
    //             <div className='trending-slider'>
    //                 <div className='trending-title-wrapper'>
    //                     <h1 className='trending-title'>Trending for back to school</h1>
    //                 </div>
    //                 <div className='slider-products'>
    //                     <button className='slider-single-product'>hello</button>
    //                     <button className='slider-single-product'>hello</button>
    //                     <button className='slider-single-product'>hello</button>
    //                     <button className='slider-single-product'>hello</button>
    //                     <button className='slider-single-product'>hello</button>
    //                     <button className='slider-single-product'>hello</button>
    //                 </div>
    //             </div>
    //         </div>
    //         <div className='bottom-home-page'>
    //             <h1 className='featured-categories-header'>Featured categories</h1>
    //             <div className='categories-buttons'>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/household-essentials'><img className='category-button-imgs' src={householdEssentials} alt='householdImage' /></Link></button>
    //                     <p className='categories-title'>Household Essentials</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/apple'><img className='category-button-imgs' src={apple} alt='appleImage' /></Link></button>
    //                     <p className='categories-title'>Apple</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/sports-outdoors'><img className='category-button-imgs' src={sportsAndOutdoors} alt='sportsImage' /></Link></button>
    //                     <p className='categories-title'>Sports & Outdoors</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/kitchen-dining'><img className='category-button-imgs' src={kitchenAndDining} alt='kitchenImage' /></Link></button>
    //                     <p className='categories-title'>Kitchen & Dining</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/electronics'><img className='category-button-imgs' src={electronics} alt='electronicsImage' /></Link></button>
    //                     <p className='categories-title'>Electronics</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/pets'><img className='category-button-imgs' src={pets} alt='petsImage' /></Link></button>
    //                     <p className='categories-title'>Pets</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/furniture'><img className='category-button-imgs' src={furniture} alt='furnitureImage' /></Link></button>
    //                     <p className='categories-title'>Furniture</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/video-games'><img className='category-button-imgs' src={videoGames} alt='videoGamesImage' /></Link></button>
    //                     <p className='categories-title'>Video Games</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/school-office'><img className='category-button-imgs' src={schoolAndOffice} alt='suppliesImage' /></Link></button>
    //                     <p className='categories-title'>School & Office</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/baby'><img className='category-button-imgs' src={baby} alt='babyImage' /></Link></button>
    //                     <p className='categories-title'>Baby</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/toys'><img className='category-button-imgs' src={toys} alt='toysImage' /></Link></button>
    //                     <p className='categories-title'>Toys</p>
    //                 </div>
    //                 <div className='category-button-wrapper'>
    //                     <button className='category-button'><Link to='/department/health'><img className='category-button-imgs' src={health} alt='healthImage' /></Link></button>
    //                     <p className='categories-title'>Health</p>
    //                 </div>
    //             </div>
    //         </div>
    //     </div>
    // )
}