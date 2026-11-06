class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.0/ext-tags_0.12.0_darwin_arm64.tar.gz"
      sha256 "a243e00e59373c02ac68345bcef740fed58788c758af2f9a1eaef2812a7a8a8e"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.0/ext-tags_0.12.0_darwin_amd64.tar.gz"
      sha256 "f3bb7bd404dd14962990ee842c7e57c20be07af589a03ab139705fafb5fce17d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.0/ext-tags_0.12.0_linux_arm64.tar.gz"
      sha256 "d05195cbdd37178fa5772543b258a0af865154133f64647a50a2bafd36c55ab6"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.0/ext-tags_0.12.0_linux_amd64.tar.gz"
      sha256 "53884147e07728617fe3e432adde4fbd3c7d4a28533c6ff53f8c38e3b78e95af"
    end
  end

  def install
    binary = Dir["ext-tags_*"].first
    odie "ext-tags binary not found" if binary.nil?
    bin.install binary => "ext-tags"
  end

  test do
    assert_match "ext-tags", shell_output("#{bin}/ext-tags version")
  end
end
