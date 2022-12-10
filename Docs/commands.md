-- entity framework commands 
dotnet ef migrations add (migration name) -p (project name where migrations folder will be stored) -s (startup project)
dotnet ef database drop -p (project name where migrations folder will be stored) -s (startup project)  
dotnet ef migrations remove -p (project name where migrations folder will be stored) -s (startup project)
dotnet ef database update (migration name) -p (project name where migrations folder will be stored) -s (startup project)

dotnet ef migrations update

-- Create a new run
docker run --name dev -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=secret -p 5432:5432 -d postgres:latest

-- Deploy to flyio via Dockerfile
create build of our image = docker build -t henke92/activitiez -f Dockerfile .
Run docker image command = docker run --rm -it -p 8080:80 henke92/activitiez

push latest to docker Hub
command = docker push henke92/activitiez:latest

-- flyctl commands
Install flyctl on your machine with this command = iwr https://fly.io/install.ps1 -useb | iex
Launch an app on Fly = flyctl launch --image henke92/activitiez:latest

flyctl proxy 6543:5432 -a activitiez-db
flyctl postgres create
flyctl apps list
flyctl auth token
flyctl secrets list
flyctl deploy
flyctl secrets set (api secrete name)=(api secret)

-- Production commands
npm run build