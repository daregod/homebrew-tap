class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.12.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.5/ext-tags_0.12.5_darwin_arm64.tar.gz"
      sha256 "1c5ec9511e90b0fbeca94a5ffb3f35e300876221f2b367c89e5ec33444dca4e6"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.5/ext-tags_0.12.5_darwin_amd64.tar.gz"
      sha256 "9a9b79c337e49557bc553be205ac32c0d1e9730f275e63aa8ab6931537c6bd86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.5/ext-tags_0.12.5_linux_arm64.tar.gz"
      sha256 "6330cdbbbf9c5ff3c240d9a4c93a88eece4fe1697d491711307e37b88f969090"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.5/ext-tags_0.12.5_linux_amd64.tar.gz"
      sha256 "a53eb5c431d7fd10fba2d84bf4361f708047b07ae6605b0c88f0e57c71f9be01"
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
