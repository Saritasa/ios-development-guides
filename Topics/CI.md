
> [Home page](/README.md)

# Overview

CI is configured on jenkins by our devops team. Usually they need the following info:
- Name of xcode scheme
- Name of xcode configuration (Release, ReleaseAppStore, etc.)
- Bundle ID
- Provisioning profile and its UUID
- Firebase config data (link to the app on firebase should suffice)

Usually Firebase distribution is configured by iOS developers, see steps below.

## Firebase Distribution Configuration

We use firebase to distribute iOS apps to our QA team. Please follow firebase documentation to
integrate their sdk in xcode project.  If a project has multiple environments with different bundle
ids, additionally you need to follow these steps:

1. Create `GoogleService` directory with subdirectories for each bundle id (use bundle id as a name
   of the subdirectory).
2. Download `GoogleService-Info.plist` for each bundle id and place them in corresponded
   subdirectories in `GoogleService` directory.
3. (Optionally) Add `GoogleService` directory in xcode project but do not add
   `GoogleService-Info.plist` files in target.
4. In xcode project, in `Build Phases` add new run script phase and place it right after
   `Dependencies` phase with the following script:
```bash
#!/usr/bin/env bash

if test -z "$PRODUCT_BUNDLE_IDENTIFIER"; then
    echo "error: Bundle ID is not set for some reason"
    exit 1
else
    cp "GoogleService/$PRODUCT_BUNDLE_IDENTIFIER/GoogleService-Info.plist" "GoogleService/GoogleService-Info.plist"
fi
```

It will copy appropriate `GoogleService-Info.plist` and place it in
`GoogleService/GoogleService-Info.plist`.

> Note: as best practice you can put this script in `./scripts/overwrite-google-service-info.sh`.

5. Run or build the project (`Cmd+B`).
6. Add newly created `GoogleService/GoogleService-Info.plist` in project's `.gitignore` (we don't
   want to track any changes to this file in git).
7. Add newly created `GoogleService/GoogleService-Info.plist` file in the target. This file will be
   replaced by an actual file from `GoogleService/<bundle id>/GoogleService-Info.plist`.
8. Add `$SRCROOT/GoogleService/GoogleService-Info.plist` in "Output Files" of the script.

> [Home page](/README.md)
