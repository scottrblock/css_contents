CSS Contents
============

Generate CSS Table of Contents

What is this and why would I use it?
------------------------------------
Maintaining large CSS files is a pain. This might help make that process just a little bit easier. This is designed for rails 3.1+ and scss files in the asset folder

Install
-------
If you wanna try this out, just put the following in your Gemfile and run bundle install. I'll get it up on rubygems soon! Also, sorry if I break it.
  
	gem 'css_contents', :git => 'git@github.com:scottrblock/css_contents.git'
    
Setup
-----
Once installed, add

	//commentify

in any scss file where you want your table of contents to be generated.  Then, throughout your scss file, indicate new chapters using:

	//chapter whatever your heard desires

**You need to include the keyword chapter for this to work!**

Usage
-----
Once your scss files are ready to go, run the following rake command to generate the table of contents awesome-sauce:

	rake css_contents:commentify

_If someone knows how to make this work with a deployment process, feel free to fork, add and pull request!_