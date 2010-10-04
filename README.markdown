# README

## What Is It?

The Sinatra HTML5 Boilerplate is a [Sinatra](http://www.sinatrarb.com) application based on the [HTML5 Boilerplate](http://html5boilerplate.com/) to be
used for setting up a consistent base for rapid prototyping. I've implemeted the HTML and CSS in HAML and SASS and retained most elements from the boilerplate, 
but left out a few things that I don't need when prototyping. Specifically, I've left out:

* YUI profiler and profile viewer
* Asynchronus Google Analytics

The stylesheets are separated into <code>style, reset, base, handheld and print</code>. The <code>reset, base, handheld and print</code> stylesheets are imported into the
<code>style</code> SASS file so that the CSS can be logically separated, but are combined into a single stylesheet when served. In a production environment,
the stylesheets are also compressed.

## Additions

* I have included [Hashgrid](http://hashgrid.com/) to overlay a grid on the layout when using grid-based design. Read the [Hashgrid website](http://hashgrid.com)
  to find out how to configure Hashgrid for your grid setup.
* Some SASS mixins for CSS3 styles that I commonly use. These are found in <code>views/css/\_plugins.sass</code>. They create styles for gradients, box-shadows,
  border-radius and a few other helpful things. The styles incorporate the [CSS3Pie](http://css3pie.com/) behavior stylesheet in an attempt to consistently
  bring these features to Internet Explorer. Visit the [CSS3Pie website](http://css3pie.com) website for more information on how this is achieved.

## To-Do

* Create a before action to assign the correct CSS class (.ie8, .ie7, .ie6, etc.) to the <code>\<html\></code> tag.

## Project Info

The Sinatra HTML5 Boilerplate is hosted on Github: http://github.com/curthasselschwert/sinatra-html5-boilerplate, where your contributions, forkings, comments and feedback are greatly welcomed.

Copyright &copy; 2010 Curt Hasselschwert, released under the MIT license.


