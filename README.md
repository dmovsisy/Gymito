# Gymito

A iOS specific strength training focused workout tracker

## Team

David Movsisyan\
email: dmovsisy@uwaterloo.ca
[](https://www.linkedin.com/in/davidmovsisyan-uw/)

## Purpose

### This project is made to act as evidence of my:
- Swift Knowledge/Skills
- SwiftUI Knowledge/Skills
- Xcode Knowledge/Skills
- XCtest Knowledge/Skills
- Testing on multiple iOS devices, iPhone, iPad, etc.
- MVVM Architecture Knowledge and Application
- Knowledge of storing to and fetching from an external data base
- API intergration
- Knowledge and use of a noSQL, document based (FireBase) data base
- Knowledge of Authentication and Authorization + relevant rules


*Note the project data was migrated from Supabase to FireBase due to the limitations of SupaBase's free tier

## Video Walkthrough


[Gymito Video](Gymito Walkthrough.mp4)

### Video Transcript

Welcome to Gymito: Your personalized strength training, workout tracker. 

First, let us go ahead and create an account.
What you will see is that I have set some Swift guards, in order to stop users from inputing invalid emails or passwords.
Once we put in a valid input to all the fields we can go ahead and create the account.
This makes an entry in our FireBase Authentication, Users List. As well as creating an entry in our FireBase FireStore users collection.

We are now in the app, there are three main navigation tabs, current workout, past workouts, and profile.
Let's go again and click on the profile tab.
This fetch's some of the users information that is stored in the FireBase database and displays it on our screen.
In order to test that our sign up work as intended, let us go ahead and log out, and log back in.
This shows that FireStore Authentication has correctly stored the authorization data for our user.

Now we can explore the meat and potatos of the application.
Once we are at the current workout tab, let's go ahead and start a workout.
We can give our workout a title, and select a date and time in case we are tracking a past workout, or want to plan a future workout.
From here, user are free to add exercises to our workout using the large green plus.
First, the user selects an exercise (with the most common exercises being suggested at the top), or by search.
The user inputs their number of sets, the weight and the reps.
Saves the exercise, which saves this data to our database, and displays it on the screen.
They can add as many exercises to the workout as they please.
When the user is satisfied, they go ahead and press "finish workout", and may add their final thoughts if they please.

Now, the user can go to the past workouts tab, and see all their past recorded workouts.
If they would like to make an edit, they can do so.
This is done by editing the users workout collection, which is linked to each user via a unique userId as a primary key.

This concludes my walkthrough of Gymito, thank you for watching, and have a good day.






