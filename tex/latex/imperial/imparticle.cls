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

% For the headers
% http://tex.stackexchange.com/questions/37868/fancyhdr-and-memoir
\let\footruleskip\undefined % To avoid clash with memoir
\RequirePackage{fancyhdr}
\fancypagestyle{titlepage}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[R]{\ifthenelse{\boolean{useVC}}{%
    \IfFileExists{\vcfile}{%
      \input{\vcfile}\noindent\textcolor{gray}{\ttfamily\footnotesize Version~\VCRevision}}{%
      \textcolor{red}{\vcfile\ missing}%
      \ClassWarning{\vcfile missing}}}{}
}
}


% Make the title page
\newcommand{\titlefont}{\bfseries\Huge\sffamily\color{ImperialBlue}}
\renewcommand{\maketitle}{%
  \thispagestyle{titlepage}
  \noindent{\titlefont \@title}\par
  \vskip 2em 
  \noindent\Large\@author\\%
  \@date\par
  \vskip 1em  
  \normalsize\normalfont
}

\counterwithout{section}{chapter}
\setsecnumdepth{subsection}
\let\chapter\section