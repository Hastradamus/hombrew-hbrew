import java.io.File;
public class OldScoreEncrypt{
    public static final void main(String[] args){
        WriteScore.init();
        File f = new File("./test");
        WriteScore.oldScoreEncrypt(f);
        //WriteScore.oldScoreEncrypt(WriteScore.scoreFile);
    }
}
