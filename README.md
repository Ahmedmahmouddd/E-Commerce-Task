# E commerce App

A Flutter app with API integration that enables users to log in, browse products, search, filter, manage their cart, and complete checkout. It uses BLoC for state management and stores user data securely with SharedPreferences. Key features include real-time search, product details, and smooth cart management with API updates.

## 📸 Screenshots of the App


## Features

User Management
  Implements Login via API with proper error handling.
  On successful login:
  Saves the user token and user ID locally using SharedPreferences.
  Persists the user's login status across app restarts.
  Enables secure API calls using the saved token.
  Supports logout, which clears all stored user data.

Home Screen
  Displays two lists of products retrieved from an API via a GET request.
  Uses BLoC (Business Logic Component) for clean state management and separation of concerns.
  Ensures smooth, responsive UI and efficient data handling.
  
Product Details Screen
  Displays full product information:
  Image gallery, Product name, Description, Smart Way of Showing Rating, Shipping Status. 
  Allows the user to add the item to cart.
  Sends an API request to update the cart on the backend.

Search Page
  Enables real-time product search with performance optimization. 
  Uses debouncing (300ms delay) to avoid excessive API calls while the user is typing.
  Sends API requests only when the input has at least 2 characters to reduce unnecessary network usage.

Filter Page
  Allows users to filter products based on the following criteria:
  Date: Newest to Oldest / Oldest to Newest
  Price: Highest to Lowest / Lowest to Highest
  Enhances user experience by helping them find relevant products more easily.

Cart Page
  Displays all products added to the cart with:
  Product name and price
  Quantity of each item
  Total cost calculation
  Allows users to:
  Increase or decrease item quantity, triggering an API request with each change
  Remove items completely from the cart
  Proceed to the checkout page for order confirmation

Cart Page
  Shows a detailed summary of all cart items, including:
  Product names, quantities, and individual prices
  Total cost of all items combined
  Provides a "Confirm Payment" button to proceed with the checkout process

Account Page
  Displays the user's account details (e.g., name, email, etc.).
  Provides a Logout option that:
  Clears user data and token from local storage
  Redirects the user to the login screen







