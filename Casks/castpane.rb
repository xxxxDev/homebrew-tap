cask "castpane" do
  arch arm: "arm64", intel: "x86_64"

  version "2026.10.31"
  sha256 arm:   "1459f64b0973bf64e986cd337abce39402138b05265769d9ba047450ee05d7e9",
         intel: "297b956854fcbdeb97fefc19023a49ef128dd017f0c767268912ee683a01eba6"

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
