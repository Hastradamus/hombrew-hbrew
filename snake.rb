class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.3.tar.gz"
  sha256 "5d1f9384f3ebfe3f1f61afdfc37f87336e93fda9b4caf3a1f560ceb118550aaf"
  def install
    system "ruby", "build.rb", "osec"
    mv "*.jar", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
