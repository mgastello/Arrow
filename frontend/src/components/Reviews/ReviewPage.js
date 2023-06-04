import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect, useParams } from "react-router-dom";

export default function ReviewPage () {
    const sessionUser = useSelector(state => state.session.user);

    return (
        <>
            {!sessionUser ? (
                <Redirect to="/login" />
            ) : (
                <div>
                    <p>hello from page</p>
                </div>
            )}
        </>
    )
}