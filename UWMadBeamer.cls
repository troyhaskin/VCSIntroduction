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
%
%   Force compression of miniframes.
\beamer@compresstrue
%
%   Define the layout and color themes
\useoutertheme{miniframes}
\usecolortheme{beaver}
\useinnertheme{circles}
%
%   Modify the color scheme a bit
\setbeamercolor{item}{parent=palette~tertiary}
\setbeamercolor{enumerate~item}{parent=palette~tertiary}
\setbeamercolor{itemize~subitem}{parent=palette~tertiary}
\setbeamercolor{section~number~projected}{parent=palette~tertiary}
%
%   Remove navigation symbols
\setbeamertemplate{navigation~symbols}{}
%
%
%
%
%
%
\tl_new:N \g_UWMadBeamer_Title_Short_tl
\tl_new:N \g_UWMadBeamer_Title_Long_tl
\tl_new:N \g_UWMadBeamer_Author_Short_tl
\tl_new:N \g_UWMadBeamer_Author_Long_tl
\tl_new:N \g_UWMadBeamer_Institution_Short_tl
\tl_new:N \g_UWMadBeamer_Institution_Long_tl
\tl_new:N \g_UWMadBeamer_Department_Short_tl
\tl_new:N \g_UWMadBeamer_Department_Long_tl
\tl_new:N \g_UWMadBeamer_Program_Short_tl
\tl_new:N \g_UWMadBeamer_Program_Long_tl
\tl_new:N \g_UWMadBeamer_Logo_FileName_tl
%
%
\cs_new_eq:NN \__UWMadBeamer_Author:nn     \author
\cs_new_eq:NN \__UWMadBeamer_Title:nn      \title
\cs_new_eq:NN \__UWMadBeamer_Institute:nn  \institute
\cs_undefine:N \author
\cs_undefine:N \title
\cs_undefine:N \institute
%
%
% Identification commands
\DeclareDocumentCommand \author { o m } {
    \IfNoValueTF {#1} {
        \tl_gset:Nn \g_UWMadBeamer_Author_Short_tl {#2}
        \tl_gset:Nn \g_UWMadBeamer_Author_Long_tl  {#2}
        \__UWMadBeamer_Author:nn[#2]{#2}
    } {
        \tl_gset:Nn \g_UWMadBeamer_Author_Short_tl {#1}
        \tl_gset:Nn \g_UWMadBeamer_Author_Long_tl  {#2}
        \__UWMadBeamer_Author:nn[#1]{#2}
    }
}
\DeclareDocumentCommand \institute { o m } {
    \IfNoValueTF {#1} {
        \tl_gset:Nn \g_UWMadBeamer_Institute_Short_tl {#2}
        \tl_gset:Nn \g_UWMadBeamer_Institute_Long_tl  {#2}
        \__UWMadBeamer_Institute:nn[#2]{#2}
    } {
        \tl_gset:Nn \g_UWMadBeamer_Institute_Short_tl {#1}
        \tl_gset:Nn \g_UWMadBeamer_Institute_Long_tl  {#2}
        \__UWMadBeamer_Institute:nn[#1]{#2}
    }
}
\DeclareDocumentCommand \title { o m } {
    \IfNoValueTF {#1} {
        \tl_gset:Nn \g_UWMadBeamer_Title_Short_tl {#2}
        \tl_gset:Nn \g_UWMadBeamer_Title_Long_tl  {#2}
        \__UWMadBeamer_Title:nn[#2]{#2}
    } {
        \tl_gset:Nn \g_UWMadBeamer_Title_Short_tl {#1}
        \tl_gset:Nn \g_UWMadBeamer_Title_Long_tl  {#2}
        \__UWMadBeamer_Title:nn[#1]{#2}
    }
}
\DeclareDocumentCommand \department { o m } {
    \IfNoValueTF {#1} {
        \tl_gset:Nn \g_UWMadBeamer_Department_Short_tl {#2}
        \tl_gset:Nn \g_UWMadBeamer_Department_Long_tl  {#2}
    } {
        \tl_gset:Nn \g_UWMadBeamer_Department_Short_tl {#1}
        \tl_gset:Nn \g_UWMadBeamer_Department_Long_tl  {#2}
    }
}
%
%
%
%
%   Adjust the footline to include the department name
\setbeamertemplate{footline}{
    \begin{beamercolorbox}[leftskip=0.5em,rightskip=0.5em]{palette~primary}
        \skip_vertical:n{0.3em}
        \g_UWMadBeamer_Department_Short_tl{}
        \tex_hfill:D{}
        \g_UWMadBeamer_Institute_Short_tl{}
        \skip_vertical:n{0.3em}
    \end{beamercolorbox}
    \begin{beamercolorbox}[leftskip=0.5em,rightskip=0.5em]{palette~tertiary}
        \skip_vertical:n{0.3em}
        \g_UWMadBeamer_Author_Short_tl{}
        \tex_hfill:D{}
        \g_UWMadBeamer_Title_Short_tl{}
        \tex_hfill:D{}
        \insertframenumber/\inserttotalframenumber
        \skip_vertical:n{0.3em}
    \end{beamercolorbox}
}
%
\AtBeginSubsection[]{
    \begin{frame}<beamer>
        \tableofcontents[currentsection,currentsubsection]
    \end{frame}
}
%
\setlength{\parskip}{0.5em}
%
\ExplSyntaxOff