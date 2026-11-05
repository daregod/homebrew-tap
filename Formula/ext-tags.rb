class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.11.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.3/ext-tags_0.11.3_darwin_arm64.tar.gz"
      sha256 "04460d87e86ccd26e27a1688f573a1790d155adabb65a7540aa244a0406af1da"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.3/ext-tags_0.11.3_darwin_amd64.tar.gz"
      sha256 "8c0fe99bd3018040894ebca7f8071ecbfcb163f2c84367a2f0459843871cac8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.3/ext-tags_0.11.3_linux_arm64.tar.gz"
      sha256 "986d6c74edf0d51c9d550534f1cd021455337b67064c6d7a62545b48a9f2c054"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.3/ext-tags_0.11.3_linux_amd64.tar.gz"
      sha256 "c691fa3ec99df43305f1b5a6dae895bb222e819867c0fc825c576ea3e48a685a"
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
