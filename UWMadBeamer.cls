%
%
%
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UWMadBeamer}%
    [2014/05/10 UW-Madison presentation class]%
%
%   Load beamer
\LoadClass[10pt,t,xcolor=table]{beamer}
%
%   Correct appendix number problem
\RequirePackage{appendixnumberbeamer}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{ifthen}
\RequirePackage{amsmath}
%
%   Compress
\beamer@compresstrue
%
%   Define the layout theme
\useoutertheme{miniframes}
\usecolortheme{beaver}
\useinnertheme{circles}
%
%   Define UW-Madison Colors
\definecolor{WiscRed}{rgb}{160,0,0}
%
%   Define the color scheme
\setbeamercolor{itemize item}{fg=WiscRed}
\setbeamercolor{enumerate item}{fg=WiscRed}
\setbeamercolor{itemize subitem}{fg=WiscRed}
\setbeamercolor{section number projected}{bg=WiscRed}
%
%   Remove navigation symbols
\setbeamertemplate{navigation symbols}{}

%
%   Adjust the footline to include the department name
\setbeamertemplate{footline}{%
    \hfill%
    \includegraphics[scale=0.50]{EPDepartmentLogo}%
    \hskip0.60em{}

    \begin{beamercolorbox}[leftskip=0.5em,rightskip=0.5em]{section in head/foot}%
        \vskip0.3em%
        \TheAuthorShort{}%
        \hfill%
        \TheTitleShort{}%
        \hfill%
        \insertframenumber/\inserttotalframenumber%
        \vskip0.3em%
    \end{beamercolorbox}%
}
%
\setlength{\parskip}{0.5em}
%
%
%
%
%
%
%
%
%
%

% ========================================================================== %
%                             Math Commands                                  %
% ========================================================================== %


% ---------------------------------------------------------------------------- %
%                                Square Root Tail                              %
% ---------------------------------------------------------------------------- %
\DeclareRobustCommand{\NthRootInTeX}[2]{\root #1 \of {#2\:\!}}

\DeclareRobustCommand{\SquareRootCore}[2]{
    \setbox0=\hbox{\ensuremath{\NthRootInTeX{#1}{#2}}}
    \dimen0=\ht0
    \advance\dimen0-0.2\ht0
    \setbox2=\hbox{\vrule height\ht0 depth -\dimen0}
    {\box0\lower0.47pt\box2}
}

\DeclareRobustCommand{\Sqrt}[2][]{
    \mathchoice{\SquareRootCore{#1}{#2}}
               {\SquareRootCore{#1}{#2}}
               {\SquareRootCore{#1}{#2}}
               {\SquareRootCore{#1}{#2}}
}



% ---------------------------------------------------------------------------- %
%                              Derivative Commands                             %
% ---------------------------------------------------------------------------- %
\newcommand{\bigdiffn}[4]{\dfrac{#1{}^{#4}}{#1 #3{}^{#4}} \left[ #2 \right]}
\newcommand{\gendiffn}[4]{\dfrac{#1{}^{#4} #2}{#1 #3{}^{#4}}}

\newcommand{\diff}[3][d]{
    \ifthenelse{\equal{p}{#1}}{
        \gendiffn{\partial}{#2}{#3}{}
    }{
        \ifthenelse{\equal{b}{#1}}{
            \bigdiffn{d}{#2}{#3}{}
        }{
            \ifthenelse{\equal{bp}{#1}}{
                \bigdiffn{\partial}{#2}{#3}{}
            }{
                \gendiffn{d}{#2}{#3}{}
            }
        }
    }
}

\newcommand{\diffn}[4][d]{
    \ifthenelse{\equal{p}{#1}}{
        \gendiffn{\partial}{#2}{#3}{#4}
    }{
        \ifthenelse{\equal{b}{#1}}{
            \bigdiffn{#2}{#3}{#4}
        }{
            \ifthenelse{\equal{bp}{#1}}{
                \bigdiffn{\partial}{#2}{#3}{#4}
            }{
                \gendiffn{#1}{#2}{#3}{#4}
            }
        }
    }
}

\newcommand{\bigdiff}   [2] {\diff[b]{#1}{#2}}
\newcommand{\pdiff}     [2] {\diff[p]{#1}{#2}}
\newcommand{\bigpdiff}  [2] {\diff[bp]{#1}{#2}}
\let\frac\dfrac
\newcommand{\subs}      [2][]{\ensuremath{{}_{#1\text{\scriptsize #2}}}}
\newcommand{\sups}      [2][]{\ensuremath{{}^{#1\text{\scriptsize #2}}}}
\newcommand{\oneo}      [1]  {\ensuremath{\frac{1}{#1}}}
\newcommand{\Skip}[1][0.45em]{\\[#1]}
\DeclareMathOperator{\Ln}{Ln}
\DeclareMathOperator{\Abs}{Abs}
\DeclareMathOperator{\Inf}{Inf}
\DeclareMathOperator{\Exp}{Exp}
\DeclareMathOperator{\Rez}{R}
\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft\;\!}
\def\left#1{\mathopen{}\mathclose\bgroup\originalleft#1\:\!}
\def\right#1{\aftergroup\egroup\:\!\originalright#1}

\newcommand{\Del}[1][]{
    \partial_{#1}
}

\newcommand{\Vector}[1]{
    \underline{#1}
}

\newcommand{\Tensor}[1]{
    \underline{\underline{#1}}
}


\newcommand{\etal}{et al.}
\newcommand{\etc}{etc.}
\newcommand{\eg}{e.g.}
\newcommand{\ie}{i.e.}
\newlength{\LengthOfArgument}
\newcommand{\IfEmpty}[3]{
    \settowidth{\LengthOfArgument}{#1}
    \ifdim\LengthOfArgument=0pt
        #2
    \else
        #3
    \fi
}
%
% Identification commands
\newcommand{\Author}[2][]{

    \IfEmpty{#1}{
        \def\TheAuthorShort{#2}
        \def\TheAuthorLong{#2}
        \author{#2}
    }{
        \def\TheAuthorShort{#1}
        \def\TheAuthorLong{#2}
        \author[#1]{#2}
    }
}

\newcommand{\Institute}[2][]{

    \IfEmpty{#1}{
        \def\TheInstituteShort{#2}
        \def\TheInstituteLong{#2}
        \institute{#2}
    }{
        \def\TheInstituteShort{#1}
        \def\TheInstituteLong{#2}
        \institute[#1]{#2}
    }
}

\newcommand{\Title}[2][]{

    \IfEmpty{#1}{
        \def\TheTitleShort{#2}
        \def\TheTitleLong{#2}
        \title{#2}
    }{
        \def\TheTitleShort{#1}
        \def\TheTitleLong{#2}
        \title[#1]{#2}
    }
}

\newcommand{\Department}[2][]{

    \IfEmpty{#1}{
        \def\TheDepartmentShort{#2}
        \def\TheDepartmentLong{#2}
    }{
        \def\TheDepartmentShort{#1}
        \def\TheDepartmentLong{#2}
    }
}
