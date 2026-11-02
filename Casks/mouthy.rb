cask "mouthy" do
  version "0.5.0"
  sha256 "c59f96d209a017e3030d08842cad682fe5030e33df551d431d29e779e2b56393"

  url "https://github.com/azizi-a/mouthy/releases/download/v#{version}/Mouthy_#{version}_aarch64.dmg"
  name "Mouthy"
  desc "Reads selected text aloud with an offline Kokoro voice"
  homepage "https://github.com/azizi-a/mouthy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  # The bundle's floor is macOS 13.4; casks can only name major releases.
  depends_on macos: :ventura

  app "Mouthy.app"

  zap trash: [
    "~/Library/Application Support/com.azizi.mouthy",
    "~/Library/Caches/com.azizi.mouthy",
    "~/Library/Logs/com.azizi.mouthy",
    "~/Library/Preferences/com.azizi.mouthy.plist",
    "~/Library/WebKit/com.azizi.mouthy",
  ]

  caveats <<~EOS
    Mouthy is not signed with an Apple Developer ID or notarised, so macOS
    blocks its first launch. Open System Settings → Privacy & Security and
    click Open Anyway, or clear the download flag:
      xattr -dr com.apple.quarantine /Applications/Mouthy.app

    `brew uninstall --zap --cask mouthy` also deletes the voice models
    Mouthy downloaded.
  EOS
end
