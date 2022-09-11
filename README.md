# gutenberg_library

Application for fetching and searching books from Gutenberg Library (API source: http://gutendex.com/). 
Built for __B. Design and implement an app as a long term project__ situation

## Scope of Features
- Home Screen, contains list of books. Support offline data, obtained from cache containing latest success books API response.
- Search, search for books based on selected keywords
- Detail Screen, contains detail data of selected book
- Bookshelf Screen, contains list of books from a specific bookshelf

## Tech Stack
### Production Environment
- Equatable, to ease compare similar instance
- Dartz, for returning object as Either, to ease return as success or fail state
- Internet Connection Checker, to help check for device internet connectivity
- SqlFLite, for caching fetch list of book result from API response
- http, for REST Client
- BLoC, for handling state management and presentation logic in Widget
- get it, for dependency injection
- url launcher, for handling open link
### Test Environment
- Mocktail, for stub and mock object for test
- sqflite_common_ffi, for mocking sqlflite database interaction

## Development Details
- Built by using Clean Architecture approach, separate data, domain, and presentation layer
- Using TDD approach by implementing Red, Green, Refactor style
