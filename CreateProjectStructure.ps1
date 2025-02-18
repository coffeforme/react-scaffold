# Define the project structure
$directories = @(
    "src/redux",
    "src/hooks/api",
    "src/hooks/data",
    "src/hooks/pages",
    "src/components/atoms/Button",
    "src/components/molecules/FormField",
    "src/components/organisms/Header",
    "src/views/authenticated/Dashboard",
    "src/views/authenticated/Profile/components",
    "src/views/readonly/Home",
    "src/views/readonly/About",
    "src/views/readonly/components",
    "src/contexts/global",
    "src/contexts/pages",
    "src/infrastructure/api",
    "src/infrastructure/persistence",
    "src/routes",
    "src/styles",
    "src/types",
    "src/utils",
    "src/config"
)

$files = @{
    "src/App.tsx" = ""
    "src/main.tsx" = ""
    "src/config/env.ts" = ""
    "src/redux/store.ts" = ""
    "src/redux/selectors.ts" = ""
    "src/hooks/api/useAuthApi.ts" = ""
    "src/hooks/api/useUserApi.ts" = ""
    "src/hooks/data/useUserData.ts" = ""
    "src/hooks/pages/useProfilePage.ts" = ""
    "src/components/atoms/Button/Button.tsx" = ""
    "src/components/atoms/Button/Button.module.css" = ""
    "src/components/molecules/FormField/FormField.tsx" = ""
    "src/components/molecules/FormField/FormField.module.css" = ""
    "src/components/organisms/Header/Header.tsx" = ""
    "src/components/organisms/Header/Header.module.css" = ""
    "src/views/authenticated/Dashboard/Dashboard.tsx" = ""
    "src/views/authenticated/Dashboard/useDashboardLogic.ts" = ""
    "src/views/authenticated/Dashboard/components/Chart.tsx" = ""
    "src/views/authenticated/Dashboard/components/Chart.module.css" = ""
    "src/views/readonly/Home/Home.tsx" = ""
    "src/views/readonly/Home/useHomeLogic.ts" = ""
    "src/views/readonly/About/About.tsx" = ""
    "src/views/readonly/About/useAboutLogic.ts" = ""
    "src/views/readonly/components/Banner.tsx" = ""
    "src/views/readonly/components/Banner.module.css" = ""
    "src/contexts/global/AuthContext.tsx" = ""
    "src/contexts/pages/ProfileContext.tsx" = ""
    "src/infrastructure/api/axiosInstance.ts" = ""
    "src/infrastructure/api/authService.ts" = ""
    "src/infrastructure/api/userService.ts" = ""
    "src/infrastructure/persistence/authStorage.ts" = ""
    "src/routes/AppRouter.tsx" = ""
    "src/routes/AuthenticatedRoutes.tsx" = ""
    "src/routes/ReadonlyRoutes.tsx" = ""
    "src/routes/ProtectedRoute.tsx" = ""
    "src/styles/global.css" = ""
    "src/styles/variables.css" = ""
    "src/styles/mixins.css" = ""
    "src/types/User.ts" = ""
    "src/types/ApiResponse.ts" = ""
    "src/utils/formatDate.ts" = ""
    "src/utils/formatDate.test.ts" = ""
}

# Create directories
foreach ($directory in $directories) {
    if (!(Test-Path -Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force
        Write-Output "Created directory: $directory"
    } else {
        Write-Output "Directory already exists: $directory"
    }
}

# Create files
foreach ($file in $files.Keys) {
    if (!(Test-Path -Path $file)) {
        New-Item -ItemType File -Path $file -Force | Out-Null
        Set-Content -Path $file -Value $files[$file]
        Write-Output "Created file: $file"
    } else {
        Write-Output "File already exists: $file"
    }
}

Write-Output "Project structure created successfully."
