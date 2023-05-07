import { useDispatch } from "react-redux";
import { fetchSearchResults } from "../../store/search";
import { useHistory } from "react-router-dom"
import { useState } from "react"
import "./SearchBar.css"

const SearchBar = () => {
	const dispatch = useDispatch();
	const history = useHistory()
	const [ searchText, setSearchText ] = useState("")

	async function handleSearch(e) {
		e.preventDefault()
		const query = e.target.value
		await setSearchText(query)
		dispatch(fetchSearchResults(query));
	}

	function handleSearchSubmit(e) {
		e.preventDefault()
		if (searchText.length > 0) {
			history.push(`/search/products=${searchText}`);
		}
	}

	return (
		<>
			<div>
				<input onChange={handleSearch} type="text" placeholder="What can we help you find?" className="search-bar"></input>
				<button onClick={handleSearchSubmit} className="search-button"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</>
	)
};

export default SearchBar