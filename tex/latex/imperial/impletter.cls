% Imperial College London letterhead class
% LdC Foulkes January 2003
% 
% Modified by James Keirstead, June 2014

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{impletter}[2014/06/19 Imperial College Letter]

\LoadClass[a4paper]{article}

\RequirePackage{fancyhdr}
\RequirePackage{ifthen}

% Load last because it has the hyperref loading in it
\RequirePackage{imperial-common}
\ifxetex
  \RequirePackage{fontawesome}
\else
  \newcommand{\faPhone}{Tel}
  \newcommand{\faEnvelope}{}
\fi

% Blank paper
\DeclareOption{blank}{%
	\pagestyle{fancy}
	\lhead{%
	\resizebox{52.5mm}{!}{\includegraphics{\imperiallogo}}}%
	\renewcommand\headrulewidth{0pt}
	\lfoot{%
	\vspace*{10.5mm}
	\hspace*{-1.8mm}
	\fontsize{9}{11pt}%\usefont{OT1}{cmss}{m}{n}
	Imperial College of Science, Technology and Medicine}%
	\cfoot{}
}%
% % Personalised letterhead paper
\DeclareOption{headed}{%
	\pagestyle{empty}
}%
% Logo only paper
\DeclareOption{logo}{%
	\pagestyle{empty}
}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{openbib}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% Use the \pagestyle{empty} option as the default if nothing is given.
\ExecuteOptions{headed}
\ProcessOptions\relax

% Set the appropriate font type, font size, and lengths
%\renewcommand{\normalsize}{\fontsize{12}{16pt}}%\usefont{OT1}{cmss}{m}{n}}
\setlength{\paperheight}{297mm}
\setlength{\paperwidth}{210mm}
\setlength{\voffset}{-25.4mm}
\setlength{\topmargin}{9mm}
\setlength{\evensidemargin}{-1pt}
\setlength{\oddsidemargin}{-1pt}
\setlength{\textheight}{220mm}
\setlength{\textwidth}{160mm}
\setlength{\headheight}{15.5mm}
\setlength{\headsep}{23mm}
\setlength{\footskip}{10.6mm}
\setlength{\parindent}{0mm}
\setlength{\parskip}{3mm}

%%%%%%%%%%%%%%%% Adjustment Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%
% The letter has to have have the following (measured from the top):
%	The bottom of the word 'Imperial' in the logo at 15mm
%	The bottom of the date at 51mm
%	The bottom of the 1st address line at 63mm
%	The bottom of the salutation at 105mm
%	The bottom of the department line (top right) at 12mm
%	The bottom of the statutory footer 5.5mm from the bottom
% 	The bottom of the first line of text on the second page at 51mm
%	The margin at the left of the text should be 25mm
%	The sender's detail (top right block) should be 90mm from the
%	right edge.

% The following are adjustable parameters to account for printer
% differences. The values can be given in mm or pt
% (a point is about .35 of a mm).

% To move the printed page up (minus value) or down (plus value):
\addtolength{\topmargin}{0mm}

% To move the printed text to the right (plus) or left (minus).
\addtolength{\evensidemargin}{0pt}
\addtolength{\oddsidemargin}{0pt}

% To move the statutory footer up (minus) or down (plus) - useful
% if the printer will not print so close to the bottom of the page
\addtolength{\footskip}{0mm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TeX parameters to account for odd formatting of headers
\hbadness=10000 % Ignore underfull boxes
\hfuzz=28mm % Allow over the margin text - needed for sender details

%\informal is like ragged right, but allows hyphen breaks and does not
%produce such extreme differences in line lengths.
\def\informal{\rightskip\z@ plus\tw@ em\dimen@\the\fontdimen4\the
\font\spaceskip\the\fontdimen\tw@\the\font minus .6\dimen@\xspaceskip
\spaceskip\multiply\xspaceskip\thr@@\divide\xspaceskip\tw@
\hyphenpenalty\@medpenalty\exhyphenpenalty\@highpenalty\let\informal\relax}

\newcommand{\@dept}{}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}
\newcommand{\@address}{}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
\newcommand{\@telephone}{}
\newcommand{\telephone}[1]{\renewcommand{\@telephone}{#1}}
\newcommand{\@fax}{}
\newcommand{\fax}[1]{\renewcommand{\@fax}{#1}}
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\@web}{}
\newcommand{\web}[1]{\renewcommand{\@web}{#1}}
\newcommand{\@nametitle}{}
\newcommand{\nametitle}[1]{\renewcommand{\@nametitle}{#1}}
\newcommand{\@postnoms}{}
\newcommand{\postnoms}[1]{\renewcommand{\@postnoms}{#1}}
\newcommand{\@jobtitle}{}
\newcommand{\jobtitle}[1]{\renewcommand{\@jobtitle}{#1}}
\newcommand{\@signature}{}
\newcommand{\signature}[1]{\renewcommand{\@signature}{#1}}
\newlength{\sigwidth}
\setlength{\sigwidth}{2in}

% Header for personalised letterhead consists of a table with
% one paragraph box
\newcommand{\header}[2]{
 \begin{tabular}{@{}p{95mm}}
  % left box with date, address and salutation
  \vspace*{-3.5mm}
  \begin{minipage}[t]{95mm}
  \fontsize{12}{16pt}%\usefont{OT1}{cmss}{m}{n}

  \today\\	% date at 51mm

  \vspace*{1mm}
  #1 % addressee at 63mm
  
  \vspace*{8mm}
  #2 % salutation at 105

  \end{minipage}
 \end{tabular}
}

% Header for logo and blank paper consists of a table with two paragraph boxes.
\newcommand{\headers}[2]{
 \begin{tabular}{@{}p{95mm}@{}p{90mm}}
  % left box with date, address and salutation
  \vspace*{-3.5mm}
  \begin{minipage}[t]{95mm}
  \fontsize{12}{16pt}%\usefont{OT1}{cmss}{m}{n}

  \today\\	% date at 51mm

  \vspace*{1mm}
  #1 % addressee at 63mm

  \vspace*{8mm}
  #2 % salutation at 105

  \end{minipage}

  &
  % right box with college details of sender
  \begin{minipage}[t]{90mm}
  \vspace*{-41.3mm}
  \fontsize{9}{11pt}%\usefont{OT1}{cmss}{m}{n}
  \@dept\\
  \college\\

  \@address\\
  \faPhone\ \@telephone\ifthenelse{\equal{\@fax}{}}{}{, Fax \@fax}\\

  \faEnvelope\ \href{mailto:\@email}{\textcolor{black}{\@email}}\\
  \href{http://\@web}{\textcolor{black}{\@web}}\\
%  \vspace*{4mm}\\

  \fontsize{11}{11pt}%\usefont{OT1}{cmss}{m}{n}
  \textbf{\@nametitle\ \@author}
  \fontsize{7}{11pt}%\usefont{OT1}{cmss}{m}{n}
  \textsc{\@postnoms}\\
  \fontsize{9}{11pt}%\usefont{OT1}{cmss}{m}{n}
  \@jobtitle\\
  \end{minipage}
 \end{tabular}
}

% Command to add the closing and sender's name
\newcommand{\close}[1]{
\begin{minipage}[t]{100mm}
#1

\ifthenelse{\equal{\@signature}{}}{%
  \vspace{18mm}
}{%
  \includegraphics[width=\sigwidth]{\@signature}
}

\@author
\end{minipage}
}

% Added flexibility to keep vertical formatting constant
\raggedbottom
