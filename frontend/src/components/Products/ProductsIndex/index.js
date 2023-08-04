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

export default function ProductIndex() {
    const allProducts = useSelector(state => Object.values(state?.products))
    const { departmentName } = useParams()
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch]);

    const formattedDepartmentName = formatDepartmentName(departmentName);
    
    const products = allProducts.filter(product => {
        const productDepartments = product.department.split(',').map(dept => formatDepartmentName(dept.trim()));
        return productDepartments.includes(formattedDepartmentName);
    });


    if (departmentName !== 'apple' &&
    departmentName !== 'household-essentials' &&
    departmentName !== 'sports-and-outdoors' &&
    departmentName !== 'kitchen-and-dining' &&
    departmentName !== 'electronics' &&
    departmentName !== 'pets' &&
    departmentName !== 'furniture' &&
    departmentName !== 'video-games' &&
    departmentName !== 'school-and-office' &&
    departmentName !== 'baby' &&
    departmentName !== 'toys' &&
    departmentName !== 'health') {
        return <PageNotFound />
    }

    return (
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