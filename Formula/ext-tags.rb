class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.16.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.3/ext-tags_0.16.3_darwin_arm64.tar.gz"
      sha256 "928975848edaee34ee3eb94d0a6c88b7b47fc20bd8246ea83211bb8b07f32ef4"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.3/ext-tags_0.16.3_darwin_amd64.tar.gz"
      sha256 "5d4a71cf517f7bae2ee4b9214abf9d91ed5f0617a29c604fb05f072044a07efe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.3/ext-tags_0.16.3_linux_arm64.tar.gz"
      sha256 "38bce3e0e7a26483e703938245e963d647c26e57b0e2b74915eddd2bd9f1e10e"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.3/ext-tags_0.16.3_linux_amd64.tar.gz"
      sha256 "ce6dfe2a0a20887d1c2a68532f35f28f829db351f6d7ce568526d2508be2aa54"
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
