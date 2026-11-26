cask "mutepad" do
  version "1.0.0"
  sha256 "5b2bc58c1ddcd8ff10c5bbc92d5092d54c84308ef900cb0146a7eba684e456ae"

  url "https://github.com/FahrilPratama/mute-pad/releases/download/v#{version}/MutePad.dmg"
  name "MutePad"
  desc "Menu bar utility that locks the built-in trackpad when an external mouse is connected"
  homepage "https://github.com/FahrilPratama/mute-pad"

  depends_on macos: ">= :ventura"

  app "MutePad.app"

  postflight do
    # Remove Gatekeeper quarantine attribute for unsigned open-source releases
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MutePad.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.fahrilpratama.MutePad.plist",
  ]
end
