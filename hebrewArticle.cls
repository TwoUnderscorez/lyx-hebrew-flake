% Copyright Daniel H.
% Creative Commons CC BY 4.0
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hebrewArticle}[2025/03/29 Hebrew Article]

\LoadClass[a4paper]{article}

% Setting docuemnt language and fonts
\RequirePackage[bidi=basic, layout=tabular, provide=*]{babel}
\babelprovide[main, import]{hebrew}
\babelprovide{rl}
\babelfont[hebrew]{rm}[Renderer=Harfbuzz]{David CLM}
\babelfont[hebrew]{sf}{Miriam CLM}
\babelfont[hebrew]{tt}{Miriam Mono CLM}

% Setting theorem environments
\RequirePackage{amsthm, thmtools}
\newtheoremstyle{c_remark}
	{}	% Space above
	{}	% Space below
	{}% Body font
	{}	% Indent amount
	{\bfseries}	% Theorem head font
	{}	% Punctuation after theorem head
	{.5em}	% Space after theorem head
	{\thmname{#1}\thmnumber{ #2}\thmnote{ \normalfont{\text{(#3)}}}}	% head content
\newtheoremstyle{c_definition}
	{3pt}	% Space above
	{3pt}	% Space below
	{}% Body font
	{}	% Indent amount
	{\bfseries}	% Theorem head font
	{}	% Punctuation after theorem head
	{.5em}	% Space after theorem head
	{\thmname{#1}\thmnumber{ #2}\thmnote{ \normalfont{\text{(#3)}}}}	% head content
\newtheoremstyle{c_plain}
	{3pt}	% Space above
	{3pt}	% Space below
	{\itshape}% Body font
	{}	% Indent amount
	{\bfseries}	% Theorem head font
	{}	% Punctuation after theorem head
	{.5em}	% Space after theorem head
	{\thmname{#1}\thmnumber{ #2}\thmnote{ \text{(#3)}}}	% head content
 
\theoremstyle{c_plain}
\newtheorem{theorem}{משפט}[section]
\newtheorem{lemma}[theorem]{למה}
\newtheorem{proposition}[theorem]{טענה}
\newtheorem*{proposition*}{טענה}

\theoremstyle{c_definition}
\newtheorem{definition}[theorem]{הגדרה}
\newtheorem*{definition*}{הגדרה}
\newtheorem{example}{דוגמה}[section]
\newtheorem{exercise}{תרגיל}[section]

\theoremstyle{c_remark}
\newtheorem*{remark}{הערה}
\newtheorem*{solution}{פתרון}
\newtheorem{conclusion}[theorem]{מסקנה}
\newtheorem{notation}[theorem]{סימון}

% Other essential packages
\RequirePackage{amsmath, amsfonts, amssymb}

% Style
\RequirePackage[a4paper, margin=80pt, includeheadfoot]{geometry}
\RequirePackage[skip=3pt, indent=0pt]{parskip}
\linespread{1.2}