# README
 An analytics service to track events on websites.  

 Main features:
 * A client-side JavaScript snippet that allows a user to track events on their website
 * A server-side API that captures and saves those events to a database
 * A Rails application that displays the captured event data for a user

# How it Works

* Sign up for an account

* Register your application

* Add the code below to the application.js file in your app

```
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    // create an event JSON object to send to the Blocmetrics analytics service.
    var event = {event: { name: eventName }};
    //initialize a new XMLHttpRequest() (AJAX request)
    var request = new XMLHttpRequest();
    // set the HTTP method to POST, the url of our events endpoint, and //allow the request to run asynchronously.
    request.open("POST", "http://localhost:3000/api/events", true);
    // set the request Content-Type header to 'application/json' //Without that, our API::EventsController would not know to process //the request as JSON
    request.setRequestHeader('Content-Type', 'application/json');
    //send the request
    request.send(JSON.stringify(event));
 }
 ```


* You can now call this function to help you track events such as click events:
```
<a href="/about" onclick="blocmetrics.report('about link clicked')">
```

* ...or even execute when a page is loaded:
```
<script>blocmetrics.report('about page loaded');</script>
```
