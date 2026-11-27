cask "mutepad" do
  version "1.0.2"
  sha256 "09247686ed4d9a13a2667684cc8a7a1f573bbbd2f3f6032b4983195ad60e7e48"

  url "https://github.com/FahrilPratama/mute-pad/releases/download/v#{version}/MutePad.dmg"
  name "MutePad"
  desc "Locks built-in trackpad when an external mouse is connected"
  homepage "https://github.com/FahrilPratama/mute-pad"

  depends_on macos: :ventura

  app "MutePad.app"

  postflight_steps do
    # Remove Gatekeeper quarantine attribute for unsigned open-source releases
    run "/usr/bin/xattr",
        args:         ["-cr", "/Applications/MutePad.app"],
        must_succeed: false
    # Reset stale TCC Accessibility entry so updated ad-hoc binary does not conflict
    run "/usr/bin/tccutil",
        args:         ["reset", "Accessibility", "com.fahrilpratama.MutePad"],
        must_succeed: false,
        print_stderr: false
  end

  zap trash: "~/Library/Preferences/com.fahrilpratama.MutePad.plist"
end
