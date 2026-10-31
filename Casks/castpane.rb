cask "castpane" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.6"
  sha256 arm:   "d89feb8ee998e251c7337c291f1bc4acdebb8f16775ffe3add5fb8923f9c0e92",
         intel: "f1ca52a07c2eef28e4db18458b848943cb943ea117d697043f3335ceaf7fcabf"

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
