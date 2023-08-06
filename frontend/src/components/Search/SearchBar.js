import { useDispatch } from "react-redux";
import { fetchSearchResults } from "../../store/search";
import { useHistory } from "react-router-dom";
import { useState } from "react";
import "./SearchBar.css";

const SearchBar = () => {
	const dispatch = useDispatch();
	const history = useHistory();
	const [searchText, setSearchText] = useState("");

	async function handleSearch(e) {
		e.preventDefault();
		setSearchText(e.target.value);
	}

	function handleSearchSubmit(e) {
		e.preventDefault();
		if (searchText.length > 0) {
			dispatch(fetchSearchResults(searchText));
			history.push(`/search/products=${encodeURIComponent(searchText)}`, { searchText });
		}
	}

	return (
		<>
			{/* <div> */}
				<form>
					<input onChange={handleSearch} type="text" placeholder="What can we help you find?" className="search-bar"></input>
					<button onClick={handleSearchSubmit} className="search-button"><i className="fa-solid fa-magnifying-glass"></i></button>
				</form>
			{/* </div> */}
		</>
	)
};

export default SearchBar;
