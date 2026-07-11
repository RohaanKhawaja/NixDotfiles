local ls = require("luasnip")

ls.snippets = ls.snippets or {}
ls.snippets.tex = ls.snippets.tex or {}

ls.snippets.tex = vim.list_extend(ls.snippets.tex, {
  -- Environment
  ls.snippet("beg", {
    ls.text_node({"\\begin{"}),
    ls.insert_node(1, "environment"),
    ls.text_node({"}"}),
    ls.insert_node(0),
    ls.text_node({"\\end{"}),
    ls.insert_node(1),
    ls.text_node({"}"})
  }),
  -- Unlabelled equation
  ls.snippet("eq", {
    ls.text_node({"\\begin{equation*}", "\t"}),
    ls.insert_node(1),
    ls.text_node({"", "\\end{equation*}"}),
  }),
  -- Labelled equation
  ls.snippet("eqn", {
    ls.text_node({"\\begin{equation}", "\t"}),
    ls.insert_node(1),
    ls.text_node({"", "\t\\label{"}),
    ls.insert_node(2, "eq:"),
    ls.text_node({"}", "\\end{equation}"}),
  }),
  -- Fraction
  ls.snippet("fr", {
    ls.text_node({"\\frac{"}),
    ls.insert_node(1),
    ls.text_node({"}{"}),
    ls.insert_node(2),
    ls.text_node({"}"})
  }),
  -- Subscript
  ls.snippet("sub", {
    ls.insert_node(1),
    ls.text_node({"_{"}),
    ls.insert_node(2),
    ls.text_node({"}"})
  }),
  -- Superscript
  ls.snippet("sup", {
    ls.insert_node(1),
    ls.text_node({"^{"}),
    ls.insert_node(2),
    ls.text_node({"}"})
  }),
  -- Inline math
  ls.snippet("im", {
    ls.text_node({"$"}),
    ls.insert_node(1),
    ls.text_node({"$"})
  }),
  -- Display math
  ls.snippet("dm", {
    ls.text_node({"\\[ "}),
    ls.insert_node(1),
    ls.text_node({" \\]"})
  }),
  -- Vectors
  ls.snippet("vec", {
    ls.text_node({"\\vec{"}),
    ls.insert_node(1),
    ls.text_node({"}"})
  }),
  -- Matrices
  ls.snippet("mat", {
    ls.text_node({"\\begin{bmatrix}"}),
    ls.insert_node(1),
    ls.text_node({"\\end{bmatrix}"})
  }),
  -- Bra-ket
  ls.snippet("ket", {
    ls.text_node({"\\lvert "}),
    ls.insert_node(1),
    ls.text_node({" \\rangle"})
  }),
  ls.snippet("bra", {
    ls.text_node({"\\langle "}),
    ls.insert_node(1),
    ls.text_node({" \\rvert"})
  }),
  ls.snippet("braket", {
    ls.text_node({"\\langle "}),
    ls.insert_node(1),
    ls.text_node({" \\vert "}),
    ls.insert_node(2),
    ls.text_node({" \\rangle"})
  }),
  -- Greek letters
  ls.snippet("al", { ls.text_node("\\alpha") }),
  ls.snippet("be", { ls.text_node("\\beta") }),
  ls.snippet("ga", { ls.text_node("\\gamma") }),
  ls.snippet("de", { ls.text_node("\\delta") }),
  ls.snippet("ep", { ls.text_node("\\epsilon") }),
  ls.snippet("la", { ls.text_node("\\lambda") }),
  ls.snippet("mu", { ls.text_node("\\mu") }),
  ls.snippet("si", { ls.text_node("\\sigma") }),
  ls.snippet("th", { ls.text_node("\\theta") }),
  -- Paragraph
  ls.snippet("par", {
    ls.text_node("\\paragraph{"),
    ls.insert_node(1),
    ls.text_node({"}", ""}),
    ls.insert_node(0),
  }),
  -- Subparagraph
  ls.snippet("spar", {
    ls.text_node("\\subparagraph{"),
    ls.insert_node(1),
    ls.text_node({"}", ""}),
    ls.insert_node(0),
  }),
  -- Section
  ls.snippet("sec", {
    ls.text_node("\\section{"),
    ls.insert_node(1),
    ls.text_node({"}", ""}),
    ls.insert_node(0),
  }),
  -- Subsection
  ls.snippet("ss", {
    ls.text_node("\\subsection{"),
    ls.insert_node(1),
    ls.text_node({"}", ""}),
    ls.insert_node(0),
  }),
  -- Subsubsection
  ls.snippet("sss", {
    ls.text_node("\\subsubsection{"),
    ls.insert_node(1),
    ls.text_node({"}", ""}),
    ls.insert_node(0),
  }),
  -- Subitem
  ls.snippet("sitem", {
    ls.text_node({ "", "\\subitem " }),
    ls.insert_node(1),
    ls.insert_node(0),
  }),
  -- Itemize
  ls.snippet("item", {
    ls.text_node({"\\begin{itemize}", "\t\\item "}),
    ls.insert_node(1),
    ls.text_node({"", "\\end{itemize}"}),
    ls.insert_node(0),
  }),
  -- Single item
  ls.snippet("it", {
    ls.text_node({ "", "\\item " }),
    ls.insert_node(1),
    ls.insert_node(0),
  }),
  -- Label
  ls.snippet("lab", {
    ls.text_node({"\\label{"}),
    ls.insert_node(1, "eq:"),
    ls.text_node({"}"}),
  }),
  -- Reference
  ls.snippet("ref", {
    ls.text_node({"\\ref{"}),
    ls.insert_node(1),
    ls.text_node({"}"}),
  }),
  -- Equation reference
  ls.snippet("eqref", {
    ls.text_node({"\\eqref{"}),
    ls.insert_node(1),
    ls.text_node({"}"}),
  }),
  -- Bold text
  ls.snippet("bf", {
    ls.text_node({"\\textbf{"}),
    ls.insert_node(1),
    ls.text_node({"}"}),
  }),
  -- Italic text
  ls.snippet("itx", {
    ls.text_node({"\\textit{"}),
    ls.insert_node(1),
    ls.text_node({"}"}),
  }),
  -- Colour text
  ls.snippet("col", {
    ls.text_node({"\\textcolor{"}),
    ls.insert_node(1, "red"),
    ls.text_node({"}{"}),
    ls.insert_node(2),
    ls.text_node({"}"}),
  }),
  -- Highlight colour box
  ls.snippet("hl", {
    ls.text_node({"\\colorbox{"}),
    ls.insert_node(1, "yellow"),
    ls.text_node({"}{"}),
    ls.insert_node(2),
    ls.text_node({"}"}),
  }),
  -- Align environment (unnumbered)
  ls.snippet("aln", {
    ls.text_node({"\\begin{align*}", "\t"}),
    ls.insert_node(1),
    ls.text_node({"", "\\end{align*}"}),
  }),
  -- Align environment (numbered)
  ls.snippet("alnn", {
    ls.text_node({"\\begin{align}", "\t"}),
    ls.insert_node(1),
    ls.text_node({"", "\\end{align}"}),
  }),
  -- Cases
  ls.snippet("cases", {
    ls.text_node({"\\begin{cases}", "\t"}),
    ls.insert_node(1),
    ls.text_node({"", "\\end{cases}"}),
  }),
  -- Figure
  ls.snippet("fig", {
    ls.text_node({
      "\\begin{figure}[h]",
      "\t\\centering",
      "\t\\includegraphics[width=0.8\\textwidth]{"
    }),
    ls.insert_node(1, "file"),
    ls.text_node({"}", "\t\\caption{"}),
    ls.insert_node(2),
    ls.text_node({"}", "\t\\label{"}),
    ls.insert_node(3, "fig:"),
    ls.text_node({"}", "\\end{figure}"}),
  }),
  -- Itemize (duplicate of "item" above)
  ls.snippet("itemize", {
    ls.text_node({"\\begin{itemize}", "\t\\item "}),
    ls.insert_node(1),
    ls.text_node({"", "\\end{itemize}"}),
  }),
  -- Enumerate
  ls.snippet("enum", {
    ls.text_node({"\\begin{enumerate}", "\t\\item "}),
    ls.insert_node(1),
    ls.text_node({"", "\\end{enumerate}"}),
  }),
  -- Parentheses
  ls.snippet("lr", {
    ls.text_node({"\\left( "}),
    ls.insert_node(1),
    ls.text_node({" \\right)"}),
  }),
  -- Square brackets
  ls.snippet("lsq", {
    ls.text_node({"\\left[ "}),
    ls.insert_node(1),
    ls.text_node({" \\right]"}),
  }),
  -- Absolute value
  ls.snippet("abs", {
    ls.text_node({"\\left| "}),
    ls.insert_node(1),
    ls.text_node({" \\right|"}),
  }),
  -- Limit
  ls.snippet("lim", {
    ls.text_node({"\\lim_{"}),
    ls.insert_node(1, "n \\to \\infty"),
    ls.text_node({"} "}),
    ls.insert_node(2),
  }),
  -- Small Sum
  ls.snippet("sumsmall", {
    ls.text_node({"\\sum_{"}),
    ls.insert_node(1, "i=1"),
    ls.text_node({"}^{"}),
    ls.insert_node(2, "n"),
    ls.text_node({"} "}),
    ls.insert_node(3),
  }),
  -- Integral
  ls.snippet("int", {
    ls.text_node({"\\int_{"}),
    ls.insert_node(1),
    ls.text_node({"}^{"}),
    ls.insert_node(2),
    ls.text_node({"} "}),
    ls.insert_node(3),
    ls.text_node({" \\, d"}),
    ls.insert_node(4, "x"),
  }),
  -- Table
  ls.snippet("tab", {
    ls.text_node({
      "\\begin{table}[h]",
      "\t\\centering",
      "\t\\begin{tabular}{"
    }),
    ls.insert_node(1, "c"),
    ls.text_node({"}", "\t\t"}),
    ls.insert_node(2),
    ls.text_node({"", "\t\\end{tabular}", "\t\\caption{"}),
    ls.insert_node(3),
    ls.text_node({"}", "\t\\label{tab:"}),
    ls.insert_node(4),
    ls.text_node({"}", "\\end{table}"}),
  }),
  -- Large sum
  ls.snippet("sum", {
    ls.text_node({"\\displaystyle \\sum_{"}),
    ls.insert_node(1, "i=1"),
    ls.text_node({"}^{"}),
    ls.insert_node(2, "n"),
    ls.text_node({"}\\; "}),
    ls.insert_node(3),
  }),
  -- Large Fraction
  ls.snippet("frac", {
    ls.text_node({"\\displaystyle \\frac{"}),
    ls.insert_node(1),
    ls.text_node({"}{"}),
    ls.insert_node(2),
    ls.text_node({"}"}),
  }),
  -- Small fraction
  ls.snippet("fracsmall", {
    ls.insert_node(1),
    ls.text_node({" / "}),
    ls.insert_node(2),
  }),
})

-- Prioritise custom snippets
ls.add_snippets("tex", ls.snippets.tex, { override = true })
