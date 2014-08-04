public class JavaSolutionish {
    public static String getVal(String param) {
        return param.replaceAll("\\(\\)", "o").replaceAll("\\('al'\\)", "al");
    }

    public static void main(String[] args) {
        System.out.println(getVal("\u0022+"g('al')"+\u0022"));
        System.out.println(getVal("\u0022+"g()('al')"+\u0022"));
        System.out.println(getVal("\u0022+"g()()('al')"+\u0022"));
        System.out.println(getVal("\u0022+"g()()()('al')"+\u0022"));

        //g()('al) is NOT a string literal in source! v = string, + = not string
        //                        vvvvvvvvv+++++++++vvvvvvvvv
        System.out.println(getVal("\u0022+"g()('al')"+\u0022"));

        //The reason this works is because java compiler converts UTF-8 *before* compiling
        //                          vv+vvvvvvvvvvv+vv
        //System.out.println(getVal(""+"g()('al')"+""));
    }
}
