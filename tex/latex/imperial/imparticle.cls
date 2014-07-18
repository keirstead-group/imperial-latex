% Template for Imperial College articles
% James Keirstead
% 18 July 2014

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{imparticle}[2014/07/18 Article template for Imperial college]

% Finally base the whole thing on the article class
\LoadClass[article, oneside]{memoir}

% Required packages
% This provides xcolor, graphicx
\RequirePackage{imperial-common}
\setsansfont{Seravek ExtraLight}

% Set up the solutions toggle
% Needed for later processing
\RequirePackage{ifthen}
\newboolean{useVC}
\setboolean{useVC}{false}

% Add an option to use version control
\DeclareOption{vc}{%
  \setboolean{useVC}{true}
  %% See vc manual to compile with xelatex --enable-write18
  \ifx\ifeof18
  \immediate\write18{vc.sh}
  \fi
  \newcommand{\vcfile}{vc.tex}
}%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

% For nice tables
\RequirePackage{booktabs}

% Caption styles
\captionnamefont{\bfseries\sffamily}
\captiondelim{\quad}
\hangcaption


% Make the title page
\renewcommand{\maketitle}{%
  \noindent{\bfseries\Huge\sffamily\textcolor{ImperialBlue}{\@title}}\par
  \vskip 2em 
  \noindent\Large\@author\\%
  \@date\par
  \vskip 1em  
  \ifthenelse{\boolean{useVC}}{%
    \input{\vcfile}\noindent Version~\VCRevision}{}      
  \normalsize\normalfont

}

\counterwithout{section}{chapter}
\setsecnumdepth{subsection}
\let\chapter\section