#!/bin/sh

cat >~/.pentadactyl/colors/auto.penta <<EOL
" Solarized dark color scheme for Pentadactyl                      {{{1
" ----------------------------------------------------------------------
"
" Mantainer: claytron <robots@claytron.com>
" Name: solarized-dark

" Solarized color mappings                                          {{{1
" ----------------------------------------------------------------------
" This allows us to easily map the colors by name

" Foreground colors                                                 {{{2
" ----------------------------------------------------------------------
hi s_base03 color: #$C15 !important;
hi s_base02 color: #$Cf !important;
hi s_base01 color: #$C15 !important;
hi s_base00 color: #$C15 !important;
hi s_base0 color: #$C12 !important;
hi s_base1 color: #$C10 !important;
hi s_base2 color: #$C3 !important;
hi s_base3 color: #$C6 !important;
hi s_yellow color: #$C7 !important;
hi s_orange color: #$C5 !important;
hi s_red color: #$C9 !important;
hi s_magenta color: #$C9 !important;
hi s_violet color: #$C14 !important;
hi s_blue color: #$C13 !important;
hi s_cyan color: #$C11 !important;
hi s_green color: #$C1 !important;
hi s_whitesheepf color: #$C15 !important;
hi s_greysheepf color: #$C2 !important;
hi s_mediumsheepf color: #$C9 !important;
hi s_bluesheepf color: #$C10 !important;
hi s_blacksheepf color: #$Cb !important;


" Background colors                                                 {{{2
" ----------------------------------------------------------------------
hi s_base03_back background-color: #$Cb !important;
hi s_base02_back background-color: #$Cb !important;
hi s_base01_back background-color: #$Cb !important;
hi s_base00_back background-color: #$Cb !important;
hi s_base0_back background-color: #$C12 !important;
hi s_base1_back background-color: #$C10 !important;
hi s_base2_back background-color: #$C4 !important;
hi s_base3_back background-color: #$C4 !important;
hi s_yellow_back background-color: #$C12 !important;
hi s_orange_back background-color: #$C5 !important;
hi s_red_back background-color: #$C9 !important;
hi s_magenta_back background-color: #$C9 !important;
hi s_violet_back background-color: #$C14 !important;
hi s_blue_back background-color: #$C13 !important;
hi s_cyan_back background-color: #$C3 !important;
hi s_green_back background-color: #$C4 !important;
hi s_whitesheep background-color: #$C15 !important;
hi s_greysheep background-color: #$C4 !important;
hi s_mediumsheep background-color: #$C4 !important;
hi s_bluesheep background-color: #$C4 !important;
hi s_blacksheep background-color: #$Cb !important;
hi s_sandy background-color: #$C1 !important;
hi s_grey background-color: #$C2 !important;
hi s_red background-color: #$C3 !important;
hi s_green background-color: #$C8 !important;

" Gradient backgrounds                                              {{{2
" ----------------------------------------------------------------------
" base0 to base03
hi s_comp_title background: -moz-linear-gradient(60deg, #505e7a, #505e7a) !important;
" cyan to base03
hi s_comp_sep background: -moz-linear-gradient(60deg, #9d976f, #9d976f) !important;

" Status Line                                                       {{{1
" ----------------------------------------------------------------------
hi -l=s_whitesheepf,s_blacksheep StatusLineNormal
hi -l=s_greysheepf,s_red StatusLineBroken
hi -l=s_greysheepf,s_blacksheep StatusLineSecure
hi -l=s_blacksheepf,s_grey StatusLineExtended
hi -l=s_blacksheepf,s_red StatusWarningMsg
" Make sure the question output looks nice between each status color
hi StatusQuestion -a color: inherit !important; background-color: inherit !important;

" Command Line                                                      {{{1
" ----------------------------------------------------------------------
hi -l=s_whitesheepf,s_blacksheep Normal
hi -l=s_greysheepf,s_bluesheep CompItem[selected]
" background is s_base03
hi CompItem:nth-child(2n+1) -a background: rgba(0, 43, 54, .04);
hi -l=s_blue_back,s_cyan_back CompTitle
hi -l=s_greysheepf CompDesc -a
hi -l=s_greysheepf Preview -a
hi -l=s_comp_sep CompTitleSep height: 2px;
hi -l=s_bluesheepf,s_sandy Message
hi -l=s_greysheepf,s_red WarningMsg
hi -l=s_whitesheepf,s_red ErrorMsg
hi -l=s_greysheepf URL
hi -l=s_greysheepf URLExtra
hi -l=s_blacksheepf URL[selected]
hi -l=s_blacksheepf URLExtra[selected]
hi MoreMsg -a color: inherit !important; background-color: inherit !important;
hi -l=s_greysheepf,s_blacksheep Filter -a
hi -l=s_whitesheepf InfoMsg
hi -l=s_whitesheepf ModeMsg
hi -l=s_whitesheepf CmdInput
hi -l=s_whitesheepf,s_blacksheep CmdCmdLine
hi -l=s_greysheepf,s_red CmdErrorMsg

" Hints                                                             {{{1
" ----------------------------------------------------------------------
" The hint background is s_base3, the outline is s_base03
hi -l=s_bluesheepf Hint -a outline: 1px solid rgba(0, 0, 0, .5); background: rgba(20, 20, 20, .8);
hi -l=s_greysheepf,s_blue_back HintElem
hi -l=s_greysheepf,s_blacksheep HintActive

" Other                                                             {{{1
" ----------------------------------------------------------------------
hi -l=s_red_back Bell
hi -l=s_blue,s_base03_back NonText -a min-height: 16px; padding-left: 2px;
hi -l=s_magenta_back Search -a
hi -l=s_red Title -a
hi -l=s_blue Indicator -a
hi -l=s_green Question
hi -l=s_blue Enabled -a
hi -l=s_blue_back FrameIndicator -a
hi -l=s_base0,s_base3_back LinkInfo -a
hi -l=s_base03,s_base2_back LineNr
hi -l=s_blue Tag -a
hi -l=s_base03,s_orange_back EditorBlink1
hi -l=s_base01 EditorBlink2
hi -l=s_base2,s_base03_back EditorEditing>*
hi -l=s_base2,s_base03_back EditorEditing
hi -l=s_base03,s_red_back EditorError
hi -l=s_base01 Disabled -a
hi -l=s_base01 Addon:not([active]) -a
" background is s_base03
hi Addon:nth-child(2n+1) -a background: rgba(0, 43, 54, .04);
" background is s_base03
hi UsageItem:nth-of-type(2n) -a background: rgba(0, 43, 54, .04);
hi -l=s_base01 Download:not([active]) -a
" background is s_base03
hi Download:nth-child(2n+1) -a background: rgba(0, 43, 54, .04);
" Text shadow is s_base03
hi -l=s_base3 TabIconNumber -a text-shadow: #002b36 -1px 0 1px, #002b36 0 1px 1px, #002b36 1px 0 1px, #002b36 0 -1px 1px;
" buttons
hi -l=s_blue Button -a
hi -l=s_blue Button::after -a
hi -l=s_blue Button::before -a


" Help                                                              {{{1
" ----------------------------------------------------------------------
hi -l=s_base0,s_base03_back HelpBody -a
" Border is s_base3, and there to fake padding on the background image,
" since the logo is black and I'm putting it on a white bg
hi -l=s_base3_back Logo -a border: 5px solid #$C4 !important;
" This can't be !important, or else it overrides all links (e.g. ex,
" key, opt). The color used here is s_blue
hi HelpLink[href] -a color: #$C13;
hi -l=s_blue HelpTopic -a
hi -l=s_blue HelpType margin-right: 2ex;
hi -l=s_magenta HelpInfoLabel -a
hi -l=s_magenta HelpWarning -a
hi -l=s_magenta HelpNote -a
hi -l=s_orange HelpEx -a
hi -l=s_green HelpKey -a
hi -l=s_red HelpKeyword -a
hi -l=s_red HelpTag -a
hi -l=s_green HelpNewsTag -a
hi -l=s_yellow HelpHead -a
" Using s_base1 here for the border
hi HelpBorder -a border-color: #$C10 !important;
hi -l=s_cyan HelpSpec -a
hi -l=s_cyan HelpArg -a
hi -l=s_cyan HelpOptionalArg -a
hi -l=s_violet HelpString -a
hi -l=s_cyan HelpOpt -a
" Help code blocks
hi -l=s_base0 HelpXMLText -a
hi -l=s_base00,s_base3_back HelpXMLBase -a padding: 7px;
hi -l=s_blue HelpXMLTagStart -a
hi -l=s_blue HelpXMLTagEnd -a
hi -l=s_orange HelpXMLAttribute -a
hi -l=s_cyan HelpXMLString -a
hi -l=s_base01 HelpXMLComment -a
hi -l=s_base00 HelpXMLAttribute::after -a
hi -l=s_orange HelpXMLNamespace -a
hi -l=s_cyan HelpXMLNamespace::after -a
hi -l=s_cyan HelpXMLProcessing -a
hi -l=s_base00 HelpXMLProcessing::before -a
hi -l=s_base00 HelpXMLProcessing::after -a
hi HelpXML -a border: none;
hi HelpXMLBlock -a border: none;
hi -l=s_cyan Boolean -a
hi -l=s_yellow Keyword -a
hi -l=s_blue Function -a
hi -l=s_blue Null -a
hi -l=s_blue Number -a
hi -l=s_green Object -a
hi -l=s_base1 Comment -a
hi -l=s_base0 Comment -a

" vim: fdm=marker
EOL
