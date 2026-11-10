class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.16.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.2/ext-tags_0.16.2_darwin_arm64.tar.gz"
      sha256 "064a028980885b15314d9d6de55e5efae46d23f62459e11dc335c753340d8015"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.2/ext-tags_0.16.2_darwin_amd64.tar.gz"
      sha256 "8bc2ba57e383dbad0989eea0596e092c6e1b6156d7b27f0a80c2d44d75dca105"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.2/ext-tags_0.16.2_linux_arm64.tar.gz"
      sha256 "2d472a359d616401fa9e6ad27c5e6b3fc6cff6234d2194aefee8ab2bee0b6748"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.2/ext-tags_0.16.2_linux_amd64.tar.gz"
      sha256 "ef4d15db81da03ce80a0149fe0ad483fdbe691ff0e6856660d3b42221d6fcf45"
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
