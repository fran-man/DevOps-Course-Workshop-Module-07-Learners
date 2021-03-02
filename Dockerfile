FROM mcr.microsoft.com/dotnet/sdk:3.1 as build-stage

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /app && mkdir /app/DotnetTemplate.Web && mkdir /app/DotnetTemplate.Web.Tests
WORKDIR /app

COPY DotnetTemplate.Web DotnetTemplate.Web
COPY DotnetTemplate.Web.Tests DotnetTemplate.Web.Tests
COPY DotnetTemplate.sln .
RUN dotnet build --runtime linux-x64
WORKDIR /app/DotnetTemplate.Web
RUN npm install && npm run build

FROM mcr.microsoft.com/dotnet/aspnet:3.1

WORKDIR /app

COPY --from=build-stage /app /app

WORKDIR /app/DotnetTemplate.Web

ENTRYPOINT ["./bin/Debug/netcoreapp3.1/DotnetTemplate.Web"]