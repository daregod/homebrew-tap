class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.2/ext-tags_0.12.2_darwin_arm64.tar.gz"
      sha256 "6e5b58c1216db6aa711de411c1a489fb8dad9331fc332470855a772a93d0e9ea"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.2/ext-tags_0.12.2_darwin_amd64.tar.gz"
      sha256 "b4a8eff57a6841be48005f5d75d95b64e6081208e86925357adf4e38d8387110"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.2/ext-tags_0.12.2_linux_arm64.tar.gz"
      sha256 "eaa231b1c66dc1518fa9f58da6a502ccc4d54bd50877ed14220afac8dbf472a5"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.2/ext-tags_0.12.2_linux_amd64.tar.gz"
      sha256 "0c55aed26878dcc361a26cf9c5dc8fc419dbe15f67d5368815cfd717554e306a"
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
