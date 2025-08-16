# Mastering SOLID Principles in Swift with a Simple News App

<p align="center">
  <img width="500" height="245" alt="Screenshot 2025-08-16 at 2 05 11 AM" src="https://github.com/user-attachments/assets/73a0d7e0-fd9e-4166-ad2a-bb67ea614b5e" />
</p>

## Introduction

In modern iOS development, writing code that works is not enough — you need code that’s easy to understand, extend, and maintain.
That’s where the SOLID principles come in. These five object-oriented design principles help us write robust and flexible Swift code.

In this article, we’ll build a simple SwiftUI News App using a free API from [NewsData.io](https://newsdata.io/), applying SOLID principles throughout.

**Here’s a concise 5-line definition for SOLID:**

S — Single Responsibility: Each class or struct should do just one job.

O — Open/Closed: Software entities should be open for extension, but closed for modification.

L — Liskov Substitution: You should be able to swap a subclass for its parent without breaking things.

I — Interface Segregation: Clients should not be forced to depend on interfaces they do not use.

D — Dependency Inversion: Depend on abstractions, not on concrete implementations.

## App Overview

Our app fetches the latest news headlines and displays them in a clean SwiftUI list, complete with thumbnail images and multi-line descriptions.

The API endpoint:

https://newsdata.io/api/1/news?apikey=YOUR_API_KEY&language=en

## Folder Structure

<img width="441" height="472" alt="Screenshot 2025-08-17 at 2 29 21 AM" src="https://github.com/user-attachments/assets/c15f216f-b4be-47c6-8106-1111c82989fe" />

## Applying the SOLID Principles

### S — Single Responsibility Principle (SRP)

Each class or struct has one reason to change.

**NetworkManager →** only handles making network requests

**NewsService →** only handles fetching and decoding news data

**NewsListViewModel →** only manages state for the news list screen

### Example:

```swift
final class NetworkManager: NetworkServiceProtocol {
    func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                completion(.failure(err))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

enum NetworkError: Error {
    case noData
}
```
**Reason to change?** Only if networking implementation changes.

### O — Open/Closed Principle (OCP)
Code should be open for extension, closed for modification.

We define protocols like `NetworkServiceProtocol` and `NewsServiceProtocol` so we can easily swap implementations without touching the rest of the code.

```swift
protocol NewsServiceProtocol {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void)
}
```
If tomorrow we want to load news from a local database instead of the API, we just create `LocalNewsService` implementing `NewsServiceProtocol`.

### L — Liskov Substitution Principle (LSP)

If a class (or struct) implements a protocol, it should be replaceable without breaking the app.

Because `NetworkManager` conforms to `NetworkServiceProtocol`, we can replace it with `MockNetworkManager` in unit tests without touching `NewsService`.

### I — Interface Segregation Principle (ISP)

We avoid “fat” protocols. Each protocol serves a specific purpose.

Example:

**NetworkServiceProtocol** → generic networking

**NewsServiceProtocol** → news-specific fetching

No single protocol forces classes to implement methods they don’t need.

### D — Dependency Inversion Principle (DIP)

High-level modules (NewsListViewModel) depend on abstractions, not concrete classes.

```swift
final class NewsListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private let newsService: NewsServiceProtocol

    init(newsService: NewsServiceProtocol) {
        self.newsService = newsService
    }

    func loadNews() {
        newsService.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                if case .success(let articles) = result {
                    self?.articles = articles
                }
            }
        }
    }
}
```

### The UI Layer

Our SwiftUI views remain simple and focus only on presentation.

**NewsListView.swift**

```swift
struct NewsListView: View {
    @StateObject var viewModel: NewsListViewModel

    var body: some View {
        List(viewModel.articles) { article in
            NewsRowView(article: article)
                .padding(.vertical, 4)
        }
        .onAppear {
            viewModel.loadNews()
        }
    }
}
```

**NewsRowView.swift**


```swift
struct NewsRowView: View {
    let article: Article

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            AsyncImage(url: URL(string: article.image_url ?? "")) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .foregroundColor(.gray)
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                Text(article.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(4)
            }
        }
    }
}
```

## Key Takeaways

**SRP** → separate networking, business logic, and UI

**OCP** → use protocols for easy extension

**LSP** → replace implementations without breaking code

**ISP** → keep protocols focused

**DIP** → inject dependencies via abstractions

## Possible Next Steps

- Add filtering by category or source
- Save news offline with Core Data
- Add unit tests for services and view models

Build it once, use it forever — a simple, living example of SOLID in Swift for every project ahead.

---

## ✍️ About the Author  

Hi, I’m **Dhaval Trivedi**, an iOS Developer with 9 years of experience.  
I enjoy building clean, scalable apps and sharing knowledge about Swift, architecture, and best practices.  

📫 Connect with me on [LinkedIn](https://www.linkedin.com/in/dhaval-trivedi-%EF%A3%BF-779011139/) · 🌐 [GitHub](https://github.com/Dhaval1094)  

