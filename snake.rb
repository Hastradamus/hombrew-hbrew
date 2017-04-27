class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.4.tar.gz"
  sha256 "3d6ee2d67a489993f9b04730017f0cdba2efa8b7bc71cc54924ea695c9f27378"

  jre = "jre1.8.0_131.jre"
  jas = "jasypt-1.9.2.jar"
  snakejar = "snake.jar"

  def install
    ohai "#{prefix}"
    bin.install "snake"
    system "ruby", "build.rb", "osec"
    system "ruby", "build.rb", "extractjre"
    mv "snake.jar", "#{prefix}/"
    mv "jasypt-1.9.2.jar", "#{prefix}/"
    mv "jre1.8.0_131.jre", "#{prefix}/"
    mv "snake.jar", "#{prefix}/"
  end
  test do
    #system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
