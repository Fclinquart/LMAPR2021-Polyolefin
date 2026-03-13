% ============================================================
%  beamer-style.cls  –  François Clinquart  –  Master Thesis 2026
%  UCLouvain Beamer theme – inspired by the Ilmenau theme
%  Colours: UCLouvain Blue #003366 / UCLouvain Cyan #009AC7
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beamer-style}[2026/03/04 UCLouvain Beamer Style]

% --- Load base Beamer class ----------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[aspectratio=169]{beamer}

% --- Load custom packages ------------------------------------
\usepackage{Styles/packages}

% =============================================================
%  SANS-SERIF FONT  (Fira Sans)
%  Install via:  tlmgr install fira
%            or: sudo apt install texlive-fonts-extra
% =============================================================
\usepackage[sfdefault, light]{FiraSans}
\usepackage[T1]{fontenc}
\renewcommand{\familydefault}{\sfdefault}
\usefonttheme{professionalfonts}

% =============================================================
%  COLOUR PALETTE
% =============================================================
\definecolor{UCLblue}     {HTML}{003366}
\definecolor{UCLcyan}     {HTML}{009AC7}
\definecolor{UCLgray}     {HTML}{58585A}
\definecolor{UCLlightgray}{HTML}{E8E8E8}
\definecolor{UCLwhite}    {HTML}{FFFFFF}

% =============================================================
%  BEAMER COLOUR THEME
% =============================================================
\usecolortheme{default}

\setbeamercolor{palette primary}   {bg=UCLblue, fg=UCLwhite}
\setbeamercolor{palette secondary} {bg=UCLcyan, fg=UCLwhite}
\setbeamercolor{palette tertiary}  {bg=UCLblue, fg=UCLwhite}
\setbeamercolor{palette quaternary}{bg=UCLgray, fg=UCLwhite}

\setbeamercolor{structure}       {fg=UCLblue}
\setbeamercolor{local structure} {fg=UCLcyan}

% Frame title
\setbeamercolor{frametitle}   {fg=UCLwhite, bg=UCLblue}
\setbeamercolor{framesubtitle}{fg=UCLcyan,  bg=UCLblue}

% Header / footer
\setbeamercolor{section in head/foot}    {fg=UCLwhite, bg=UCLblue}
\setbeamercolor{subsection in head/foot} {fg=UCLwhite, bg=UCLcyan}
\setbeamercolor{author in head/foot}     {fg=UCLwhite, bg=UCLblue}
\setbeamercolor{title in head/foot}      {fg=UCLwhite, bg=UCLgray}
\setbeamercolor{date in head/foot}       {fg=UCLwhite, bg=UCLblue}
\setbeamercolor{page number in head/foot}{fg=UCLwhite, bg=UCLblue}

% Body
\setbeamercolor{normal text}        {fg=UCLgray,  bg=UCLwhite}
\setbeamercolor{block title}        {fg=UCLwhite, bg=UCLblue}
\setbeamercolor{block body}         {fg=UCLgray,  bg=UCLlightgray}
\setbeamercolor{block title alerted}{fg=UCLwhite, bg=red!70!black}
\setbeamercolor{block body alerted} {fg=black,    bg=red!5}
\setbeamercolor{block title example}{fg=UCLwhite, bg=UCLcyan}
\setbeamercolor{block body example} {fg=UCLgray,  bg=UCLcyan!10}

% Items
\setbeamercolor{itemize item}      {fg=UCLcyan}
\setbeamercolor{itemize subitem}   {fg=UCLblue}
\setbeamercolor{itemize subsubitem}{fg=UCLgray}
\setbeamercolor{enumerate item}    {fg=UCLblue}

% =============================================================
%  BEAMER FONT THEME
% =============================================================
\setbeamerfont{title}         {size=\Large,      series=\bfseries}
\setbeamerfont{subtitle}      {size=\normalsize,  series=\mdseries}
\setbeamerfont{frametitle}    {size=\large,       series=\bfseries}
\setbeamerfont{framesubtitle} {size=\small,       series=\mdseries}
\setbeamerfont{author}        {size=\small}
\setbeamerfont{institute}     {size=\footnotesize}
\setbeamerfont{date}          {size=\footnotesize}
\setbeamerfont{block title}   {size=\normalsize,  series=\bfseries}
\setbeamerfont{section in head/foot}   {size=\tiny}
\setbeamerfont{subsection in head/foot}{size=\tiny}

% =============================================================
%  INNER THEME
% =============================================================
\useinnertheme{circles}
\setbeamertemplate{blocks}[rounded][shadow=false]
\setbeamertemplate{navigation symbols}{}

\setbeamertemplate{itemize item}      {\textbullet}
\setbeamertemplate{itemize subitem}   {$\circ$}
\setbeamertemplate{itemize subsubitem}{$-$}

% =============================================================
%  MULTI-AUTHOR SUPPORT
% ---------------------------------------------------------
%  In your main.tex:
%
%    \addauthor{François Clinquart}{1}
%    \addauthor{Jean Dupont}{1,2}
%    \addaffil{1}{École Polytechnique de Louvain, UCLouvain}
%    \addaffil{2}{iMMC -- Institute of Mechanics, Materials and Civil Engineering}
%    \setcontact{a}{francois.clinquart@uclouvain.be}
%
%  The contact command adds a footnote-style line:
%    (a) francois.clinquart@uclouvain.be
%  and you mark the corresponding author with \addauthor{Name}{1,a}
%
%  For the footer short-author, use the normal:
%    \author[F. Clinquart et al.]{} % body is ignored, only short name matters
% =============================================================
\usepackage{etoolbox}

\def\ucl@authorlist{}
\def\ucl@affillist{}
\def\ucl@contact{}

% \addauthor{Name}{affil-numbers}
\newcommand{\addauthor}[2]{%
  \ifdefempty{\ucl@authorlist}{%
    \def\ucl@authorlist{#1\textsuperscript{\,#2}}%
  }{%
    \appto\ucl@authorlist{,\space #1\textsuperscript{\,#2}}%
  }%
}

% \addaffil{number}{institution}  — each on its own line
\newcommand{\addaffil}[2]{%
  \ifdefempty{\ucl@affillist}{%
    \def\ucl@affillist{\textsuperscript{#1}#2}%
  }{%
    \appto\ucl@affillist{\\[0.15em]\textsuperscript{#1}#2}%
  }%
}

% \setcontact{symbol}{email}
% Marks a corresponding author; displayed below affiliations on title slide.
% Use the same symbol as the superscript in \addauthor, e.g. {a} or {*}
\newcommand{\setcontact}[2]{%
  \def\ucl@contact{\textsuperscript{#1}\,\texttt{#2}}%
}

% =============================================================
%  LOGO PATHS  (relative to the compiled .tex file)
% =============================================================
\newcommand{\UCLlogopath}{Styles/UCLouvain_logos/UCLouvain-logo.jpg}
\newcommand{\EPLlogopath}{Styles/UCLouvain_logos/EPL-logo.jpg}
\newcommand{\logoheight}{1.0cm}

% =============================================================
%  HEADLINE  (Ilmenau-style)
% =============================================================
\setbeamertemplate{headline}{%
  \leavevmode%
  \begin{beamercolorbox}[wd=\paperwidth, ht=2.5ex, dp=1.5ex]{section in head/foot}%
    \insertsectionnavigationhorizontal{\paperwidth}{\hskip2pt}{\hfill}%
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=\paperwidth, ht=2ex, dp=1ex]{subsection in head/foot}%
    \insertsubsectionnavigationhorizontal{\paperwidth}{\hskip2pt}{\hfill}%
  \end{beamercolorbox}%
  \begin{tikzpicture}
    \draw[UCLcyan, line width=1pt] (0,0) -- (\paperwidth,0);
  \end{tikzpicture}\vspace{-4pt}%
}

% =============================================================
%  FOOTLINE
% =============================================================
\setbeamertemplate{footline}{%
  \leavevmode%
  \hbox{%
    \begin{beamercolorbox}[wd=.30\paperwidth, ht=2.5ex, dp=1.25ex,
                            center]{author in head/foot}%
      \usebeamerfont{author in head/foot}\insertshortauthor
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=.40\paperwidth, ht=2.5ex, dp=1.25ex,
                            center]{title in head/foot}%
      \usebeamerfont{title in head/foot}\insertshorttitle
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=.20\paperwidth, ht=2.5ex, dp=1.25ex,
                            center]{date in head/foot}%
      \usebeamerfont{date in head/foot}\insertshortdate
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=.10\paperwidth, ht=2.5ex, dp=1.25ex,
                            center]{page number in head/foot}%
      \usebeamerfont{page number in head/foot}%
      \insertframenumber{}/\inserttotalframenumber
    \end{beamercolorbox}%
  }%
}

% =============================================================
%  FRAME TITLE
% =============================================================
\setbeamertemplate{frametitle}{%
  \nointerlineskip%
  \begin{beamercolorbox}[wd=\paperwidth, ht=2.8ex, dp=0.8ex,
                          leftskip=1em, rightskip=1em]{frametitle}%
    \usebeamerfont{frametitle}\insertframetitle%
    \ifx\insertframesubtitle\@empty\else%
      \hspace{1em}{\usebeamerfont{framesubtitle}%
      \usebeamercolor[fg]{framesubtitle}$|$~\insertframesubtitle}%
    \fi%
  \end{beamercolorbox}%
  \begin{tikzpicture}
    \fill[UCLcyan] (0,0) rectangle (\paperwidth, 1.2pt);
  \end{tikzpicture}\vspace{-2pt}%
}

% =============================================================
%  TITLE PAGE  – white, sober
% =============================================================
\setbeamertemplate{title page}{%
  \begin{tikzpicture}[remember picture, overlay]
    \fill[UCLwhite] (current page.south west) rectangle (current page.north east);
    % Left blue bar
    \fill[UCLblue]  (current page.south west)
      rectangle ([xshift=5pt]current page.north west);
    % Top cyan stripe
    \fill[UCLcyan]  ([yshift=-3pt]current page.north west)
      rectangle (current page.north east);
    % Bottom blue stripe
    \fill[UCLblue]  (current page.south west)
      rectangle ([yshift=3pt]current page.south east);
    % UCLouvain logo – bottom-left
    \node[anchor=south west, inner sep=0]
      at ([xshift=10pt, yshift=6pt]current page.south west)
      {\includegraphics[height=\logoheight]{\UCLlogopath}};
    % EPL logo – bottom-right
    \node[anchor=south east, inner sep=0]
      at ([xshift=-10pt, yshift=6pt]current page.south east)
      {\includegraphics[height=\logoheight]{\EPLlogopath}};
  \end{tikzpicture}%
  \vfill
  \begin{center}
    {\usebeamerfont{title}\color{UCLblue}\inserttitle}\\[0.35em]
    {\usebeamerfont{subtitle}\color{UCLgray}\insertsubtitle}\\[0.9em]
    {\color{UCLcyan}\rule{0.45\linewidth}{0.8pt}}\\[0.75em]
    {\usebeamerfont{author}\color{UCLgray}\ucl@authorlist}\\[0.5em]
    {\usebeamerfont{institute}\color{UCLgray}\ucl@affillist}\\[0.4em]
    \ifdefempty{\ucl@contact}{}{%
      {\usebeamerfont{institute}\color{UCLcyan}\ucl@contact}\\[0.3em]%
    }%
    {\usebeamerfont{date}\color{UCLgray}\insertdate}
  \end{center}
  \vfill
}

% =============================================================
%  THANK-YOU SLIDE  – white, sober
%  Usage: \thanksframe[optional extra line]
% =============================================================
\newcommand{\thanksframe}[1][]{%
  \begin{frame}[plain, noframenumbering]
    \begin{tikzpicture}[remember picture, overlay]
      \fill[UCLwhite] (current page.south west) rectangle (current page.north east);
      \fill[UCLblue]  (current page.south west)
        rectangle ([xshift=5pt]current page.north west);
      \fill[UCLcyan]  ([yshift=-3pt]current page.north west)
        rectangle (current page.north east);
      \fill[UCLblue]  (current page.south west)
        rectangle ([yshift=3pt]current page.south east);
      \node[anchor=south west, inner sep=0]
        at ([xshift=10pt, yshift=6pt]current page.south west)
        {\includegraphics[height=\logoheight]{\UCLlogopath}};
      \node[anchor=south east, inner sep=0]
        at ([xshift=-10pt, yshift=6pt]current page.south east)
        {\includegraphics[height=\logoheight]{\EPLlogopath}};
    \end{tikzpicture}%
    \vfill
    \begin{center}
      {\usebeamerfont{title}\color{UCLblue} Thank you for your attention}\\[0.9em]
      {\color{UCLcyan}\rule{0.45\linewidth}{0.8pt}}\\[0.7em]
      \ifx&#1&\else%
        {\usebeamerfont{author}\color{UCLgray} #1}%
      \fi
    \end{center}
    \vfill
  \end{frame}%
}

% =============================================================
%  HELPERS
% =============================================================

% Highlighted box
\newcommand{\uclbox}[1]{%
  \begin{beamercolorbox}[rounded=true, shadow=false,
                          wd=\linewidth, sep=4pt]{block title}%
    #1
  \end{beamercolorbox}%
}

% Two-column layout:  \twocols[left_ratio]{left}{right}
\newcommand{\twocols}[3][0.48]{%
  \begin{columns}[T]
    \column{#1\linewidth} #2
    \column{\dimexpr\linewidth-#1\linewidth-2em\relax} #3
  \end{columns}%
}

% =============================================================
%  MISC
% =============================================================
\setbeamersize{text margin left=1.5em, text margin right=1.5em}
\addtobeamertemplate{block begin}{\vspace{2pt}}{}
\addtobeamertemplate{block end}  {}{\vspace{4pt}}

% =============================================================
%  FIGURE CAPTIONS  (Beamer-native, pas de package caption)
%  Format: "Fig. 1." (gras) + texte (9pt, italique)
% =============================================================
\setbeamertemplate{caption}{%
  {\usebeamerfont{caption name}\usebeamercolor[fg]{caption name}%
   \insertcaptionname~\insertcaptionnumber.}~%
  {\fontsize{9pt}{11pt}\selectfont\textit{\insertcaption}}%
}
\setbeamertemplate{caption label separator}{}  % géré manuellement ci-dessus
\renewcommand{\figurename}{Fig.}
\setbeamerfont{caption name}{series=\bfseries, size=\footnotesize}
\setbeamercolor{caption name}{fg=UCLgray}

% =============================================================
%  GREEN BLOCK  (vert sapin)
%  Usage: \begin{greenblock}{Titre} ... \end{greenblock}
% =============================================================
\definecolor{UCLgreen}{HTML}{1B5E20}   % vert sapin

\newenvironment{greenblock}[1]{%
  \setbeamercolor{block title}{fg=UCLwhite, bg=UCLgreen}%
  \setbeamercolor{block body} {fg=UCLgray,  bg=UCLgreen!10}%
  \begin{block}{#1}%
}{%
  \end{block}%
}

% =============================================================
%  APPENDIX SUPPORT
%  Usage dans main.tex :
%
%    \appendix
%
%    \aframe{Détails expérimentaux}{
%      contenu de la slide...
%    }
%    \aframe{Données supplémentaires}{
%      contenu...
%    }
% =============================================================

\newcounter{appendixcount}
\setcounter{appendixcount}{0}

\apptocmd{\appendix}{%
  % Slide d'annonce
  \begin{frame}[plain, noframenumbering]
    \begin{tikzpicture}[remember picture, overlay]
      \fill[UCLwhite] (current page.south west) rectangle (current page.north east);
      \fill[UCLblue]  (current page.south west)
        rectangle ([xshift=5pt]current page.north west);
      \fill[UCLcyan]  ([yshift=-3pt]current page.north west)
        rectangle (current page.north east);
      \fill[UCLblue]  (current page.south west)
        rectangle ([yshift=3pt]current page.south east);
    \end{tikzpicture}%
    \vfill
    \begin{center}
      {\color{UCLcyan}\rule{0.45\linewidth}{0.8pt}}\\[0.6em]
      {\usebeamerfont{title}\color{UCLblue} Appendices}\\[0.6em]
      {\color{UCLcyan}\rule{0.45\linewidth}{0.8pt}}
    \end{center}
    \vfill
  \end{frame}%
  % Numérotation romaine
  \setcounter{framenumber}{0}%
  \setbeamertemplate{page number in head/foot}{\roman{framenumber}}%
}{}{}

% \aframe{Titre}{Contenu}
\newcommand{\aframe}[2]{%
  \stepcounter{appendixcount}%
  \begin{frame}{Appendix~\Roman{appendixcount}:~#1}
    #2
  \end{frame}%
}

\endinput
