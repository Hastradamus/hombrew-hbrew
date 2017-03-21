class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.2.tar.gz"
  sha256 "fcfb8d20ff34717302c473ac4cc3f7e2a90cecd9ac0019fbb23cb77551a27b0b"
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
