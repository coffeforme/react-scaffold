What is the final structure you would follow?

What is the authentication method you will use?

What is the authorization method you will use?

What are the purpose for each layer?

You don¿t need to render a component you neet to say a variable that th component should be rendered.

**React + Typescript Scratching a project**

**Considerations:**

**Since React is a library not a framework, it does not include some security features you’d need for a production deployment like ADDING custom headers to prevent attacks like CSRF. To overpass it you may include an additional feature.**

1. **Adding eslint & prettier for a starting up project**

npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-hooks @typescript-eslint/eslint-plugin @typescript-eslint/parser

1. **Setting up .eslintrc.json**

{

"parser": "@typescript-eslint/parser",

"parserOptions": {

"ecmaVersion": 2020,

"sourceType": "module",

"ecmaFeatures": {

"jsx": true

}

},

"extends": \[

"eslint:recommended",

"plugin:react/recommended",

"plugin:react-hooks/recommended",

"plugin:@typescript-eslint/recommended",

"plugin:prettier/recommended"

\],

"plugins": \["react", "react-hooks", "@typescript-eslint"\],

"rules": {

"prettier/prettier": "error",

"react/react-in-jsx-scope": "off",

"react/prop-types": "off",

"@typescript-eslint/no-unused-vars": \["warn", { "argsIgnorePattern": "^\_" }\],

"@typescript-eslint/explicit-module-boundary-types": "off"

},

"settings": {

"react": {

"version": "detect"

}

}

}

 Recommended rules for ESLint, React, and TypeScript.

 Prettier integration for consistent formatting.

 Common adjustments like ignoring unused parameters prefixed with \_.

1. **VSCode workspace settings**

{

&nbsp;   "editor.formatOnSave": true,

&nbsp;   "editor.codeActionsOnSave": {

&nbsp;     "source.fixAll.eslint": "always"

&nbsp;   }

&nbsp; }

&nbsp;

1. **Folder structure**

src

├── redux # Global state managed with Redux

│ ├── store.ts # Redux store configuration

│ ├── \[feature\]Slice.ts # Individual feature slices

│ └── selectors.ts # Reusable selectors for Redux state

│

├── hooks # Centralized hooks organized by purpose

│ ├── api # Hooks that interact with API services

│ │ ├── useAuthApi.ts # Hook for authentication-related API calls

│ │ └── useUserApi.ts # Hook for user-related API calls

│ ├── data # Hooks for data fetching and transformation

│ │ └── useUserData.ts # Example hook for fetching and managing user data

│ ├── pages # Page-specific hooks managing page-level logic

│ │ └── useProfilePage.ts # Example hook for managing profile page logic

│ └── \[otherGlobalHooks\] # Additional global or utility hooks

│

├── components # Shared, reusable components following atomic design

│ ├── atoms # Basic components that can’t be broken down further

│ │ ├── Button

│ │ │ ├── Button.tsx # Button component

│ │ │ ├── Button.test.tsx # Unit test for Button component

│ │ │ └── Button.module.css # Styles specific to the Button component

│ ├── molecules # Composed of multiple atoms, forming more complex components

│ │ ├── FormField

│ │ │ ├── FormField.tsx # Component combining Label and Input

│ │ │ ├── FormField.test.ts # Unit test for FormField component

│ │ │ └── FormField.module.css # Styles specific to the FormField component

│ ├── organisms # Complex components composed of atoms and molecules

│ │ ├── Header

│ │ │ ├── Header.tsx # Header component with logo, navigation, etc.

│ │ │ ├── Header.test.tsx # Unit test for Header component

│ │ │ └── Header.module.css # Styles specific to the Header component

│

├── views # Higher-level folder for all views/pages

│ ├── authenticated # Authenticated pages

│ │ ├── Dashboard

│ │ │ ├── Dashboard.tsx # Dashboard page (protected route)

│ │ │ ├── useDashboardLogic.ts # Hook specific to Dashboard page

│ │ │ ├── components # Page-specific components reusable in other pages

│ │ │ │ ├── Chart.tsx # Example page component

│ │ │ │ ├── Chart.module.css # Styles specific to Chart component

│ │ │ │ └── Chart.test.tsx # Unit test for Chart component

│ │ └── Profile

│ │ ├── Profile.tsx # Profile page (protected route)

│ │ ├── useProfileLogic.ts # Hook specific to Profile page

│ │ ├── components # Page-specific components reusable in other pages

│ │ │ ├── InfoCard.tsx # Example page component

│ │ │ └── InfoCard.module.css # Styles specific to InfoCard component

│ ├── readonly # Readonly access pages

│ │ ├── Home

│ │ │ ├── Home.tsx # Home page

│ │ │ └── useHomeLogic.ts # Hook specific to Home page

│ │ ├── About

│ │ │ ├── About.tsx # About page

│ │ │ └── useAboutLogic.ts # Hook specific to About page

│ │ └── components # Shared components across readonly pages

│ │ ├── Banner.tsx # Example readonly page component

│ │ └── Banner.module.css # Styles specific to Banner component

│

├── contexts # Contexts for managing global and page-specific state

│ ├── global # Global context providers for app-wide state

│ │ ├── AuthContext.tsx # Example global context for authentication

│ └── pages # Page-specific contexts for localized state

│ └── ProfileContext.tsx # Example context for Profile page

│

├── infrastructure # Infrastructure layer for API calls and configurations

│ ├── api # API-related configurations and service modules

│ │ ├── axiosInstance.ts # Axios instance with default settings (baseURL, interceptors)

│ │ ├── authService.ts # Authentication API calls

│ │ ├── userService.ts # User-related API calls

│ └── persistence # Local persistence like localStorage/sessionStorage handling

│ ├── authStorage.ts # Manage auth tokens in storage

│ └── \[otherPersistence\] # Additional persistence utilities

│

├── routes # Routing configuration

│ ├── AppRouter.tsx # Main application router

│ ├── AuthenticatedRoutes.tsx # Routes for authenticated pages

│ ├── ReadonlyRoutes.tsx # Routes for readonly pages

│ └── ProtectedRoute.tsx # HOC or component to protect authenticated routes

│

├── styles # Global styles and theming

│ ├── global.css # Global CSS file for general styles

│ ├── variables.css # CSS variables for theme colors, spacing, etc.

│ └── mixins.css # CSS mixins for reusable styling patterns

│

├── types # Shared type definitions and interfaces

│ ├── User.ts # User-related types

│ ├── ApiResponse.ts # API response types

│ └── \[otherTypes\].ts # Additional type definitions

│

├── utils # Shared utility functions

│ ├── formatDate.ts # Utility function to format dates

│ └── formatDate.test.ts # Unit test for formatDate utility

│

├── config # Application configuration settings

│ ├── env.ts # Environment configuration

│

├── App.tsx # Main application component

└── main.tsx # Application entry point