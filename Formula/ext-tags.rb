class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.2/ext-tags_0.11.2_darwin_arm64.tar.gz"
      sha256 "9925277f06bf20a31c6befb6f609228516b682205eebda2070859e4cf57a7057"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.2/ext-tags_0.11.2_darwin_amd64.tar.gz"
      sha256 "09780fa9c6cee5688eae7c232e89b844c33f5855d79f094588f21d669032838c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.2/ext-tags_0.11.2_linux_arm64.tar.gz"
      sha256 "580a98a80404f2ea4d13f9780e0a3965feedeff8e08679519a0d7d353627d620"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.11.2/ext-tags_0.11.2_linux_amd64.tar.gz"
      sha256 "b07d568b45f5e11e8eaba3928ee608fbe46efac19ea7ffbee662f302b49ee5a3"
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
