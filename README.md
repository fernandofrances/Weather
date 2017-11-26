# Dummy Weather App
Simple app where you type in the name of a city and it shows you the current weather forecast of it from this [*weather API*](http://openweathermap.org/) .
Do not expect much from the design nor the functionality, the app was made just for practice.

The search is implemented with an UISearchController that shows the last search cities on a tableView while you are doing a search. Only if the city that the users searchs for is right, the city will be saved as last searched.

The API doesn't support city search, only gives you the forecast of a city supplied by the user in the search, so it's not possible to show the cities according to what the user is typing on the searchBar.