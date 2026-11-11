class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.16.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.6/ext-tags_0.16.6_darwin_arm64.tar.gz"
      sha256 "a7f76ba9309058d8fa4c1e8e455c09e93a49214fe2d6abcb4769f43b191339b5"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.6/ext-tags_0.16.6_darwin_amd64.tar.gz"
      sha256 "f1181f8bbab1bec4fba65761cee836dfb067b2578e81bf5ca64b0cbbc81265a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.6/ext-tags_0.16.6_linux_arm64.tar.gz"
      sha256 "501ce1fa4696393ae5d3470a92e09f371f5dd7bbd72a72571d10d10383cfd4cc"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.6/ext-tags_0.16.6_linux_amd64.tar.gz"
      sha256 "c7ed9f19cb62a15ad097f3806a5f242bb03ca1dab1bc03dfe1d5f17c73e1ddb4"
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
