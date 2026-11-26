cask "mutepad" do
  version "0.1.0-beta.2"
  sha256 "87c34b45128273140ae1b829de086918c76ef91ad014e818cd8283ab73b93881"

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
