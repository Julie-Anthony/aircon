# AirCon API

API to find events and alternative places to stay nearby.

Our AirCon API finds Airbnb listings near events you want to go to using the Eventbrite API and the Zilyo API. Search the event name and you will have local Airbnb listings returned in JSON format.  

Enter your event search (use %20 instead of spaces) as params[:event] in
```
/api/v1/aircons/:event
```

You will recieve a "response" hash with an array of places to rent.  Each place to rent is a hash that includes a heading, location, dwelling_type, number_of_bedrooms, occupancy, beds, bathrooms, description, monthly_price, weekly_price, nightly_price, and url to find the listing on http://airbnb.com website.  Many results are usually displayed, however, you may get a message saying there are no results if the Zilyo API does not return any results from Airbnb.
