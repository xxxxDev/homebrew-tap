cask "castpane" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.3"
  sha256 arm:   "a2fc235f133e67d147bbcde314b8798f7523e3e9c3ca1be532f9d9ee032ddc15",
         intel: "47f1cd634a41d0725d2d9ac69143f3f91a31f0808bdcec0b99b859ba36276b70"

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
