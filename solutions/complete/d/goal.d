// Run with:
//    rdmd goal.d
// NOte: tested with dmd v2.056 only
 
module goal;

import std.stdio : writeln;
import std.array : appender;

void main() {

    auto g = (function() {

        class Goal {
        private:
            size_t callCount = 0;
        public:
            Goal opCall()() {
                callCount++;
                return this;
            }
            auto opCall(T = string)(T suffix) {
                auto res = appender!string();
                res.put("g");
                foreach (i; 0..callCount) {
                    res.put("o");
                }
                callCount = 0;
                res.put(suffix);
                return res.data;
            }
        }

        return new Goal();
    })();

    writeln(  g("al")  );
    writeln(  g()("al")  );
    writeln(  g()()("al")  );
    writeln(  g()()()("al")  );
    writeln(  g()()()()()()()()()()()("al")  );
}
