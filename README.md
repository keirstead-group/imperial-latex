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
   
 * `exam.cls` for creating exam scripts with and without solutions
 
## Other files

The package includes other files that you probably won't need to call
directly.  This includes the examples in the `doc` folder and the
following notable files.

 * `imperial-beamer-style.tex` gives configuration settings for Beamer
   presentations.
   
