cask "castpane" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.2"
  sha256 arm:   "ab3be4a7d16ac928ca205fa7755b6941db9a59f589ee4c141eb55c151556805d",
         intel: "cc239d3f88d38764a1538e80cd7cd1a935bfd993fed418d3145414cea11d307c"

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
