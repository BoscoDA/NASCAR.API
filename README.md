## Create DB
Run the included db script to generate the needed sql server database for the project.

## Adding NASCAR Drivers

- Refer to the db creation script for inserting any new driver data into the dd. Each driver will need to be of UserType 2 and have a unique AvatarID which will need to start at 14. I used numbers starting at 20 for the drivers that I implemented with fake scores as we couldn't get real data before class finsihed.

## Hook up to UI

- Add the url for the host web app to CORS in the program.cs file
- Setup URLS in the 'launchSettings.json' file
- Add DB connection string to the DatabaseConnectionSingleton class
