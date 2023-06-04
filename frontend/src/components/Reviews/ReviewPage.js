// import React from "react";
// import { useDispatch, useSelector } from "react-redux";
// import { Redirect, useHistory, useParams } from "react-router-dom";

// export default function ReviewPage () {
//     const sessionUser = useSelector(state => state.session.user);
//     const history = useHistory()

//     const handleClick = () => {
//         if (!sessionUser) {
//             history.push("/login")
//         } else {
//             history.push("add-review")
//         }
//     }

//     return (
//         <>
//             {!sessionUser ? (
//                 <Redirect to="/login" />
//             ) : (
//                 <div>
//                     <p>hello from page</p>
//                 </div>
//             )}
//         </>
//     )
// }