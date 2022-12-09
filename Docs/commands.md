-- Create a new run
docker run --name dev -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=secret -p 5432:5432 -d postgres:latest

-- Deploy to flyio via Dockerfile
create build of our image = docker build -t henke92/activitiez -f Dockerfile .
Run docker image command = docker run --rm -it -p 8080:80 henke92/activitiez