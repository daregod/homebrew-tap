class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.12.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.4/ext-tags_0.12.4_darwin_arm64.tar.gz"
      sha256 "2d159cb5ab5aff5bc7c0a702030046b29f46ad687b68bbaafa3288f780b7a534"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.4/ext-tags_0.12.4_darwin_amd64.tar.gz"
      sha256 "e90c6e984c619846729cce0dd158e7848d4a23803a6d2bcae44e8df90b74627d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.4/ext-tags_0.12.4_linux_arm64.tar.gz"
      sha256 "a6aeda23e2c4bab2adefd4ec5bbbd1221399f7488a389889e6c888d7f8e7fe57"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.4/ext-tags_0.12.4_linux_amd64.tar.gz"
      sha256 "71744dd7c3e85d4c782f479eb653a0f9f7c17a1dcceedb3b93e3eaaf997f1730"
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
