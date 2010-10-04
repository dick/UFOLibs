# README

The Sinatra HTML5 Boilerplate is a [Sinatra](http://www.sinatrarb.com) application based on the [HTML5 Boilerplate](http://html5boilerplate.com/) to be
used for setting up a consistent base for rapid prototyping. I've implemeted the HTML and CSS in HAML and SASS and retained most elements from the boilerplate, 
but left out a few things that I don't need when prototyping. Specifically, I've left out:

* YUI profiler and profile viewer
* Asynchronus Google Analytics

The stylesheets are separated into <code>style, reset, base, handheld and print</code>. The <code>reset, base, handheld and print</code> stylesheets are imported into the
<code>style</code> SASS file so that the CSS can be logically separated, but are combined into a single stylesheet when served. In a production environment,
the stylesheets are also compressed.

I have included [Hashgrid](http://hashgrid.com/) to overlay a grid on the layout when using grid-based design. Read the [Hashgrid website](http://hashgrid.com)
to find out how to configure Hashgrid for your grid setup.
