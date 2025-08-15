# NewsApp-SOLID-Swift
SOLID in Swift – Simplified with Real Code

A simple SwiftUI project that demonstrates how to structure code following the **SOLID principles** using a real-world example: fetching and displaying news from the [NewsData API](https://newsdata.io/).

---

## 📖 Overview

This app:
- Fetches the latest news from a public API.
- Displays them in a clean SwiftUI list with thumbnails.
- Follows **SOLID** design principles for clean, scalable, and maintainable code.

---

## 🧩 SOLID Principles Recap

- **S – Single Responsibility**  
  Each file/class/struct does exactly one job.

- **O – Open/Closed**  
  Add new features without modifying existing code.

- **L – Liskov Substitution**  
  You can replace a class with its subclass without breaking anything.

- **I – Interface Segregation**  
  No class is forced to implement methods it doesn’t need.

- **D – Dependency Inversion**  
  High-level modules depend on abstractions, not concrete classes.

---

## 🗂 Folder Structure

NewsApp/

 ├── Models/
 
     │ └── Article.swift
 
 ├── Services/
 
     │ ├── NetworkServiceProtocol.swift
 
     │ ├── NetworkManager.swift
 
     │ ├── NewsServiceProtocol.swift
 
 │ └── NewsService.swift
 
     ├── ViewModels/
 
     │ └── NewsListViewModel.swift
 
 ├── Views/
 
     │ ├── NewsListView.swift
 
     │ └── NewsRowView.swift
 
 └── NewsApp.swift


---

## 🚀 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/Dhaval1094/NewsApp-SOLID-Swift.git
   
2. Open in Xcode

3. Add your API Key
- Sign up for a free key at NewsData.io.
- Open NewsService.swift and replace API_KEY with your key.
   
4. Run the project on a simulator or device.


🎯 Why This Project?

If you follow this structure, you’ll have:

- A working SwiftUI news app.

- A living example of SOLID in Swift you can reuse in any project.

- Clear separation between UI, logic, and networking.

📜 License

This project is licensed under the MIT License

📎 Full Article

Read the full breakdown and explanation of the SOLID principles in Swift on [Medium](https://medium.com/@dhavaltrivedi-56634/mastering-solid-principles-in-swift-with-a-simple-news-app-fdbe599fcb47).

