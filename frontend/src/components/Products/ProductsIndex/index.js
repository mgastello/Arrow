import React, { useEffect } from 'react';
import { useSelector, useDispatch } from "react-redux";
import { fetchProducts } from '../../../store/product';
import { useParams } from 'react-router-dom';
import ProductIndexItem from './ProductIndexItem';
import PageNotFound from '../../404/404';
import './ProductIndex.css';

const formatDepartmentName = (name) => {
    return name.toLowerCase().replace(/\s+/g, '-');
};

const capitalizeDepartmentName = (name) => {
    if (name === 'sports-outdoors' || name === 'kitchen-dining' || name === 'school-office') {
        return name
            .toLowerCase()
            .split('-')
            .map(word => word.charAt(0).toUpperCase() + word.slice(1))
            .join(' & ');
    } else {
        return name
            .toLowerCase()
            .split('-')
            .map(word => word.charAt(0).toUpperCase() + word.slice(1))
            .join(' ')
    }
};

export default function ProductIndex() {
    const allProducts = useSelector(state => Object.values(state?.products))
    const { departmentName } = useParams()
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchProducts())
        window.scrollTo(0, 0)
    }, [dispatch]);

    const formattedDepartmentName = formatDepartmentName(departmentName);

    const products = allProducts.filter(product => {
        const productDepartments = product.department.split(',').map(dept => formatDepartmentName(dept.trim()));
        return productDepartments.includes(formattedDepartmentName);
    });

    const numProducts = products.length

    if (departmentName !== 'apple' &&
        departmentName !== 'household-essentials' &&
        departmentName !== 'sports-outdoors' &&
        departmentName !== 'kitchen-dining' &&
        departmentName !== 'electronics' &&
        departmentName !== 'pets' &&
        departmentName !== 'furniture' &&
        departmentName !== 'video-games' &&
        departmentName !== 'school-office' &&
        departmentName !== 'baby' &&
        departmentName !== 'toys' &&
        departmentName !== 'health') {
        return <PageNotFound />
    }

    return (
        <>
            <h1 className='product-index-title'>{capitalizeDepartmentName(departmentName)}</h1>
            {numProducts === 1 ? (<h1 className='results-text'>{numProducts} result</h1>) : (<h1 className='results-text'>{numProducts} results</h1>)}
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