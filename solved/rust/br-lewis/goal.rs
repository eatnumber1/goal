#![feature(fn_traits)]
#![feature(unboxed_closures)]

fn main() {
    // g is moved on each call
    let g = Goal::new();
    println!("{}", g("al"));
    let g = Goal::new();
    println!("{}", g()("al"));
    let g = Goal::new();
    println!("{}", g()()()("al"));
    let g = Goal::new();
    println!("{}", g()()()()()()("al"));
}

struct Goal(String);

impl Goal {
    fn new() -> Self {
        Self("g".to_owned())
    }
}

impl FnOnce<()> for Goal {
    type Output = Goal;

    extern "rust-call" fn call_once(self, _args: ()) -> Self::Output {
        Goal(self.0 + "o")
    }
}

impl FnOnce<(&str,)> for Goal {
    type Output = String;

    extern "rust-call" fn call_once(self, args: (&str,)) -> Self::Output {
        self.0 + args.0
    }
}
