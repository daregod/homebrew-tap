class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.1/ext-tags_0.17.1_darwin_arm64.tar.gz"
      sha256 "60b64c0ad721e368aa3fca39c13500605180eb61a37247fe577ec98e8224f89c"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.1/ext-tags_0.17.1_darwin_amd64.tar.gz"
      sha256 "7deca8ce9bd545bd83e723f6b577694ad9dd16e1a8b819e01ad340edb25dc451"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.1/ext-tags_0.17.1_linux_arm64.tar.gz"
      sha256 "ac04b6a75505ad98e22ace94c21e1c8ee17a739e4e2815154a9ed6fd9aadacac"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.1/ext-tags_0.17.1_linux_amd64.tar.gz"
      sha256 "bf3c67540082feb702f3abe2ebfe6ca24cd8b68e94a8c8ee622369dd1b765d3b"
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
