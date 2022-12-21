sub g ($append = 'o') {
    # &say calls .gist on its input. This wraps &g.gist to return "g..."
    # If we were using &print, .Str could've been used instead.
    my &gist = &g.can('gist')[0];
    once &gist.wrap: { 'g' }

    my $wrap-handle = &gist.wrap: {
        # Undo wraps after .gist is called.
        LEAVE $wrap-handle.restore;
        # Return the value of the last wrap + the new string.
        callsame() ~ $append
    }

    &g  # Return self
}

say g()('al');
say g()()()('al');
say g()()()()()()()()('al')('!');
say g('al');
