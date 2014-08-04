Just like the other entries, this is a cheap hack.

>PHP does not yet support a nested function dereferencing syntax (i.e. foo()()).
>This may change in the future should the Uniform Variable Syntax
>(https://wiki.php.net/rfc/uniform_variable_syntax) be accepted.

While this is technically true, PHP does (kind of) support unicode and unicode
supports the zero-width space. So this works:

```php
echo g().​().​().​().​('al');
```

And so does this (gg used because you can't have two different definitions of
g):

```php
echo gg()->​()->​()->​()->​('al');
```

If the Uniform Variable Syntax RFC passes then this solution will work as
expected, i.e.:

```php
echo g()()("al"); // will work once (if?) the UVS passes
```

Inspired by @kopiro's original efforts
