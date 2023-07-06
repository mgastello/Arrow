import { NavLink } from "react-router-dom"
import arrowLogo from '../../images/arrowLogo.png';
import "./404.css"

function PageNotFound() {
    return (
        <div className="message">
            <div>
                <NavLink to={'/'} id="page-not-found-link">
                    <img className='page-not-found-img' src={arrowLogo} alt='arrow-logo'></img>
                </NavLink>
                <h1 className="page-not-found-body">We're sorry! This page is currently unavailable.</h1>
            </div>
        </div>
    )
}

export default PageNotFound