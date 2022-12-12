## How to start the project locally

### Step 1 -

Inside the API project make sure you have the DefaultConnection with activitiez.db inside appsettings.Development.json under ConnectionStrings.

This will create your SQLite db later.

### Step 2 - 

Inside /API/Extensions/ApplicationServiceExtensions.cs at line 38, change
the connection string to DefaultConnection.

### Step 3 -

Remove the Migrations folder and make a new migration

dotnet ef migrations add (migration name) -p Persistence -s API
dotnet ef database drop -p Persistence -s API

### Step 4 -

If you are using VS Code you can run dotnet watch run in the Activitiez folder
and to start the client you need to be in /Activitiez/client and run npm start