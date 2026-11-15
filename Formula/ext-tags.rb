class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.17.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.2/ext-tags_0.17.2_darwin_arm64.tar.gz"
      sha256 "82403c1ba6d74d4cc3274145dacdf186676edc5def8af8c23dc7b85031fbb0a4"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.2/ext-tags_0.17.2_darwin_amd64.tar.gz"
      sha256 "8c46ac4c2a7d34a244ea497934249c754a4be15255240ada805ea85d845960f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.2/ext-tags_0.17.2_linux_arm64.tar.gz"
      sha256 "4dfa7aaaba0cfe45800dc0a15de4d2eefad93049fb6cfa2c9e92636c6abbb054"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.17.2/ext-tags_0.17.2_linux_amd64.tar.gz"
      sha256 "d9b612f2f7d6c30570137fde00e0d99b585a3b6caee4f1f6394c32df8e028227"
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
