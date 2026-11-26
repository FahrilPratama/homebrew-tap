cask "mutepad" do
  version "0.1.0-beta.3"
  sha256 "9765a886da62dd7f1ae72fc8b68ef988343f526510600126ba45dffd5ba03033"

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
