param (
    [parameter(Mandatory=$true)]
    [string]$project,
    [parameter(Mandatory=$true)]
    [string]$sonarToken
)

# Begin SonarQube analysis
dotnet sonarscanner begin `
    /k:"$project" `
    /d:sonar.host.url="http://10.0.0.29:9000" `
    /d:sonar.coverage.exclusions="build/**,RestNSX/libs/**,RestNSX/fonts/**,RestNSX/graphics/**,RestNSX/logs/**,RestNSX/Support/**,RestNSX/Content/Legacy/**,RestNSX/Content/login-page/**,RestNSX/System/**,RestNSX/Models/NSX63/**" `
    /d:sonar.exclusions="build/**,RestNSX/libs/**,RestNSX/fonts/**,RestNSX/graphics/**,RestNSX/logs/**,RestNSX/Support/**,RestNSX/Content/Legacy/**,RestNSX/Content/login-page/**,RestNSX/System/**,RestNSX/Models/NSX63/**" `
    /d:sonar.login="$sonarToken"

# Build the solution
dotnet build

# End SonarQube analysis
dotnet sonarscanner end /d:sonar.login="$sonarToken"