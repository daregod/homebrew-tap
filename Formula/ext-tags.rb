class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.1/ext-tags_0.16.1_darwin_arm64.tar.gz"
      sha256 "d3e9a32e3c856fc1c79854fc16358bed165a9a620ddda88e8724158d36fb2257"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.1/ext-tags_0.16.1_darwin_amd64.tar.gz"
      sha256 "f6aece7dbb1f161ef9056a3ef5ea93d55bfbc3f3c707d9a370b6b6d9e3f7fee9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.1/ext-tags_0.16.1_linux_arm64.tar.gz"
      sha256 "fe99714b3eb0de79c4241318dd87e7e3a26b29f67dbf36d2b626e2d03a586fa9"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.16.1/ext-tags_0.16.1_linux_amd64.tar.gz"
      sha256 "f418e58dff911372099c6dae709662dfd06ad1c0fd525de7b222994328678203"
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
