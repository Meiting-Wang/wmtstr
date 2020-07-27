program define wmtstr, rclass
version 16
syntax anything(id="strings" equalok everything) [, Unique Ascending Descending DIgital]

*程序不合规时的报错
if ~ustrregexm("`anything'", "\s+") {
	dis "{error:I think your idea is to deal with two or more words}"
	exit
}

if ("`ascending'"!="") & ("`descending'"!="") {
	dis "{error:ascending and descending cannot exist together}"
	exit
}

local real "-?([1-9]\d*\.\d+|0\.\d*[1-9]\d*|[1-9]\d*|0)"
local real "^(`real')(\s+`real')+$"
if ~ustrregexm("`anything'", "`real'") & ("`digital'"!="") {
	dis "{error:not all characters entered are numbers.}"
	exit
}

*设置默认选项
if ("`unique'"=="") & ("`ascending'"=="") & ("`descending'"=="") {
	local unique unique
}

*将所输入的字符串一次导入`temp'变量中
tempvar temp
preserve  //--------------------------------------------------------------------
clear
local anything_num: word count `anything'
qui set obs `anything_num'
tokenize `anything'
qui gen `temp' = .
if "`digital'" == "" {
	qui tostring `temp', replace
}
local i = 1
while "``i''" != "" {
	if "`digital'" == "" {
		qui replace `temp' = "``i''" in `i++'
	}
	else {
		qui replace `temp' = ``i'' in `i++'
	}
}

*根据选项对`temp'变量做处理
if "`unique'" != "" {
	qui duplicates drop
}

if "`ascending'" != "" {
	qui gsort `temp'
}

if "`descending'" != "" {
	qui gsort -`temp'
}

*将`temp'变量的值输出至local中
local out_anything ""
forvalues i = 1/`=_N' {
	if ustrregexm("`=`temp'[`i']'", "\w+\s+\w+") {
		local out_anything `"`out_anything'"`=`temp'[`i']'" "'
	}
	else {
		local out_anything `"`out_anything'`=`temp'[`i']' "'
	}
}
local out_anything = ustrtrim(stritrim("`out_anything'")) //去除字符串中间和两端多余的空格(以更好的输出)
restore //----------------------------------------------------------------------

*将结果输出至Stata界面上
local p_method ""
if "`unique'" != "" {
	local p_method "`unique'"
}
if "`ascending'" != "" {
	if "`p_method'" != "" {
		local p_method "`p_method' & `ascending'"
	}
	else {
		local p_method "`ascending'"
	}
}
if "`descending'" != "" {
	if "`p_method'" != "" {
		local p_method "`p_method' & `descending'"
	}
	else {
		local p_method "`descending'"
	}
}
if "`digital'" != "" { //运行到这里，`p_method'肯定不为空
	local p_method "`p_method' & `digital'"
}
dis in g "Processing method: `p_method'"
dis in y `"`out_anything'"'

*返回值
return local processing_method "`p_method'"
return local wmtstr "`out_anything'"
end