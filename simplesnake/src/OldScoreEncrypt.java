import java.io.File;
import java.io.FileWriter; 
import java.util.Scanner;
import java.io.IOException;
import java.io.*;
import java.util.NoSuchElementException;
public class OldScoreEncrypt{

    public static void oldScoreEncrypt(String fileName){
        File scoreFile = new File(fileName);
        String fileContents;
        Scanner s;
        try{
            s = new Scanner(scoreFile);
        } catch(FileNotFoundException e){
            // do nothing
            System.out.println("File not found");
            return;
        }
        try{
            fileContents = s.next();
        } catch(NoSuchElementException e){
            System.out.println("the file didn't have anyting in it");
            scoreFile.delete();
            System.out.println("file deleted");
            return;
        }
        try{
            Integer.parseInt(fileContents);
        } catch(NumberFormatException e){
            //assume file is already encrypted
            System.out.println("file up to date");
            return;
        }
        WriteScore.init();
        try{
            PrintWriter p = new PrintWriter(scoreFile);
            String encyptedContents = WriteScore.textEncryptor.encrypt(fileContents);
            System.out.println(encyptedContents);
            p.println(encyptedContents);
            p.close();
        } catch(FileNotFoundException e){
            System.out.println("can't find file");
        }
    }

    public static final void main(String[] args){
        oldScoreEncrypt(WriteScore.saveLoc);
    }
}
