class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.16.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.5/ext-tags_0.16.5_darwin_arm64.tar.gz"
      sha256 "1e45ced8565cb37c32d750fbed1991ccb76045f6b1c550e648415001b76b45c3"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.5/ext-tags_0.16.5_darwin_amd64.tar.gz"
      sha256 "93800d57da09ca62e362e7d529a818da69bbf5ddd6762535f5844dccdb4319c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.5/ext-tags_0.16.5_linux_arm64.tar.gz"
      sha256 "c28b5e09585dc2843ae0292ed0840a65c5646eb9d38890305ceb3f3475b206d4"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.5/ext-tags_0.16.5_linux_amd64.tar.gz"
      sha256 "6aa6c84ff91c45e4ae165fd9244125dc6208a39842542123cfa497fa204887d6"
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
