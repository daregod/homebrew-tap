class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.0/ext-tags_0.16.0_darwin_arm64.tar.gz"
      sha256 "bf7c47b40a3e42a4e8ae78b6956fbf456fe53c09b4b2f87084d429038376cd65"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.0/ext-tags_0.16.0_darwin_amd64.tar.gz"
      sha256 "23c247bacfc64cfcada91562d0dd0b389922078e7542273a26d0f62ee360a397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.0/ext-tags_0.16.0_linux_arm64.tar.gz"
      sha256 "715dd02e4aeb574a67ab277f205a9536a4d938e783e6c879375f9d9b1ae9fe3e"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.0/ext-tags_0.16.0_linux_amd64.tar.gz"
      sha256 "705c1431f673a7fd7aeb8b1339f4257d09c408292a8b030075f7cf7413309281"
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
