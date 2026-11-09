class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.1/ext-tags_0.15.1_darwin_arm64.tar.gz"
      sha256 "a78cc4889d3b8bbdb4d3a6ca5a480900a84b08aabe69c3bebe1592e21b042166"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.1/ext-tags_0.15.1_darwin_amd64.tar.gz"
      sha256 "ac3ad66403735c6abf6e38a9994dbf351163ed70e9feeee8263715cc90350669"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.1/ext-tags_0.15.1_linux_arm64.tar.gz"
      sha256 "7d5e8eb7db570af7592f7a4bb383949d420bde4f0d85d80af46a0c8f408d7fe4"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.1/ext-tags_0.15.1_linux_amd64.tar.gz"
      sha256 "fa8486c4d1d88677b59edcc1b58bebbd7977dc77ae969aac2f85ad48cb957337"
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
