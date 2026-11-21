# xxxxDev/homebrew-tap

Homebrew casks for the projects at [github.com/xxxxDev](https://github.com/xxxxDev).

```sh
brew install --cask xxxxDev/tap/castpane
brew install --cask xxxxDev/tap/ipa-loom
```

| Cask | What |
| --- | --- |
| [castpane](Casks/castpane.rb) | [Castpane](https://github.com/xxxxDev/castpane): see and control your Mac from a phone or another computer, in the browser. Apple silicon or Intel, macOS 14 (Sonoma) or later. |
| [ipa-loom](Casks/ipa-loom.rb) | [IPA Loom](https://github.com/xxxxDev/ipa-loom): decrypt iPhone and iPad apps from the App Store on an Apple Silicon Mac. Apple silicon, macOS 14 (Sonoma) or later. |

Castpane is signed with the project's own certificate and is not notarized by Apple. Its cask
removes the download's quarantine flag after checking the image's SHA-256, so the app opens
without **Open Anyway**: you are trusting this tap and the project's releases, as when you
build it yourself.

Castpane updates itself (it checks GitHub once a day); `brew upgrade --cask --greedy castpane`
also works. Remove with `brew uninstall --cask castpane`;
add `--zap` to remove its data folder too.

IPA Loom is signed and handled the same way (its own certificate, not notarized, quarantine
flag removed after the SHA-256 check) and also updates itself. Remove with
`brew uninstall --cask ipa-loom`; its private data folder is left for the app's own reset.
