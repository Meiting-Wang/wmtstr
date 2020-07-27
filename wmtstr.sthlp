{smcl}
{right:Updated time: July 27, 2020}
{* -----------------------------title------------------------------------ *}{...}
{p 0 16 2}
{bf:[W-7] wmtstr} {hline 2} perform unique, ascending or descending processing on strings. You can view source code in {browse "https://github.com/Meiting-Wang/wmtstr":github}.


{* -----------------------------Syntax------------------------------------ *}{...}
{title:Syntax}

{p 8 8 2}
{cmd:wmtstr} {it:{help strings}} [, {it:{help wmtstr##Options:options}}]


{* -----------------------------Contents------------------------------------ *}{...}
{title:Contents}

{p 4 4 2}
{help wmtstr##Description:Description}{break}
{help wmtstr##Options:Options}{break}
{help wmtstr##Examples:Examples}{break}
{help wmtstr##Author:Author}


{* -----------------------------Description------------------------------------ *}{...}
{marker Description}{title:Description}

{p 4 4 2}
{bf:wmtstr} can perform unique, ascending or descending processing on strings. The result and the processing method used are stored in {bf:r()}. It is worth noting that this command can only be used in version 16.0 or later.


{* -----------------------------Options------------------------------------ *}{...}
{marker Options}{title:Options}

{synoptset 20}{...}
{synopthdr}
{synoptline}
{synopt :{opt u:nique}}Only keep the first occurrence of the word in the strings{p_end}
{synopt :{opt a:scending}}Rearrange all words in the strings in ascending order of the first character ASCII code{p_end}
{synopt :{opt d:escending}}Rearrange all words in the strings in descending order of the first character ASCII code{p_end}
{synopt :{opt di:gital}}If the strings you enter only contains numbers, you can use this option. For example, when the {opt ascending} and {opt digital} options exist at the same time, the entered numbers can be rearranged in ascending order according to the actual number size{p_end}
{synoptline}


{* -----------------------------Examples------------------------------------ *}{...}
{marker Examples}{title:Examples}

{p 4 4 2}Perform unique processing on strings by default{p_end}
{p 8 8 2}. {stata wmtstr price mpg weight mpg price trunk}{p_end}
{p 8 8 2}. {stata wmtstr price mpg weight mpg price trunk, u}{p_end}

{p 4 4 2}Perform ascending processing on strings{p_end}
{p 8 8 2}. {stata wmtstr price mpg weight mpg price trunk, a}{p_end}

{p 4 4 2}Perform descending processing on strings{p_end}
{p 8 8 2}. {stata wmtstr price mpg weight mpg price trunk, d}{p_end}

{p 4 4 2}Perform unique and descending processing on strings{p_end}
{p 8 8 2}. {stata wmtstr price mpg weight mpg price trunk, u a}{p_end}

{p 4 4 2}Perform unique processing on numbers{p_end}
{p 8 8 2}. {stata wmtstr 1 5 3 89 45 3 45 66 89 4}{p_end}
{p 8 8 2}. {stata wmtstr 1 5 3 89 45 3 45 66 89 4, u}{p_end}

{p 4 4 2}Perform ascending processing on numbers like ascending processing on strings{p_end}
{p 8 8 2}. {stata wmtstr 1 5 3 89 45 3 45 66 89 4, a}{p_end}

{p 4 4 2}Perform ascending processing on numbers according to the actual number size{p_end}
{p 8 8 2}. {stata wmtstr 1 5 3 89 45 3 45 66 89 4, a di}{p_end}

{p 4 4 2}Perform unique and ascending processing on numbers according to the actual number size{p_end}
{p 8 8 2}. {stata wmtstr 1 5 3 89 45 3 45 66 89 4, u a di}{p_end}

{p 4 4 2}Get the result and the processing method in {bf:r()}{p_end}
{p 8 8 2}. {stata wmtstr 1 5 3 89 45 3 45 66 89 4, u a di}{p_end}
{p 8 8 2}. {stata return list}{p_end}


{* -----------------------------Author------------------------------------ *}{...}
{marker Author}{title:Author}

{p 4 4 2}
Meiting Wang{break}
Institute for Economic and Social Research, Jinan University{break}
Guangzhou, China{break}
wangmeiting92@gmail.com

