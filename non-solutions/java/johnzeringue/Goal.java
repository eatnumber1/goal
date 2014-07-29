/**
 * Not a real solution (duh) but an attempt to match the desired syntax as
 * closely as possible.
 */
public class Goal {
    public static String g(String s) {
        StringBuilder sb = new StringBuilder("g");
loop:
        for (int i = 0; ; i += 2) {
            switch (s.charAt(i)) {
                case ')':
                    sb.append('o');
                    break;
                case '\'':
                    sb.append("al");
                default:
                    break loop;
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(g("'al'"));       // prints "gal"
        System.out.println(g(")('al'"));     // prints "goal"
        System.out.println(g(")()('al'"));   // prints "gooal"
        System.out.println(g(")()()('al'")); // prints "goooal"
    }
}
