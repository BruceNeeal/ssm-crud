import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * @author bruce
 * @date 02/06/2020 - 11:51
 */
public class LeetCodeTest {
    public static void main(String[] args) throws IOException {
        LeetCodeTest leetCodeTest = new LeetCodeTest();
        
    }

    public String convert(String s, int numRows) {
        if (numRows <= 1) return s;
        int len = Math.min(s.length(),numRows);
        StringBuilder[] stringBuilders = new StringBuilder[len];
        for (int i = 0; i < len ; i++)
            stringBuilders[i] = new StringBuilder();
        int curRow = 0;
        boolean goingDown = false;
        for (int i=0;i<s.length();i++) {
            stringBuilders[curRow].append(s.charAt(i));
            if (curRow == 0 || curRow == numRows - 1) goingDown = !goingDown;
            curRow += goingDown ? 1 : -1;
        }
        StringBuilder ret = new StringBuilder();
        for (int i = 0; i < len; i++) {
            ret.append(stringBuilders[i]);
        }
        return ret.toString();
    }
}