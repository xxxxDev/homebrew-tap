cask "castpane" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.4-beta"
  sha256 arm:   "a295750b9f050526d8c78fb717c64760959b90e2b7022616204c03edc57601f8",
         intel: "986ee605938c18c387ccbd1a16e09ec14925f0cacb9620f9f264b6d4de7baa3c"

  url "https://github.com/xxxxDev/castpane/releases/download/v#{version}/Castpane-#{version.sub(/-beta$/, "")}-#{arch}.dmg"
  name "Castpane"
  desc "See and control this computer from a phone or another computer, in the browser"
  homepage "https://github.com/xxxxDev/castpane"

  auto_updates true
  depends_on macos: :sonoma

  app "Castpane.app"

  # Castpane is signed with the project's own certificate, not notarized by Apple: without
  # the download's quarantine flag it opens without "Open Anyway".
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Castpane.app"]
  end

  uninstall quit: "io.github.castpane"

  zap trash: [
    "~/Library/Application Support/Castpane",
    "~/Library/Caches/io.github.castpane",
    "~/Library/Preferences/io.github.castpane.plist",
  ]

  caveats <<~EOS
    Castpane is signed with the project's own certificate and is not notarized by Apple.
    This cask removes the download's quarantine flag, so it opens without "Open Anyway".
    On first launch its setup assistant asks for Screen Recording and Accessibility; they
    stay granted across updates. Castpane updates itself (Settings › General).
  EOS
end
