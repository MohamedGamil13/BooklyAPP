## Quick context for AI coding agents

This is a Flutter app (Bookly). The codebase follows a feature-first, layered structure under `lib/Features/` with a small shared `lib/core/` set of utilities.

- Entry: `lib/main.dart` — app starts here. DI is initialized (`setupServiceLocator()`), then `MultiBlocProvider` creates cubits that immediately call their fetch methods.
- DI: `lib/core/utils/sevices_locator.dart` — uses `get_it` and registers a singleton `HomeRepoImpl` (note filename has a typo: `sevices_locator.dart`). Use `getIt.get<HomeRepoImpl>()` to retrieve.
- Networking: `lib/core/utils/api_service.dart` — wraps `Dio` and uses base URL `https://www.googleapis.com/books/v1/`.
- Feature layout example: `lib/Features/home/` with subfolders `data/`, `presentation/`, etc. Repos live in `data/repos`, models in `data/models`, and cubits in `presentation/views_model`.

## Important patterns & conventions (concrete)

- State management: `flutter_bloc` (Cubits). Example: `FeaturedBooksCubit` in `lib/Features/home/presentation/views_model/featured_bookCubit/featured_books_cubit.dart`.
  - Cubits call repository methods which return `dartz.Either<Failure, T>`.
  - Failure type is defined under `lib/core/errors/failures.dart` and repo implementations convert Dio exceptions into `ServerFailure`.

- Repository pattern: Abstract repo interfaces in `data/repos` (e.g. `home_repo.dart`) and implementations named `*RepoImpl` (e.g. `home_repo_impl.dart`). Implementations return `Either<Failure, Result>`.
  - Note: method names contain spelling typos (e.g. `fecthNewstBooks`, `fecthFeaturedBooks`). Search for `fecth` when tracing fetch calls.

- Dependency registration: add services in `lib/core/utils/sevices_locator.dart`. Example registration:
  - `getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiService: ApiService(Dio())));`
  - When adding bindings, match the concrete type used in callers (`getIt.get<HomeRepoImpl>()`) or register an abstract type if you plan to retrieve interfaces.

- API usage: `ApiService.get(endPoint: '...')` returns parsed JSON (Map). Repos iterate `data['items']` and call model factories like `BookModel.fromJson`.

## Integration points & external deps

- Key packages (see `pubspec.yaml`): `flutter_bloc`, `get_it`, `dio`, `dartz`, `get` (GetX used for `GetMaterialApp`), `google_fonts`, `cached_network_image`.
- Remote API: Google Books API (base URL in `api_service.dart`) — API key currently hard-coded in `HomeRepoImpl`.

## Developer workflows (concrete commands — Windows PowerShell)

Run app (fetch deps first):
```powershell
flutter pub get
flutter run -d chrome   # or -d windows / -d android
```

Run tests:
```powershell
flutter test
```

Build release APK:
```powershell
flutter build apk
```

Notes: The project uses standard Flutter tooling. If adding CI, ensure Flutter SDK is installed and `flutter pub get` runs before builds.

## Common pitfalls and search tips for agents

- Typos matter: service locator file is `sevices_locator.dart` (not `services_locator.dart`). Fetch methods use `fecth` spelling. When searching for symbols, include these misspellings.
- DI retrieval in `main.dart` fetches `HomeRepoImpl` directly with `getIt.get<HomeRepoImpl>()`. If you register abstract types later, update callers accordingly.
- Error-handling: repos return `Either<Failure, T>`. Callers (cubits) use `fold` to convert failures to states.

## When editing code

- Preserve existing naming and method signatures (including minor typos) unless doing a deliberate refactor across the codebase. If you rename methods, update all callers and tests.
- Add new services to `lib/core/utils/sevices_locator.dart` and register them before app start (main calls `setupServiceLocator()`).

## Key files to inspect for context

- `lib/main.dart` — app entry, DI and cubit wiring
- `lib/core/utils/sevices_locator.dart` — DI registrations
- `lib/core/utils/api_service.dart` — networking base URL / Dio
- `lib/Features/home/data/repos/home_repo_impl.dart` — repo implementation and error handling
- `lib/Features/home/presentation/views_model/*` — cubits and states

If any part of this is unclear or you'd like more examples (e.g., how to add a new feature, register an interface instead of a concrete repo, or add unit tests for a cubit), tell me which area to expand and I will iterate.
