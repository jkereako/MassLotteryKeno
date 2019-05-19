# Kringle
Do you really need [Alamofire]? Are you going to use all of those features? Do
you even know what they do? Do you just want to download some JSON and parse it
into a contract and be done with it? That is what Kringle is for.

Kringle is my cat. It's also a small, opinionated networking framework. It was
designed with simplicity in mind and is really just a thin abstraction around
[URLSession].

# Features
 - **Promises.** Uses [Google's Promises][Promises] framework to provides a 
   sane way to manage completion handlers and asynchronous behavior in general
 - **JSON deserialization.** JSON response data is deserialized into objects
   which adopt the [Decodable protocol][Decodable] on a background queue. So,
   your app won't hang if your JSON dataset is large
 - **Automated cookie management.** Cookies will be stored for any response 
   that contains the `Set-Cookie` header with an expiration date in the future
   or without one at all. Likewise, cookies will be deleted for any response
   that contains the `Set-Cookie` with an expiration date in the past (see 
   [RFC-6265 section 4.1.2][RFC-6265])

# Design
So I said this is an opinionated framework. The interface to this
framework is through NetworkClient. This class exposes only eight methods. Each
method name coresponds to a HTTP method name. Thus far, only `delete`, `get`,
`post` and `put` are supported. I left out the other ones, like `patch`, because
no one actually uses them even if folks say they do.

These methods accept an Endpoint type and return a `Promise<void>` if no response
is expected from the endpoint, or a `Promise<T>` where T is a [Decodable]. Promises
were added purely to improve developer experience.

The Endpoint type is an enum. This was inspired by a [Chris Eidhof][Eidhof] post
from years ago.

```swift
enum CatEndpoint {
    case cuddle
    case pet(catName: String)
    case feed(catName: String)
}

extension CatEndpoint: Endpoint {
    var baseURL: URL { return URL(string: "https://api.kringlekitty.com")! }
    var path: String {
        switch self {
        case .cuddle:
            return "/kittycuddles"
        case .pet(let catName):
            return "/pet/\(catName)/"
        case .feed(let catName):
            return "/feed/\(catName)/"
        }
    }
}

```

And here's how to invoke a GET request on that endpoint.

```swift
let cat = CatEndpoint.pet(catName: "Kringle")
networkClient = NetworkClient()

// This performs a GET request on https://api.kringlekitty.com/pet/Kringle
networkClient.get(cat).then { _ in
  print("🐱")
  }.catch { error in
    print("You gotta be kitten me!")
}
```

# Development
This framework was created with Swift Package Manager. The easiest 
way to get started after cloning the repository is to run `swift build` to
install all dependencies.

[Eidhof]: http://chris.eidhof.nl/post/typesafe-url-routes-in-swift/
[Alamofire]: https://github.com/Alamofire/Alamofire
[URLSession]: https://developer.apple.com/documentation/foundation/urlsession
[Promises]: https://github.com/google/promises
[RFC-6265]: https://tools.ietf.org/html/rfc6265#section-4.1.2
[Decodable]: https://developer.apple.com/documentation/swift/decodable
