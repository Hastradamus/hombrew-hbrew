class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.3.tar.gz"
  sha256 "8e35203f41bea7476334fb761e5a616c5a58f3472ebac706ffd4a0abf454cd87"
  def install
    system "ruby", "build.rb", "osec"
    mv "*.jar", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
