FROM mcr.microsoft.com/dotnet/sdk:3.1

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /app && mkdir /app/DotnetTemplate.Web && mkdir /app/DotnetTemplate.Web.Tests
WORKDIR /app

COPY DotnetTemplate.Web DotnetTemplate.Web
COPY DotnetTemplate.Web.Tests DotnetTemplate.Web.Tests
COPY DotnetTemplate.sln .
RUN dotnet build
WORKDIR /app/DotnetTemplate.Web
RUN npm install && npm run build

ENTRYPOINT ["dotnet","run"]