class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.3/ext-tags_0.12.3_darwin_arm64.tar.gz"
      sha256 "5b6d8ddd3419bdb4d26d0218792dd2ffb680f721f746f061d9cdbaf79588a58a"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.3/ext-tags_0.12.3_darwin_amd64.tar.gz"
      sha256 "8edfae6e12d977eb8f7582d995ff8df4578427632ace4e3cdec3ea4e1ee2a7d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.3/ext-tags_0.12.3_linux_arm64.tar.gz"
      sha256 "c216f0e984655cde265c64c4824a27ddca11a1071f3618fbbc47862e2e69f28f"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.3/ext-tags_0.12.3_linux_amd64.tar.gz"
      sha256 "8e745f9da372600217b9bf065e3ce8f56301abe819d4b3158e506ac6cdd9f950"
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
