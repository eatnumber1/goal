// only 46 characters using JavaScript 1.8 expression closures
// only supported by Firefox 3+
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/New_in_JavaScript/1.8#Expression_closures_(Merge_into_own_page.2Fsection)
// credits for the => syntax go to /u/inmatarian
// http://www.reddit.com/r/programming/comments/2btrvt/gal/cj97o5f

g=(a,o)=>a?'g'+(o||'')+a:(a)=>g(a,(o||'')+'o')

console.log(g('al'));
console.log(g()('al'));
console.log(g()()('al'));
