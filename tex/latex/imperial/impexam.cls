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
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{environ}
\RequirePackage{xcolor}
\RequirePackage{enumerate}

% Set the solution color
\definecolor{solutiontext}{rgb}{0.8,0,0}

% Use pretty fonts if they're available
\RequirePackage{imperial-common}

% Set up the geometry
\RequirePackage{geometry}
\geometry{margin=1in}

% Declare variables
\newcommand{\themodulename}{}
\newcommand{\modulename}[1]{\renewcommand{\themodulename}{#1}}
\newcommand{\themodulenumber}{}
\newcommand{\modulenumber}[1]{\renewcommand{\themodulenumber}{#1}}
\newcommand{\theexamyear}{}
\newcommand{\examyear}[1]{\renewcommand{\theexamyear}{#1}}
\newcommand{\theexamdate}{}
\newcommand{\examdate}[1]{\renewcommand{\theexamdate}{#1}}
\newcommand{\therubric}{}
\newcommand{\rubric}[1]{\renewcommand{\therubric}{#1}}
\newcommand{\thedegree}{MEng}
\newcommand{\degree}[1]{\renewcommand{\thedegree}{#1}}
\newcommand{\theextratext}{\emph{This paper is also taken for the relevant examination for the Associateship.}}
\newcommand{\extratext}[1]{\renewcommand{\theextratext}{#1}}
\newcommand{\theyearpart}{PART I}
\newcommand{\yearpart}[1]{\renewcommand{\theyearpart}{#1}}

% I don't want paragraph indents in this document
\setlength{\parindent}{0pt}

% Make the title page
\newcommand{\makecover}{%
  \thispagestyle{empty}
  {\Large Imperial College London\\[2em]%
  \thedegree\ Examination} \theexamyear\\[1em]%
  {\large \theyearpart}\\[1em]%
  \theextratext\\[4em]
  \textbf{\Large\themodulenumber: \themodulename}\\[2em]%
  \theexamdate\\[2em]%
  \ifthenelse{\boolean{showsolutions}}{\textcolor{solutiontext}{\large With solutions}\\Set by \@author}{\mbox{}}\\[4em]
  \therubric\\%
  \vfill
  \begin{center}
    \bfseries DO NOT OPEN THIS EXAMINATION PAPER UNTIL\\
    INSTRUCTED TO DO SO BY THE INVIGILATOR
  \end{center}
  \vfill
  \copyright~\theexamyear\ Imperial College London%
  \newpage
  \setcounter{page}{1}
}

% Create an environment for the questions
\newcounter{question}
\newcommand{\points}[1]{\\\mbox{}\hfill \emph{(#1 marks)}}
\newenvironment{questions}[1][]{\begin{list}%
    {#1 \arabic{question}.}%
    {\usecounter{question}
	\setlength{\itemsep}{1em}}}
               {\end{list}}

% Create an environment for hidden/visible solutions    
\NewEnviron{solution}{\ifthenelse{\boolean{showsolutions}}{\textcolor{solutiontext}{\emph{Solution:$\quad$}\BODY}}{}}

% A sample question
\newcommand{\example}{Define energy and power, and explain the relationship between the two.  What are the SI units for energy and power?  When you pay an electricity bill on the basis of kWh, are you paying for a quantity of energy or power?}
