%
%   Load expl3 package.
\RequirePackage{expl3}[2013/07/28]
\@ifpackagelater{expl3}{2013/07/28} {} {%
    \PackageError{UWMadThesis}{Version of l3kernel is too old}
      {%
        Please install an up to date version of l3kernel\MessageBreak
        using your TeX package manager or from CTAN.
      }%
    \endinput
}%
%
%   Turn on expl3.
\ExplSyntaxOn
%
%   Declare the LaTeX format needed
\NeedsTeXFormat{LaTeX2e}
%
%   Provide the class
\ProvidesClass{UWMadBeamer}
    [2014/05/10~v0.1~UW-Madison~presentation~class]
%
%   Pass all user options directly to beamer
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{beamer}
}
%
%   Declare defaults and process the options
\ExecuteOptions{10pt,t,xcolor=table}
\ProcessOptions
%
%   load beamer
\LoadClass{beamer}[2013/01/01]
%
%   Load packages
\RequirePackage{xparse}
\RequirePackage{appendixnumberbeamer}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{graphicx}
%
%   Define the layout and color themes
\usecolortheme{UWMad}
\useoutertheme{default}
\useinnertheme{circles}
%
%   Modify the color scheme a bit
%
%   Remove navigation symbols
\setbeamertemplate{navigation~symbols}{}
%
%
%
%   Headline is a simple listing of section names (no pips)
\setbeamertemplate{headline}{%
 \begin{beamercolorbox}[ht=0.029\paperheight]{section~in~head/foot}%
    \usebeamerfont{section~in~head/foot}%
    \insertsectionnavigationhorizontal{0.99\paperwidth}{}{}
    \vbox{}\vskip0.001\paperheight
  \end{beamercolorbox}
}
%
%
%
%   Frametitle includes logo on far right of slide
\defbeamertemplate*{frametitle}{UWMadDefault}[1][left]{
    \nointerlineskip
    %
    %   Total width
    \@tempdima=\textwidth
    \advance\@tempdima by\beamer@leftmargin
    \advance\@tempdima by\beamer@rightmargin
    %
    %   Encompassing box
    \begin{beamercolorbox}
        [wd=\the\@tempdima,ht=0.098666\paperheight,dp=0pt]{frametitle}
        %
        %   Width/box for text
        \advance\@tempdima by -0.400\paperwidth
        \begin{beamercolorbox}
            [leftskip=0.01\paperwidth,rightskip=0.01\paperwidth,
            wd=\the\@tempdima,ht=0.098666\paperheight,dp=0pt]
            {frametitle}
            \usebeamerfont{frametitle}
            \usebeamercolor{frametitle}
            \strut\insertframetitle\strut
            \vbox{}\vskip0.010\paperheight
        \end{beamercolorbox}
        %
        %   Box for institution
        \begin{beamercolorbox}
            [right,rightskip=0.01\paperwidth,
            wd=0.400\paperwidth,ht=0.098666\paperheight,dp=0pt]
            {frametitle}
            \raisebox{0.0030\paperheight}{
                \includegraphics[keepaspectratio=true,height=0.099\paperheight]{EPLogoHQ_LeftWhite}
            }
        \end{beamercolorbox}
    \end{beamercolorbox}
    %
    %   Vertical corrections and gold box separator
    \vbox{}\vskip-0.128\paperheight
    \begin{beamercolorbox}[wd=\paperwidth,ht=0.004\paperheight]{fine~separation~line}
    \end{beamercolorbox}%
}
%
%
%
%   Footline: Date - Title - Slide Count
\setbeamertemplate{footline}{
    %
    %   Vertical corrections and gold box separator
    \begin{beamercolorbox}[wd=\paperwidth,ht=0.004\paperheight]{fine~separation~line}
    \end{beamercolorbox}%
    %
    %   Encompassing box
    \begin{beamercolorbox}{palette~tertiary}
        %
        %   Left, small box for date
        \begin{beamercolorbox}
            [wd=0.1\paperwidth,ht=0.024\paperheight,
            dp=0.00266666\paperheight,leftskip=0.01\paperwidth]
            {palette~tertiary}
            \insertdate{}
        \end{beamercolorbox}
        %
        %   Center, large box for title
        \begin{beamercolorbox}
            [center,wd=0.7999\paperwidth,
            ht=0.024\paperheight,dp=0.00266666\paperheight]
            {palette~tertiary}
            \insertshorttitle{}
        \end{beamercolorbox}
        %
        %   Right, small box for slide count
        \begin{beamercolorbox}
            [right,wd=0.1\paperwidth,ht=0.024\paperheight,
            dp=0.00266666\paperheight,rightskip=0.01\paperwidth]
            {palette~tertiary}
            \insertframenumber/\inserttotalframenumber
        \end{beamercolorbox}
        %
        %   Bit ox extra vertical space
        \vbox{}\vskip0.01\paperheight
    \end{beamercolorbox}
}
%
%
%
%   Display outline at start of every (sub)section.
\AtBeginSection[]{
    \begin{frame}<beamer>
        \frametitle{Outline}
        \tableofcontents[currentsection]
    \end{frame}
}
\AtBeginSubsection[]{
    \begin{frame}<beamer>
        \frametitle{Outline}
        \tableofcontents[currentsection,currentsubsection]
    \end{frame}
}
\setlength{\parskip}{0.5em}
%
\ExplSyntaxOff