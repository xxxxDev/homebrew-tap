# xxxxDev/homebrew-tap

Homebrew casks for the projects at [github.com/xxxxDev](https://github.com/xxxxDev).

```sh
brew install --cask xxxxDev/tap/castpane
```

| Cask | What |
| --- | --- |
| [castpane](Casks/castpane.rb) | [Castpane](https://github.com/xxxxDev/castpane): see and control your Mac from a phone or another computer, in the browser. Apple silicon, macOS 14 or later. |

Castpane is signed with the project's own certificate and is not notarized by Apple. Its cask
removes the download's quarantine flag after checking the image's SHA-256, so the app opens
without **Open Anyway**: you are trusting this tap and the project's releases, as when you
build it yourself.

Update with `brew upgrade --cask castpane`. Remove with `brew uninstall --cask castpane`;
add `--zap` to remove its data folder too.
