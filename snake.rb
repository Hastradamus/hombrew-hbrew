class HomebrewHbrew < Formula
  desc "A simple snake game written in pure Java"
  homepage "http://pages.iu.edu/~hasahmed/snake/"
  url "https://github.com/hasahmed/homebrew-hbrew/releases/download/2.0.0/simplesnake.tar.gz"
  sha256 "9886f049310dbcd6516b3bda081a082b7c86880251972f32a6b190bd3384257b"
  def install
    mv "Simple Snake.app", "/Applications"
  end

  test do
    system "true"
  end
end
