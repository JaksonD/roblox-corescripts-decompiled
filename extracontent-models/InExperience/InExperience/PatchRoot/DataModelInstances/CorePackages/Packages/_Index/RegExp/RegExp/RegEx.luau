local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local v7 = {
    cacheSize = 256, 
    unicodeData = false
};
local v8 = v7.unicodeData and require(script:WaitForChild("_unicodechar_category"));
local v9 = v7.unicodeData and require(script:WaitForChild("_scripts"));
local v10 = v7.unicodeData and require(script:WaitForChild("_xuc"));
local v11 = setmetatable({}, {
    __mode = "k"
});
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = nil;
local function v24(v16, v17) --[[ Line: 54 ]] --[[ Name: to_str_arr ]]
    if v17 then
        v16 = string.sub(v16, utf8.offset(v16, v17));
    end;
    local v18 = utf8.len(v16);
    if v18 <= 1999 then
        return {
            n = v18, 
            s = v16; 
            utf8.codepoint(v16, 1, #v16)
        };
    else
        local v19 = math.ceil(v18 / 1999);
        local v20 = table.create(v18);
        local v21 = 1;
        for v22 = 1, v19 do
            local v23 = table.pack(utf8.codepoint(v16, utf8.offset(v16, v22 * 1999 - 1998), utf8.offset(v16, v22 * 1999 - (v22 == v19 and 1998 - ((v18 - 1) % 1999 + 1) or -1)) - 1));
            table.move(v23, 1, v23.n, v21, v20);
            v21 = v21 + v23.n;
        end;
        v20.s = v16;
        v20.n = v18;
        return v20;
    end;
end;
local function v30(v25) --[[ Line: 74 ]] --[[ Name: from_str_arr ]]
    local v26 = v25.n or #v25;
    if v26 <= 7997 then
        return utf8.char(table.unpack(v25));
    else
        local v27 = math.ceil(v26 / 7997);
        local v28 = table.create(v27);
        for v29 = 1, v27 do
            v28[v29] = utf8.char(table.unpack(v25, v29 * 7997 - 7996, v29 * 7997 - (v29 == v27 and 7997 - ((v26 - 1) % 7997 + 1) or 0)));
        end;
        return table.concat(v28);
    end;
end;
local function _(v31, v32, v33) --[[ Line: 87 ]] --[[ Name: utf8_sub ]]
    v33 = utf8.offset(v31, v33);
    return (string.sub(v31, utf8.offset(v31, v32), v33 and v33 - 1));
end;
local v35 = {
    a = "anchored", 
    i = "caseless", 
    m = "multiline", 
    s = "dotall", 
    u = "unicode", 
    U = "ungreedy", 
    x = "extended"
};
local v36 = {
    alnum = true, 
    alpha = true, 
    ascii = true, 
    blank = true, 
    cntrl = true, 
    digit = true, 
    graph = true, 
    lower = true, 
    print = true, 
    punct = true, 
    space = true, 
    upper = true, 
    word = true, 
    xdigit = true
};
local v37 = {
    [68] = {
        "class", 
        "digit", 
        true
    }, 
    [83] = {
        "class", 
        "space", 
        true
    }, 
    [87] = {
        "class", 
        "word", 
        true
    }, 
    [100] = {
        "class", 
        "digit", 
        false
    }, 
    [115] = {
        "class", 
        "space", 
        false
    }, 
    [119] = {
        "class", 
        "word", 
        false
    }, 
    [72] = {
        "class", 
        "blank", 
        true
    }, 
    [86] = {
        "class", 
        "vertical_tab", 
        true
    }, 
    [104] = {
        "class", 
        "blank", 
        false
    }, 
    [118] = {
        "class", 
        "vertical_tab", 
        false
    }, 
    [78] = {
        78
    }, 
    [82] = {
        82
    }, 
    [66] = 8, 
    [110] = 10, 
    [114] = 13, 
    [116] = 9
};
local v38 = {
    [98] = {
        98, 
        {
            "class", 
            "word", 
            false
        }
    }, 
    [66] = {
        66, 
        {
            "class", 
            "word", 
            false
        }
    }, 
    [75] = {
        75
    }, 
    [71] = {
        71
    }, 
    [74] = {
        74
    }, 
    [90] = {
        90
    }, 
    [122] = {
        122
    }
};
local v39 = {
    C = true, 
    Cc = true, 
    Cf = true, 
    Cn = true, 
    Co = true, 
    Cs = true, 
    L = true, 
    Ll = true, 
    Lm = true, 
    Lo = true, 
    Lt = true, 
    Lu = true, 
    M = true, 
    Mc = true, 
    Me = true, 
    Mn = true, 
    N = true, 
    Nd = true, 
    Nl = true, 
    No = true, 
    P = true, 
    Pc = true, 
    Pd = true, 
    Pe = true, 
    Pf = true, 
    Pi = true, 
    Po = true, 
    Ps = true, 
    S = true, 
    Sc = true, 
    Sk = true, 
    Sm = true, 
    So = true, 
    Z = true, 
    Zl = true, 
    Zp = true, 
    Zs = true, 
    Xan = true, 
    Xps = true, 
    Xsp = true, 
    Xuc = true, 
    Xwd = true
};
local v40 = {
    [33] = true, 
    [34] = true, 
    [35] = true, 
    [36] = true, 
    [37] = true, 
    [38] = true, 
    [39] = true, 
    [40] = true, 
    [41] = true, 
    [42] = true, 
    [43] = true, 
    [44] = true, 
    [45] = true, 
    [46] = true, 
    [47] = true, 
    [58] = true, 
    [59] = true, 
    [60] = true, 
    [61] = true, 
    [62] = true, 
    [63] = true, 
    [64] = true, 
    [91] = true, 
    [92] = true, 
    [93] = true, 
    [94] = true, 
    [95] = true, 
    [96] = true, 
    [123] = true, 
    [124] = true, 
    [125] = true, 
    [126] = true
};
local v41 = {
    36
};
local v42 = {
    46
};
local v43 = {
    94
};
local v44 = {
    124
};
local function _(v45, v46, v47) --[[ Line: 150 ]] --[[ Name: check_re ]]
    -- upvalues: v11 (copy), v12 (copy)
    if v45 == "Match" then
        return function(...) --[[ Line: 152 ]]
            -- upvalues: v11 (ref), v46 (copy), v47 (copy)
            if select("#", ...) < 1 then
                error("missing argument #1 (Match expected)", 2);
            end;
            local v48, v49 = ...;
            if not v11[v48] or v11[v48].name ~= "Match" then
                error(string.format("invalid argument #1 to %q (Match expected, got %s)", v46, (typeof(v48))), 2);
            else
                v48 = v11[v48];
            end;
            if (v46 == "group" or v46 == "span") and v49 == nil then
                v49 = 0;
            end;
            return v47(v48, v49);
        end;
    else
        return function(...) --[[ Line: 171 ]]
            -- upvalues: v11 (ref), v46 (copy), v12 (ref), v47 (copy)
            local v50 = select("#", ...);
            if v50 < 1 then
                error("missing argument #1 (RegEx expected)", 2);
            elseif v50 < 2 then
                error("missing argument #2 (string expected)", 2);
            end;
            local v51, v52, v53, v54, v55, v56 = ...;
            if not v11[v51] or v11[v51].name ~= "RegEx" then
                if type(v51) ~= "string" and type(v51) ~= "number" then
                    error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", v46, (typeof(v51))), 2);
                end;
                v51 = v12.fromstring(v51);
            elseif v46 == "sub" then
                if type(v53) == "number" then
                    v53 = v53 .. "";
                elseif type(v53) ~= "string" then
                    error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v53))), 2);
                end;
            elseif type(v52) == "number" then
                v52 = v52 .. "";
            elseif type(v52) ~= "string" then
                error(string.format("invalid argument #2 to %q (string expected, got %s)", v46, (typeof(v52))), 2);
            end;
            if v46 ~= "sub" and v46 ~= "split" then
                local v57 = typeof(v53);
                if v57 ~= "nil" then
                    v53 = tonumber(v53);
                    if not v53 then
                        error(string.format("invalid argument #3 to %q (number expected, got %s)", v46, v57), 2);
                    else
                        v53 = if v53 < 0 then #v52 + math.floor(v53 + 0.5) + 1 else math.max(math.floor(v53 + 0.5), 1);
                    end;
                end;
            end;
            v51 = v11[v51];
            if v46 == "match" or v46 == "matchiter" then
                v54 = ...;
            elseif v46 == "sub" then
                v56 = ...;
            end;
            return v47(v51, v52, v53, v54, v55, v56);
        end;
    end;
end;
local function v69(v59) --[[ Line: 219 ]] --[[ Name: match_tostr ]]
    -- upvalues: v11 (copy)
    local l_spans_0 = v11[v59].spans;
    local v61 = l_spans_0[0][1];
    local v62 = l_spans_0[0][2];
    if v62 <= v61 then
        return string.format("Match (%d..%d, empty)", v61, v62 - 1);
    else
        local l_format_0 = string.format;
        local v64 = "Match (%d..%d): %s";
        local l_v61_0 = v61;
        local v66 = v62 - 1;
        local l_input_0 = l_spans_0.input;
        local v68 = utf8.offset(l_input_0, v62);
        return l_format_0(v64, l_v61_0, v66, (string.sub(l_input_0, utf8.offset(l_input_0, v61), v68 and v68 - 1)));
    end;
end;
local function v76(v70, v71, v72, v73) --[[ Line: 228 ]] --[[ Name: new_match ]]
    -- upvalues: v15 (ref), v14 (ref), v69 (copy), v11 (copy)
    v70.source = v72;
    v70.input = v73;
    local v74 = newproxy(true);
    local v75 = getmetatable(v74);
    v75.__metatable = v15;
    v75.__index = setmetatable(v70, v14);
    v75.__tostring = v69;
    v11[v74] = {
        name = "Match", 
        spans = v70, 
        group_id = v71
    };
    return v74;
end;
local function v83(v77, v78) --[[ Line: 240 ]]
    local v79 = v77.spans[type(v78) == "number" and v78 or v77.group_id[v78]];
    if not v79 then
        return nil;
    else
        local l_input_1 = v77.spans.input;
        local v81 = v79[1];
        local v82 = v79[2];
        v82 = utf8.offset(l_input_1, v82);
        return (string.sub(l_input_1, utf8.offset(l_input_1, v81), v82 and v82 - 1));
    end;
end;
local v84 = "group";
local l_v84_0 = v84 --[[ copy: 27 -> 47 ]];
local l_v83_0 = v83 --[[ copy: 26 -> 48 ]];
v14.group = function(...) --[[ Line: 152 ]]
    -- upvalues: v11 (copy), l_v84_0 (copy), l_v83_0 (copy)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v87, v88 = ...;
    if not v11[v87] or v11[v87].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v84_0, (typeof(v87))), 2);
    else
        v87 = v11[v87];
    end;
    if (l_v84_0 == "group" or l_v84_0 == "span") and v88 == nil then
        v88 = 0;
    end;
    return l_v83_0(v87, v88);
end;
v83 = function(v89, v90) --[[ Line: 248 ]]
    local v91 = v89.spans[type(v90) == "number" and v90 or v89.group_id[v90]];
    if not v91 then
        return nil;
    else
        return v91[1], v91[2] - 1;
    end;
end;
v84 = "span";
local l_v84_1 = v84 --[[ copy: 27 -> 49 ]];
local l_v83_1 = v83 --[[ copy: 26 -> 50 ]];
v14.span = function(...) --[[ Line: 152 ]]
    -- upvalues: v11 (copy), l_v84_1 (copy), l_v83_1 (copy)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v94, v95 = ...;
    if not v11[v94] or v11[v94].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v84_1, (typeof(v94))), 2);
    else
        v94 = v11[v94];
    end;
    if (l_v84_1 == "group" or l_v84_1 == "span") and v95 == nil then
        v95 = 0;
    end;
    return l_v83_1(v94, v95);
end;
v83 = function(v96) --[[ Line: 256 ]]
    local l_spans_1 = v96.spans;
    if l_spans_1.n > 0 then
        local v98 = table.create(l_spans_1.n);
        for v99 = 0, l_spans_1.n do
            local v100 = l_spans_1[v99];
            if v100 then
                local l_input_2 = l_spans_1.input;
                local v102 = v100[1];
                local v103 = v100[2];
                v103 = utf8.offset(l_input_2, v103);
                v98[v99] = string.sub(l_input_2, utf8.offset(l_input_2, v102), v103 and v103 - 1);
            end;
        end;
        return table.unpack(v98, 1, l_spans_1.n);
    else
        local l_input_3 = l_spans_1.input;
        local v105 = l_spans_1[0][1];
        local v106 = l_spans_1[0][2];
        v106 = utf8.offset(l_input_3, v106);
        return (string.sub(l_input_3, utf8.offset(l_input_3, v105), v106 and v106 - 1));
    end;
end;
v84 = "groups";
local l_v84_2 = v84 --[[ copy: 27 -> 51 ]];
local l_v83_2 = v83 --[[ copy: 26 -> 52 ]];
v14.groups = function(...) --[[ Line: 152 ]]
    -- upvalues: v11 (copy), l_v84_2 (copy), l_v83_2 (copy)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v109, v110 = ...;
    if not v11[v109] or v11[v109].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v84_2, (typeof(v109))), 2);
    else
        v109 = v11[v109];
    end;
    if (l_v84_2 == "group" or l_v84_2 == "span") and v110 == nil then
        v110 = 0;
    end;
    return l_v83_2(v109, v110);
end;
v83 = function(v111) --[[ Line: 271 ]]
    local l_spans_2 = v111.spans;
    local v113 = {};
    for v114, v115 in pairs(v111.group_id) do
        v115 = l_spans_2[v115];
        if v115 then
            local l_input_4 = l_spans_2.input;
            local v117 = v115[1];
            local v118 = v115[2];
            v118 = utf8.offset(l_input_4, v118);
            v113[v114] = string.sub(l_input_4, utf8.offset(l_input_4, v117), v118 and v118 - 1);
        end;
    end;
    return v113;
end;
v84 = "groupdict";
local l_v84_3 = v84 --[[ copy: 27 -> 53 ]];
local l_v83_3 = v83 --[[ copy: 26 -> 54 ]];
v14.groupdict = function(...) --[[ Line: 152 ]]
    -- upvalues: v11 (copy), l_v84_3 (copy), l_v83_3 (copy)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v121, v122 = ...;
    if not v11[v121] or v11[v121].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v84_3, (typeof(v121))), 2);
    else
        v121 = v11[v121];
    end;
    if (l_v84_3 == "group" or l_v84_3 == "span") and v122 == nil then
        v122 = 0;
    end;
    return l_v83_3(v121, v122);
end;
v83 = function(v123) --[[ Line: 283 ]]
    local l_spans_3 = v123.spans;
    local v125 = table.create(l_spans_3.n);
    for v126 = 0, l_spans_3.n do
        local v127 = l_spans_3[v126];
        if v127 then
            local l_input_5 = l_spans_3.input;
            local v129 = v127[1];
            local v130 = v127[2];
            v130 = utf8.offset(l_input_5, v130);
            v125[v126] = string.sub(l_input_5, utf8.offset(l_input_5, v129), v130 and v130 - 1);
        end;
    end;
    v125.n = l_spans_3.n;
    return v125;
end;
v84 = "groupdict";
local l_v84_4 = v84 --[[ copy: 27 -> 55 ]];
local l_v83_4 = v83 --[[ copy: 26 -> 56 ]];
v14.grouparr = function(...) --[[ Line: 152 ]]
    -- upvalues: v11 (copy), l_v84_4 (copy), l_v83_4 (copy)
    if select("#", ...) < 1 then
        error("missing argument #1 (Match expected)", 2);
    end;
    local v133, v134 = ...;
    if not v11[v133] or v11[v133].name ~= "Match" then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", l_v84_4, (typeof(v133))), 2);
    else
        v133 = v11[v133];
    end;
    if (l_v84_4 == "group" or l_v84_4 == "span") and v134 == nil then
        v134 = 0;
    end;
    return l_v83_4(v133, v134);
end;
local v135 = {
    CR = 0, 
    LF = 1, 
    CRLF = 2, 
    ANYRLF = 3, 
    ANY = 4, 
    NUL = 5
};
v83 = function(v136, v137, v138) --[[ Line: 300 ]] --[[ Name: is_newline ]]
    local l_newline_0 = v138.newline;
    local v140 = v136[v137];
    if l_newline_0 == 0 then
        return v140 == 13;
    elseif l_newline_0 == 2 then
        local v141 = false;
        if v140 == 10 then
            v141 = v136[v137 - 1] == 32;
        end;
        return v141;
    elseif l_newline_0 == 3 then
        local v142 = true;
        if v140 ~= 10 then
            v142 = v140 == 13;
        end;
        return v142;
    elseif l_newline_0 == 4 then
        local v143 = true;
        if v140 ~= 10 then
            v143 = true;
            if v140 ~= 11 then
                v143 = true;
                if v140 ~= 12 then
                    v143 = true;
                    if v140 ~= 13 then
                        v143 = true;
                        if v140 ~= 133 then
                            v143 = true;
                            if v140 ~= 8232 then
                                v143 = v140 == 8233;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v143;
    elseif l_newline_0 == 5 then
        return v140 == 0;
    else
        return v140 == 10;
    end;
end;
v84 = function(v144, v145, v146, v147, v148) --[[ Line: 324 ]] --[[ Name: tkn_char_match ]]
    -- upvalues: v84 (copy), v8 (copy), v40 (copy), v10 (copy), v83 (copy)
    local v149 = v145[v146];
    if not v149 then
        return false;
    else
        if v147.ignoreCase and v149 >= 97 and v149 <= 122 then
            v149 = v149 - 32;
        end;
        if type(v144) == "number" then
            return v144 == v149;
        elseif v144[1] == "charset" then
            for _, v151 in ipairs(v144[3]) do
                if v84(v151, v145, v146, v147, v148) then
                    return not v144[2];
                end;
            end;
            return v144[2];
        elseif v144[1] == "range" then
            return v144[2] <= v149 and v149 <= v144[3] or v147.ignoreCase and v149 >= 65 and v149 <= 90 and v149 + 32 >= v144[2] and v149 + 32 <= v144[3];
        elseif v144[1] == "class" then
            local v152 = v144[2];
            local v153 = v144[3];
            local v154 = false;
            if v152 == "xdigit" then
                v154 = v149 >= 48 and v149 <= 57 or v149 >= 65 and v149 <= 70 or v149 >= 97 and v149 <= 102;
            elseif v152 == "ascii" then
                v154 = v149 <= 127;
            elseif v152 == "vertical_tab" then
                v154 = v149 >= 10 and v149 <= 13 or v149 == 8232 or v149 == 8233;
            elseif v147.unicode then
                local v155 = v8[v149] or "Cn";
                local v156 = v155:sub(1, 1);
                if v152 == "alnum" then
                    local v157 = true;
                    if v156 ~= "L" then
                        v157 = true;
                        if v155 ~= "Nl" then
                            v157 = v155 == "Nd";
                        end;
                    end;
                    v154 = v157;
                elseif v152 == "alpha" then
                    local v158 = true;
                    if v156 ~= "L" then
                        v158 = v155 == "Nl";
                    end;
                    v154 = v158;
                elseif v152 == "blank" then
                    local v159 = true;
                    if v155 ~= "Zs" then
                        v159 = v149 == 9;
                    end;
                    v154 = v159;
                elseif v152 == "cntrl" then
                    v154 = v155 == "Cc";
                elseif v152 == "digit" then
                    v154 = v155 == "Nd";
                elseif v152 == "graph" then
                    local v160 = false;
                    if v156 ~= "P" then
                        v160 = v156 ~= "C";
                    end;
                    v154 = v160;
                elseif v152 == "lower" then
                    v154 = v155 == "Ll";
                elseif v152 == "print" then
                    v154 = v156 ~= "C";
                elseif v152 == "punct" then
                    v154 = v156 == "P";
                elseif v152 == "space" then
                    local v161 = true;
                    if v156 ~= "Z" then
                        v161 = false;
                        if v149 >= 9 then
                            v161 = v149 <= 13;
                        end;
                    end;
                    v154 = v161;
                elseif v152 == "upper" then
                    v154 = v155 == "Lu";
                elseif v152 == "word" then
                    local v162 = true;
                    if v156 ~= "L" then
                        v162 = true;
                        if v155 ~= "Nl" then
                            v162 = true;
                            if v155 ~= "Nd" then
                                v162 = v155 == "Pc";
                            end;
                        end;
                    end;
                    v154 = v162;
                end;
            elseif v152 == "alnum" then
                v154 = v149 >= 48 and v149 <= 57 or v149 >= 65 and v149 <= 90 or v149 >= 97 and v149 <= 122;
            elseif v152 == "alpha" then
                v154 = v149 >= 65 and v149 <= 90 or v149 >= 97 and v149 <= 122;
            elseif v152 == "blank" then
                local v163 = true;
                if v149 ~= 9 then
                    v163 = v149 == 32;
                end;
                v154 = v163;
            elseif v152 == "cntrl" then
                local v164 = true;
                if v149 > 31 then
                    v164 = v149 == 127;
                end;
                v154 = v164;
            elseif v152 == "digit" then
                local v165 = false;
                if v149 >= 48 then
                    v165 = v149 <= 57;
                end;
                v154 = v165;
            elseif v152 == "graph" then
                local v166 = false;
                if v149 >= 33 then
                    v166 = v149 <= 126;
                end;
                v154 = v166;
            elseif v152 == "lower" then
                local v167 = false;
                if v149 >= 97 then
                    v167 = v149 <= 122;
                end;
                v154 = v167;
            elseif v152 == "print" then
                local v168 = false;
                if v149 >= 32 then
                    v168 = v149 <= 126;
                end;
                v154 = v168;
            elseif v152 == "punct" then
                v154 = v40[v149];
            elseif v152 == "space" then
                v154 = v149 >= 9 and v149 <= 13 or v149 == 32;
            elseif v152 == "upper" then
                local v169 = false;
                if v149 >= 65 then
                    v169 = v149 <= 90;
                end;
                v154 = v169;
            elseif v152 == "word" then
                v154 = v149 >= 48 and v149 <= 57 or v149 >= 65 and v149 <= 90 or v149 >= 97 and v149 <= 122 or v149 == 95;
            end;
            if v153 then
                return not v154;
            else
                return v154;
            end;
        elseif v144[1] == "category" then
            local v170 = v8[v149] or "Cn";
            local v171 = v144[3];
            local v172 = #v171;
            if v172 == 3 then
                local v173 = false;
                if v171 == "Xan" or v171 == "Xwd" then
                    v173 = v170:find("^[LN]") or v171 == "Xwd" and v149 == 95;
                elseif v171 == "Xps" or v171 == "Xsp" then
                    local v174 = true;
                    if v170:sub(1, 1) ~= "Z" then
                        v174 = false;
                        if v149 >= 9 then
                            v174 = v149 <= 13;
                        end;
                    end;
                    v173 = v174;
                elseif v171 == "Xuc" then
                    v173 = v84(v10, v145, v146, v147, v148);
                end;
                if v144[2] then
                    return not v173;
                else
                    return v173;
                end;
            elseif v170:sub(1, v172) == v171 then
                return not v144[2];
            else
                return v144[2];
            end;
        elseif v144[1] == 46 then
            return v147.dotAll or not v83(v145, v146, v148);
        elseif v144[1] == 78 then
            return not v83(v145, v146, v148);
        elseif v144[1] == 82 then
            if v148.newline_seq == 0 then
                local v175 = true;
                if v149 ~= 10 then
                    v175 = v149 == 13;
                end;
                return v175;
            else
                local v176 = true;
                if v149 ~= 10 then
                    v176 = true;
                    if v149 ~= 11 then
                        v176 = true;
                        if v149 ~= 12 then
                            v176 = true;
                            if v149 ~= 13 then
                                v176 = true;
                                if v149 ~= 133 then
                                    v176 = true;
                                    if v149 ~= 8232 then
                                        v176 = v149 == 8233;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                return v176;
            end;
        else
            return false;
        end;
    end;
end;
local function v182(v177, v178, v179) --[[ Line: 449 ]] --[[ Name: find_alternation ]]
    -- upvalues: v44 (copy)
    while true do
        local v180 = v177[v178];
        local v181 = type(v180) == "table";
        if v180 == v44 then
            return v178, v179;
        else
            if v181 and v180[1] == 40 then
                if v179 then
                    v179 = v179 + v180.count;
                end;
                v178 = v180[3];
            elseif v181 and v180[1] == "quantifier" and type(v180[5]) == "table" and v180[5][1] == 40 then
                if v179 then
                    v179 = v179 + v180[5].count;
                end;
                v178 = v180[5][3];
            elseif not v180 or v181 and v180[1] == 41 then
                return nil, v179;
            elseif v179 then
                if v181 and v180[1] == "quantifier" then
                    v179 = v179 + v180[3];
                else
                    v179 = v179 + 1;
                end;
            end;
            v178 = v178 + 1;
        end;
    end;
end;
local function v262(v183, v184, v185, v186, v187, v188) --[[ Line: 478 ]] --[[ Name: re_rawfind ]]
    -- upvalues: v182 (copy), v84 (copy), v83 (copy)
    local v189 = 0;
    local l_v185_0 = v185;
    local l_v185_1 = v185;
    local v192 = {};
    while v189 do
        if v189 == 0 then
            v189 = v189 + 1;
            local v193 = v182(v183, v189);
            if v193 then
                table.insert(v192, 1, {
                    "alternation", 
                    v193, 
                    l_v185_0
                });
            end;
        else
            local v194 = v183[v189];
            local v195 = false;
            if type(v194) == "table" then
                v195 = v194[1];
            end;
            if not v194 then
                break;
            elseif v194 == "ACCEPT" then
                local v196 = true;
                local l_v189_0 = v189;
                repeat
                    l_v189_0 = l_v189_0 + 1;
                    local v198 = type(v183[l_v189_0]) == "table";
                    local v199 = v183[l_v189_0];
                    if v198 and (v199[1] == 40 or v199[1] == "quantifier" and type(v199[5]) == "table" and v199[5][1] == 40) then
                        l_v189_0 = v199[1] == "quantifier" and v199[5][3] or v199[3];
                    elseif v198 and v199[1] == 41 and (v199[4] == 33 or v199[4] == 61) then
                        v196 = false;
                        v189 = l_v189_0;
                        break;
                    end;
                until not v199;
                if v196 then
                    break;
                end;
            elseif v194 == "PRUNE" or v194 == "SKIP" then
                table.insert(v192, 1, {
                    v194, 
                    l_v185_0
                });
                v189 = v189 + 1;
            elseif v195 == 40 then
                table.insert(v192, 1, {
                    "group", 
                    v189, 
                    l_v185_0, 
                    nil, 
                    v194[2], 
                    v194[3], 
                    v194[4]
                });
                v189 = v189 + 1;
                local v200, v201 = v182(v183, v189, (not (v194[4] ~= 33) or v194[4] == 61) and v194[5] and 0);
                if v200 then
                    table.insert(v192, 1, {
                        "alternation", 
                        v200, 
                        l_v185_0
                    });
                end;
                if v201 then
                    l_v185_0 = l_v185_0 - v201;
                end;
            elseif v195 == 41 and v194[4] ~= 33 then
                if v194[4] == 33 or v194[4] == 61 then
                    local v202, v203;
                    while true do
                        v203 = nil;
                        v202 = table.remove(v192, 1);
                        if v202[1] ~= "group" or v202[2] ~= v194[3] then
                            if v202[1] == "matchStart" and not v203 and v194[4] == 61 then
                                v203 = v202;
                            end;
                        else
                            break;
                        end;
                    end;
                    if (v194[4] == 33 or v194[4] == 61) and not v194[5] then
                        l_v185_0 = v202[3];
                    end;
                    if v203 then
                        table.insert(v192, 1, v203);
                    end;
                elseif v194[4] == 62 then
                    repeat
                        local v204 = table.remove(v192, 1);
                    until not v204 or v204[1] == "group" and v204[2] == v194[3];
                else
                    for _, v206 in ipairs(v192) do
                        if v206[1] == "group" and v206[2] == v194[3] then
                            if v206.jmp then
                                v189 = v206.jmp;
                            end;
                            v206[4] = l_v185_0;
                            if v206[7] == "quantifier" and v206[10] + 1 < v206[9] then
                                if v183[v194[3]][4] ~= "lazy" or v206[10] + 1 < v206[8] then
                                    v189 = v194[3];
                                end;
                                local v207 = v183[v194[3]];
                                table.insert(v192, 1, {
                                    "group", 
                                    v206[2], 
                                    l_v185_0, 
                                    nil, 
                                    v207[5][2], 
                                    v207[5][3], 
                                    "quantifier", 
                                    v207[2], 
                                    v207[3], 
                                    v206[10] + 1, 
                                    v206[11], 
                                    v207[4]
                                });
                                if v206[11] then
                                    table.insert(v192, 1, {
                                        "alternation", 
                                        v206[11], 
                                        l_v185_0
                                    });
                                    break;
                                else
                                    break;
                                end;
                            else
                                break;
                            end;
                        end;
                    end;
                end;
                v189 = v189 + 1;
            elseif v195 == 75 then
                table.insert(v192, 1, {
                    "matchStart", 
                    l_v185_0
                });
                v189 = v189 + 1;
            elseif v195 == 124 then
                local l_v189_1 = v189;
                repeat
                    l_v189_1 = l_v189_1 + 1;
                    local v209 = type(v183[l_v189_1]) == "table";
                    local v210 = v183[l_v189_1];
                    if v209 and (v210[1] == 40 or v210[1] == "quantifier" and type(v210[5]) == "table" and v210[5][1] == 40) then
                        l_v189_1 = v210[1] == "quantifier" and v210[5][3] or v210[3];
                    end;
                until v209 and v210[1] == 41 or not v210;
                if v183[l_v189_1] then
                    for _, v212 in ipairs(v192) do
                        if v212[1] == "group" and v212[6] == l_v189_1 then
                            v189 = v212[6];
                            break;
                        end;
                    end;
                else
                    v189 = l_v189_1;
                end;
            elseif v195 == "recurmatch" then
                table.insert(v192, 1, {
                    "group", 
                    v194[3], 
                    l_v185_0, 
                    nil, 
                    nil, 
                    v183[v194[3]][3], 
                    nil; 
                    jmp = v189
                });
                v189 = v194[3] + 1;
                local v213, _ = v182(v183, v189);
                if v213 then
                    table.insert(v192, 1, {
                        "alternation", 
                        v213, 
                        l_v185_0
                    });
                end;
            else
                local v215 = nil;
                if v194 == "FAIL" then
                    v215 = false;
                elseif v195 == 41 then
                    repeat
                        local v216 = table.remove(v192, 1);
                    until v216[1] == "group" and v216[2] == v194[3];
                elseif v195 == "quantifier" then
                    if type(v194[5]) == "table" and v194[5][1] == 40 then
                        local v217 = v182(v183, v189 + 1);
                        if v217 then
                            table.insert(v192, 1, {
                                "alternation", 
                                v217, 
                                l_v185_0
                            });
                        end;
                        table.insert(v192, v217 and 2 or 1, {
                            "group", 
                            v189, 
                            l_v185_0, 
                            nil, 
                            v194[5][2], 
                            v194[5][3], 
                            "quantifier", 
                            v194[2], 
                            v194[3], 
                            0, 
                            v217, 
                            v194[4]
                        });
                        if v194[4] == "lazy" and v194[2] == 0 then
                            v189 = v194[5][3];
                        end;
                        v215 = true;
                    else
                        local v218 = nil;
                        local v219 = nil;
                        local v220 = 1;
                        local v221 = false;
                        if type(v194[5]) == "table" then
                            v221 = v194[5][1] == "backref";
                        end;
                        if v221 then
                            v220 = 0;
                            local v222 = v194[5][2];
                            for _, v224 in ipairs(v192) do
                                if v224[1] == "group" and v224[5] == v222 then
                                    v218 = v224[3];
                                    v219 = v224[4];
                                    v220 = v219 - v218;
                                    break;
                                end;
                            end;
                        end;
                        local v225 = l_v185_0 + v194[2] * v220;
                        local v226 = 0;
                        while v226 < v194[3] do
                            if v221 then
                                if v218 and v219 then
                                    local l_l_v185_0_0 = l_v185_0;
                                    local l_s_0 = v184.s;
                                    local l_v218_0 = v218;
                                    local v230 = utf8.offset(l_s_0, v219);
                                    local v231 = string.sub(l_s_0, utf8.offset(l_s_0, l_v218_0), v230 and v230 - 1);
                                    l_v218_0 = v184.s;
                                    v230 = l_v185_0 + v220;
                                    v230 = utf8.offset(l_v218_0, v230);
                                    if v231 ~= string.sub(l_v218_0, utf8.offset(l_v218_0, l_l_v185_0_0), v230 and v230 - 1) then
                                        break;
                                    end;
                                else
                                    break;
                                end;
                            elseif not v84(v194[5], v184, l_v185_0, v186, v187) then
                                break;
                            end;
                            l_v185_0 = l_v185_0 + v220;
                            v226 = v226 + 1;
                        end;
                        v215 = v194[2] <= v226;
                        if v215 and v194[4] ~= "possessive" then
                            if v194[4] == "lazy" then
                                local l_l_v185_0_1 = l_v185_0;
                                l_v185_0 = v225;
                                v225 = l_l_v185_0_1;
                            end;
                            table.insert(v192, 1, {
                                "quantifier", 
                                v189, 
                                l_v185_0, 
                                math.min(v225, v184.n + 1), 
                                (v194[4] == "lazy" and 1 or -1) * v220
                            });
                        end;
                    end;
                elseif v195 == "backref" then
                    local v233 = nil;
                    local v234 = nil;
                    local v235 = v194[2];
                    for _, v237 in ipairs(v192) do
                        if v237[1] == "group" and v237[5] == v235 then
                            v233 = v237[3];
                            v234 = v237[4];
                            break;
                        end;
                    end;
                    if v233 and v234 then
                        local l_l_v185_0_2 = l_v185_0;
                        l_v185_0 = l_v185_0 + (v234 - v233);
                        local l_s_1 = v184.s;
                        local l_v233_0 = v233;
                        local v241 = utf8.offset(l_s_1, v234);
                        local v242 = string.sub(l_s_1, utf8.offset(l_s_1, l_v233_0), v241 and v241 - 1);
                        l_v233_0 = v184.s;
                        v241 = utf8.offset(l_v233_0, l_v185_0);
                        v215 = v242 == string.sub(l_v233_0, utf8.offset(l_v233_0, l_l_v185_0_2), v241 and v241 - 1);
                    end;
                else
                    local v243 = v184[l_v185_0];
                    if v195 == 36 or v195 == 90 or v195 == 122 then
                        local v244 = true;
                        if l_v185_0 ~= v184.n + 1 then
                            v244 = v195 == 36 and v186.multiline and v83(v184, l_v185_0 + 1, v187) or v195 == 90 and l_v185_0 == v184.n and v83(v184, l_v185_0, v187);
                        end;
                        v215 = v244;
                    elseif v195 == 94 or v195 == 65 or v195 == 71 then
                        local v245 = true;
                        if l_v185_0 ~= 1 then
                            v245 = v195 == 94 and v186.multiline and v83(v184, l_v185_0 - 1, v187) or v195 == 71 and l_v185_0 == v185;
                        end;
                        v215 = v245;
                    elseif v195 == 66 or v195 == 98 then
                        local v246 = true;
                        if l_v185_0 ~= 1 then
                            v246 = v186.multiline and v83(v184, l_v185_0 - 1, v187);
                        end;
                        local v247 = true;
                        if l_v185_0 ~= v184.n + 1 then
                            v247 = v186.multiline and v83(v184, l_v185_0, v187);
                        end;
                        local v248 = v84(v194[2], v184[l_v185_0 - 1], v186) and 0 or v84(v194[2], v243, v186) and 1;
                        if v248 == 0 then
                            v215 = v247 or not v84(v194[2], v243, v186);
                        elseif v248 then
                            v215 = v246 or not v84(v194[2], v184[l_v185_0 - 1], v186);
                        end;
                        if v195 == 66 then
                            v215 = not v215;
                        end;
                    else
                        v215 = v84(v194, v184, l_v185_0, v186, v187);
                        l_v185_0 = l_v185_0 + 1;
                    end;
                end;
                if not v215 then
                    while true do
                        local v249 = v192[1] and v192[1][1];
                        local v250 = v192[1];
                        if not v249 or v249 == "PRUNE" or v249 == "SKIP" then
                            if v249 then
                                table.clear(v192);
                            end;
                            if v184.n < l_v185_1 then
                                if v188 then
                                    return false;
                                else
                                    return nil;
                                end;
                            else
                                l_v185_1 = v249 == "SKIP" and v250[2] or l_v185_1 + 1;
                                v189 = 0;
                                l_v185_0 = l_v185_1;
                                break;
                            end;
                        elseif v249 == "alternation" then
                            v189 = v250[2];
                            l_v185_0 = v250[3];
                            local v251, v252 = v182(v183, v189 + 1);
                            if v251 then
                                v250[2] = v251;
                            else
                                table.remove(v192, 1);
                            end;
                            if v252 then
                                l_v185_0 = l_v185_0 - v252;
                                break;
                            else
                                break;
                            end;
                        else
                            if v249 == "group" then
                                if v250[7] == "quantifier" then
                                    if v250[12] == "greedy" and v250[10] >= v250[8] or v250[12] == "lazy" and v250[10] < v250[9] and not v250[13] then
                                        v189 = v250[12] == "greedy" and v250[6] or v250[2];
                                        l_v185_0 = v250[3];
                                        if v250[12] == "greedy" then
                                            table.remove(v192, 1);
                                            break;
                                        elseif v250[10] >= v250[8] then
                                            v250[13] = true;
                                            break;
                                        end;
                                    end;
                                elseif v250[7] == 33 then
                                    table.remove(v192, 1);
                                    v189 = v250[6];
                                    l_v185_0 = v250[3];
                                    break;
                                end;
                            elseif v249 == "quantifier" and math.sign(v250[4] - v250[3]) == math.sign(v250[5]) then
                                v250[3] = v250[3] + v250[5];
                                v189 = v250[2];
                                l_v185_0 = v250[3];
                                break;
                            end;
                            table.remove(v192, 1);
                        end;
                    end;
                end;
                v189 = v189 + 1;
            end;
        end;
    end;
    if v188 then
        return true;
    else
        local v253 = false;
        local v254 = table.create(v183.group_n);
        local v255 = 0;
        local v256 = {
            l_v185_1, 
            l_v185_0
        };
        local l_group_n_0 = v183.group_n;
        v254[v255] = v256;
        v254.n = l_group_n_0;
        for _, v259 in ipairs(v192) do
            if v259[1] == "matchStart" and not v253 then
                local v260 = v254[0];
                local v261 = v259[2];
                v253 = true;
                v260[1] = v261;
            elseif v259[1] == "group" and v259[5] and not v254[v259[5]] then
                v254[v259[5]] = {
                    v259[3], 
                    v259[4]
                };
            end;
        end;
        return v254;
    end;
end;
local function v266(v263, v264, v265) --[[ Line: 775 ]]
    -- upvalues: v262 (copy), v24 (copy)
    return (v262(v263.token, v24(v264, v265), 1, v263.flags, v263.verb_flags, true));
end;
local v267 = "test";
local l_v267_0 = v267 --[[ copy: 32 -> 57 ]];
local l_v266_0 = v266 --[[ copy: 31 -> 58 ]];
v13.test = function(...) --[[ Line: 171 ]]
    -- upvalues: v11 (copy), l_v267_0 (copy), v12 (copy), l_v266_0 (copy)
    local v270 = select("#", ...);
    if v270 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v270 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v271, v272, v273, v274, v275, v276 = ...;
    if not v11[v271] or v11[v271].name ~= "RegEx" then
        if type(v271) ~= "string" and type(v271) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v267_0, (typeof(v271))), 2);
        end;
        v271 = v12.fromstring(v271);
    elseif l_v267_0 == "sub" then
        if type(v273) == "number" then
            v273 = v273 .. "";
        elseif type(v273) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v273))), 2);
        end;
    elseif type(v272) == "number" then
        v272 = v272 .. "";
    elseif type(v272) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v267_0, (typeof(v272))), 2);
    end;
    if l_v267_0 ~= "sub" and l_v267_0 ~= "split" then
        local v277 = typeof(v273);
        if v277 ~= "nil" then
            v273 = tonumber(v273);
            if not v273 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v267_0, v277), 2);
            else
                v273 = if v273 < 0 then #v272 + math.floor(v273 + 0.5) + 1 else math.max(math.floor(v273 + 0.5), 1);
            end;
        end;
    end;
    v271 = v11[v271];
    if l_v267_0 == "match" or l_v267_0 == "matchiter" then
        v274 = ...;
    elseif l_v267_0 == "sub" then
        v276 = ...;
    end;
    return l_v266_0(v271, v272, v273, v274, v275, v276);
end;
v266 = function(v278, v279, v280, v281) --[[ Line: 779 ]]
    -- upvalues: v262 (copy), v24 (copy), v76 (copy)
    local v282 = v262(v278.token, v24(v279, v280), 1, v278.flags, v278.verb_flags, false);
    if not v282 then
        return nil;
    else
        return (v76(v282, v278.group_id, v281, v279));
    end;
end;
v267 = "match";
local l_v267_1 = v267 --[[ copy: 32 -> 59 ]];
local l_v266_1 = v266 --[[ copy: 31 -> 60 ]];
v13.match = function(...) --[[ Line: 171 ]]
    -- upvalues: v11 (copy), l_v267_1 (copy), v12 (copy), l_v266_1 (copy)
    local v285 = select("#", ...);
    if v285 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v285 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v286, v287, v288, v289, v290, v291 = ...;
    if not v11[v286] or v11[v286].name ~= "RegEx" then
        if type(v286) ~= "string" and type(v286) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v267_1, (typeof(v286))), 2);
        end;
        v286 = v12.fromstring(v286);
    elseif l_v267_1 == "sub" then
        if type(v288) == "number" then
            v288 = v288 .. "";
        elseif type(v288) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v288))), 2);
        end;
    elseif type(v287) == "number" then
        v287 = v287 .. "";
    elseif type(v287) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v267_1, (typeof(v287))), 2);
    end;
    if l_v267_1 ~= "sub" and l_v267_1 ~= "split" then
        local v292 = typeof(v288);
        if v292 ~= "nil" then
            v288 = tonumber(v288);
            if not v288 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v267_1, v292), 2);
            else
                v288 = if v288 < 0 then #v287 + math.floor(v288 + 0.5) + 1 else math.max(math.floor(v288 + 0.5), 1);
            end;
        end;
    end;
    v286 = v11[v286];
    if l_v267_1 == "match" or l_v267_1 == "matchiter" then
        v289 = ...;
    elseif l_v267_1 == "sub" then
        v291 = ...;
    end;
    return l_v266_1(v286, v287, v288, v289, v290, v291);
end;
v266 = function(v293, v294, v295, v296) --[[ Line: 787 ]]
    -- upvalues: v24 (copy), v262 (copy), v76 (copy)
    v294 = v24(v294, v295);
    local v297 = 1;
    return function() --[[ Line: 790 ]]
        -- upvalues: v297 (ref), v294 (ref), v262 (ref), v293 (copy), v76 (ref), v296 (copy)
        local v298 = false;
        if v297 <= v294.n + 1 then
            v298 = v262(v293.token, v294, v297, v293.flags, v293.verb_flags, false);
        end;
        if not v298 then
            return nil;
        else
            v297 = v298[0][2] + (v298[0][1] >= v298[0][2] and 1 or 0);
            return (v76(v298, v293.group_id, v296, v294.s));
        end;
    end;
end;
v267 = "matchall";
local l_v267_2 = v267 --[[ copy: 32 -> 61 ]];
local l_v266_2 = v266 --[[ copy: 31 -> 62 ]];
v13.matchall = function(...) --[[ Line: 171 ]]
    -- upvalues: v11 (copy), l_v267_2 (copy), v12 (copy), l_v266_2 (copy)
    local v301 = select("#", ...);
    if v301 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v301 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v302, v303, v304, v305, v306, v307 = ...;
    if not v11[v302] or v11[v302].name ~= "RegEx" then
        if type(v302) ~= "string" and type(v302) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v267_2, (typeof(v302))), 2);
        end;
        v302 = v12.fromstring(v302);
    elseif l_v267_2 == "sub" then
        if type(v304) == "number" then
            v304 = v304 .. "";
        elseif type(v304) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v304))), 2);
        end;
    elseif type(v303) == "number" then
        v303 = v303 .. "";
    elseif type(v303) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v267_2, (typeof(v303))), 2);
    end;
    if l_v267_2 ~= "sub" and l_v267_2 ~= "split" then
        local v308 = typeof(v304);
        if v308 ~= "nil" then
            v304 = tonumber(v304);
            if not v304 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v267_2, v308), 2);
            else
                v304 = if v304 < 0 then #v303 + math.floor(v304 + 0.5) + 1 else math.max(math.floor(v304 + 0.5), 1);
            end;
        end;
    end;
    v302 = v11[v302];
    if l_v267_2 == "match" or l_v267_2 == "matchiter" then
        v305 = ...;
    elseif l_v267_2 == "sub" then
        v307 = ...;
    end;
    return l_v266_2(v302, v303, v304, v305, v306, v307);
end;
local function v309(v310, v311, v312, v313) --[[ Line: 800 ]] --[[ Name: insert_tokenized_sub ]]
    -- upvalues: v309 (copy)
    for _, v315 in ipairs(v313) do
        if type(v315) == "table" then
            if v315[1] == "condition" then
                if v312[v315[2]] then
                    if v315[3] then
                        v309(v310, v311, v312, v315[3]);
                    else
                        table.move(v311, v312[v315[2]][1], v312[v315[2]][2] - 1, #v310 + 1, v310);
                    end;
                elseif v315[4] then
                    v309(v310, v311, v312, v315[4]);
                end;
            else
                table.move(v315, 1, #v315, #v310 + 1, v310);
            end;
        elseif v312[v315] then
            table.move(v311, v312[v315][1], v312[v315][2] - 1, #v310 + 1, v310);
        end;
    end;
    v310.n = #v310;
    return v310;
end;
v267 = function(v316, v317, v318, v319, v320, v321) --[[ Line: 824 ]]
    -- upvalues: v24 (copy), v37 (copy), v262 (copy), v309 (copy), v76 (copy), v30 (copy)
    if v320 ~= nil and type(v320) ~= "number" and type(v320) ~= "string" then
        error(string.format("invalid argument #5 to 'sub' (string expected, got %s)", (typeof(v320))), 3);
    end;
    local v322 = {
        l = false, 
        o = false, 
        u = false
    };
    for v323 in string.gmatch(v320 or "", utf8.charpattern) do
        if v322[v323] ~= false then
            error("invalid regular expression substitution flag " .. v323, 3);
        end;
        v322[v323] = true;
    end;
    local v324 = type(v317);
    if v324 == "number" then
        v317 = v317 .. "";
    elseif v324 ~= "string" and v324 ~= "function" and (not v322.o or v324 ~= "table") then
        error(string.format("invalid argument #2 to 'sub' (string/function%s expected, got %s)", v322.o and "/table" or "", (typeof(v317))), 3);
    end;
    if tonumber(v319) then
        v319 = tonumber(v319);
        if v319 <= -1 or v319 ~= v319 then
            v319 = 1e999;
        end;
    elseif v319 ~= nil then
        error(string.format("invalid argument #4 to 'sub' (number expected, got %s)", (typeof(v319))), 3);
    else
        v319 = 1e999;
    end;
    if v319 < 1 then
        return v318, 0;
    else
        local v325 = 0;
        if v324 == "string" then
            v317 = v24(v317);
            if not v322.l then
                local v326 = 0;
                local v327 = table.create(3);
                local l_group_n_1 = v316.token.group_n;
                local v329 = {};
                while v326 < v317.n do
                    local l_v326_0 = v326;
                    repeat
                        l_v326_0 = l_v326_0 + 1;
                    until not v317[l_v326_0] or v317[l_v326_0] == 36 or v317[l_v326_0] == 92 or (v317[l_v326_0] == 58 or v317[l_v326_0] == 125) and v329[1];
                    v325 = v325 + (l_v326_0 - v326 - 1);
                    if l_v326_0 - v326 > 1 then
                        table.insert(v327, table.move(v317, v326 + 1, l_v326_0 - 1, 1, table.create(l_v326_0 - v326 - 1)));
                    end;
                    if v317[l_v326_0] == 58 then
                        local v331 = v329[1];
                        if v331[2] then
                            error("malformed substitution pattern", 3);
                        end;
                        v331[2] = table.move(v327, v331[3], #v327, 1, table.create(#v327 + 1 - v331[3]));
                        for v332 = #v327, v331[3], -1 do
                            v327[v332] = nil;
                        end;
                    elseif v317[l_v326_0] == 125 then
                        local v333 = table.remove(v329, 1);
                        local v334 = table.move(v327, v333[3], #v327, 1, table.create(#v327 + 1 - v333[3]));
                        for v335 = #v327, v333[3], -1 do
                            v327[v335] = nil;
                        end;
                        local v336 = {};
                        local v337 = "condition";
                        local v338 = v333[1];
                        local v339 = false;
                        if v333[2] ~= true then
                            v339 = v333[2] or v334;
                        end;
                        local v340 = v333[2] and v334;
                        v6(v336, 1, v337, v338, v339, v340);
                        table.insert(v327, v336);
                    elseif v317[l_v326_0] then
                        l_v326_0 = l_v326_0 + 1;
                        local v341 = v317[l_v326_0];
                        if not v341 then
                            if v317[l_v326_0 - 1] == 92 then
                                error("replacement string must not end with a trailing backslash", 3);
                            end;
                            local v342 = v327[#v327];
                            if type(v342) == "table" then
                                table.insert(v342, v317[l_v326_0 - 1]);
                            else
                                table.insert(v327, {
                                    v317[l_v326_0 - 1]
                                });
                            end;
                        elseif v341 == 92 and v317[l_v326_0 - 1] == 36 then
                            local v343 = v327[#v327];
                            if type(v343) == "table" then
                                table.insert(v343, 36);
                            else
                                table.insert(v327, {
                                    36
                                });
                            end;
                            l_v326_0 = l_v326_0 - 1;
                            v325 = v325 + 1;
                        elseif v341 == 48 then
                            table.insert(v327, 0);
                        elseif v341 > 48 and v341 <= 57 then
                            local _ = l_v326_0;
                            local v345 = v341 - 48;
                            while v317[l_v326_0 + 1] and v317[l_v326_0 + 1] >= 48 and v317[l_v326_0 + 1] <= 57 do
                                v345 = v345 .. v317[l_v326_0 + 1] - 48;
                                l_v326_0 = l_v326_0 + 1;
                            end;
                            v345 = tonumber(v345);
                            if not v322.u and l_group_n_1 < v345 then
                                error("reference to non-existent subpattern", 3);
                            end;
                            table.insert(v327, v345);
                        elseif v341 == 123 and v317[l_v326_0 - 1] == 36 then
                            l_v326_0 = l_v326_0 + 1;
                            local l_l_v326_0_1 = l_v326_0;
                            while v317[l_v326_0] and (v317[l_v326_0] >= 48 and v317[l_v326_0] <= 57 or v317[l_v326_0] >= 65 and v317[l_v326_0] <= 90 or v317[l_v326_0] >= 97 and v317[l_v326_0] <= 122 or v317[l_v326_0] == 95) do
                                l_v326_0 = l_v326_0 + 1;
                            end;
                            if (v317[l_v326_0] == 125 or v317[l_v326_0] == 58 and (v317[l_v326_0 + 1] == 43 or v317[l_v326_0 + 1] == 45)) and l_v326_0 ~= l_l_v326_0_1 then
                                local l_s_2 = v317.s;
                                local v348 = utf8.offset(l_s_2, l_v326_0);
                                local v349 = string.sub(l_s_2, utf8.offset(l_s_2, l_l_v326_0_1), v348 and v348 - 1);
                                if v317[l_l_v326_0_1] >= 48 and v317[l_l_v326_0_1] <= 57 then
                                    v349 = tonumber(v349);
                                    if not v322.u and l_group_n_1 < v349 then
                                        error("reference to non-existent subpattern", 3);
                                    end;
                                else
                                    v349 = v316.group_id[v349];
                                    if not v322.u and (not v349 or l_group_n_1 < v349) then
                                        error("reference to non-existent subpattern", 3);
                                    end;
                                end;
                                if v317[l_v326_0] == 58 then
                                    l_v326_0 = l_v326_0 + 1;
                                    table.insert(v329, {
                                        v349, 
                                        v317[l_v326_0] == 45, 
                                        #v327 + 1
                                    });
                                else
                                    table.insert(v327, v349);
                                end;
                            else
                                error("malformed substitution pattern", 3);
                            end;
                        else
                            local v350 = nil;
                            if v317[l_v326_0 - 1] == 36 then
                                if v341 ~= 36 then
                                    local v351 = v327[#v327];
                                    if type(v351) == "table" then
                                        table.insert(v351, 36);
                                    else
                                        table.insert(v327, {
                                            36
                                        });
                                    end;
                                end;
                            else
                                v350 = v37[v317[l_v326_0]];
                                if type(v350) ~= "number" then
                                    v350 = nil;
                                end;
                            end;
                            local v352 = v327[#v327];
                            if type(v352) == "table" then
                                table.insert(v352, v350 or v317[l_v326_0]);
                            else
                                table.insert(v327, {
                                    v350 or v317[l_v326_0]
                                });
                            end;
                            v325 = v325 + 1;
                        end;
                    end;
                    v326 = l_v326_0;
                end;
                if v329[1] then
                    error("malformed substitution pattern", 3);
                end;
                if not v327[2] and type(v327[1]) == "table" and v327[1][1] ~= "condition" then
                    local v353 = v327[1];
                    v317.n = #v327[1];
                    v317 = v353;
                else
                    v317 = v327;
                    v324 = "subst_string";
                end;
            end;
        end;
        v318 = v24(v318);
        local v354 = 0;
        local v355 = 1;
        local v356 = 0;
        while v355 <= v318.n + v354 + 1 do
            local v357 = v262(v316.token, v318, v355, v316.flags, v316.verb_flags, false);
            if v357 then
                local v358 = nil;
                if v324 == "string" then
                    v358 = v317;
                elseif v324 == "subst_string" then
                    v358 = v309(table.create(v325), v318, v357, v317);
                else
                    local v359 = nil;
                    local v360 = nil;
                    if v324 == "table" then
                        local l_s_3 = v318.s;
                        local v362 = v357[0][1];
                        local v363 = v357[0][2];
                        v363 = utf8.offset(l_s_3, v363);
                        v359 = string.sub(l_s_3, utf8.offset(l_s_3, v362), v363 and v363 - 1);
                        v360 = v317[v359];
                    else
                        v359 = v76(v357, v316.group_id, v321, v318.s);
                        v360 = v317(v359);
                    end;
                    if v360 == v359 or v322.o and not v360 then
                        local v364 = v357[0][2] - v357[0][1];
                        v358 = table.move(v318, v357[0][1], v357[0][2] - 1, 1, table.create(v364));
                        v358.n = v364;
                    elseif type(v360) == "string" then
                        v358 = v24(v360);
                    elseif type(v360) == "number" then
                        v358 = v24(v360 .. "");
                    elseif v322.o then
                        error(string.format("invalid replacement value (a %s)", (type(v360))), 3);
                    else
                        v358 = {
                            n = 0
                        };
                    end;
                end;
                local v365 = v357[0][2] - v357[0][1];
                local v366 = math.min(v358.n, v365);
                for v367 = 0, v366 - 1 do
                    v318[v357[0][1] + v367] = v358[v367 + 1];
                end;
                local v368 = v357[0][1] + v366;
                v355 = v357[0][2];
                if v358.n < v365 then
                    for _ = 1, v365 - v358.n do
                        table.remove(v318, v368);
                        v354 = v354 - 1;
                        v355 = v355 - 1;
                    end;
                elseif v365 < v358.n then
                    for v370 = 1, v358.n - v365 do
                        table.insert(v318, v368 + v370 - 1, v358[v366 + v370]);
                        v354 = v354 + 1;
                        v355 = v355 + 1;
                    end;
                end;
                if v365 <= 0 then
                    v355 = v355 + 1;
                end;
                v356 = v356 + 1;
                if v319 < v356 + 1 then
                    break;
                end;
            else
                break;
            end;
        end;
        return v30(v318), v356;
    end;
end;
local v371 = "sub";
local l_v371_0 = v371 --[[ copy: 33 -> 63 ]];
local l_v267_3 = v267 --[[ copy: 32 -> 64 ]];
v13.sub = function(...) --[[ Line: 171 ]]
    -- upvalues: v11 (copy), l_v371_0 (copy), v12 (copy), l_v267_3 (copy)
    local v374 = select("#", ...);
    if v374 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v374 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v375, v376, v377, v378, v379, v380 = ...;
    if not v11[v375] or v11[v375].name ~= "RegEx" then
        if type(v375) ~= "string" and type(v375) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v371_0, (typeof(v375))), 2);
        end;
        v375 = v12.fromstring(v375);
    elseif l_v371_0 == "sub" then
        if type(v377) == "number" then
            v377 = v377 .. "";
        elseif type(v377) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v377))), 2);
        end;
    elseif type(v376) == "number" then
        v376 = v376 .. "";
    elseif type(v376) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v371_0, (typeof(v376))), 2);
    end;
    if l_v371_0 ~= "sub" and l_v371_0 ~= "split" then
        local v381 = typeof(v377);
        if v381 ~= "nil" then
            v377 = tonumber(v377);
            if not v377 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v371_0, v381), 2);
            else
                v377 = if v377 < 0 then #v376 + math.floor(v377 + 0.5) + 1 else math.max(math.floor(v377 + 0.5), 1);
            end;
        end;
    end;
    v375 = v11[v375];
    if l_v371_0 == "match" or l_v371_0 == "matchiter" then
        v378 = ...;
    elseif l_v371_0 == "sub" then
        v380 = ...;
    end;
    return l_v267_3(v375, v376, v377, v378, v379, v380);
end;
v267 = function(v382, v383, v384) --[[ Line: 1062 ]]
    -- upvalues: v24 (copy), v262 (copy)
    if tonumber(v384) then
        v384 = tonumber(v384);
        if v384 <= -1 or v384 ~= v384 then
            v384 = 1e999;
        end;
    elseif v384 ~= nil then
        error(string.format("invalid argument #3 to 'split' (number expected, got %s)", (typeof(v384))), 3);
    else
        v384 = 1e999;
    end;
    v383 = v24(v383);
    local v385 = 1;
    local v386 = 0;
    local v387 = {};
    local v388 = 0;
    while v385 <= v383.n + 1 do
        v386 = v386 + 1;
        local v389 = false;
        if v386 <= v384 then
            v389 = v262(v382.token, v383, v385, v382.flags, v382.verb_flags, false);
        end;
        if v389 then
            local l_s_4 = v383.s;
            local v391 = v385 - v388;
            local v392 = v389[0][1];
            v392 = utf8.offset(l_s_4, v392);
            table.insert(v387, (string.sub(l_s_4, utf8.offset(l_s_4, v391), v392 and v392 - 1)));
            v388 = v389[0][1] >= v389[0][2] and 1 or 0;
            v385 = v389[0][2] + v388;
        else
            break;
        end;
    end;
    table.insert(v387, (string.sub(v383.s, utf8.offset(v383.s, v385 - v388))));
    return v387;
end;
v371 = "split";
local l_v371_1 = v371 --[[ copy: 33 -> 65 ]];
local l_v267_4 = v267 --[[ copy: 32 -> 66 ]];
v13.split = function(...) --[[ Line: 171 ]]
    -- upvalues: v11 (copy), l_v371_1 (copy), v12 (copy), l_v267_4 (copy)
    local v395 = select("#", ...);
    if v395 < 1 then
        error("missing argument #1 (RegEx expected)", 2);
    elseif v395 < 2 then
        error("missing argument #2 (string expected)", 2);
    end;
    local v396, v397, v398, v399, v400, v401 = ...;
    if not v11[v396] or v11[v396].name ~= "RegEx" then
        if type(v396) ~= "string" and type(v396) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", l_v371_1, (typeof(v396))), 2);
        end;
        v396 = v12.fromstring(v396);
    elseif l_v371_1 == "sub" then
        if type(v398) == "number" then
            v398 = v398 .. "";
        elseif type(v398) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v398))), 2);
        end;
    elseif type(v397) == "number" then
        v397 = v397 .. "";
    elseif type(v397) ~= "string" then
        error(string.format("invalid argument #2 to %q (string expected, got %s)", l_v371_1, (typeof(v397))), 2);
    end;
    if l_v371_1 ~= "sub" and l_v371_1 ~= "split" then
        local v402 = typeof(v398);
        if v402 ~= "nil" then
            v398 = tonumber(v398);
            if not v398 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", l_v371_1, v402), 2);
            else
                v398 = if v398 < 0 then #v397 + math.floor(v398 + 0.5) + 1 else math.max(math.floor(v398 + 0.5), 1);
            end;
        end;
    end;
    v396 = v11[v396];
    if l_v371_1 == "match" or l_v371_1 == "matchiter" then
        v399 = ...;
    elseif l_v371_1 == "sub" then
        v401 = ...;
    end;
    return l_v267_4(v396, v397, v398, v399, v400, v401);
end;
v266 = function(v403, v404) --[[ Line: 1092 ]] --[[ Name: re_index ]]
    -- upvalues: v13 (ref), v11 (copy)
    return v13[v404] or v11[v403].flags[v404];
end;
v267 = function(v405) --[[ Line: 1096 ]] --[[ Name: re_tostr ]]
    -- upvalues: v11 (copy)
    return v11[v405].pattern_repr .. v11[v405].flag_repr;
end;
v371 = {
    [58] = true, 
    [33] = true, 
    [61] = true, 
    [62] = true, 
    [124] = true
};
local function v546(v406, v407) --[[ Line: 1112 ]] --[[ Name: tokenize_ptn ]]
    -- upvalues: v7 (copy), v135 (copy), v371 (copy), v44 (copy), v42 (copy), v37 (copy), v36 (copy), v39 (copy), v9 (copy), v38 (copy), v43 (copy), v41 (copy)
    if v407.unicode and not v7.unicodeData then
        return "options.unicodeData cannot be turned off while having unicode flag";
    else
        local v408 = 1;
        local l_n_0 = v406.n;
        local v410 = 0;
        local v411 = {};
        local v412 = {};
        local v413 = {
            newline = 1, 
            newline_seq = 1, 
            not_empty = 0
        };
        while v408 <= l_n_0 do
            local v414 = v406[v408];
            if v414 == 40 then
                local v415 = nil;
                if v406[v408 + 1] == 42 then
                    v408 = v408 + 2;
                    local l_v408_0 = v408;
                    while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 90 or v406[v408] >= 97 and v406[v408] <= 122 or v406[v408] == 95 or v406[v408] == 58) do
                        v408 = v408 + 1;
                    end;
                    if v406[v408] ~= 41 and v406[v408 - 1] ~= 58 then
                        return "quantifier doesn't follow a repeatable pattern";
                    else
                        local l_s_5 = v406.s;
                        local v418 = utf8.offset(l_s_5, v408);
                        local v419 = string.sub(l_s_5, utf8.offset(l_s_5, l_v408_0), v418 and v418 - 1);
                        if v419 == "positive_lookahead:" or v419 == "negative_lookhead:" or v419 == "positive_lookbehind:" or v419 == "negative_lookbehind:" or v419:find("^[pn]l[ab]:$") then
                            v415 = {
                                40, 
                                nil, 
                                nil, 
                                v419:find("^n") and 33 or 61, 
                                v419:find("b", 3, true) and 1
                            };
                        elseif v419 == "atomic:" then
                            v415 = {
                                40, 
                                nil, 
                                nil, 
                                62, 
                                nil
                            };
                        elseif v419 == "ACCEPT" or v419 == "FAIL" or v419 == "F" or v419 == "PRUNE" or v419 == "SKIP" then
                            v415 = v419 == "F" and "FAIL" or v419;
                        else
                            if v135[v419] then
                                v413.newline = v419;
                            elseif v419 == "BSR_ANYCRLF" or v419 == "BSR_UNICODE" then
                                v413.newline_seq = v419 == "BSR_UNICODE" and 1 or 0;
                            elseif v419 == "NOTEMPTY" or v419 == "NOTEMPTY_ATSTART" then
                                v413.not_empty = v419 == "NOTEMPTY" and 1 or 2;
                            else
                                return "unknown or malformed verb";
                            end;
                            if v411[1] then
                                return "this verb must be placed at the beginning of the regex";
                            end;
                        end;
                    end;
                elseif v406[v408 + 1] == 63 then
                    v408 = v408 + 2;
                    if v406[v408] == 35 then
                        v408 = table.find(v406, 41, v408);
                        if not v408 then
                            return "unterminated parenthetical";
                        else
                            v408 = v408 + 1;
                            continue;
                        end;
                    elseif not v406[v408] then
                        return "unterminated parenthetical";
                    else
                        v415 = {
                            40, 
                            nil, 
                            nil, 
                            v406[v408], 
                            nil
                        };
                        if v406[v408] == 48 and v406[v408 + 1] == 41 then
                            local v420 = "recurmatch";
                            local v421 = 0;
                            local v422 = 0;
                            local v423 = nil;
                            v415[1] = v420;
                            v415[2] = v421;
                            v415[3] = v422;
                            v415[5] = v423;
                        elseif v406[v408] > 48 and v406[v408] <= 57 then
                            local l_v408_1 = v408;
                            v408 = v408 + 1;
                            while v406[v408] >= 48 and v406[v408] <= 48 do
                                v408 = v408 + 1;
                            end;
                            if v406[v408] ~= 41 then
                                return "invalid group structure";
                            else
                                local v425 = "recurmatch";
                                local l_s_6 = v406.s;
                                local v427 = utf8.offset(l_s_6, v408);
                                local v428 = tonumber((string.sub(l_s_6, utf8.offset(l_s_6, l_v408_1), v427 and v427 - 1)));
                                local v429 = nil;
                                v415[1] = v425;
                                v415[2] = v428;
                                v415[4] = v429;
                            end;
                        elseif v406[v408] == 60 and v406[v408 + 1] == 33 or v406[v408 + 1] == 61 then
                            v408 = v408 + 1;
                            local v430 = v406[v408];
                            local v431 = 1;
                            v415[4] = v430;
                            v415[5] = v431;
                        elseif v406[v408] == 124 then
                            v415[5] = v410;
                        elseif v406[v408] == 80 or v406[v408] == 60 or v406[v408] == 39 then
                            if v406[v408] == 80 then
                                v408 = v408 + 1;
                            end;
                            if v406[v408] == 61 then
                                local v432 = v408 + 1;
                                while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 90 or v406[v408] >= 97 and v406[v408] <= 122 or v406[v408] == 95) do
                                    v408 = v408 + 1;
                                end;
                                if not v406[v408] then
                                    return "unterminated parenthetical";
                                elseif v406[v408] ~= 41 or v408 == v432 then
                                    return "invalid group structure";
                                else
                                    local v433 = {};
                                    local v434 = "backref";
                                    local l_s_7 = v406.s;
                                    local v436 = utf8.offset(l_s_7, v408);
                                    local v437 = string.sub(l_s_7, utf8.offset(l_s_7, v432), v436 and v436 - 1);
                                    v6(v433, 1, v434, v437);
                                    v415 = v433;
                                end;
                            elseif v406[v408] == 60 or v406[v408 - 1] ~= 80 and v406[v408] == 39 then
                                local v438 = v406[v408] == 39 and 39 or 62;
                                local v439 = v408 + 1;
                                v408 = v408 + 1;
                                if v406[v408] == 41 then
                                    return "missing character in subpattern";
                                elseif v406[v408] >= 48 and v406[v408] <= 57 then
                                    return "subpattern name must not begin with a digit";
                                elseif (v406[v408] < 65 or v406[v408] > 90) and (v406[v408] < 97 or v406[v408] > 122) and v406[v408] ~= 95 then
                                    return "invalid character in subpattern";
                                else
                                    v408 = v408 + 1;
                                    while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 90 or v406[v408] >= 97 and v406[v408] <= 122 or v406[v408] == 95) do
                                        v408 = v408 + 1;
                                    end;
                                    if not v406[v408] then
                                        return "unterminated parenthetical";
                                    elseif v406[v408] ~= v438 then
                                        return "invalid character in subpattern";
                                    else
                                        local l_s_8 = v406.s;
                                        local v441 = utf8.offset(l_s_8, v408);
                                        local v442 = string.sub(l_s_8, utf8.offset(l_s_8, v439), v441 and v441 - 1);
                                        v410 = v410 + 1;
                                        if (v412[v442] or v410) ~= v410 then
                                            return "subpattern name already exists";
                                        else
                                            for v443, v444 in pairs(v412) do
                                                if v442 ~= v443 and v410 == v444 then
                                                    return "different names for subpatterns of the same number aren't permitted";
                                                end;
                                            end;
                                            v412[v442] = v410;
                                            l_s_8 = nil;
                                            v415[2] = v410;
                                            v415[4] = l_s_8;
                                        end;
                                    end;
                                end;
                            else
                                return "invalid group structure";
                            end;
                        elseif not v371[v406[v408]] then
                            return "invalid group structure";
                        end;
                    end;
                else
                    v410 = v410 + 1;
                    v415 = {
                        40, 
                        v410, 
                        nil, 
                        nil
                    };
                end;
                if v415 then
                    table.insert(v411, v415);
                end;
            elseif v414 == 41 then
                local v445 = #v411 + 1;
                local v446 = -1;
                local v447 = 0;
                local v448 = 0;
                local v449 = 0;
                repeat
                    v445 = v445 - 1;
                    local v450 = v411[v445];
                    local v451 = type(v411[v445]) == "table";
                    if v451 and v450[1] == 40 then
                        v449 = v449 + 1;
                        if v447 and v450.count then
                            v447 = v447 + v450.count;
                        end;
                        if not v450[3] then
                            if v450[4] == 124 then
                                v410 = v450[5] + math.max(v448, v449);
                            end;
                            v446 = if v447 ~= v446 and v446 ~= -1 then nil else v447;
                            break;
                        end;
                    elseif v450 == v44 then
                        if v447 ~= v446 and v446 ~= -1 then
                            v446 = nil;
                            v447 = nil;
                        else
                            v446 = v447;
                            v447 = 0;
                        end;
                        v448 = math.max(v448, v449);
                        v449 = 0;
                    elseif v447 then
                        if v451 and v450[1] == "quantifier" then
                            if v450[2] == v450[3] then
                                v447 = v447 + v450[2];
                            else
                                v447 = nil;
                            end;
                        else
                            v447 = v447 + 1;
                        end;
                    end;
                until v445 < 1;
                if v445 < 1 then
                    return "unmatched ) in regular expression";
                else
                    local v452 = v411[v445];
                    local v453 = #v411 + 1;
                    local v454 = {
                        41, 
                        v452[2], 
                        v445, 
                        v452[4], 
                        v452[5]; 
                        count = v446
                    };
                    if (v452[4] == 33 or v452[4] == 61) and v452[5] and not v446 then
                        return "lookbehind assertion is not fixed width";
                    else
                        v452[3] = v453;
                        table.insert(v411, v454);
                    end;
                end;
            elseif v414 == 46 then
                table.insert(v411, v42);
            elseif v414 == 91 then
                local v455 = false;
                local v456 = nil;
                v408 = v408 + 1;
                local l_v408_2 = v408;
                if v406[v408] == 94 then
                    v455 = true;
                    v408 = v408 + 1;
                elseif v406[v408] == 46 or v406[v408] == 58 or v406[v408] == 61 then
                    v456 = v406[v408];
                end;
                local v458 = nil;
                if v406[v408] == 91 or v406[v408] == 92 then
                    v458 = {};
                else
                    v458 = {
                        v406[v408]
                    };
                    v408 = v408 + 1;
                end;
                while v406[v408] ~= 93 do
                    if not v406[v408] then
                        return "unterminated character class";
                    else
                        if v406[v408] == 45 and v458[1] and type(v458[1]) == "number" then
                            if v406[v408 + 1] == 93 then
                                table.insert(v458, 1, 45);
                            else
                                v408 = v408 + 1;
                                local v459 = v406[v408];
                                if v459 == 91 then
                                    if v406[v408 + 1] == 46 or v406[v408 + 1] == 58 or v406[v408 + 1] == 61 then
                                        local v460 = v408 + 2;
                                        repeat
                                            v460 = table.find(v406, 93, v460);
                                        until not v460 or v406[v460 - 1] ~= 92;
                                        if not v460 then
                                            return "unterminated character class";
                                        elseif v406[v460 - 1] == v406[v408 + 1] and v460 - 1 ~= v408 + 1 then
                                            return "invalid range in character class";
                                        end;
                                    end;
                                    if v458[1] > 91 then
                                        return "invalid range in character class";
                                    end;
                                elseif v459 == 92 then
                                    v408 = v408 + 1;
                                    if v406[v408] == 120 then
                                        local v461 = nil;
                                        local v462 = nil;
                                        v408 = v408 + 1;
                                        if v406[v408] and v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102 then
                                            v461 = v406[v408] - (v406[v408] >= 65 and v406[v408] <= 90 and 55 or v406[v408] >= 97 and v406[v408] <= 122 and 87 or 48);
                                            v408 = v408 + 1;
                                            if v406[v408] and v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102 then
                                                v462 = v406[v408] - (v406[v408] >= 65 and v406[v408] <= 90 and 55 or v406[v408] >= 97 and v406[v408] <= 122 and 87 or 48);
                                            else
                                                v408 = v408 - 1;
                                            end;
                                        else
                                            v408 = v408 - 1;
                                        end;
                                        v459 = v461 and (v462 and 16 * v461 + v462 or v461) or 0;
                                    elseif v406[v408] >= 48 and v406[v408] <= 55 then
                                        local v463 = v406[v408] - 48;
                                        local v464 = nil;
                                        local v465 = nil;
                                        v408 = v408 + 1;
                                        if v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 then
                                            v464 = v406[v408] - 48;
                                            v408 = v408 + 1;
                                            if v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 then
                                                v465 = v406[v408] - 48;
                                            else
                                                v408 = v408 - 1;
                                            end;
                                        else
                                            v408 = v408 - 1;
                                        end;
                                        v459 = v464 and (v465 and 64 * v463 + 8 * v464 + v465 or 8 * v463 + v464) or v463;
                                    else
                                        v459 = v37[v406[v408]] or v406[v408];
                                        if type(v459) ~= "number" then
                                            return "invalid range in character class";
                                        end;
                                    end;
                                elseif v459 < v458[1] then
                                    return "invalid range in character class";
                                end;
                                v458[1] = {
                                    "range", 
                                    v458[1], 
                                    v459
                                };
                            end;
                        elseif v406[v408] == 91 then
                            if v406[v408 + 1] == 46 or v406[v408 + 1] == 58 or v406[v408 + 1] == 61 then
                                local v466 = v408 + 2;
                                repeat
                                    v466 = table.find(v406, 93, v466);
                                until not v466 or v406[v466 - 1] ~= 92;
                                if not v466 then
                                    return "unterminated character class";
                                elseif v406[v466 - 1] ~= v406[v408 + 1] or v466 - 1 == v408 + 1 then
                                    table.insert(v458, 1, 91);
                                elseif v406[v466 - 1] == 46 or v406[v466 - 1] == 61 then
                                    return "POSIX collating elements aren't supported";
                                elseif v406[v466 - 1] == 58 then
                                    local v467 = v406[v408 + 3] == 94;
                                    local l_s_9 = v406.s;
                                    local v469 = v408 + (v467 and 3 or 2);
                                    local v470 = v466 - 1;
                                    v470 = utf8.offset(l_s_9, v470);
                                    local v471 = string.sub(l_s_9, utf8.offset(l_s_9, v469), v470 and v470 - 1);
                                    if not v36[v471] then
                                        return "unknown POSIX class name";
                                    else
                                        table.insert(v458, 1, {
                                            "class", 
                                            v471, 
                                            v467
                                        });
                                        v408 = v466;
                                    end;
                                end;
                            else
                                table.insert(v458, 1, 91);
                            end;
                        elseif v406[v408] == 92 then
                            v408 = v408 + 1;
                            if v406[v408] == 120 then
                                local v472 = nil;
                                local v473 = nil;
                                v408 = v408 + 1;
                                if v406[v408] == 123 then
                                    v408 = v408 + 1;
                                    local l_v408_3 = v408;
                                    while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102) do
                                        v408 = v408 + 1;
                                    end;
                                    if v406[v408] ~= 125 or v408 == l_v408_3 then
                                        return "malformed hexadecimal character";
                                    elseif v408 - l_v408_3 > 4 then
                                        return "character offset too large";
                                    else
                                        local v475 = 1;
                                        local l_s_10 = v406.s;
                                        local v477 = utf8.offset(l_s_10, v408);
                                        table.insert(v458, v475, (tonumber(string.sub(l_s_10, utf8.offset(l_s_10, l_v408_3), v477 and v477 - 1), 16)));
                                    end;
                                else
                                    if v406[v408] and v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102 then
                                        v472 = v406[v408] - (v406[v408] >= 65 and v406[v408] <= 90 and 55 or v406[v408] >= 97 and v406[v408] <= 122 and 87 or 48);
                                        v408 = v408 + 1;
                                        if v406[v408] and v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102 then
                                            v473 = v406[v408] - (v406[v408] >= 65 and v406[v408] <= 90 and 55 or v406[v408] >= 97 and v406[v408] <= 122 and 87 or 48);
                                        else
                                            v408 = v408 - 1;
                                        end;
                                    else
                                        v408 = v408 - 1;
                                    end;
                                    table.insert(v458, 1, v472 and (v473 and 16 * v472 + v473 or v472) or 0);
                                end;
                            elseif v406[v408] >= 48 and v406[v408] <= 55 then
                                local v478 = v406[v408] - 48;
                                local v479 = nil;
                                local v480 = nil;
                                v408 = v408 + 1;
                                if v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 then
                                    v479 = v406[v408] - 48;
                                    v408 = v408 + 1;
                                    if v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 then
                                        v480 = v406[v408] - 48;
                                    else
                                        v408 = v408 - 1;
                                    end;
                                else
                                    v408 = v408 - 1;
                                end;
                                table.insert(v458, 1, v479 and (v480 and 64 * v478 + 8 * v479 + v480 or 8 * v478 + v479) or v478);
                            elseif v406[v408] ~= 69 then
                                if v406[v408] == 81 then
                                    local v481 = v408 + 1;
                                    repeat
                                        v408 = table.find(v406, 92, v408 + 1);
                                    until not v408 or v406[v408 + 1] == 69;
                                    table.move(v406, v481, v408 and v408 - 1 or #v406, #v411 + 1, v411);
                                    if v408 then
                                        v408 = v408 + 1;
                                    else
                                        break;
                                    end;
                                elseif v406[v408] == 78 then
                                    if v406[v408 + 1] == 123 and v406[v408 + 2] == 85 and v406[v408 + 3] == 43 and v407.unicode then
                                        v408 = v408 + 4;
                                        local l_v408_4 = v408;
                                        while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102) do
                                            v408 = v408 + 1;
                                        end;
                                        if v406[v408] ~= 125 or v408 == l_v408_4 then
                                            return "malformed Unicode code point";
                                        else
                                            local l_s_11 = v406.s;
                                            local v484 = utf8.offset(l_s_11, v408);
                                            table.insert(v458, 1, (tonumber((string.sub(l_s_11, utf8.offset(l_s_11, l_v408_4), v484 and v484 - 1)))));
                                        end;
                                    else
                                        return "invalid escape sequence";
                                    end;
                                elseif v406[v408] == 80 or v406[v408] == 112 then
                                    if not v7.unicodeData then
                                        return "options.unicodeData cannot be turned off when using \\p";
                                    else
                                        v408 = v408 + 1;
                                        if v406[v408] ~= 123 then
                                            local v485 = utf8.char(v406[v408] or 0);
                                            if not v39[v485] then
                                                return "unknown or malformed script name";
                                            else
                                                table.insert(v458, 1, {
                                                    "category", 
                                                    false, 
                                                    v485
                                                });
                                            end;
                                        else
                                            local v486 = v406[v408] == 80;
                                            v408 = v408 + 1;
                                            if v406[v408] == 94 then
                                                v408 = v408 + 1;
                                                v486 = not v486;
                                            end;
                                            local l_v408_5 = v408;
                                            while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 90 or v406[v408] >= 97 and v406[v408] <= 122 or v406[v408] == 95) do
                                                v408 = v408 + 1;
                                            end;
                                            if v406[v408] ~= 125 then
                                                return "unknown or malformed script name";
                                            else
                                                local l_s_12 = v406.s;
                                                local v489 = utf8.offset(l_s_12, v408);
                                                local v490 = string.sub(l_s_12, utf8.offset(l_s_12, l_v408_5), v489 and v489 - 1);
                                                l_s_12 = v9[v490];
                                                if l_s_12 then
                                                    table.insert(v458, 1, {
                                                        "charset", 
                                                        v486, 
                                                        l_s_12
                                                    });
                                                elseif not v39[v490] then
                                                    return "unknown or malformed script name";
                                                else
                                                    table.insert(v458, 1, {
                                                        "category", 
                                                        v486, 
                                                        v490
                                                    });
                                                end;
                                            end;
                                        end;
                                    end;
                                elseif v406[v408] == 111 then
                                    v408 = v408 + 1;
                                    if v406[v408] ~= 123 then
                                        return "malformed octal code";
                                    else
                                        v408 = v408 + 1;
                                        local l_v408_6 = v408;
                                        while v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 do
                                            v408 = v408 + 1;
                                        end;
                                        if v406[v408] ~= 125 or v408 == l_v408_6 then
                                            return "malformed octal code";
                                        else
                                            local l_s_13 = v406.s;
                                            local v493 = utf8.offset(l_s_13, v408);
                                            local v494 = tonumber(string.sub(l_s_13, utf8.offset(l_s_13, l_v408_6), v493 and v493 - 1), 8);
                                            if v494 > 65535 then
                                                return "character offset too large";
                                            else
                                                table.insert(v458, 1, v494);
                                            end;
                                        end;
                                    end;
                                else
                                    local v495 = v37[v406[v408]];
                                    table.insert(v458, 1, type(v495) == "string" and {
                                        "class", 
                                        v495, 
                                        false
                                    } or v495 or v406[v408]);
                                end;
                            end;
                        elseif v407.ignoreCase and v406[v408] >= 97 and v406[v408] <= 122 then
                            table.insert(v458, 1, v406[v408] - 32);
                        else
                            table.insert(v458, 1, v406[v408]);
                        end;
                        v408 = v408 + 1;
                    end;
                end;
                if v406[v408 - 1] == v456 and v408 - 1 ~= l_v408_2 then
                    if v456 == 58 then
                        return "POSIX named classes are only support within a character set";
                    else
                        return "POSIX collating elements aren't supported";
                    end;
                elseif not v458[2] and not v455 then
                    table.insert(v411, v458[1]);
                else
                    table.insert(v411, {
                        "charset", 
                        v455, 
                        v458
                    });
                end;
            elseif v414 == 92 then
                v408 = v408 + 1;
                local v496 = v406[v408];
                if not v496 then
                    return "pattern may not end with a trailing backslash";
                elseif v496 >= 48 and v496 <= 57 then
                    local l_v408_7 = v408;
                    while v406[v408 + 1] and v406[v408 + 1] >= 48 and v406[v408 + 1] <= 57 do
                        v408 = v408 + 1;
                    end;
                    local l_s_14 = v406.s;
                    local v499 = v408 + 1;
                    v499 = utf8.offset(l_s_14, v499);
                    local v500 = tonumber((string.sub(l_s_14, utf8.offset(l_s_14, l_v408_7), v499 and v499 - 1)));
                    if v410 < v500 and v408 ~= l_v408_7 then
                        v408 = l_v408_7;
                        local v501 = nil;
                        l_s_14 = nil;
                        v499 = nil;
                        if v406[v408] <= 55 then
                            v501 = v406[v408] - 48;
                            v408 = v408 + 1;
                            if v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 then
                                l_s_14 = v406[v408] - 48;
                                v408 = v408 + 1;
                                if v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 then
                                    v499 = v406[v408] - 48;
                                else
                                    v408 = v408 - 1;
                                end;
                            else
                                v408 = v408 - 1;
                            end;
                        end;
                        table.insert(v411, v501 and (l_s_14 and (v499 and 64 * v501 + 8 * l_s_14 + v499 or 8 * v501 + l_s_14) or v501) or v406[l_v408_7]);
                    else
                        table.insert(v411, {
                            "backref", 
                            v500
                        });
                    end;
                elseif v496 ~= 69 then
                    if v496 == 81 then
                        local v502 = v408 + 1;
                        repeat
                            v408 = table.find(v406, 92, v408 + 1);
                        until not v408 or v406[v408 + 1] == 69;
                        table.move(v406, v502, v408 and v408 - 1 or #v406, #v411 + 1, v411);
                        if v408 then
                            v408 = v408 + 1;
                        else
                            break;
                        end;
                    elseif v496 == 78 then
                        if v406[v408 + 1] == 123 and v406[v408 + 2] == 85 and v406[v408 + 3] == 43 and v407.unicode then
                            v408 = v408 + 4;
                            local l_v408_8 = v408;
                            while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102) do
                                v408 = v408 + 1;
                            end;
                            if v406[v408] ~= 125 or v408 == l_v408_8 then
                                return "malformed Unicode code point";
                            else
                                local l_s_15 = v406.s;
                                local v505 = utf8.offset(l_s_15, v408);
                                table.insert(v411, (tonumber((string.sub(l_s_15, utf8.offset(l_s_15, l_v408_8), v505 and v505 - 1)))));
                            end;
                        else
                            table.insert(v411, v37[78]);
                        end;
                    elseif v496 == 80 or v496 == 112 then
                        if not v7.unicodeData then
                            return "options.unicodeData cannot be turned off when using \\p";
                        else
                            v408 = v408 + 1;
                            if v406[v408] ~= 123 then
                                local v506 = utf8.char(v406[v408] or 0);
                                if not v39[v506] then
                                    return "unknown or malformed script name";
                                else
                                    table.insert(v411, {
                                        "category", 
                                        false, 
                                        v506
                                    });
                                end;
                            else
                                local v507 = v496 == 80;
                                v408 = v408 + 1;
                                if v406[v408] == 94 then
                                    v408 = v408 + 1;
                                    v507 = not v507;
                                end;
                                local l_v408_9 = v408;
                                while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 90 or v406[v408] >= 97 and v406[v408] <= 122 or v406[v408] == 95) do
                                    v408 = v408 + 1;
                                end;
                                if v406[v408] ~= 125 then
                                    return "unknown or malformed script name";
                                else
                                    local l_s_16 = v406.s;
                                    local v510 = utf8.offset(l_s_16, v408);
                                    local v511 = string.sub(l_s_16, utf8.offset(l_s_16, l_v408_9), v510 and v510 - 1);
                                    l_s_16 = v9[v511];
                                    if l_s_16 then
                                        table.insert(v411, {
                                            "charset", 
                                            v507, 
                                            l_s_16
                                        });
                                    elseif not v39[v511] then
                                        return "unknown or malformed script name";
                                    else
                                        table.insert(v411, {
                                            "category", 
                                            v507, 
                                            v511
                                        });
                                    end;
                                end;
                            end;
                        end;
                    elseif v496 == 103 and (v406[v408 + 1] == 123 or v406[v408 + 1] >= 48 and v406[v408 + 1] <= 57) then
                        local v512 = false;
                        v408 = v408 + 1;
                        if v406[v408] == 123 then
                            v408 = v408 + 1;
                            v512 = true;
                        elseif v406[v408] < 48 or v406[v408] > 57 then
                            return "malformed reference code";
                        end;
                        local l_v408_10 = v408;
                        while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102) do
                            v408 = v408 + 1;
                        end;
                        if v512 and v406[v408] ~= 125 then
                            return "malformed reference code";
                        else
                            local l_s_17 = v406.s;
                            local v515 = v408 + (v512 and 0 or 1);
                            v515 = utf8.offset(l_s_17, v515);
                            table.insert(v411, {
                                "backref", 
                                (tonumber((string.sub(l_s_17, utf8.offset(l_s_17, l_v408_10), v515 and v515 - 1))))
                            });
                            if not v512 then
                                v408 = v408 - 1;
                            end;
                        end;
                    elseif v496 == 111 then
                        v408 = v408 + 1;
                        if v406[v408 + 1] ~= 123 then
                            return "malformed octal code";
                        else
                            v408 = v408 + 1;
                            local l_v408_11 = v408;
                            while v406[v408] and v406[v408] >= 48 and v406[v408] <= 55 do
                                v408 = v408 + 1;
                            end;
                            if v406[v408] ~= 125 or v408 == l_v408_11 then
                                return "malformed octal code";
                            else
                                local l_s_18 = v406.s;
                                local v518 = utf8.offset(l_s_18, v408);
                                local v519 = tonumber(string.sub(l_s_18, utf8.offset(l_s_18, l_v408_11), v518 and v518 - 1), 8);
                                if v519 > 65535 then
                                    return "character offset too large";
                                else
                                    table.insert(v411, v519);
                                end;
                            end;
                        end;
                    elseif v496 == 120 then
                        local v520 = nil;
                        local v521 = nil;
                        v408 = v408 + 1;
                        if v406[v408] == 123 then
                            v408 = v408 + 1;
                            local l_v408_12 = v408;
                            while v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102) do
                                v408 = v408 + 1;
                            end;
                            if v406[v408] ~= 125 or v408 == l_v408_12 then
                                return "malformed hexadecimal code";
                            elseif v408 - l_v408_12 > 4 then
                                return "character offset too large";
                            else
                                local l_s_19 = v406.s;
                                local v524 = utf8.offset(l_s_19, v408);
                                table.insert(v411, (tonumber(string.sub(l_s_19, utf8.offset(l_s_19, l_v408_12), v524 and v524 - 1), 16)));
                            end;
                        else
                            if v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102) then
                                v520 = v406[v408] - (v406[v408] >= 65 and v406[v408] <= 90 and 55 or v406[v408] >= 97 and v406[v408] <= 122 and 87 or 48);
                                v408 = v408 + 1;
                                if v406[v408] and (v406[v408] >= 48 and v406[v408] <= 57 or v406[v408] >= 65 and v406[v408] <= 70 or v406[v408] >= 97 and v406[v408] <= 102) then
                                    v521 = v406[v408] - (v406[v408] >= 65 and v406[v408] <= 90 and 55 or v406[v408] >= 97 and v406[v408] <= 122 and 87 or 48);
                                else
                                    v408 = v408 - 1;
                                end;
                            else
                                v408 = v408 - 1;
                            end;
                            table.insert(v411, v520 and (v521 and 16 * v520 + v521 or v520) or 0);
                        end;
                    else
                        table.insert(v411, v38[v496] or v37[v496] or v496);
                    end;
                end;
            elseif v414 == 42 or v414 == 43 or v414 == 63 or v414 == 123 then
                local v525 = nil;
                local v526 = nil;
                if v414 == 123 then
                    local v527 = v408 + 1;
                    local v528 = nil;
                    while v406[v408 + 1] and (v406[v408 + 1] >= 48 and v406[v408 + 1] <= 57 or v406[v408 + 1] == 44 and not v528 and v408 + 1 ~= v527) do
                        v408 = v408 + 1;
                        if v406[v408] == 44 then
                            v528 = v408;
                        end;
                    end;
                    if v406[v408 + 1] == 125 then
                        v408 = v408 + 1;
                        if not v528 then
                            local l_s_20 = v406.s;
                            local v530 = utf8.offset(l_s_20, v408);
                            v525 = tonumber((string.sub(l_s_20, utf8.offset(l_s_20, v527), v530 and v530 - 1)));
                            v526 = v525;
                        else
                            local l_s_21 = v406.s;
                            local v532 = utf8.offset(l_s_21, v528);
                            v525 = tonumber((string.sub(l_s_21, utf8.offset(l_s_21, v527), v532 and v532 - 1)));
                            local v533;
                            if v528 + 1 == v408 then
                                v533 = 1e999;
                            else
                                l_s_21 = v406.s;
                                v532 = v528 + 1;
                                local v534 = utf8.offset(l_s_21, v408);
                                v533 = tonumber((string.sub(l_s_21, utf8.offset(l_s_21, v532), v534 and v534 - 1)));
                            end;
                            v526 = v533;
                            if v526 < v525 then
                                return "numbers out of order in {} quantifier";
                            end;
                        end;
                    else
                        table.move(v406, v527 - 1, v408, #v411 + 1, v411);
                    end;
                else
                    v525 = v414 == 43 and 1 or 0;
                    v526 = v414 == 63 and 1 or 1e999;
                end;
                if v525 then
                    local v535 = v407.ungreedy and "lazy" or "greedy";
                    if v406[v408 + 1] == 43 or v406[v408 + 1] == 63 then
                        v408 = v408 + 1;
                        v535 = v406[v408] == 43 and "possessive" or v407.ungreedy and "greedy" or "lazy";
                    end;
                    local v536 = #v411;
                    local v537 = v411[v536];
                    if not v537 or type(v537) == "table" and (v537[1] == "quantifier" or v537[1] == 40 or v38[v537[1]]) or v537 == v44 or type(v537) == "string" then
                        return "quantifier doesn't follow a repeatable pattern";
                    elseif v526 == 0 then
                        table.remove(v411);
                    elseif v525 ~= 1 or v526 ~= 1 then
                        if type(v537) == "table" and v537[1] == 41 then
                            v536 = v537[3];
                        end;
                        v411[v536] = {
                            "quantifier", 
                            v525, 
                            v526, 
                            v535, 
                            v411[v536]
                        };
                    end;
                end;
            elseif v414 == 124 then
                table.insert(v411, v44);
                local v538 = #v411;
                repeat
                    v538 = v538 - 1;
                    local v539 = v411[v538];
                    local v540 = type(v411[v538]) == "table";
                    if v540 and v539[1] == 41 then
                        v538 = v411[v538][3];
                    elseif v540 and v539[1] == 40 then
                        if v539[4] == 124 then
                            v410 = v539[5];
                            break;
                        else
                            break;
                        end;
                    end;
                until not v539;
            elseif v414 == 36 or v414 == 94 then
                table.insert(v411, v414 == 94 and v43 or v41);
            elseif v407.ignoreCase and v414 >= 97 and v414 <= 122 then
                table.insert(v411, v414 - 32);
            elseif v407.extended and (v414 >= 9 and v414 <= 13 or v414 == 32 or v414 == 35) then
                if v414 == 35 then
                    repeat
                        v408 = v408 + 1;
                    until not v406[v408] or v406[v408] == 10 or v406[v408] == 13;
                end;
            else
                table.insert(v411, v414);
            end;
            v408 = v408 + 1;
        end;
        local v541 = 0;
        for _, v543 in ipairs(v411) do
            if type(v543) == "table" and (v543[1] == 40 or v543[1] == "quantifier" and type(v543[5]) == "table" and v543[5][1] == 40) then
                if v543[1] == "quantifier" then
                    v543 = v543[5];
                end;
                if not v543[3] then
                    return "unterminated parenthetical";
                elseif v543[2] then
                    v541 = math.max(v541, v543[2]);
                end;
            elseif type(v543) == "table" and (v543[1] == "backref" or v543[1] == "recurmatch") then
                if not v412[v543[2]] and (type(v543[2]) ~= "number" or v410 < v543[2]) then
                    return "reference to a non-existent or invalid subpattern";
                elseif v543[1] == "recurmatch" and v543[2] ~= 0 then
                    for v544, v545 in ipairs(v411) do
                        if type(v545) == "table" and v545[1] == 40 and v545[2] == v543[2] then
                            v543[3] = v544;
                            break;
                        end;
                    end;
                elseif type(v543[2]) == "string" then
                    v543[2] = v412[v543[2]];
                end;
            end;
        end;
        v411.group_n = v541;
        return v411, v412, v413;
    end;
end;
if not tonumber(v7.cacheSize) then
    error(string.format("expected number for options.cacheSize, got %s", (typeof(v7.cacheSize))), 2);
end;
local v547 = false;
if math.floor(v7.cacheSize or 0) ~= 0 then
    v547 = tonumber(v7.cacheSize);
end;
local v548 = nil;
local v549 = nil;
if v547 then
    if v547 < 0 or v547 ~= v547 then
        error("cache size cannot be a negative number or a NaN", 2);
    elseif v547 == 1e999 then
        v548 = {
            nil
        };
        v549 = {
            nil
        };
    elseif v547 >= 4294967296 then
        error("cache size too large", 2);
    else
        v548 = table.create(v7.cacheSize);
        v549 = table.create(v7.cacheSize);
    end;
end;
if v547 then
    v12.pruge = function() --[[ Line: 1902 ]] --[[ Name: pruge ]]
        -- upvalues: v549 (ref), v548 (ref)
        table.clear(v549);
        table.clear(v548);
    end;
end;
local function v567(v550, v551, v552, v553) --[[ Line: 1908 ]] --[[ Name: new_re ]]
    -- upvalues: v547 (copy), v548 (ref), v549 (ref), v546 (copy), v11 (copy), v13 (ref), v267 (copy), v15 (ref)
    local v554 = nil;
    local v555 = nil;
    local v556 = nil;
    local v557 = v547 and string.format("%s|%s", v550.s, v552);
    local v558 = v547 and v548[table.find(v549, v557)];
    if v558 then
        local v559, v560, v561 = table.unpack(v558, 1, 3);
        v554 = v559;
        v555 = v560;
        v556 = v561;
    else
        local v562, v563, v564 = v546(v550, v551);
        v554 = v562;
        v555 = v563;
        v556 = v564;
        if type(v554) == "string" then
            error(v554, 2);
        end;
        if v547 and v554[1] then
            table.insert(v549, 1, v557);
            table.insert(v548, 1, {
                v554, 
                v555, 
                v556
            });
            if v547 ~= 1e999 then
                table.remove(v549, v547 + 1);
                table.remove(v548, v547 + 1);
            end;
        end;
    end;
    local v565 = newproxy(true);
    v11[v565] = {
        name = "RegEx", 
        flags = v551, 
        flag_repr = v552, 
        pattern_repr = v553, 
        token = v554, 
        group_id = v555, 
        verb_flags = v556
    };
    local v566 = getmetatable(v565);
    v566.__index = setmetatable(v551, v13);
    v566.__tostring = v267;
    v566.__metatable = v15;
    return v565;
end;
local function v569(v568) --[[ Line: 1939 ]] --[[ Name: escape_fslash ]]
    return (#v568 % 2 == 0 and "\\" or "") .. v568 .. ".";
end;
local function v572(v570, v571) --[[ Line: 1943 ]] --[[ Name: sort_flag_chr ]]
    return v570:lower() < v571:lower();
end;
v12.new = function(...) --[[ Line: 1947 ]] --[[ Name: new ]]
    -- upvalues: v35 (copy), v572 (copy), v567 (copy), v24 (copy), v569 (copy)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2);
    end;
    local v573, v574 = ...;
    if type(v573) == "number" then
        v573 = v573 .. "";
    elseif type(v573) ~= "string" then
        error(string.format("invalid argument #1 (string expected, got %s)", (typeof(v573))), 2);
    end;
    if type(v574) ~= "string" and type(v574) ~= "number" and v574 ~= nil then
        error(string.format("invalid argument #2 (string expected, got %s)", (typeof(v574))), 2);
    end;
    local v575 = {
        anchored = false, 
        caseless = false, 
        multiline = false, 
        dotall = false, 
        unicode = false, 
        ungreedy = false, 
        extended = false
    };
    local v576 = {};
    for v577 in string.gmatch(v574 or "", utf8.charpattern) do
        if v575[v35[v577]] ~= false then
            error("invalid regular expression flag " .. v577, 3);
        end;
        v575[v35[v577]] = true;
        table.insert(v576, v577);
    end;
    table.sort(v576, v572);
    v576 = table.concat(v576);
    return (v567(v24(v573), v575, v576, string.format("/%s/", v573:gsub("(\\*)/", v569))));
end;
v12.fromstring = function(...) --[[ Line: 1977 ]] --[[ Name: fromstring ]]
    -- upvalues: v24 (copy), v35 (copy), v572 (copy), v567 (copy)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2);
    end;
    local v578 = ...;
    if type(v578) == "number" then
        v578 = v578 .. "";
    elseif type(v578) ~= "string" then
        error(string.format("invalid argument #1 (string expected, got %s)", typeof(v578), 2));
    end;
    local v579 = v24(v578);
    local v580 = v579[1];
    if not v580 then
        error("empty regex", 2);
    elseif v580 == 92 or v580 >= 48 and v580 <= 57 or v580 >= 65 and v580 <= 90 or v580 >= 97 and v580 <= 122 then
        error("delimiter must not be alphanumeric or a backslash", 2);
    end;
    local v581 = 1;
    repeat
        v581 = table.find(v579, v580, v581 + 1);
        if not v581 then
            error(string.format("no ending delimiter ('%s') found", utf8.char(v580)), 2);
        end;
        local v582 = 1;
        while v579[v581 - v582] == 92 do
            v582 = v582 + 1;
        end;
    until v582 % 2 == 1;
    local v583 = {
        anchored = false, 
        caseless = false, 
        multiline = false, 
        dotall = false, 
        unicode = false, 
        ungreedy = false, 
        extended = false
    };
    local v584 = {};
    while v581 < v579.n do
        local v585 = utf8.char(table.remove(v579));
        v579.n = v579.n - 1;
        if v583[v35[v585]] ~= false then
            error("invalid regular expression flag " .. v585, 3);
        end;
        v583[v35[v585]] = true;
        table.insert(v584, v585);
    end;
    table.sort(v584, v572);
    v584 = table.concat(v584);
    table.remove(v579, 1);
    table.remove(v579);
    v579.n = v579.n - 2;
    v579.s = string.sub(v579.s, 2, 1 + v579.n);
    return (v567(v579, v583, v584, (string.sub(v578, 1, 2 + v579.n))));
end;
local v586 = {
    ["\000"] = "\\x00", 
    ["\n"] = "\\n", 
    ["\t"] = "\\t", 
    ["\r"] = "\\r", 
    ["\f"] = "\\f"
};
v12.escape = function(...) --[[ Line: 2033 ]] --[[ Name: escape ]]
    -- upvalues: v586 (copy)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2);
    end;
    local v587, v588, v589 = ...;
    if type(v587) == "number" then
        v587 = v587 .. "";
    elseif type(v587) ~= "string" then
        error(string.format("invalid argument #1 to 'escape' (string expected, got %s)", (typeof(v587))), 2);
    end;
    if v589 == nil then
        v589 = "";
    elseif type(v589) == "number" then
        v589 = v589 .. "";
    elseif type(v589) ~= "string" then
        error(string.format("invalid argument #3 to 'escape' (string expected, got %s)", (typeof(v589))), 2);
    end;
    if utf8.len(v589) > 1 or v589:match("^[%a\\]$") then
        error("delimiter have not be alphanumeric", 2);
    end;
    return (string.gsub(v587, "[\000\f\n\r\t]", v586):gsub(string.format("[\\%s#()%%%%*+.?[%%]^{|%s]", v588 and "%s" or "", (v589:find("^[%%%]]$") and "%" or "") .. v589), "\\%1"));
end;
v12.type = function(...) --[[ Line: 2056 ]] --[[ Name: type ]]
    -- upvalues: v11 (copy)
    if select("#", ...) == 0 then
        error("missing argument #1", 2);
    end;
    return v11[...] and v11[...].name;
end;
for v590, v591 in pairs(v13) do
    v12[v590] = v591;
end;
v13 = {
    __index = v13
};
v15 = v12.fromstring("/The\\s*metatable\\s*is\\s*(?:locked|inaccessible)(?#Nice try :])/i");
getmetatable(v15).__metatable = v15;
local function v592() --[[ Line: 2072 ]] --[[ Name: readonly_table ]]
    error("Attempt to modify a readonly table", 2);
end;
v14 = {
    __index = v14, 
    __metatable = v15, 
    __newindex = v592
};
v12.Match = setmetatable({}, v14);
return (setmetatable({}, {
    __index = v12, 
    __metatable = v15, 
    __newindex = v592
}));