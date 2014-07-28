import static java.lang.System.*;

/** The closest you can get to the g()()()('al') in vanilla Java */
public class Goalie {
    StringBuilder sb;

    Goalie() {
        out.println(g("al"));
        out.println(g()._("al"));
        out.println(g()._()._("al"));
        out.println(g()._()._()._("al"));
        out.println(g()._()._()._()._("al"));
    }

    public Goalie g(String... args) {
        sb = new StringBuilder("g");
        if (args.length > 0)
            sb.append(args[0]);
        return this;
    }

    public Goalie _(String... args) {
        sb.append(args.length == 0 ? 'o' : args[0]);
        return this;
    }

    public String toString() {
        return sb.toString();
    }

    public static void main(String[] args) {
        new Goalie();
    }
}