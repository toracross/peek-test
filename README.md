# peek-test: Peek Test GraphQL Demo App
Peek iOS Test App Repository.

This repository contains the demo of the Peek iOS take home challenge. This was a very fun exercise and a good introduction into the magic of GraphQL. *More information on GraphQL can be found here: https://graphql.org/*

## Let's dive into the project.
This exercise was to fulfill the following criteria:<br/>

•On launch: <br/>
Perform a query search against Github's GraphQL API and return a list of repositories containing the string "GraphQL"

Display the returned repositories to the user with the provided information:<br/>
  -The name of the repo <br/>
  -The owner login name<br/>
  -The owner avatar<br/>
  -The number of stars<br/>

•On Interaction: <br/>
Pagination: Once the user scrolls down far enough in the list of repos, fetch the next set of repos and display it to the user, effectively: infinite scrolling.
 
## Some project details and development thoughts.
GraphQL is very interesting and extremely useful, to say the least. It's a framework that I regret not having used sooner/incorporated into my previous applications as it allows you to query *exactly* what you need without needing to return the entire contents of an API call. It does take a little bit of setup, but I feel it is well worth the time.

I structured the application in a way that it should be easy to trace what decisions were made where.<br/> For example: GithubQueryType <br/>
I created an enum, GithubQueryType, in order to prevent having two separate functions with nearly identical bodies, in the case of fetching the initial repositories versus additional repositories. This enum also takes in an endCursorKey parameter when needed should the developer want to fetch additional repos. This helps reduce code bloat and the number of functions that are nearly identical because of one or two factors.

This project took just under 3 hours from start to finish (start time: 11:15AM EST, current time as of writing this: 2:05PM EST). I spent the last 30 minutes of the project on polish, including a few things such as a cascading reload animation for the UITableView, as well as some error handling and adding developer QOL functions.

## So what does it look like?

Here's a preview!

<video src="peek.mp4" width="320" height="200" controls preload></video>
