#!/usr/bin/ruby
def main(cp)
    pathToJRE = "./jre1.8.0_131.jre/Contents/Home/bin/"
    if ARGV.length == 0
        system("javac -cp #{cp} *.java")
        return
    end
    if ARGV.include?("test")
        system("javac -cp #{cp} *.java")
        system("rm *.class")
    end
    if ARGV.include?("compile")
        system("javac -cp #{cp} *.java")
    end
    if ARGV.include?("jar")
        system("javac -cp #{cp} *.java")
        system("jar cfm snake.jar Manifest.txt *.class")
        system("rm *.class")
        return
    end
    if ARGV.include?("run")
        system("javac -cp #{cp} *.java")
        system("java -cp #{cp} Snake")
        return
    end
    if ARGV.include?("jrun")
        system("java -cp #{cp} Snake")
    end
    if ARGV.include?("osec")
        system("java -cp snake.jar:.:jasypt-1.9.2.jar OldScoreEncrypt")
    end
    if ARGV.include?("runlocal")
        #run local jre
        system("javac -cp #{cp} *.java")
        system("#{pathToJRE}java -cp snake.jar:.:jasypt-1.9.2.jar Snake")

    end
    if ARGV.include?("jrunlocal")
        system("#{pathToJRE}java -jar -cp snake.jar:.:jasypt-1.9.2.jar Snake")
    end

end
classpath = "./jasypt-1.9.2.jar:."
main(classpath)
