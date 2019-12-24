### СтавкаTV
# Документация
===========================

This document contains information and guidelines about contributing to this project.
Please read it before you start participating.

**Topics**

* [Asking Questions](#asking-questions)
* [Reporting Security Issues](#reporting-security-issues)
* [Reporting Issues](#reporting-other-issues)
* [Developers Certificate of Origin](#developers-certificate-of-origin)
* [Code of Conduct](#code-of-conduct)


# Экран загрузки

### Session Manager

Top-level convenience methods like `Alamofire.request` use a default instance of `Alamofire.SessionManager`, which is configured with the default `URLSessionConfiguration`.

# Лента

Top-level convenience methods like `Alamofire.request` use a default instance of `Alamofire.SessionManager`, which is configured with the default `URLSessionConfiguration`.


```swift
Alamofire.request("https://httpbin.org/get")
```

```swift
let sessionManager = Alamofire.SessionManager.default
sessionManager.request("https://httpbin.org/get")
```

## Asking Questions
We don't use GitHub as a support forum.
For any usage questions that are not specific to the project itself,
please ask on [Stack Overflow](https://stackoverflow.com) instead.
By doing so, you'll be more likely to quickly solve your problem,
and you'll allow anyone else with the same question to find the answer.
This also allows maintainers to focus on improving the project for others.

## Reporting Security Issues
The Alamofire Software Foundation takes security seriously.
If you discover a security issue, please bring it to our attention right away!

Please **DO NOT** file a public issue,
instead send your report privately to <security@alamofire.org>.
This will help ensure that any vulnerabilities that _are_ found
can be [disclosed responsibly](https://en.wikipedia.org/wiki/Responsible_disclosure)
to any affected parties.

## Advanced Usage
Alamofire is built on `URLSession` and the Foundation URL Loading System. To make the most of this framework, it is recommended that you be familiar with the concepts and capabilities of the underlying networking stack.

**Recommended Reading**

- [URL Loading System Programming Guide](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/URLLoadingSystem/URLLoadingSystem.html)
- [URLSession Class Reference](https://developer.apple.com/reference/foundation/nsurlsession)
- [URLCache Class Reference](https://developer.apple.com/reference/foundation/urlcache)
- [URLAuthenticationChallenge Class Reference](https://developer.apple.com/reference/foundation/urlauthenticationchallenge)

### Session Manager

Top-level convenience methods like `Alamofire.request` use a default instance of `Alamofire.SessionManager`, which is configured with the default `URLSessionConfiguration`.

As such, the following two statements are equivalent:

When reporting issues, please include the following:

* The version of Xcode you're using
* The version of iOS or macOS you're targeting
* The full output of any stack trace or compiler error
* A code snippet that reproduces the described behavior, if applicable
* Any other details that would be useful in understanding the problem

This information will help us review and fix your issue faster.

## Triage Issues [![Open Source Helpers](https://www.codetriage.com/alamofire/alamofire/badges/users.svg)](https://www.codetriage.com/alamofire/alamofire)

You can triage issues which may include reproducing bug reports or asking for vital information, such as version numbers or reproduction instructions. If you would like to start triaging issues, one easy way to get started is to [subscribe to alamofire on CodeTriage](https://www.codetriage.com/alamofire/alamofire).

## Developer's Certificate of Origin 1.1
By making a contribution to this project, I certify that:

- (a) The contribution was created in whole or in part by me and I
      have the right to submit it under the open source license
      indicated in the file; or

- (b) The contribution is based upon previous work that, to the best
      of my knowledge, is covered under an appropriate open source
      license and I have the right under that license to submit that
      work with modifications, whether created in whole or in part
      by me, under the same open source license (unless I am
      permitted to submit under a different license), as indicated
      in the file; or

- (c) The contribution was provided directly to me by some other
      person who certified (a), (b) or (c) and I have not modified
      it.

- (d) I understand and agree that this project and the contribution
      are public and that a record of the contribution (including all
      personal information I submit with it, including my sign-off) is
      maintained indefinitely and may be redistributed consistent with
      this project or the open source license(s) involved.

### Session Manager

Top-level convenience methods like `Alamofire.request` use a default instance of `Alamofire.SessionManager`, which is configured with the default `URLSessionConfiguration`.

As such, the following two statements are equivalent:

```swift
Alamofire.request("https://httpbin.org/get")
```

```swift
let sessionManager = Alamofire.SessionManager.default
sessionManager.request("https://httpbin.org/get")
```

Applications can create session managers for background and ephemeral sessions, as well as new managers that customize the default session configuration, such as for default headers (`httpAdditionalHeaders`) or timeout interval (`timeoutIntervalForRequest`).

#### Creating a Session Manager with Default Configuration

```swift
let configuration = URLSessionConfiguration.default
let sessionManager = Alamofire.SessionManager(configuration: configuration)
```

#### Creating a Session Manager with Background Configuration

```swift
let configuration = URLSessionConfiguration.background(withIdentifier: "com.example.app.background")
let sessionManager = Alamofire.SessionManager(configuration: configuration)
```

#### Creating a Session Manager with Ephemeral Configuration

```swift
let configuration = URLSessionConfiguration.ephemeral
let sessionManager = Alamofire.SessionManager(configuration: configuration)
```

#### Modifying the Session Configuration

```swift
var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
defaultHeaders["DNT"] = "1 (Do Not Track Enabled)"

let configuration = URLSessionConfiguration.default
configuration.httpAdditionalHeaders = defaultHeaders

let sessionManager = Alamofire.SessionManager(configuration: configuration)
```

> This is **not** recommended for `Authorization` or `Content-Type` headers. Instead, use the `headers` parameter in the top-level `Alamofire.request` APIs, `URLRequestConvertible` and `ParameterEncoding`, respectively.

### Session Delegate

By default, an Alamofire `SessionManager` instance creates a `SessionDelegate` object to handle all the various types of delegate callbacks that are generated by the underlying `URLSession`. The implementations of each delegate method handle the most common use cases for these types of calls abstracting the complexity away from the top-level APIs. However, advanced users may find the need to override the default functionality for various reasons.

#### Override Closures

The first way to customize the `SessionDelegate` behavior is through the use of the override closures. Each closure gives you the ability to override the implementation of the matching `SessionDelegate` API, yet still use the default implementation for all other APIs. This makes it easy to customize subsets of the delegate functionality. Here are a few examples of some of the override closures available:

```swift
/// Overrides default behavior for URLSessionDelegate method `urlSession(_:didReceive:completionHandler:)`.
open var sessionDidReceiveChallenge: ((URLSession, URLAuthenticationChallenge) -> (URLSession.AuthChallengeDisposition, URLCredential?))?

/// Overrides default behavior for URLSessionDelegate method `urlSessionDidFinishEvents(forBackgroundURLSession:)`.
open var sessionDidFinishEventsForBackgroundURLSession: ((URLSession) -> Void)?

/// Overrides default behavior for URLSessionTaskDelegate method `urlSession(_:task:willPerformHTTPRedirection:newRequest:completionHandler:)`.
open var taskWillPerformHTTPRedirection: ((URLSession, URLSessionTask, HTTPURLResponse, URLRequest) -> URLRequest?)?

/// Overrides default behavior for URLSessionDataDelegate method `urlSession(_:dataTask:willCacheResponse:completionHandler:)`.
open var dataTaskWillCacheResponse: ((URLSession, URLSessionDataTask, CachedURLResponse) -> CachedURLResponse?)?
```

The following is a short example of how to use the `taskWillPerformHTTPRedirection` to avoid following redirects to any `apple.com` domains.

```swift
let sessionManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
let delegate: Alamofire.SessionDelegate = sessionManager.delegate

delegate.taskWillPerformHTTPRedirection = { session, task, response, request in
var finalRequest = request

if
let originalRequest = task.originalRequest,
let urlString = originalRequest.url?.urlString,
urlString.contains("apple.com")
{
finalRequest = originalRequest
}

return finalRequest
}
```

#### Subclassing

Another way to override the default implementation of the `SessionDelegate` is to subclass it. Subclassing allows you completely customize the behavior of the API or to create a proxy for the API and still use the default implementation. Creating a proxy allows you to log events, emit notifications, provide pre and post hook implementations, etc. Here's a quick example of subclassing the `SessionDelegate` and logging a message when a redirect occurs.

```swift
class LoggingSessionDelegate: SessionDelegate {
override func urlSession(
_ session: URLSession,
task: URLSessionTask,
willPerformHTTPRedirection response: HTTPURLResponse,
newRequest request: URLRequest,
completionHandler: @escaping (URLRequest?) -> Void)
{
print("URLSession will perform HTTP redirection to request: \(request)")

super.urlSession(
session,
task: task,
willPerformHTTPRedirection: response,
newRequest: request,
completionHandler: completionHandler
)
}
}
```

Generally speaking, either the default implementation or the override closures should provide the necessary functionality required. Subclassing should only be used as a last resort.

> It is important to keep in mind that the `subdelegates` are initialized and destroyed in the default implementation. Be careful when subclassing to not introduce memory leaks.

### Request

The result of a `request`, `download`, `upload` or `stream` methods are a `DataRequest`, `DownloadRequest`, `UploadRequest` and `StreamRequest` which all inherit from `Request`. All `Request` instances are always created by an owning session manager, and never initialized directly.

Each subclass has specialized methods such as `authenticate`, `validate`, `responseJSON` and `uploadProgress` that each return the caller instance in order to facilitate method chaining.

Requests can be suspended, resumed and cancelled:

- `suspend()`: Suspends the underlying task and dispatch queue.
- `resume()`: Resumes the underlying task and dispatch queue. If the owning manager does not have `startRequestsImmediately` set to `true`, the request must call `resume()` in order to start.
- `cancel()`: Cancels the underlying task, producing an error that is passed to any registered response handlers.

### Routing Requests

As apps grow in size, it's important to adopt common patterns as you build out your network stack. An important part of that design is how to route your requests. The Alamofire `URLConvertible` and `URLRequestConvertible` protocols along with the `Router` design pattern are here to help.

#### URLConvertible

Types adopting the `URLConvertible` protocol can be used to construct URLs, which are then used to construct URL requests internally. `String`, `URL`, and `URLComponents` conform to `URLConvertible` by default, allowing any of them to be passed as `url` parameters to the `request`, `upload`, and `download` methods:

```swift
let urlString = "https://httpbin.org/post"
Alamofire.request(urlString, method: .post)

let url = URL(string: urlString)!
Alamofire.request(url, method: .post)

let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
Alamofire.request(urlComponents, method: .post)
```

Applications interacting with web applications in a significant manner are encouraged to have custom types conform to `URLConvertible` as a convenient way to map domain-specific models to server resources.

##### Type-Safe Routing

```swift
extension User: URLConvertible {
static let baseURLString = "https://example.com"

func asURL() throws -> URL {
let urlString = User.baseURLString + "/users/\(username)/"
return try urlString.asURL()
}
}
```

```swift
let user = User(username: "mattt")
Alamofire.request(user) // https://example.com/users/mattt
```

#### URLRequestConvertible

Types adopting the `URLRequestConvertible` protocol can be used to construct URL requests. `URLRequest` conforms to `URLRequestConvertible` by default, allowing it to be passed into `request`, `upload`, and `download` methods directly (this is the recommended way to specify custom HTTP body for individual requests):

```swift
let url = URL(string: "https://httpbin.org/post")!
var urlRequest = URLRequest(url: url)
urlRequest.httpMethod = "POST"

let parameters = ["foo": "bar"]

do {
urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
} catch {
// No-op
}

urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

Alamofire.request(urlRequest)
```

Applications interacting with web applications in a significant manner are encouraged to have custom types conform to `URLRequestConvertible` as a way to ensure consistency of requested endpoints. Such an approach can be used to abstract away server-side inconsistencies and provide type-safe routing, as well as manage authentication credentials and other state.

##### API Parameter Abstraction

```swift
enum Router: URLRequestConvertible {
case search(query: String, page: Int)

static let baseURLString = "https://example.com"
static let perPage = 50

// MARK: URLRequestConvertible

func asURLRequest() throws -> URLRequest {
let result: (path: String, parameters: Parameters) = {
switch self {
case let .search(query, page) where page > 0:
return ("/search", ["q": query, "offset": Router.perPage * page])
case let .search(query, _):
return ("/search", ["q": query])
}
}()

let url = try Router.baseURLString.asURL()
let urlRequest = URLRequest(url: url.appendingPathComponent(result.path))

return try URLEncoding.default.encode(urlRequest, with: result.parameters)
}
}
```

```swift
Alamofire.request(Router.search(query: "foo bar", page: 1)) // https://example.com/search?q=foo%20bar&offset=50
```

##### CRUD & Authorization

```swift
import Alamofire

enum Router: URLRequestConvertible {
case createUser(parameters: Parameters)
case readUser(username: String)
case updateUser(username: String, parameters: Parameters)
case destroyUser(username: String)

static let baseURLString = "https://example.com"

var method: HTTPMethod {
switch self {
case .createUser:
return .post
case .readUser:
return .get
case .updateUser:
return .put
case .destroyUser:
return .delete
}
}

var path: String {
switch self {
case .createUser:
return "/users"
case .readUser(let username):
return "/users/\(username)"
case .updateUser(let username, _):
return "/users/\(username)"
case .destroyUser(let username):
return "/users/\(username)"
}
}

// MARK: URLRequestConvertible

func asURLRequest() throws -> URLRequest {
let url = try Router.baseURLString.asURL()

var urlRequest = URLRequest(url: url.appendingPathComponent(path))
urlRequest.httpMethod = method.rawValue

switch self {
case .createUser(let parameters):
urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
case .updateUser(_, let parameters):
urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
default:
break
}

return urlRequest
}
}
```

```swift
Alamofire.request(Router.readUser("mattt")) // GET https://example.com/users/mattt
```

### Adapting and Retrying Requests

Most web services these days are behind some sort of authentication system. One of the more common ones today is OAuth. This generally involves generating an access token authorizing your application or user to call the various supported web services. While creating these initial access tokens can be laborsome, it can be even more complicated when your access token expires and you need to fetch a new one. There are many thread-safety issues that need to be considered.

The `RequestAdapter` and `RequestRetrier` protocols were created to make it much easier to create a thread-safe authentication system for a specific set of web services.

#### RequestAdapter

The `RequestAdapter` protocol allows each `Request` made on a `SessionManager` to be inspected and adapted before being created. One very specific way to use an adapter is to append an `Authorization` header to requests behind a certain type of authentication.

```swift
class AccessTokenAdapter: RequestAdapter {
private let accessToken: String

init(accessToken: String) {
self.accessToken = accessToken
}

func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
var urlRequest = urlRequest

if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix("https://httpbin.org") {
urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
}

return urlRequest
}
}
```

```swift
let sessionManager = SessionManager()
sessionManager.adapter = AccessTokenAdapter(accessToken: "1234")

sessionManager.request("https://httpbin.org/get")
```

#### RequestRetrier

The `RequestRetrier` protocol allows a `Request` that encountered an `Error` while being executed to be retried. When using both the `RequestAdapter` and `RequestRetrier` protocols together, you can create credential refresh systems for OAuth1, OAuth2, Basic Auth and even exponential backoff retry policies. The possibilities are endless. Here's an example of how you could implement a refresh flow for OAuth2 access tokens.

> **DISCLAIMER:** This is **NOT** a global `OAuth2` solution. It is merely an example demonstrating how one could use the `RequestAdapter` in conjunction with the `RequestRetrier` to create a thread-safe refresh system.
