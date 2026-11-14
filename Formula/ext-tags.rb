class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.0/ext-tags_0.17.0_darwin_arm64.tar.gz"
      sha256 "cc78b89d5ae361f62bc03a98f0294d3f12ec848539fe25c8c1bfbffc51825dae"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.0/ext-tags_0.17.0_darwin_amd64.tar.gz"
      sha256 "1df92fd9bae4f96bcc3dfaa8e82f5101eb5d8511c5f00f396ef7ee3bd4880843"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.0/ext-tags_0.17.0_linux_arm64.tar.gz"
      sha256 "23bd8cf5dfe9dc042fe2f4a4b78ac6e87cfab33a627ba1a8f87277583360392c"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.0/ext-tags_0.17.0_linux_amd64.tar.gz"
      sha256 "72e6b90a25d363470a7ef651a06962eac2211e96e543c2239f48691a046d33d0"
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
