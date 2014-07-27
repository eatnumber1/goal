import std.stdio;

void main ()
{
    writeln(g()("al"));
    writeln(g()()()("al"));
    writeln(g("al"));
    writeln(g()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()("al"));
}

struct G
{
    string data = "g";

    G opCall ()
    {
        this.data ~= 'o';
        return this;
    }

    string opCall (string data)
    {
        this.data ~= "al";
        return this.data;
    }
}


G g ()
{
    return new G().opCall();
}

string g (string data)
{
    return new G().opCall("al");
}
