# LaTeX styles for Imperial College

This package contains a series of style and class files for creating
LaTeX documents with a consistent look-and-feel for Imperial College.
The sections below list the high-level files that users can call
directly in their LaTeX documents.  

## Style files

 * `imperial-common.sty` contains common settings for fonts, colors,
   and so on.

 * `imperial-conference.sty` for conference presentations.  This
   should be loaded with `\usepackage` in both the slides and notes
   versions of a presentation.  Please see the `doc` folder for
   examples.

## Class files
 
 * `impletter.cls` based on a 2003 template for Imperial College
   letters, updated with a simpler user interface and consistency with
   `imperial-common.sty`.
   
 * `impexam.cls` for creating exam scripts with and without solutions.
 
 * `impreport.cls` for reports with an Imperial College logo on the
   front page and matching colour scheme and typography.  This uses
   the memoir package.
 
 * `imparticle.cls` for articles, including knitr documents.  This
   class is also based on the memoir package using the `article` and
   `oneside` options.  To avoid any confusion, the `\chapter` command
   is redefined to be `\section`.
 
Note that `impreport`, `imparticle`, and `imperial-conference` all
have support for displaying version control information.  To use this
feature, you must manually run the version control script,
e.g. `vc.sh` to populate the `vc.tex` file with appropriate values.
The `vc` option then needs to be turned on to display the information.
It assumes that the `vc.tex` is in the same directory as the main
document; however this can be changed by redefining the `\vcfile`
command.
 
## Other files

The package includes other files that you probably won't need to call
directly.  This includes the examples in the `doc` folder and the
following notable files.

 * `imperial-beamer-style.tex` gives configuration settings for Beamer
   presentations.
   
