cask "mutepad" do
  version "0.1.0-beta.4"
  sha256 "d58a839f6c03ae2f9a89d9750740f25b8ec4540a9f98abb9c68bb91210119823"

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
