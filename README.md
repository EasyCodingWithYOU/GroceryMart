
Video demo link : https://drive.google.com/file/d/1v7ZO4NuX-jiz8AKzkgUYVnQ5Ucgr7C47/view?usp=drive_link
🛒 GroceryMart – Demo Flutter App
GroceryMart is a demo Flutter application designed to showcase clean UI development and basic state management using BLoC. This app simulates an online grocery shopping experience with a focus on key user interface flows and persistent cart management.

🚀 Features
✅ Splash Screen – Initial loading screen to introduce the app.

✅ Onboarding Screen – Walks users through the app’s value proposition.

✅ Bottom Navigation Bar – Main navigation structure with tabs.

✅ Shop Screen – Displays grocery items as cards using dummy data.

✅ Detail Screen – Detailed view of selected grocery item.

✅ Cart Screen – Add, remove, increase, or decrease item quantity.

✅ State Management – Implemented using BLoC pattern for cart operations.

✅ Data Persistence – Cart data is stored locally using SharedPreferences to preserve state even after app restarts.

📱 App Flow
Splash Screen →

Onboarding Screen →

Bottom Navigation (Home)

Displays grocery cards.

Tapping the ➕ icon on a card opens the Detail Screen.

Detail Screen

Add the item to cart.

Cart Screen

View all added items.

Increase/decrease quantity or delete items.

All changes are preserved even after closing and reopening the app.

🧠 State Management
BLoC Pattern is used for managing the cart.

Logic is implemented cleanly in a repository layer (CartRepositoryImpl).

The cart operations (add/remove/update) interact with SharedPreferences for local persistence.

📦 Data
The current version uses dummy data for grocery items.

No backend/API integration is implemented in this demo.
