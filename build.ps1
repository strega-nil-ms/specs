[CmdletBinding()]
Param(
  [Parameter(Mandatory)]
  [string]$MarkdownFile
)

$pandocArgs = @(
  '--pdf-engine=xelatex'
  '-H', 'head.tex'
  '-V', 'subparagraph'
  '-V', 'geometry:top=3cm, bottom=3cm, left=3cm, right=3cm'
  '-V', 'fontfamily:times'
  '-V', 'monofont:Comic Code Ligatures'
  '-V', 'fontsize=11pt')

$builtFile = "$(Split-Path -LeafBase $MarkdownFile).pdf"

pandoc @pandocArgs $MarkdownFile -o $builtFile
