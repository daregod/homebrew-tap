class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.1/ext-tags_0.14.1_darwin_arm64.tar.gz"
      sha256 "355199874ed7a691923ac29076a8acff5b7d437aaee266d36df1c743b5b688c1"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.1/ext-tags_0.14.1_darwin_amd64.tar.gz"
      sha256 "7c833db063fa3a698e287e2a1750dd55ca05a74a15fad6b99252c284e716d1e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.1/ext-tags_0.14.1_linux_arm64.tar.gz"
      sha256 "0fa0c828cea59fa1fc4eeb650eb9c5f3acf9e2696885db8cc566aa7e9706a7a2"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.1/ext-tags_0.14.1_linux_amd64.tar.gz"
      sha256 "839b2b542ef9ebd808a933b3aea98a07d33d58486d48ebad33bca8dfaa69f6dd"
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
