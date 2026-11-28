cask "mutepad" do
  version "1.0.3"
  sha256 "4d0d4b5f223ed412cc5a4004572420fa37ff9f306216b3160ce024a92e310ab8"

  url "https://github.com/FahrilPratama/mute-pad/releases/download/v#{version}/MutePad.dmg"
  name "MutePad"
  desc "Locks built-in trackpad when an external mouse is connected"
  homepage "https://github.com/FahrilPratama/mute-pad"

  depends_on macos: :ventura

  app "MutePad.app"

  postflight_steps do
    # Remove Gatekeeper quarantine attribute for unsigned open-source releases
    run "/usr/bin/xattr", args: ["-cr", "/Applications/MutePad.app"]
  end

  zap trash: "~/Library/Preferences/com.fahrilpratama.MutePad.plist"
end
