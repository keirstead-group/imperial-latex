% Imperial College London report
% James Keirstead, July 2014

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{impreport}[2014/07/16 Imperial College report]

\LoadClass[a4paper]{memoir}

% Needed for later processing
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\newboolean{useVC}
\setboolean{useVC}{false}

% Add an option to use version control
\DeclareOption{vc}{%
  \setboolean{useVC}{true}
  %% See vc manual to compile with xelatex --enable-write18
  \ifx\ifeof18
  \immediate\write18{vc.sh}
  \fi
}%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

%\ifxetex
%  \RequirePackage{fontawesome}
%\else
%  \newcommand{\faPhone}{Tel}
%  \newcommand{\faEnvelope}{}
%\fi

% Load last because it has the hyperref loading in it
\RequirePackage{imperial-common}
% This will set the basic fonts but I want to tweak them
\setmainfont[Mapping=tex-text]{Book Antiqua}
\setsansfont[Mapping=tex-text]{Seravek ExtraLight}

% Declare the title font
\newcommand{\imptitlefont}{\color{ImperialBlue}\sffamily}

% Define a subtitle command
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\@logo}{\imperiallogo}
\newcommand{\logo}[1]{\renewcommand{\@logo}{#1}}
\newcommand{\@reporturl}{}
\newcommand{\reporturl}[1]{\renewcommand{\@reporturl}{#1}}
\newcommand{\@funding}{}
\newcommand{\funding}[1]{\renewcommand{\@funding}{#1}}
\newcommand{\vcfile}{vc.tex}
\newcommand{\@twitter}{}
\newcommand{\twitter}[1]{\renewcommand{\@twitter}{#1}}
\RequirePackage{etoolbox}

% Then the title page style
% Then the title page style
\newlength{\rightshift}
\setlength{\rightshift}{20em}
\pretitle{\Huge \imptitlefont\bfseries}
\posttitle{\par\noindent\color{black}\normalfont\LARGE\sffamily\@subtitle\par\vskip 20em}
\preauthor{\Large\sffamily}
\postauthor{\par}
\predate{\Large\noindent\sffamily}
\postdate{}
\renewcommand{\maketitlehooka}{%
  \vskip -6em
  \noindent\includegraphics[width=2in]{\@logo}
  \vskip 10em
  \noindent}
\renewcommand{\maketitlehookb}{\hskip \rightshift}
\renewcommand{\maketitlehookc}{\hskip \rightshift}
\renewcommand{\maketitlehookd}{\vskip 4em%
    \hskip \rightshift%
  \begin{minipage}[t]{0.5\textwidth}%
      \sffamily\small%
      \ifdefempty{\@funding}{}{\@funding\par}
      \ifdefempty{\@reporturl}{}{\@reporturl\par} 
      \ifdefempty{\@twitter}{}{\@twitter\par}
      \vskip 2em
      \ifthenelse{\boolean{useVC}}{%
        \input{\vcfile}Version~\VCRevision}{}      
  \end{minipage}}

% Style of section headings
\chapterstyle{hangnum}
\addtodef\chapnumfont{}{\bfseries\Huge\imptitlefont}
\addtodef\chaptitlefont{}{\normalfont\Huge\imptitlefont}
\renewcommand{\printchaptername}{}
\setsecheadstyle{\Large\sffamily}
\setsubsecheadstyle{\large\sffamily}

% Headers and footers
\makepagestyle{plain}
\makeevenfoot{plain}{\sffamily\thepage}{}{}
\makeoddfoot{plain}{}{}{\sffamily\thepage}
\nouppercaseheads
\createmark{chapter}{left}{shownumber}{\sffamily\itshape}{\quad}
\createmark{section}{right}{shownumber}{\sffamily\itshape}{\quad}
\makeevenhead{headings}{\sffamily\leftmark}{}{}
\makeevenfoot{headings}{\sffamily\thepage}{}{}
\makeoddhead{headings}{}{}{\sffamily\rightmark}
\makeoddfoot{headings}{}{}{\sffamily\thepage}

% Caption styles
\captionnamefont{\bfseries\sffamily}
\captiondelim{\quad}
\hangcaption

% Hook for last page (unused)
%\AtEndDocument{%
%  \emptyclearpage
%  \ifthenelse{\isodd{\pageref{LastPage}}}{\null\emptyclearpage}{}}
%}


% Finally the hyperref settings
\RequirePackage{hyperref}
\hypersetup{draft=false,%
	bookmarks=true,%
	pageanchor=true,%
	bookmarksnumbered=true,	%
        bookmarksopen=false,%
	colorlinks=true,%
	linkcolor=black,%
	urlcolor=USBENGreen,%
	anchorcolor=black,%
	filecolor=black,%
	menucolor=black,%
	citecolor=black}