import { useDispatch } from "react-redux";
import { fetchSearchResults } from "../../store/search";
import { useHistory } from "react-router-dom"
import { useState } from "react"

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
			<input onChange={handleSearch} type="text" placeholder="What can we help you find?"></input>
			<button onClick={handleSearchSubmit}>search</button>
		</>
	)
};

export default SearchBar