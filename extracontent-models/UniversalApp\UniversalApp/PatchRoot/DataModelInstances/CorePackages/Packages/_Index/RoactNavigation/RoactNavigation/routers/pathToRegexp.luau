local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = require(l_Parent_0.RegExp);
local function _(v3) --[[ Line: 35 ]] --[[ Name: TypeError ]]
    return v3;
end;
local v5 = {};
local v6 = nil;
local v7 = nil;
local function v54(v8) --[[ Line: 65 ]] --[[ Name: lexer ]]
    local v9 = {};
    local v10 = 1;
    local function _(v11) --[[ Line: 72 ]] --[[ Name: preIncrement_i ]]
        -- upvalues: v10 (ref)
        v10 = v10 + 1;
        return v11;
    end;
    local function _(v13) --[[ Line: 77 ]] --[[ Name: getChar ]]
        -- upvalues: v8 (copy)
        return (string.sub(v8, v13, v13));
    end;
    local v15 = string.len(v8);
    while v10 <= v15 do
        local v16 = string.sub(v8, v10, v10);
        if v16 == "*" or v16 == "+" or v16 == "?" then
            local v17 = {
                type = "MODIFIER", 
                index = v10
            };
            local l_v10_0 = v10;
            v10 = v10 + 1;
            local l_l_v10_0_0 = l_v10_0;
            v17.value = string.sub(v8, l_l_v10_0_0, l_l_v10_0_0);
            table.insert(v9, v17);
        elseif v16 == "\\" then
            local v20 = {
                type = "ESCAPED_CHAR"
            };
            local l_v10_1 = v10;
            v10 = v10 + 1;
            v20.index = l_v10_1;
            local l_v10_2 = v10;
            v10 = v10 + 1;
            l_v10_1 = l_v10_2;
            v20.value = string.sub(v8, l_v10_1, l_v10_1);
            table.insert(v9, v20);
        elseif v16 == "{" then
            local v23 = {
                type = "OPEN", 
                index = v10
            };
            local l_v10_3 = v10;
            v10 = v10 + 1;
            local l_l_v10_3_0 = l_v10_3;
            v23.value = string.sub(v8, l_l_v10_3_0, l_l_v10_3_0);
            table.insert(v9, v23);
        elseif v16 == "}" then
            local v26 = {
                type = "CLOSE", 
                index = v10
            };
            local l_v10_4 = v10;
            v10 = v10 + 1;
            local l_l_v10_4_0 = l_v10_4;
            v26.value = string.sub(v8, l_l_v10_4_0, l_l_v10_4_0);
            table.insert(v9, v26);
        elseif v16 == ":" then
            local v29 = "";
            local v30 = v10 + 1;
            do
                local l_v30_0 = v30;
                local function _(v32) --[[ Line: 129 ]] --[[ Name: preIncrement_j ]]
                    -- upvalues: l_v30_0 (ref)
                    l_v30_0 = l_v30_0 + 1;
                    return v32;
                end;
                while l_v30_0 <= v15 do
                    local v34 = string.byte(v8, l_v30_0);
                    if v34 >= 48 and v34 <= 57 or v34 >= 65 and v34 <= 90 or v34 >= 97 and v34 <= 122 or v34 == 95 then
                        local l_v29_0 = v29;
                        local l_l_v30_0_0 = l_v30_0;
                        l_v30_0 = l_v30_0 + 1;
                        local l_l_l_v30_0_0_0 = l_l_v30_0_0;
                        v29 = l_v29_0 .. string.sub(v8, l_l_l_v30_0_0_0, l_l_l_v30_0_0_0);
                    else
                        break;
                    end;
                end;
                if v29 == "" then
                    error((("Missing parameter name at %d"):format(v10)));
                end;
                table.insert(v9, {
                    type = "NAME", 
                    index = v10, 
                    value = v29
                });
                v10 = l_v30_0;
            end;
        elseif v16 == "(" then
            local v38 = 1;
            local v39 = "";
            local v40 = v10 + 1;
            local l_v40_0 = v40;
            if string.sub(v8, l_v40_0, l_v40_0) == "?" then
                error((("Pattern cannot start with \"?\" at %d"):format(v40)));
            end;
            do
                local l_v40_1 = v40;
                local function _(v43) --[[ Line: 179 ]] --[[ Name: preIncrement_j ]]
                    -- upvalues: l_v40_1 (ref)
                    l_v40_1 = l_v40_1 + 1;
                    return v43;
                end;
                while l_v40_1 <= v15 do
                    local l_l_v40_1_0 = l_v40_1;
                    if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) == "\\" then
                        l_v40_0 = v39;
                        local l_l_v40_1_1 = l_v40_1;
                        l_v40_1 = l_v40_1 + 1;
                        local l_l_l_v40_1_1_0 = l_l_v40_1_1;
                        local v48 = string.sub(v8, l_l_l_v40_1_1_0, l_l_l_v40_1_1_0);
                        l_l_v40_1_1 = l_v40_1;
                        l_v40_1 = l_v40_1 + 1;
                        l_l_l_v40_1_1_0 = l_l_v40_1_1;
                        v39 = l_v40_0 .. v48 .. string.sub(v8, l_l_l_v40_1_1_0, l_l_l_v40_1_1_0);
                    end;
                    l_l_v40_1_0 = l_v40_1;
                    if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) == ")" then
                        v38 = v38 - 1;
                        if v38 == 0 then
                            l_v40_1 = l_v40_1 + 1;
                            break;
                        end;
                    else
                        l_l_v40_1_0 = l_v40_1;
                        if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) == "(" then
                            v38 = v38 + 1;
                            l_l_v40_1_0 = l_v40_1 + 1;
                            if string.sub(v8, l_l_v40_1_0, l_l_v40_1_0) ~= "?" then
                                error((("Capturing groups are not allowed at %d"):format(l_v40_1)));
                            end;
                        end;
                    end;
                    l_v40_0 = v39;
                    local l_l_v40_1_2 = l_v40_1;
                    l_v40_1 = l_v40_1 + 1;
                    local l_l_l_v40_1_2_0 = l_l_v40_1_2;
                    v39 = l_v40_0 .. string.sub(v8, l_l_l_v40_1_2_0, l_l_l_v40_1_2_0);
                end;
                if v38 ~= 0 then
                    error((("Unbalanced pattern at %d"):format(v10)));
                end;
                if v39 == "" then
                    error((("Missing pattern at %d"):format(v10)));
                end;
                table.insert(v9, {
                    type = "PATTERN", 
                    index = v10, 
                    value = v39
                });
                v10 = l_v40_1;
            end;
        else
            local v51 = {
                type = "CHAR", 
                index = v10
            };
            local l_v10_5 = v10;
            v10 = v10 + 1;
            local l_l_v10_5_0 = l_v10_5;
            v51.value = string.sub(v8, l_l_v10_5_0, l_l_v10_5_0);
            table.insert(v9, v51);
        end;
    end;
    table.insert(v9, {
        type = "END", 
        index = v10, 
        value = ""
    });
    return v9;
end;
v5.parse = function(v55, v56) --[[ Line: 252 ]] --[[ Name: parse ]]
    -- upvalues: v54 (copy), v6 (ref)
    local v57 = v56 or {};
    local v58 = v54(v55);
    local v59 = "./";
    if v57.prefixes ~= nil and v57.prefixes ~= "" then
        v59 = v57.prefixes;
    end;
    local v60 = string.format("[^%s]+?", v6(v57.delimiter or "/#?"));
    local v61 = {};
    local v62 = 0;
    local v63 = 1;
    local v64 = "";
    local function _(v65) --[[ Line: 269 ]] --[[ Name: preIncrement_i ]]
        -- upvalues: v63 (ref)
        v63 = v63 + 1;
        return v65;
    end;
    local function _(v67) --[[ Line: 277 ]] --[[ Name: preIncrement_key ]]
        -- upvalues: v62 (ref)
        v62 = v62 + 1;
        return v67;
    end;
    local function _(v69) --[[ Line: 282 ]] --[[ Name: tryConsume ]]
        -- upvalues: v63 (ref), v58 (copy)
        if v63 <= #v58 and v58[v63].type == v69 then
            local l_v58_0 = v58;
            local l_v63_0 = v63;
            v63 = v63 + 1;
            return l_v58_0[l_v63_0].value;
        else
            return nil;
        end;
    end;
    local function v80(v73) --[[ Line: 290 ]] --[[ Name: mustConsume ]]
        -- upvalues: v63 (ref), v58 (copy)
        local v74;
        if v63 <= #v58 and v58[v63].type == v73 then
            local l_v58_1 = v58;
            local l_v63_1 = v63;
            v63 = v63 + 1;
            v74 = l_v58_1[l_v63_1].value;
        else
            v74 = nil;
        end;
        if v74 ~= nil then
            return v74;
        else
            local v77 = v58[v63];
            if v77 == nil then
                error((("Expected token %s, got nil"):format(v73)));
            end;
            local l_type_0 = v77.type;
            local l_index_0 = v77.index;
            error((("Unexpected %s at %d, expected %s"):format(l_type_0, l_index_0, v73)));
            return;
        end;
    end;
    local function v92() --[[ Line: 304 ]] --[[ Name: consumeText ]]
        -- upvalues: v63 (ref), v58 (copy)
        local v81 = "";
        local v82;
        if v63 <= #v58 and v58[v63].type == "CHAR" then
            local l_v58_2 = v58;
            local l_v63_2 = v63;
            v63 = v63 + 1;
            v82 = l_v58_2[l_v63_2].value;
        else
            v82 = nil;
        end;
        if not v82 then
            if v63 <= #v58 and v58[v63].type == "ESCAPED_CHAR" then
                local l_v58_3 = v58;
                local l_v63_3 = v63;
                v63 = v63 + 1;
                v82 = l_v58_3[l_v63_3].value;
            else
                v82 = nil;
            end;
        end;
        while v82 and v82 ~= "" do
            v81 = v81 .. v82;
            local v87;
            if v63 <= #v58 and v58[v63].type == "CHAR" then
                local l_v58_4 = v58;
                local l_v63_4 = v63;
                v63 = v63 + 1;
                v87 = l_v58_4[l_v63_4].value;
            else
                v87 = nil;
            end;
            if not v87 then
                if v63 <= #v58 and v58[v63].type == "ESCAPED_CHAR" then
                    local l_v58_5 = v58;
                    local l_v63_5 = v63;
                    v63 = v63 + 1;
                    v87 = l_v58_5[l_v63_5].value;
                else
                    v87 = nil;
                end;
            end;
            v82 = v87;
        end;
        return v81;
    end;
    while #v58 >= v63 do
        local v93;
        if #v58 >= v63 and v58[v63].type == "CHAR" then
            local l_v63_6 = v63;
            v63 = v63 + 1;
            v93 = v58[l_v63_6].value;
        else
            v93 = nil;
        end;
        local v95;
        if #v58 >= v63 and v58[v63].type == "NAME" then
            local l_v63_7 = v63;
            v63 = v63 + 1;
            v95 = v58[l_v63_7].value;
        else
            v95 = nil;
        end;
        local v97;
        if #v58 >= v63 and v58[v63].type == "PATTERN" then
            local l_v63_8 = v63;
            v63 = v63 + 1;
            v97 = v58[l_v63_8].value;
        else
            v97 = nil;
        end;
        if v95 and v95 ~= "" or v97 and v97 ~= "" then
            local v99 = v93 or "";
            if string.find(v59, v99) == nil then
                v64 = v64 .. v99;
                v99 = "";
            end;
            if v64 ~= nil and v64 ~= "" then
                table.insert(v61, v64);
                v64 = "";
            end;
            local l_v95_0 = v95;
            if v95 == nil or v95 == "" then
                local l_v62_0 = v62;
                v62 = v62 + 1;
                l_v95_0 = l_v62_0;
            end;
            local l_v97_0 = v97;
            if v97 == nil or v97 == "" then
                l_v97_0 = v60;
            end;
            local v103 = {
                name = l_v95_0, 
                prefix = v99, 
                suffix = "", 
                pattern = l_v97_0
            };
            local v104;
            if #v58 >= v63 and v58[v63].type == "MODIFIER" then
                local l_v63_9 = v63;
                v63 = v63 + 1;
                v104 = v58[l_v63_9].value;
            else
                v104 = nil;
            end;
            v103.modifier = v104 or "";
            table.insert(v61, v103);
        else
            local l_v93_0 = v93;
            if not l_v93_0 then
                if #v58 >= v63 and v58[v63].type == "ESCAPED_CHAR" then
                    local l_v63_10 = v63;
                    v63 = v63 + 1;
                    l_v93_0 = v58[l_v63_10].value;
                else
                    l_v93_0 = nil;
                end;
            end;
            if l_v93_0 and l_v93_0 ~= "" then
                v64 = v64 .. l_v93_0;
            else
                if v64 and v64 ~= "" then
                    table.insert(v61, v64);
                    v64 = "";
                end;
                local v108;
                if #v58 >= v63 and v58[v63].type == "OPEN" then
                    local l_v63_11 = v63;
                    v63 = v63 + 1;
                    v108 = v58[l_v63_11].value;
                else
                    v108 = nil;
                end;
                if v108 and v108 ~= "" then
                    local v110 = v92();
                    local v111;
                    if #v58 >= v63 and v58[v63].type == "NAME" then
                        local l_v63_12 = v63;
                        v63 = v63 + 1;
                        v111 = v58[l_v63_12].value;
                    else
                        v111 = nil;
                    end;
                    local v113 = v111 or "";
                    local v114;
                    if #v58 >= v63 and v58[v63].type == "PATTERN" then
                        local l_v63_13 = v63;
                        v63 = v63 + 1;
                        v114 = v58[l_v63_13].value;
                    else
                        v114 = nil;
                    end;
                    v111 = v114 or "";
                    v114 = v92();
                    v80("CLOSE");
                    if v113 == "" and v111 ~= "" then
                        local l_v62_1 = v62;
                        v62 = v62 + 1;
                        v113 = l_v62_1;
                    end;
                    if v113 ~= "" and v113 ~= 0 and (v111 == nil or v111 == "") then
                        v111 = v60;
                    end;
                    local v117 = {
                        name = v113, 
                        pattern = v111, 
                        prefix = v110, 
                        suffix = v114
                    };
                    local v118;
                    if #v58 >= v63 and v58[v63].type == "MODIFIER" then
                        local l_v63_14 = v63;
                        v63 = v63 + 1;
                        v118 = v58[l_v63_14].value;
                    else
                        v118 = nil;
                    end;
                    v117.modifier = v118 or "";
                    table.insert(v61, v117);
                else
                    v80("END");
                end;
            end;
        end;
    end;
    return v61;
end;
v5.compile = function(v120, v121) --[[ Line: 416 ]] --[[ Name: compile ]]
    -- upvalues: v5 (copy)
    return v5.tokensToFunction(v5.parse(v120, v121), v121);
end;
v5.tokensToFunction = function(v122, v123) --[[ Line: 425 ]] --[[ Name: tokensToFunction ]]
    -- upvalues: v7 (ref), l_Array_0 (copy), v2 (copy)
    if v123 == nil then
        v123 = {};
    end;
    local l_v123_0 = v123;
    local v125 = v7(l_v123_0);
    local v127 = l_v123_0.encode or function(v126) --[[ Line: 431 ]]
        return v126;
    end;
    local l_validate_0 = l_v123_0.validate;
    if l_validate_0 == nil then
        l_validate_0 = true;
    end;
    local v130 = l_Array_0.map(v122, function(v129) --[[ Line: 440 ]]
        -- upvalues: v2 (ref), v125 (copy)
        if type(v129) == "table" then
            return v2(("^(?:%s)$"):format(v129.pattern), v125);
        else
            return nil;
        end;
    end);
    return function(v131) --[[ Line: 447 ]]
        -- upvalues: v122 (copy), l_Array_0 (ref), v127 (copy), l_validate_0 (ref), v130 (copy)
        local v132 = "";
        for v133, v134 in v122 do
            if type(v134) == "string" then
                v132 = v132 .. v134;
            else
                local v135 = if v131 then v131[tostring(v134.name)] else nil;
                local v136 = true;
                if v134.modifier ~= "?" then
                    v136 = v134.modifier == "*";
                end;
                local v137 = true;
                if v134.modifier ~= "*" then
                    v137 = v134.modifier == "+";
                end;
                if l_Array_0.isArray(v135) then
                    if not v137 then
                        error((("Expected \"%s\" to not repeat, but got an array"):format(v134.name)));
                    end;
                    if #v135 == 0 then
                        if not v136 then
                            error((("Expected \"%s\" to not be empty"):format(v134.name)));
                        else
                            continue;
                        end;
                    end;
                    for _, v139 in v135 do
                        local v140 = v127(v139, v134);
                        if l_validate_0 and not v130[v133]:test(v140) then
                            error((("Expected all \"%s\" to match \"%s\", but got \"%s\""):format(v134.name, v134.pattern, v140)));
                        end;
                        v132 = v132 .. v134.prefix .. v140 .. v134.suffix;
                    end;
                else
                    local v141 = type(v135);
                    if v141 == "string" or v141 == "number" then
                        local v142 = v127(tostring(v135), v134);
                        if l_validate_0 and not v130[v133]:test(v142) then
                            error((("Expected \"%s\" to match \"%s\", but got \"%s\""):format(v134.name, v134.pattern, v142)));
                        end;
                        v132 = v132 .. v134.prefix .. v142 .. v134.suffix;
                    elseif not v136 then
                        local v143 = v137 and "an array" or "a string";
                        error((("Expected \"%s\" to be %s"):format(tostring(v134.name), v143)));
                    end;
                end;
            end;
        end;
        return v132;
    end;
end;
v5.match = function(v144, v145) --[[ Line: 554 ]] --[[ Name: match ]]
    -- upvalues: v5 (copy)
    local v146 = {};
    local v147 = v5.pathToRegexp(v144, v146, v145);
    return v5.regexpToFunction(v147, v146, v145);
end;
v5.regexpToFunction = function(v148, v149, v150) --[[ Line: 563 ]] --[[ Name: regexpToFunction ]]
    -- upvalues: l_Array_0 (copy)
    if v150 == nil then
        v150 = {};
    end;
    local v152 = v150.decode or function(v151) --[[ Line: 567 ]]
        return v151;
    end;
    return function(v153) --[[ Line: 571 ]]
        -- upvalues: v148 (copy), v149 (copy), l_Array_0 (ref), v152 (copy)
        local v154 = v148:exec(v153);
        if not v154 then
            return false;
        else
            local v155 = v154[1];
            local v156 = v154.index or 0;
            local v157 = {};
            for v158 = 2, v154.n do
                if v154[v158] ~= nil then
                    local v159 = v149[v158 - 1];
                    if v159.modifier == "*" or v159.modifier == "+" then
                        v157[v159.name] = l_Array_0.map(string.split(v154[v158], v159.prefix .. v159.suffix), function(v160) --[[ Line: 592 ]]
                            -- upvalues: v152 (ref), v159 (copy)
                            return v152(v160, v159);
                        end);
                    else
                        v157[v159.name] = v152(v154[v158], v159);
                    end;
                end;
            end;
            return {
                path = v155, 
                index = v156, 
                params = v157
            };
        end;
    end;
end;
v6 = function(v161) --[[ Line: 611 ]] --[[ Name: escapeString ]]
    return string.gsub(v161, "[%.%+%*%?=%^!:${}%(%)%[%]|/\\]", function(v162) --[[ Line: 612 ]]
        return "\\" .. v162;
    end);
end;
v7 = function(v163) --[[ Line: 620 ]] --[[ Name: flags ]]
    if v163 and v163.sensitive then
        return "";
    else
        return "i";
    end;
end;
local function v169(v164, v165, v166) --[[ Line: 686 ]] --[[ Name: arrayToRegexp ]]
    -- upvalues: l_Array_0 (copy), v5 (copy), v2 (copy), v7 (ref)
    local v168 = l_Array_0.map(v164, function(v167) --[[ Line: 691 ]]
        -- upvalues: v5 (ref), v165 (copy), v166 (copy)
        return v5.pathToRegexp(v167, v165, v166).source;
    end);
    return v2(("(?:%s)"):format(table.concat(v168, "|")), v7(v166));
end;
local function v173(v170, v171, v172) --[[ Line: 701 ]] --[[ Name: stringToRegexp ]]
    -- upvalues: v5 (copy)
    return v5.tokensToRegexp(v5.parse(v170, v172), v171, v172);
end;
v5.tokensToRegexp = function(v174, v175, v176) --[[ Line: 739 ]] --[[ Name: tokensToRegexp ]]
    -- upvalues: v6 (ref), v2 (copy), v7 (ref)
    local v177 = {};
    if v176 ~= nil then
        v177 = v176;
    end;
    local l_strict_0 = v177.strict;
    if l_strict_0 == nil then
        l_strict_0 = false;
    end;
    local l_start_0 = v177.start;
    if l_start_0 == nil then
        l_start_0 = true;
    end;
    local l_end__0 = v177.end_;
    if l_end__0 == nil then
        l_end__0 = true;
    end;
    local v182 = v177.encode or function(v181) --[[ Line: 756 ]]
        return v181;
    end;
    local v183 = if v177.endsWith then ("[%s]|$"):format(v6(v177.endsWith or "")) else "$";
    local v184 = ("[%s]"):format(v6(v177.delimiter or "/#?"));
    local v185 = l_start_0 and "^" or "";
    for _, v187 in v174 do
        if type(v187) == "string" then
            v185 = v185 .. v6(v182(v187));
        else
            local v188 = v6(v182(v187.prefix));
            local v189 = v6(v182(v187.suffix));
            if v187.pattern and v187.pattern ~= "" then
                if v175 then
                    table.insert(v175, v187);
                end;
                if v188 and v188 ~= "" or v189 and v189 ~= "" then
                    if v187.modifier == "+" or v187.modifier == "*" then
                        local v190 = v187.modifier == "*" and "?" or "";
                        v185 = v185 .. ("(?:%s((?:%s)(?:%s%s(?:%s))*)%s)%s"):format(v188, v187.pattern, v189, v188, v187.pattern, v189, v190);
                    else
                        v185 = v185 .. ("(?:%s(%s)%s)%s"):format(v188, v187.pattern, v189, v187.modifier);
                    end;
                else
                    v185 = v185 .. ("(%s)%s"):format(v187.pattern, v187.modifier);
                end;
            else
                v185 = v185 .. ("(?:%s%s)%s"):format(v188, v189, v187.modifier);
            end;
        end;
    end;
    if l_end__0 then
        if not l_strict_0 then
            v185 = v185 .. ("%s?"):format(v184);
        end;
        v185 = if v177.endsWith and v177.endsWith ~= "" then v185 .. ("(?=%s)"):format(v183) else v185 .. "$";
    else
        local v191 = v174[#v174];
        local v192 = v191 == nil;
        if type(v191) == "string" then
            v192 = string.find(v184, v191:sub(-1)) ~= nil;
        end;
        if not l_strict_0 then
            v185 = v185 .. string.format("(?:%s(?=%s))?", v184, v183);
        end;
        if not v192 then
            v185 = v185 .. string.format("(?=%s|%s)", v184, v183);
        end;
    end;
    return v2(v185, v7(v177));
end;
v5.pathToRegexp = function(v193, v194, v195) --[[ Line: 841 ]] --[[ Name: pathToRegexp ]]
    -- upvalues: l_Array_0 (copy), v169 (copy), v173 (copy)
    if l_Array_0.isArray(v193) then
        return v169(v193, v194, v195);
    else
        return v173(v193, v194, v195);
    end;
end;
return v5;