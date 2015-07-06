# tex4ht support for pgfmanual

We don't use built-in tikz support for svg, because it doesn't support advanced
text options and math. Instead, externalization is used. But it doesn't work
correctly with code examples, so they are extracted using Lua and converted on
their own.

Needed tools:

    pdf2svg
    pdfcrop

compilation:

    make pdf
    ./extract-examples
    make


