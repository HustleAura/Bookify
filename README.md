# Bookify

### Bookify is a platform to provide immersive reading experience with ebooks. It has been built as the solution to Microsoft Engage Recommendation Engine Challenge 2022.

#### Demo video link : [https://www.youtube.com/watch?v=O2Ul1a1d1lU](https://www.youtube.com/watch?v=hOelPMTypqY)

Test credentials used in demo : 
Test email: `manjeet@gmail.com`

Test password: `123456`


### 📌 Table of Contents
* [Features](#features)
* [Tech Stack Used/ Dependencies](#tech-stack)
* [Usage Guide/ Application flow](#usage)
* [Challenges faced and learnings](#challenges)
* [Future Scope/ What's next?](#scope)
* [Bug Reporting](#bug)
* [Feature Requests](#feature-request)


<a id="features"></a>
## 🚀 Features
- Search Recommendations
- User based recommendations
- Signing In using email/password method.
- Favorites list of books
- [Add more features](#feature-request)...


<a id="tech-stack"></a>
## 💻 Tech Stack Used/ Dependencies

***Flutter*** : Front-end framework for building user interfaces or UI components.

***Firebase*** : Google-backed application development software. Specifically used here for user authentication

***Python*** : Various libraries of python like vectorizer library for building the recommendation algorithm.

***Flask*** : Micro web framework. Used for making API to transfer data between the frontend and backend

<a id="usage"></a>
## 📖 Usage guide/ Application flow

### Sign Up Page
Enter all the fields for successful sign up. Make sure the password strength is strong. It requires a minimum of 6 characters

![WhatsApp Image 2022-05-31 at 12 47 28 AM](https://user-images.githubusercontent.com/80444886/171054591-132c934b-aae1-4100-b09d-d63cddbc3865.jpeg)


### Login Page
You can sign in using the email/password you used to sign yourself up previously.

![WhatsApp Image 2022-05-31 at 12 47 28 AM(1)](https://user-images.githubusercontent.com/80444886/171054616-8530d919-2a87-4a0f-a424-1d3b36ca83c0.jpeg)

After entering your email/password, pressing login and a successfull sign in, you will be directed to the Bookify app.

### Post-Login HomePage
The default homepage appears as follows. It contains recomendations for user based on his/her favorites

![WhatsApp Image 2022-05-31 at 12 47 28 AM(2)](https://user-images.githubusercontent.com/80444886/171054626-851facd2-71b2-4c8b-b06c-a88cb0fe896c.jpeg)

### Favorites Page

The following is the favorites page which shows list of books added to favorites

![WhatsApp Image 2022-05-31 at 12 47 28 AM(3)](https://user-images.githubusercontent.com/80444886/171054641-de56f309-1e62-4eea-a651-04b0c1e789c7.jpeg)

### Explore Page

Search results for any search query is displayed here. The results are displayed even if there is small error in search query.

![WhatsApp Image 2022-05-31 at 12 48 43 AM](https://user-images.githubusercontent.com/80444886/171054653-18e0e940-9283-48da-956a-977f945778fe.jpeg)

### Profile Page

The Profile Page displays some starts and has the logout button for signing out of the page.

![WhatsApp Image 2022-05-31 at 12 47 28 AM(4)](https://user-images.githubusercontent.com/80444886/171054670-bee2a285-5864-4213-b619-dd908082dd20.jpeg)

<a id="challenges"></a>
## 💡 Challenges faced and learnings

- I had zero knowledge on Machine Learning Algorithms. Spent major time on learning basic ML concepts and learning how to implement them until I understood how recommender systems work and how to implement them
- I had very basic knowledge about flutter before the program. Spent time on learning application architecture and state management through different methods and also small animations to make the UI better
- I had never implemented any third party services before. Learnt how to use firebase for authentication service
- I had no idea about dex limits on dependencies and therefore could not use cloud firestore service. This resulted in the app on missing out major features
- Deployed a full stack app with frontend, backend and database for the first time. Struggled through it but documentations and tutorials came to the rescue as always. 
- Learnt about AGILE framework of development.


<a id="scope"></a>
## 🚧 Future Scope/ What's next?

- [ ] Dark theme toggler.
- [ ] Password resetting and email verification on sign up.
- [ ] More specific details for user and user model
- [ ] Implementing genre specific recommendation
- [ ] Rating feature for books
- [ ] Freemium business model for premium content

<a id="bug"></a>
## 🐛 Bug Reporting
Feel free to [open an issue](https://github.com/HustleAura/Bookify/issues) on GitHub if you find bugs.

<a id="feature-request"></a>
## ⭐ Feature Request
- Feel free to [open an issue](https://github.com/HustleAura/Bookify/issues) on GitHub to add any additional features you feel could enhance this project.  
- You can also discuss and provide suggestions to me on [LinkedIn](https://www.linkedin.com/in/manjeetpani/).

