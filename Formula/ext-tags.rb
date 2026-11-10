class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.16.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.4/ext-tags_0.16.4_darwin_arm64.tar.gz"
      sha256 "60c4fe8ebe8200c87252c3191da0140ba18798df0ce608ec5c17f8ed0976c4ba"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.4/ext-tags_0.16.4_darwin_amd64.tar.gz"
      sha256 "5bfd09a4ca211da97b880cf188cfa025e0d9396206078b630b59e03bf57a6142"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.4/ext-tags_0.16.4_linux_arm64.tar.gz"
      sha256 "b768e7bb65c40bea9001d6c543ecba16b13cf6a1d5350af72d6dda72936eb4c1"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.4/ext-tags_0.16.4_linux_amd64.tar.gz"
      sha256 "cf249006c4268a407f7c251b99782c7e3e474bcf040bdd770606b8909d941f6d"
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
