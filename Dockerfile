FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /App

# copy .csproj and restore as distinct layers
COPY "Activitiez.sln" "Activitiez.sln"
COPY "API/API.csproj" "API/API.csproj"
COPY "Application/Application.csproj" "Application/Application.csproj"
COPY "Persistence/Persistence.csproj" "Persistence/Persistence.csproj"
COPY "Domain/Domain.csproj" "Domain/Domain.csproj"
COPY "Infrastructure/Infrastructure.csproj" "Infrastructure/Infrastructure.csproj"

RUN dotnet restore "Activitiez.sln"

# copy everything else and build
COPY . .
WORKDIR /App
RUN dotnet publish "Activitiez.sln" -c Release -o out

# build a runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT [ "dotnet", "API.dll" ]