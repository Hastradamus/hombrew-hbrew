class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.2.tar.gz"
  sha256 "c6330df3385018a6f4ac33e8a42843f026280589110c4ca2f7409c8c1c62580c"
  depends_on "ant" => :build
  depends_on :java
  def install
    system "ant", "compile", "jar"
    mv "snake.jar", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
