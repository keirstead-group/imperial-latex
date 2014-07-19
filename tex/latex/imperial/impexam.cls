% Template for Imperial College exams
% James Keirstead
% 15 February 2012

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{impexam}[2012/02/15 Exam template for Imperial college]

% Finally base the whole thing on the article class
\LoadClassWithOptions{article}

% Set up the solutions toggle
\RequirePackage{ifthen}
\newboolean{showsolutions}
\setboolean{showsolutions}{false}
\DeclareOption{solutions}{\setboolean{showsolutions}{true}}
\ProcessOptions*

% Required packages
% This provides xcolor, graphicx
\RequirePackage{imperial-common}

% Other options for exams
\RequirePackage{environ}
\RequirePackage{enumerate}

% Set the solution color
\definecolor{solutiontext}{named}{ImperialBrown}

% Set up the geometry
\RequirePackage{geometry}
\geometry{margin=1in}

% Declare variables
\newcommand{\@modulename}{}
\newcommand{\modulename}[1]{\renewcommand{\@modulename}{#1}}
\newcommand{\@modulenumber}{}
\newcommand{\modulenumber}[1]{\renewcommand{\@modulenumber}{#1}}
\newcommand{\@examyear}{}
\newcommand{\examyear}[1]{\renewcommand{\@examyear}{#1}}
\newcommand{\@examdate}{}
\newcommand{\examdate}[1]{\renewcommand{\@examdate}{#1}}
\newcommand{\@rubric}{}
\newcommand{\rubric}[1]{\renewcommand{\@rubric}{#1}}
\newcommand{\@degree}{MEng}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\@extratext}{\emph{This paper is also taken for the relevant examination for the Associateship.}}
\newcommand{\extratext}[1]{\renewcommand{\@extratext}{#1}}
\newcommand{\@yearpart}{PART I}
\newcommand{\yearpart}[1]{\renewcommand{\@yearpart}{#1}}

% I don't want paragraph indents in this document
\setlength{\parindent}{0pt}

% Make the title page
\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  {\Large Imperial College London\\[2em]%
  \@degree\ Examination} \@examyear\\[1em]%
  {\large \@yearpart}\\[1em]%
  \@extratext\\[4em]
  \textbf{\Large\@modulenumber: \@modulename}\\[2em]%
  \@examdate\\[2em]%
  \ifthenelse{\boolean{showsolutions}}{\textcolor{solutiontext}{\large With solutions}\\Set by \@author}{\mbox{}}\\[4em]
  \@rubric\\%
  \vfill
  \begin{center}
    \bfseries DO NOT OPEN THIS EXAMINATION PAPER UNTIL\\
    INSTRUCTED TO DO SO BY THE INVIGILATOR
  \end{center}
  \vfill
  \copyright~\@examyear\ Imperial College London%
  \newpage
  \setcounter{page}{1}
}

% Create an environment for the questions
\newcounter{question}
\newcommand{\points}[1]{\\\mbox{}\hfill \emph{(#1 marks)}}
\newenvironment{questions}[1][]{\begin{list}%
    {\bfseries #1 \arabic{question}.}%
    {\usecounter{question}
	\setlength{\itemsep}{1em}}}
               {\end{list}}

% Create an environment for hidden/visible solutions    
\NewEnviron{solution}{\ifthenelse{\boolean{showsolutions}}{\textcolor{solutiontext}{\emph{Solution:$\quad$}\BODY}}{}}

% A sample question
\newcommand{\example}{Define energy and power, and explain the relationship between the two.  What are the SI units for energy and power?  When you pay an electricity bill on the basis of kWh, are you paying for a quantity of energy or power?}
