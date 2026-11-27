cask "mutepad" do
  version "1.0.2"
  sha256 "1b8274483bf0d5d5fc811dce6fc4a10562608c5426dbaa6d6c6bb7ced4eb8134"

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
