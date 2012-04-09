%
% Some credits
%

%% Based on easychair.cls by Serguei A. Mokhov, Andrei Voronkov, 
%% and Geoff Sutcliffe (C) 2008
%% Modified for Student Research Conference at FMPH CU by
%% Tomas Vinar (C) 2010 

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{svk}[2010/03/07]
%
%\let\if@slovak\iffalse
\DeclareOption{slovensky}{\let\if@slovak\iftrue}
\ProcessOptions

%
% Running heads definitions

\def\titlerunning#1{\gdef\@titleRunning{#1}}
\def\authorrunning#1{\gdef\@authorRunning{#1}}
\titlerunning{easychair: Running title head is undefined.}
\authorrunning{easychair: Running author head is undefined.}

% We are an article (more customized later)
\LoadClass[a4paper,twocolumn,11pt,twoside]{article}
%\RequirePackage[headings]{fullpage}
\RequirePackage[utf8]{inputenc}
\if@slovak
  \RequirePackage{slovak}
  %\RequirePackage[slovak]{babel}
  %\RequirePackage[T1]{fontenc}
\fi
\RequirePackage{url}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{mathptmx}
\RequirePackage{listings}
\RequirePackage{latexsym}
\RequirePackage{amsthm}
%\RequirePackage{empheq}

\setlength{\textheight}{24cm}
\setlength{\topmargin}{-0.85cm}
\setlength{\headheight}{0.5cm}
\setlength{\headsep}{0.65cm}
\setlength{\footskip}{1.25cm}
\flushbottom
\setlength{\hoffset}{-0.54cm}
\setlength{\textwidth}{17cm}
\setlength{\oddsidemargin}{0cm}
\setlength{\evensidemargin}{0cm}
\setlength{\marginparsep}{0cm}
\setlength{\marginparwidth}{0pt}
\setlength{\columnsep}{0.7cm}
\setlength{\parindent}{1em}



%
% Volume
%

\RequirePackage{lastpage}

% e.g.
% \volumeinfo
%		{J. Bloe}   % editor(s)      #1
%		{1}         % No. of editors #2
%		{LICS 2008} % event title    #3
%		{1}         % volume number  #4
%		{4}         % issue          #5
%		{134}       % start page     #6

\newcommand{\volumeinfo}[6]{%
	\def\@makefntext##1{\noindent ##1}%
	\def\@Eds{ed.}%
	\ifnum #2>1 \def\@Eds{eds.} \fi%
	\footnotetext[0]{\sf #1 (\@Eds): #3, volume #4, issue: #5, pp. #6-\pageref{LastPage}}%
	\def\@makefntext##1{\noindent\@makefnmark##1}%
	\setcounter{page}{#6}}

% To ensure the footnotes are always at the bottom
\RequirePackage[bottom]{footmisc}


%
% Allow for more space to place floats.
%

\renewcommand{\topfraction}{0.95}
\renewcommand{\bottomfraction}{0.95}
\renewcommand{\textfraction}{0.05}
\renewcommand{\floatpagefraction}{0.8}


%
% Running heads and ``foots''
%

%\RequirePackage{fancyhdr}
\pagestyle{empty}

%\fancyhead{}
%\fancyhead[RE]{\@titleRunning}
%\fancyhead[RO]{\@authorRunning}

%\fancyfoot{}
%\fancyfoot[CO,CE]{\thepage}
%\renewcommand{\headrulewidth}{0pt}
%\renewcommand{\footrulewidth}{0pt}

% Suppress the default date
\date{}


% LNCS-like institute handling
\newcounter{@inst}
\def\inst#1{\unskip$^{#1}$}
\def\institute#1{\gdef\@institute{#1}}

\def\institutename{\par
 \begingroup
 \parskip=\z@
 \parindent=\z@
 \setcounter{@inst}{1}%
 \def\and{\par\stepcounter{@inst}%
 \noindent$^{\the@inst}$\enspace\ignorespaces}%
 \setbox0=\vbox{\def\thanks##1{}\@institute}%
 \ifnum\c@@inst=1\relax
   \gdef\fnnstart{0}%
 \else
   \xdef\fnnstart{\c@@inst}%
   \setcounter{@inst}{1}%
   \noindent$^{\the@inst}$\enspace
 \fi
 \ignorespaces
 \@institute\par
 \endgroup}


% Facelift a bit the title
\let\oldmaketitle=\maketitle
\def\@maketitle{%
	\newpage
	\null
	\vspace{-1cm}
	\begin{center}%
		\let \footnote \thanks
		{\LARGE{\@title}\par}
		\vskip 0.5\baselineskip
		\begin{tabular}[t]{c}%
		\@author
		\end{tabular}\par
                \vskip 0.5\baselineskip
                \@supervisor
		\vskip 0.5\baselineskip
                {\small\institutename}
	\end{center}%
	\par
	%\vskip \baselineskip
}


% Tighten up bibliography
\let\oldthebibliography=\thebibliography
\let\endoldthebibliography=\endthebibliography
\renewenvironment{thebibliography}[1]
{
	\small
	\begin{oldthebibliography}{#1}
		\setlength{\parskip}{2pt}
		\setlength{\itemsep}{0pt}
}
{
  \end{oldthebibliography}
}

% Language mutations
\def\supervisorname{Supervisor}
\def\keywordsname{Keywords}
\def\abstractname{Abstract}
\def\refname{References}

\def\theoremname{Theorem}
\def\casename{Case}
\def\conjecturename{Conjecture}
\def\corollaryname{Corollary}
\def\definitionname{Definition}
\def\examplename{Example}
\def\exercisename{Exercise}
\def\lemmaname{Lemma}
\def\notename{Note}
\def\problemname{Problem}
\def\propertyname{Property}
\def\questionname{Question}
\def\solutionname{Solution}

\if@slovak
  \def\supervisorname{Školiteľ}
  \def\keywordsname{Kľúčové slová}
  \def\abstractname{Abstrakt}
  \def\refname{Literatúra}

  \def\theoremname{Veta}
  \def\casename{Prípad}
  \def\conjecturename{Hypotéza}
  \def\corollaryname{Dôsledok}
  \def\definitionname{Definícia}
  \def\examplename{Príklad}
  \def\exercisename{Cvičenie}
  \def\lemmaname{Lema}
  \def\notename{Poznámka}
  \def\problemname{Problém}
  \def\propertyname{Vlastnosť}
  \def\questionname{Otázka}
  \def\solutionname{Riešenie}
\fi

% Theorems etc.
\newtheorem{theorem}{\theoremname}{\itshape}{\rmfamily}
\newtheorem{case}{\casename}{\itshape}{\rmfamily}
\newtheorem{conjecture}{\conjecturename}{\itshape}{\rmfamily}
\newtheorem{corollary}{\corollaryname}{\bfseries}{\itshape}
\newtheorem{definition}{\definitionname}{\bfseries}{\itshape}
\newtheorem{example}{\examplename}{\itshape}{\rmfamily}
\newtheorem{exercise}{\exercisename}{\itshape}{\rmfamily}
\newtheorem{lemma}{\lemmaname}{\bfseries}{\itshape}
\newtheorem{note}{\notename}{\itshape}{\rmfamily}
\newtheorem{problem}{\problemname}{\itshape}{\rmfamily}
\newtheorem{property}{\propertyname}{\itshape}{\rmfamily}
\newtheorem{question}{\questionname}{\itshape}{\rmfamily}
\newtheorem{solution}{\solutionname}{\itshape}{\rmfamily}

% Supervisor, email, etc
\def\email#1{\unskip\thanks{\url{#1}}}

\def\supervisor#1{\gdef\@supervisor{\supervisorname: #1}}
\let\@supervisor\@empty

\def\keywords#1{\unskip\par\smallskip\noindent{\emph{\keywordsname:} #1}}

\renewenvironment{abstract}%
{\thispagestyle{empty}%
\paragraph{\abstractname:}}%
{}



% EOF
\endinput
