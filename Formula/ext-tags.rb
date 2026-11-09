class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.0/ext-tags_0.14.0_darwin_arm64.tar.gz"
      sha256 "6aa69d34bca1d03518eb02b1140ce98d61949076c47c24ba3815ecbc49543f93"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.0/ext-tags_0.14.0_darwin_amd64.tar.gz"
      sha256 "d1f58e4f2c98d86fa934cd322508f1fbd40f6f30a862804a8144de766b35f29a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.0/ext-tags_0.14.0_linux_arm64.tar.gz"
      sha256 "cf775f2f142dbbb037f455674348522f9a8c15ae956c6ac25069a94625ca14c4"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.14.0/ext-tags_0.14.0_linux_amd64.tar.gz"
      sha256 "c042214aa8f42a829f2da4cbcb8d376e5ca5094b3febb2618d47e2d8ae70c9e3"
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
