import java.io.*;
import java.io.File;

public class Assembler {

    public static File openFile(int program_num){
        File file = null;
        switch (program_num) {
            case 1:
                file = new File("C:\\Users\\qq227\\Desktop\\program1.txt");
                break;
            case 2:
                file = new File("C:\\Users\\zhz049\\Desktop\\CSE-141L\\program2_no_label.txt");
                break;
            case 3:
                file = new File("C:\\Users\\qq227\\Desktop\\program3.txt");
                break;
            case 4:
                file = new File("C:\\Users\\zhz049\\Desktop\\CSE-141L\\complete_program.txt");
                break;
            default:
                System.out.println("no such program!");
        }
        return file;
    }

    public static String convertOperand(String op1, String op2, int num_bits, boolean im_used){
        StringBuilder sb = new StringBuilder();
        String temp = Integer.toBinaryString(Integer.parseInt(op1.substring(1,2)));
        int padding_length = 2-temp.length();
        if(num_bits==6) padding_length+=1;
        for(int i=0;i<padding_length;i++){
            sb.append(0);
        }
        sb.append(temp);
        if(im_used){
            temp = Integer.toBinaryString(Integer.parseInt(op2.substring(0,1)));
        }else {
            temp = Integer.toBinaryString(Integer.parseInt(op2.substring(1,2)));
        }
        padding_length = 3-temp.length();
        for(int i=0;i<padding_length;i++){
            sb.append(0);
        }
        sb.append(temp);
        return sb.toString();
    }

    public static String convertLine(String s){
        StringBuilder s_out = new StringBuilder();
        String temp = null;
        String[] arrOfStr = s.split("[\\s,]+");
        String opcode = arrOfStr[0].toLowerCase();
        switch (opcode){
            case "add":
                s_out.append("1100");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, false));
                break;
            case "xor":
                s_out.append("1101");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, false));
                break;
            case "pm":
                s_out.append("1011");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, false));
                break;
            case "cpy":
                s_out.append("1111");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, false));
                break;
            case "lsl":
                s_out.append("1001");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, true));
                break;
            case "lsr":
                s_out.append("1010");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, true));
                break;
            case "beqr":
            case "beq":
                s_out.append("1110");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, false));
                break;
            case "addi":
                s_out.append("1000");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],5, true));
                break;
            case "move":
            case "mov":
                s_out.append("000");
                int offset = Integer.parseInt(arrOfStr[1]);
                if(offset<0){
                    temp = Integer.toBinaryString(offset);
                    //System.out.println(temp.length());
                    s_out.append(temp.substring(26));
                }else {
                    temp = Integer.toBinaryString(offset);
                    int padding_length = 6-temp.length();
                    for(int i=0;i<padding_length;i++){
                        s_out.append(0);
                    }
                    s_out.append(temp);
                }
                break;
            case "lw":
                s_out.append("001");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],6, false));
                break;
            case "sw":
                s_out.append("010");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],6, false));
                break;
            case "rxor":
                s_out.append("011");
                s_out.append(convertOperand(arrOfStr[1],arrOfStr[2],6, false));
                break;
            default:
                System.out.println("invalid operation: "+arrOfStr[0]);
        }
        return s_out.toString();
    }

    public static void main(String[] args) throws Exception{
        File file = openFile(4);
        BufferedReader br = new BufferedReader(new FileReader(file));

        File myObj = new File("C:\\Users\\zhz049\\Desktop\\CSE-141L\\machine_code_all.txt");
        if (myObj.createNewFile()) {
            System.out.println("File created: " + myObj.getName());
        } else {
            System.out.println("File already exists.");
        }
        String s = null;
        FileWriter myWriter = new FileWriter("C:\\Users\\zhz049\\Desktop\\CSE-141L\\machine_code_all.txt");
        while ((s = br.readLine()) != null){
            myWriter.write(convertLine(s)+"\n");
        }
        myWriter.close();
        br.close();
        //System.out.println(convertLine("lsl R1 , 3"));
    }
}

