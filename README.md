## Adding NASCAR Drivers

- Use the include script in the scripts folder to add the drivers to the User table and insert their scores into the Leaderboard table.
- Any new drivers, reference the data setup of the drivers inserting using the script. Each driver will need to be of User_type 2 and have a unique avatar_id which will need to start at 14. I used numbers starting at 20 for the drivers that I implemented with fake scores as we couldn't get real data before class finsihed.

## Hook up to UI

- Add the url for the host web app to CORS in the program.cs file
- Setup URLS in the 'LaunchSettings.json' file
- Add DB connection string to the DAL_Singleton object
