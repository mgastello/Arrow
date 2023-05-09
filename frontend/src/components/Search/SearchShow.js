// // import React from 'react';
// // import { useSelector } from "react-redux";
// // import SearchIndexItem from './SearchIndexItem';

// // export default function SearchShow({ searchText }) {
// //     const products = useSelector(state => Object.values(state?.searchResults))
   
// //     return(
// //         <>
// //             <h1>{products.length} results for "{searchText}"</h1>
// //             <div className='all-products-container'>
// //                 <ul id='all-products'>
// //                     {products.map((product) => {
// //                         return <SearchIndexItem key={product.id} product={product} />
// //                     })}
// //                 </ul>
// //             </div>
// //         </>
// //     )
// // }

// import React from 'react';
// import { useSelector } from "react-redux";
// import SearchIndexItem from './SearchIndexItem';
// import "./search.css"

// export default function SearchShow() {
//     const products = useSelector(state => Object.values(state?.searchResults))
//     const searchText = window.location.pathname.split('=')[1];
   
//     return(
//         <>
//             <h1 className='search-page-header'>{products.length} results for "{searchText}"</h1>
//             <div className='all-products-container'>
//                 <ul id='all-products'>
//                     {products.map((product) => {
//                         return <SearchIndexItem key={product.id} product={product} />
//                     })}
//                 </ul>
//             </div>
//         </>
//     )
// }

import React from 'react';
import { useSelector } from "react-redux";
import SearchIndexItem from './SearchIndexItem';
import "./search.css"

export default function SearchShow() {
    const products = useSelector(state => Object.values(state?.searchResults))
    const searchText = decodeURIComponent(window.location.pathname.split('=')[1]);
   
    return(
        <>
            <h1 className='search-page-header'>{products.length} results for "{searchText}"</h1>
            <div className='search-products-container'>
                <ul id='all-products'>
                    {products.map((product) => {
                        return <SearchIndexItem key={product.id} product={product} />
                    })}
                </ul>
            </div>
        </>
    )
}
