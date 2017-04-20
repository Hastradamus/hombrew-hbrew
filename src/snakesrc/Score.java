import java.awt.*;
import java.io.*;
import javax.swing.*;
import java.util.Scanner;
import org.jasypt.util.text.BasicTextEncryptor;
import java.util.NoSuchElementException;

class Score{
  Color textColor = Color.WHITE;
  private Integer scoreNum = 0;
  Point pos = new Point(10, 409);
  String scoreText = "SCORE: " + scoreNum;
  
  Score(int x, int y, Color c, int incVal){
    this.pos.x = x;
    this.pos.y = y;
    this.textColor = c;
  }
  
//default constructor
  Score(){}
  
  void draw(Graphics g){
    g.setColor(textColor);
//    g.setFont(new Font("TimesRoman", Font.PLAIN, 10));
    g.setFont(new Font("AndaleMono", Font.PLAIN, 10));
    g.drawString(this.scoreText, this.pos.x, this.pos.y);
  }
  void addTo(){
    scoreNum++;
    scoreText = "SCORE: ".concat(scoreNum.toString());
  }
  Integer getScore(){
    return this.scoreNum;
  }
}
class WriteScore{
    private static Point GAMEOVER_LOC = new Point(140, 200);
    private static String OS = System.getProperty("os.name").toLowerCase();
    public static String saveLoc = "/Users/" + System.getProperty("user.name").concat("/.shs");
    public static File scoreFile = new File(saveLoc);
    static boolean newHighScore = false;




    //text encryptor
    private static String encryptionPassword = "wha55up";
    private static BasicTextEncryptor textEncryptor = new BasicTextEncryptor();


    static void init(){
        textEncryptor.setPassword(encryptionPassword);
        try{
            if (!scoreFile.exists()){
                scoreFile.createNewFile();
                PrintWriter println = new PrintWriter(scoreFile);
                println.print(textEncryptor.encrypt("0"));
                println.close();
            }
        }
        catch(IOException e){
            System.out.println(e.getMessage());
        }
    }

    static void writeToFile(String score){
        try{
            Scanner scannie = new Scanner(scoreFile);
            String currentScore = textEncryptor.decrypt(scannie.next());
                if (Integer.parseInt(score) > Integer.parseInt(currentScore)){

                    ///////text encryptor
                    PrintWriter printLn = new PrintWriter(scoreFile);
                    printLn.println(textEncryptor.encrypt(score));
                    printLn.close();
                    scannie.close();
                    newHighScore = true;
                }
                else newHighScore = false;        }
        catch(FileNotFoundException e){
            e.printStackTrace();
            try{
                scoreFile.createNewFile();
                String currentScore = "0";
                PrintWriter printLn = new PrintWriter(scoreFile);
                printLn.printf("%s\n", textEncryptor.encrypt(currentScore));
                printLn.close();
                if (Integer.parseInt(score) > Integer.parseInt(currentScore)){
                    printLn.printf("%s\n", textEncryptor.encrypt(score));
                    printLn.close();
                    newHighScore = true;
                    }
                else newHighScore = false;
            }
            catch(IOException f){
                System.out.println(f.getMessage());
            }
        }
    }
    
    static void drawNewHighScoreMessage(Graphics g, Integer oldHighScore, Integer snakeLength){
        try {
            Scanner scannie = new Scanner(scoreFile);
            String currentScore = textEncryptor.decrypt(scannie.next());
            String highScoreString = "NEW HIGH SCORE: ".concat(currentScore);
            scannie.close();
            Graphics2D g2 = (Graphics2D)g;
            g2.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING,RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
            Point hsp = new Point(77, 200); //highscore placement
            Font saveFont = g.getFont();
            g.setFont(new Font("Courier New", Font.BOLD, 25));
            g.setColor(Color.RED);
            g2.drawString(highScoreString, hsp.x, hsp.y);
            g.setColor(Color.BLACK);
            g.drawString(highScoreString, hsp.x + 1, hsp.y + 1);
            g.setFont(new Font("AndaleMono", Font.BOLD, 15));
            g.setFont(saveFont);
            g.setColor(Color.WHITE);
            g.drawString("The old high score was ".concat(oldHighScore.toString()), 130, hsp.y + 15);
            g.drawString("The final snake length was ".concat(snakeLength.toString()), 120, hsp.y + 30);
            g.drawString("Press R to restart", 148, 275);
            newHighScore = false;
        }
        catch(FileNotFoundException e){
            try{
                e.printStackTrace();
                scoreFile.createNewFile();
                String currentScore = "0";
                String highScoreString = "NEW HIGH SCORE: ".concat(currentScore);
                Font saveFont = g.getFont();
                g.setFont(new Font("AndaleMono", Font.BOLD, 15));
                g.setColor(Color.RED);
                g.drawString(highScoreString, 130, 200);
                g.setFont(new Font("AndaleMono", Font.BOLD, 15));
                g.setColor(Color.BLACK);
                g.drawString(highScoreString, 131, 201);
                g.setFont(saveFont);
                g.setColor(Color.WHITE);
                g.drawString("The old high score was ".concat(oldHighScore.toString()), 130, 215);
                g.drawString("The final snake length was ".concat(snakeLength.toString()), 120, 260);
                g.drawString("Press R to restart", 148, 275);
                newHighScore = false;
                }
                catch(IOException f){
                    f.printStackTrace();
                }
        }
    }




//draws
    
    static void drawNoHighScore(Graphics g, Integer currentGameScore, Integer highScore, Integer snakeLength){
        g.setColor(Color.WHITE);
        Font saveFont = g.getFont();
        g.drawString("Your score ".concat(currentGameScore.toString()), GAMEOVER_LOC.x + 22, GAMEOVER_LOC.y + 20);
        g.drawString("Current High Score ".concat(highScore.toString()), GAMEOVER_LOC.x - 10, GAMEOVER_LOC.y + 35);
        g.drawString("Final Snake Length ".concat(snakeLength.toString()), GAMEOVER_LOC.x -10, GAMEOVER_LOC.y + 50);
        g.drawString("press R to restart", GAMEOVER_LOC.x, GAMEOVER_LOC.y + 85);
        g.setColor(Color.RED);
        g.setFont(new Font("Courier New", Font.BOLD, 25));
        Graphics2D g2 = (Graphics2D)g;
        g2.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING,RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        g2.drawString("GAME OVER", GAMEOVER_LOC.x - 15, GAMEOVER_LOC.y);
        g.setFont(saveFont);
    }

    static int getScoreFromFile(){
        int i = 0;
        String fileContents;
        try{
            Scanner scannie = new Scanner(scoreFile);
            try{
            fileContents = scannie.next(); 
            i = Integer.parseInt(textEncryptor.decrypt(fileContents));
            } catch(NoSuchElementException e){
                PrintWriter p = new PrintWriter(scoreFile);
                p.println(textEncryptor.encrypt("0"));
                p.close();
                return 0;
            }
            scannie.close();
            return i;
        }
        catch(FileNotFoundException e){
            System.out.println("file .shs not found");
        }
        return -1;
    }
    
    static boolean initializeScoreFile(File f){
        try{
        PrintWriter p = new PrintWriter(f);
        p.println(textEncryptor.encrypt("0"));
        p.close();
        return true;
        } catch(FileNotFoundException e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    static void oldScoreEncrypt(File f){
        String fileContents;
        FileWriter fwriter;
        Scanner s;
        PrintWriter p;
        try{
            s = new Scanner(f);
            p = new PrintWriter(f);
        } catch(FileNotFoundException e){
            System.out.println("file not found");
            return;
        }

        try{
            fileContents = s.next();
        } catch(NoSuchElementException e){
            e.printStackTrace();
            System.out.println(saveLoc);
            System.out.println(222 + " there was nothing in the file");
            return;
        }
        fileContents = textEncryptor.encrypt(fileContents);
        p.println(fileContents);
        s.close();
        p.close();




        /*
        try{
            fwriter = new FileWriter(f, true);
            } catch(IOException e){
                System.out.println("there was another error!!!!");
                return;
            }
            PrintWriter p = new PrintWriter(fwriter);
            try{
                File file = new File(f);
                s = new Scanner(file);
            } catch(FileNotFoundException e){
                System.out.println("the file was not found");
                return;
            }
            try{
                fileContents = s.next(); //get file contents
                System.out.println(fileContents);
                p.println(textEncryptor.encrypt(fileContents)); // rewrite the file contents back to the file but encrypted this time
                p.close(); //close PrintWriter
            } catch(NoSuchElementException e){
                System.out.println("there is nothing in the file");
                return;
                // do nothing as there is nothing the file
                // and initializeScoreFile(File f) will take care of it
            }
            */
    }

    static boolean isWindows() {
        return (OS.indexOf("win") >= 0);
    }
    
    static boolean isMac() {
        return (OS.indexOf("mac") >= 0);
    }
    static boolean isUnix() {
        return (OS.indexOf("nix") >= 0 || OS.indexOf("nux") >= 0 || OS.indexOf("aix") > 0 );

    }    
}
