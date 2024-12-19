# **Final Project Instructions**

## **Start App**
For this final project, you will begin by cloning the provided sample app repository called final.

- ALL Code must be in gitlab no later than 8:30 PM EST.  No Exceptions.  Would recommend pushing code a little bit as you go.
- Late Submissions automatically take 20 points off.
- Provide full ownership of the Google Cloud Project for grading to the alphabetacreatives.com email address
- Provide ownership level access to Firebase for grading
- Invite the professor as a test user in the Firebase app distribution to the alphabetareatives.com email address
- APK or IPA are acceptable.
- You must use the profesor provided gitlab repo (first name/last name) for all of your work.
- Name the Firebase Project hunter-fall-2024- [first initial lastname - ie.jsmith]


---

## **Task 1: UI Enhancements**

### **Objective**
Enhance the appearance of the list items in the app by customizing the `ListTile` widget.

### **Steps**
1. Add a **background color** to each `ListTile` (`tileColor`).
2. Use **rounded corners** with `RoundedRectangleBorder`.
3. Add **padding** between list items.
4. Apply **custom text styles**:
   - Title: `fontSize = 18`, `fontWeight = bold`.
   - Subtitle: `fontSize = 14`, `fontStyle = italic`.

### **Grading Criteria (20 Points)**
- **5 points:** Each list item has a light background color (`tileColor`), distinct from the page.
- **5 points:** Rounded corners are applied using `RoundedRectangleBorder`.
- **5 points:** Appropriate padding is added between list items (`Padding` or `SizedBox`).
- **5 points:** Text styling is correctly applied:
  - Title: `fontSize = 18`, `fontWeight = bold`.
  - Subtitle: `fontSize = 14`, italic.

---

## **Task 2: Add a Theme Toggle**

### **Objective**
Add the ability to toggle between light and dark themes using a button in the `AppBar`.

### **Steps**
1. Convert the `BookstoreApp` widget into a **StatefulWidget** to manage theme state.
2. Add a `bool isDarkTheme` variable to track the current theme.
3. Add an **IconButton** in the `AppBar`:
   - **Sun icon (`Icons.wb_sunny`)** for light mode.
   - **Moon icon (`Icons.nights_stay`)** for dark mode.
4. Use `setState` to toggle between `ThemeData.light()` and `ThemeData.dark()`.

### **Grading Criteria (20 Points)**
- **5 points:** Theme state (`isDarkTheme`) is correctly tracked using a `bool`.
- **5 points:** The `IconButton` in the `AppBar` switches between Sun and Moon icons.
- **5 points:** Clicking the toggle button dynamically switches themes using `setState`.
- **5 points:** The correct theme (`ThemeData.light()` or `ThemeData.dark()`) is applied throughout the app.

---

## **Task 3: Add HTTP Fetch/Post Request with Dynamic Updates**

### **Objective**
Add the ability to fetch and post book data dynamically from a backend API.

### **Sample Code**
```dart
Future<void> fetchBooks() async {
  final response = await http.get(Uri.parse('http://localhost:8080/getBooks')); // Replace with backend URL
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    setState(() {
      books = data.map((item) => {
            'title': item['title'],
            'author': item['author'],
          }).toList();
    });
  } else {
    throw Exception('Failed to fetch books');
  }
}

Future<void> addBook(String title, String author) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/addBook'), // Replace with backend URL
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'title': title, 'author': author}),
  );
  if (response.statusCode == 200) {
    await fetchBooks(); // Reload the book list
  } else {
    throw Exception('Failed to add book');
  }
}

@override
void initState() {
  super.initState();
  fetchBooks();
}
```

### **Steps**
1. **Fetch books** from the API and display them dynamically in the app.
2. **Add a new book** via the API, and ensure the new book is displayed in the app.

### **Grading Criteria (20 Points)**
- **10 points:** The app allows adding and submitting a new book from the UI.
- **10 points:** The app dynamically updates the list:
  - Auto-fetches the new book, OR
  - Updates when a "Fetch" button is clicked.

---

## **Task 4: Create a PostgreSQL Database**

### **Objective**
Create a backend layer to connect the app to a PostgreSQL database.

### **Steps**
1. Create a **PostgreSQL database** and a `books` table:
   ```sql
   CREATE TABLE books (
       id SERIAL PRIMARY KEY,
       title VARCHAR(255) NOT NULL,
       author VARCHAR(255) NOT NULL
   );
   ```
2. Use **Cloud Run** or **Firebase Data Connect** to set up API endpoints for fetching and adding books:
   - `GET /getBooks`: Fetch all books.
   - `POST /addBook`: Add a new book.

### **Grading Criteria (20 Points)**
- **10 points:** PostgreSQL database and table are correctly created.
- **10 points:** Successfully submitting a new book via the app adds it to the database (verified through app distribution).

---

## **Task 5: Deploy and Test App Distribution**

### **Objective**
Distribute the app as an APK (Android) or IPA (iOS) file and test it.

### **Steps**
1. Build the app for distribution:
   ```bash
   flutter build apk --release
   ```
2. Share the APK/IPA file for testing (e.g., via Firebase App Distribution or TestFairy).
3. Ensure the app installs and runs on a tester device.

### **Grading Criteria (20 Points)**
- **5 points:** APK/IPA file is successfully uploaded for distribution.
- **5 points:** The app installs and loads correctly on the tester's device.
- **0–10 points:** Does the app function as expected?
  - Fully Working: **10 points**
  - Partially Working: **5 points**

---

## **Summary of Grading Criteria**
| **Task**                              | **Points** |
|---------------------------------------|------------|
| Task 1: UI Enhancements               | 20         |
| Task 2: Add Theme Toggle              | 20         |
| Task 3: HTTP Fetch/Post with Updates  | 20         |
| Task 4: PostgreSQL Database           | 20         |
| Task 5: Deploy and Test Distribution  | 20         |
| **Total**                             | **100**    |

---

Follow these steps carefully, and good luck! Let me know if you need further clarification.