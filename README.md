### Steps to Run the App
nothing special just run the app, min. deployment is 16.0

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I don't think I decided to focus on one specific thing over another, 
I wanted to make sure everything was as solid as I could make it

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
Total I spent around 4 hours - I split it up over the afternoon and finished it this evening.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
Well the API doesnt support pagination so since that was the case I had to load all the data in the first call
it would be better to request data using pagination (offset or cursor based depending on server state)

### Weakest Part of the Project: What do you think is the weakest part of your project?
Probably Details Screen design.  I wasn't really sure on what else to do with it.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?
None used.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
Pull to refresh feature would be better if there were more data in the API or if the data could have been paginated.  The way its immplement currently
just seems "forced." (meaning its in there because it was a requirement not necessarily because there was a geniune need for it in this use case). 
