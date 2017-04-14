class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.3.tar.gz"
  sha256 "bd4d42e841c5b3e4989562f1be2376226f1c80bae30f57a6cb545c93a2e507c0"
  depends_on :java
  def install
      system "ruby", "build.rb", "compile", "jar"
    mv "snake.jar", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
