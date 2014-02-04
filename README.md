Warning:
=======

You probably should make your life easier and use standard templates
your framework provides.  This is too hard for you (and me).


Dot\_Why
=======

My own personal way of doing templates.


Install:
=======

This is not worthy to be listed in gem repos, so you have to
install manually:

    gem install dot_why

    # === For rbenv users: ===
    rbenv rehash
    # ========================

    cd /my_templates/whatever
    dot_why Diet_Dot ./my_layout ./my_template

Note:
====

The layout and template files should have a `.rb` extension.

Support
======

You are on your own. I barely have time to add all the features
I want.


Template Guide
==============

* **section :sym do ... end**:
  Add something to a section.  Can be used multiple times.
  It accumulates the content in the block.

* **partial "path/to/file"**:
  Reads the file (*File.read*) and evals it.

* **partial "path/to/file/or/dir", "sub/path/to/file**:
  Uses the first argument as the starting point to find the
  template. The first argument can be a file (e.g. *__FILE__*)
  or dir. If it is a file, it will use the dir of the path (*File.dirname*).


