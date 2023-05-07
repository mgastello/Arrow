import { NavLink } from "react-router-dom"
import "./404.css"

function PageNotFound() {
    return (
        <div className="message">
            <div>
                <NavLink to={'/'} id="page-not-found-link">
                    <img className='page-not-found-img' src='https://gcdnb.pbrd.co/images/94w9oTDhQpAw.png?o=1' alt=''></img>
                </NavLink>
                <h1 className="page-not-found-body">We're sorry! This page is currently unavailable.</h1>
            </div>
        </div>
    )
}

export default PageNotFound