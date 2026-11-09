class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.13.0/ext-tags_0.13.0_darwin_arm64.tar.gz"
      sha256 "dae202c9c86630cc497c11d42087ad466912dd4b5d64ef8387141e9cef051904"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.13.0/ext-tags_0.13.0_darwin_amd64.tar.gz"
      sha256 "2968716496ca4947409e07abb938c4beeb201545480219d4c5f62441e3e7a0b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.13.0/ext-tags_0.13.0_linux_arm64.tar.gz"
      sha256 "58c7851e46c841fb9385b32b491cf087478b38daa8eaad4d64c97435a35aca4e"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.13.0/ext-tags_0.13.0_linux_amd64.tar.gz"
      sha256 "8db7b880b701c4a872c0eccc0cd6bd437cc6a1af1ea9e9721ef2d31bbcf30c2d"
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
