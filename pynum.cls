% vim: set filetype=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pynum}[2014/02/12 v0.1 py4num class]

\RequirePackage{kvoptions}

% ==================================== (options)
\DeclareStringOption[english]{language}
\DeclareStringOption[1.2]{linespread}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{memoir}
}

% ==================================== (default options)
\ExecuteOptions{}

% ==================================== (process options)
\ProcessOptions
\ProcessKeyvalOptions*

% ===================================== (load base class)
\LoadClass{memoir}

% ===================================== (load additional packages)
\RequirePackage{iftex}      % << to check the engine

% ==================================== (xetex)
\ifXeTeX
  % ===================================== (language)
  \RequirePackage{polyglossia}
  \setdefaultlanguage{\pynum@language}

  % ===================================== (font)
  \RequirePackage{fontspec}
  \RequirePackage{xunicode}
  \RequirePackage{xltxtra}

  \setmainfont[Mapping=tex-text]{Linux Biolinum O}

  % ===================================== (packages)
  \usepackage[xetex,hidelinks]{hyperref} % << hyper links
\fi

% ==================================== (pdftex)
\ifPDFTeX
  % ===================================== (language)
  \RequirePackage[\pynum@language]{babel}

  % ===================================== (font)
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[mono=false,sfdefault]{libertine}

  % ===================================== (packages)
  \RequirePackage[pdftex,hidelinks]{hyperref} % << hyper links
\fi

% ===================================== (load additional packages)
\RequirePackage{xparse}     % << to create new commands
\RequirePackage{microtype}  % << typographical perfection
\RequirePackage{pdftexcmds} % << some functions
\RequirePackage{tabularx}   % << tables
\RequirePackage{minted}     % << formatting source code
\RequirePackage[
  backend=biber,
  style=alphabetic,
  natbib=true,
  refsection=chapter,
  doi=false,
  url=true,
  eprint=false,
  backref=true,
  hyperref=true,
]{biblatex}                 % << bibliography

% ===================================== (additional commands)
\DeclareDocumentCommand\python{}{Python}
\DeclareDocumentCommand\numpy{}{NumPy}
\DeclareDocumentCommand\scipy{}{SciPy}
\DeclareDocumentCommand\ipython{}{IPython}

\DeclareDocumentCommand\file{m}{\emph{#1}}
\DeclareDocumentCommand\istr{m}{\texttt{#1}}

% ===================================== (language)
\ifnum\pdf@strcmp{\pynum@language}{italian}=\z@
  \DeclareDocumentCommand\chapterrefname{}{Capitolo~}
  \DeclareDocumentCommand\sectionrefname{}{Sezione~}
  \DeclareDocumentCommand\tablerefname{}{Tabella~}
\fi

% ===================================== (appareance)
\linespread{\pynum@linespread}

% ===================================== (index)
\makeindex

\endinput

