class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.3.tar.gz"
  sha256 "e3e3535e47134c4712117dd5c2897e4d91582d8f57fb4aa90b29eff87c26bb4d"
  depends_on :java
  def install
    system "ruby", "build", "compile", "jar"
    mv "snake.jar", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
