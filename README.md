# NewsApp

Build a four-paged news list app.
It will have four screens. The first appearing screen is the splash screen. Ask push notification permission at splash.
The second screen is the list that includes the news from now to the past. Fetch the data from Google News API. I can able to refresh the data by the pull to refresh.
The list screen must have a search and filter which can work at the same time. I can able to search by text and filter by date range such as from 01/01/2022 to 30/01/2022. The search must work with the API, not locale.
By tapping one of the news, the news detail screen must appear. I can able to add the news to the favorites via a button.
The last screen is the favorites that have the favorite news. No need filter and search here, only a list. Store the favorites with their news title and source URL. Open Safari when a favorited news is tapped.
Use TabBarController to store the list and favorites screens.

## What did I use:
- [News API](https://newsapi.org/)
- MVVM
- Alamofire
- Generic Network Layer
- Kingfisher
- Snapkit
- Localization

<br/>

## The app looks like this:

### Splash screen and add/remove news from favorite.
https://user-images.githubusercontent.com/77617761/183916293-8ee346ad-78ec-4e85-bd48-9f8be4385909.mov

### Filter the news and refresh
https://user-images.githubusercontent.com/77617761/183916802-9fe7b126-26fb-4df0-9dd6-064c7831f212.mov

### Search news and filter by date. The detail page appears.
https://user-images.githubusercontent.com/77617761/183917425-aaca4e71-733f-4f52-836b-c0e8b4f2683e.mov
