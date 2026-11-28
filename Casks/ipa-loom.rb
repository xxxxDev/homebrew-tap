cask "ipa-loom" do
  version "2026.11.28"
  sha256 "4beafe16f8d42d27ab75a0069659cc2939e80a165aa94ff5735056891b6bc675"

  url "https://github.com/xxxxDev/ipa-loom/releases/download/v#{version}/IPA-Loom-#{version}-arm64.dmg"
  name "IPA Loom"
  desc "Decrypt iPhone and iPad apps from the App Store on an Apple Silicon Mac"
  homepage "https://github.com/xxxxDev/ipa-loom"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "IPA Loom.app"

  # IPA Loom is not notarized by Apple: without the download's quarantine flag it opens
  # without "Open Anyway".
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/IPA Loom.app"]
  end

  uninstall quit: "io.ipaloom.app"

  # The private data folder (setup, model, outputs) is left alone on purpose:
  # remove it with the app's own reset, or by hand.
  zap trash: [
    "~/Library/Preferences/io.ipaloom.app.plist",
  ]

  caveats <<~EOS
    IPA Loom is not notarized by Apple. This cask removes the download's quarantine flag,
    so it opens without "Open Anyway". Update with: brew upgrade --cask ipa-loom
  EOS
end
