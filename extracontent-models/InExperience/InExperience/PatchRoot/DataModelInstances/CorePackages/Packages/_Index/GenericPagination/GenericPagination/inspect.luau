local v0 = {
    _VERSION = "inspect.lua 3.1.0", 
    _URL = "http://github.com/kikito/inspect.lua", 
    _DESCRIPTION = "human-readable representations of tables", 
    _LICENSE = "\t  MIT LICENSE\n\n\t  Copyright (c) 2013 Enrique Garc\195\173a Cota\n\n\t  Permission is hereby granted, free of charge, to any person obtaining a\n\t  copy of this software and associated documentation files (the\n\t  \"Software\"), to deal in the Software without restriction, including\n\t  without limitation the rights to use, copy, modify, merge, publish,\n\t  distribute, sublicense, and/or sell copies of the Software, and to\n\t  permit persons to whom the Software is furnished to do so, subject to\n\t  the following conditions:\n\n\t  The above copyright notice and this permission notice shall be included\n\t  in all copies or substantial portions of the Software.\n\n\t  THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n\t  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n\t  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n\t  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n\t  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n\t  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n\t  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\t"
};
local l_tostring_0 = tostring;
v0.KEY = setmetatable({}, {
    __tostring = function() --[[ Line: 34 ]] --[[ Name: __tostring ]]
        return "inspect.KEY";
    end
});
v0.METATABLE = setmetatable({}, {
    __tostring = function() --[[ Line: 39 ]] --[[ Name: __tostring ]]
        return "inspect.METATABLE";
    end
});
local function _(v2) --[[ Line: 44 ]] --[[ Name: rawpairs ]]
    return next, v2, nil;
end;
local function _(v4) --[[ Line: 50 ]] --[[ Name: smartQuote ]]
    if v4:match("\"") and not v4:match("'") then
        return "'" .. v4 .. "'";
    else
        return "\"" .. v4:gsub("\"", "\\\"") .. "\"";
    end;
end;
local v6 = {
    ["\a"] = "\\a", 
    ["\b"] = "\\b", 
    ["\f"] = "\\f", 
    ["\n"] = "\\n", 
    ["\r"] = "\\r", 
    ["\t"] = "\\t", 
    ["\v"] = "\\v"
};
local v7 = {};
for v8 = 0, 31 do
    local v9 = string.char(v8);
    if not v6[v9] then
        v6[v9] = "\\" .. v8;
        v7[v9] = string.format("\\%03d", v8);
    end;
end;
local function _(v10) --[[ Line: 76 ]] --[[ Name: escape ]]
    -- upvalues: v7 (copy), v6 (copy)
    return (v10:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", v7):gsub("%c", v6));
end;
local function _(v12) --[[ Line: 80 ]] --[[ Name: isIdentifier ]]
    local v13 = false;
    if type(v12) == "string" then
        v13 = v12:match("^[_%a][_%a%d]*$");
    end;
    return v13;
end;
local function _(v15, v16) --[[ Line: 84 ]] --[[ Name: isSequenceKey ]]
    local v17 = false;
    if type(v15) == "number" then
        v17 = false;
        if v15 >= 1 then
            v17 = false;
            if v15 <= v16 then
                v17 = math.floor(v15) == v15;
            end;
        end;
    end;
    return v17;
end;
local v19 = {
    number = 1, 
    boolean = 2, 
    string = 3, 
    table = 4, 
    ["function"] = 5, 
    userdata = 6, 
    thread = 7
};
local function v26(v20, v21) --[[ Line: 98 ]] --[[ Name: sortKeys ]]
    -- upvalues: v19 (copy)
    local v22 = type(v20);
    local v23 = type(v21);
    if v22 == v23 and (v22 == "string" or v22 == "number") then
        return v20 < v21;
    else
        local v24 = v19[v22];
        local v25 = v19[v23];
        if v24 and v25 then
            return v19[v22] < v19[v23];
        elseif v24 then
            return true;
        elseif v25 then
            return false;
        else
            return v22 < v23;
        end;
    end;
end;
local function _(v27) --[[ Line: 122 ]] --[[ Name: getSequenceLength ]]
    local v28 = 1;
    local v29 = rawget(v27, v28);
    while v29 ~= nil do
        v28 = v28 + 1;
        v29 = rawget(v27, v28);
    end;
    return v28 - 1;
end;
local function v40(v31) --[[ Line: 132 ]] --[[ Name: getNonSequentialKeys ]]
    -- upvalues: v26 (copy)
    local v32 = {};
    local v33 = 0;
    local v34 = 1;
    local v35 = rawget(v31, v34);
    while v35 ~= nil do
        v34 = v34 + 1;
        v35 = rawget(v31, v34);
    end;
    local v36 = v34 - 1;
    for v37, _ in next, v31 do
        local v39 = false;
        if type(v37) == "number" then
            v39 = false;
            if v37 >= 1 then
                v39 = false;
                if v37 <= v36 then
                    v39 = math.floor(v37) == v37;
                end;
            end;
        end;
        if not v39 then
            v33 = v33 + 1;
            v32[v33] = v37;
        end;
    end;
    table.sort(v32, v26);
    return v32, v33, v36;
end;
local function v41(v42, v43) --[[ Line: 145 ]] --[[ Name: countTableAppearances ]]
    -- upvalues: v41 (copy)
    v43 = v43 or {};
    if type(v42) == "table" then
        if not v43[v42] then
            v43[v42] = 1;
            for v44, v45 in next, v42 do
                v41(v44, v43);
                v41(v45, v43);
            end;
            v41(getmetatable(v42), v43);
            return v43;
        else
            v43[v42] = v43[v42] + 1;
        end;
    end;
    return v43;
end;
local function _(v46) --[[ Line: 164 ]]
    local v47 = {};
    local v48 = #v46;
    for v49 = 1, v48 do
        v47[v49] = v46[v49];
    end;
    return v47, v48;
end;
local function v59(v51, ...) --[[ Line: 172 ]] --[[ Name: makePath ]]
    local v52 = {
        ...
    };
    local v53 = {};
    local v54 = #v51;
    for v55 = 1, v54 do
        v53[v55] = v51[v55];
    end;
    local l_v53_0 = v53;
    local l_v54_0 = v54;
    for v58 = 1, #v52 do
        l_v53_0[l_v54_0 + v58] = v52[v58];
    end;
    return l_v53_0;
end;
local function v60(v61, v62, v63, v64) --[[ Line: 181 ]] --[[ Name: processRecursive ]]
    -- upvalues: v60 (copy), v59 (copy), v0 (copy)
    if v62 == nil then
        return nil;
    elseif v64[v62] then
        return v64[v62];
    else
        local v65 = v61(v62, v63);
        if type(v65) == "table" then
            local v66 = {};
            v64[v62] = v66;
            local v67 = nil;
            for v68, v69 in next, v65 do
                v67 = v60(v61, v68, v59(v63, v68, v0.KEY), v64);
                if v67 ~= nil then
                    v66[v67] = v60(v61, v69, v59(v63, v67), v64);
                end;
            end;
            local v70 = v60(v61, getmetatable(v65), v59(v63, v0.METATABLE), v64);
            if type(v70) ~= "table" then
                v70 = nil;
            end;
            setmetatable(v66, v70);
            v65 = v66;
        end;
        return v65;
    end;
end;
local v71 = {};
local v72 = {
    __index = v71
};
v71.puts = function(v73, ...) --[[ Line: 217 ]] --[[ Name: puts ]]
    local v74 = {
        ...
    };
    local l_buffer_0 = v73.buffer;
    local v76 = #l_buffer_0;
    for v77 = 1, #v74 do
        v76 = v76 + 1;
        l_buffer_0[v76] = v74[v77];
    end;
end;
v71.down = function(v78, v79) --[[ Line: 227 ]] --[[ Name: down ]]
    v78.level = v78.level + 1;
    v79();
    v78.level = v78.level - 1;
end;
v71.tabify = function(v80) --[[ Line: 233 ]] --[[ Name: tabify ]]
    v80:puts(v80.newline, string.rep(v80.indent, v80.level));
end;
v71.alreadyVisited = function(v81, v82) --[[ Line: 237 ]] --[[ Name: alreadyVisited ]]
    return v81.ids[v82] ~= nil;
end;
v71.getId = function(v83, v84) --[[ Line: 241 ]] --[[ Name: getId ]]
    -- upvalues: l_tostring_0 (copy)
    local v85 = v83.ids[v84];
    if not v85 then
        local v86 = type(v84);
        v85 = (v83.maxIds[v86] or 0) + 1;
        v83.maxIds[v86] = v85;
        v83.ids[v84] = v85;
    end;
    return (l_tostring_0(v85));
end;
v71.putKey = function(v87, v88) --[[ Line: 252 ]] --[[ Name: putKey ]]
    local v89 = false;
    if type(v88) == "string" then
        v89 = v88:match("^[_%a][_%a%d]*$");
    end;
    if v89 then
        return v87:puts(v88);
    else
        v87:puts("[");
        v87:putValue(v88);
        v87:puts("]");
        return;
    end;
end;
v71.putTable = function(v90, v91) --[[ Line: 261 ]] --[[ Name: putTable ]]
    -- upvalues: v0 (copy), l_tostring_0 (copy), v40 (copy)
    if v91 == v0.KEY or v91 == v0.METATABLE then
        v90:puts((l_tostring_0(v91)));
        return;
    elseif v90:alreadyVisited(v91) then
        v90:puts("<table ", v90:getId(v91), ">");
        return;
    elseif v90.level >= v90.depth then
        v90:puts("{...}");
        return;
    else
        if v90.tableAppearances[v91] > 1 then
            v90:puts("<", v90:getId(v91), ">");
        end;
        local v92, v93, v94 = v40(v91);
        local v95 = getmetatable(v91);
        v90:puts("{");
        v90:down(function() --[[ Line: 277 ]]
            -- upvalues: v94 (copy), v90 (copy), v91 (copy), v93 (copy), v92 (copy), v95 (copy)
            local v96 = 0;
            for v97 = 1, v94 do
                if v96 > 0 then
                    v90:puts(",");
                end;
                v90:puts(" ");
                v90:putValue(v91[v97]);
                v96 = v96 + 1;
            end;
            for v98 = 1, v93 do
                local v99 = v92[v98];
                if v96 > 0 then
                    v90:puts(",");
                end;
                v90:tabify();
                v90:putKey(v99);
                v90:puts(" = ");
                v90:putValue(v91[v99]);
                v96 = v96 + 1;
            end;
            if type(v95) == "table" then
                if v96 > 0 then
                    v90:puts(",");
                end;
                v90:tabify();
                v90:puts("<metatable> = ");
                v90:putValue(v95);
            end;
        end);
        if v93 > 0 or type(v95) == "table" then
            v90:tabify();
        elseif v94 > 0 then
            v90:puts(" ");
        end;
        v90:puts("}");
        return;
    end;
end;
v71.putValue = function(v100, v101) --[[ Line: 320 ]] --[[ Name: putValue ]]
    -- upvalues: v7 (copy), v6 (copy), l_tostring_0 (copy)
    local v102 = type(v101);
    if v102 == "string" then
        local v103 = v101:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", v7):gsub("%c", v6);
        v100:puts(if not v103:match("\"") or v103:match("'") then "\"" .. v103:gsub("\"", "\\\"") .. "\"" else "'" .. v103 .. "'");
        return;
    elseif v102 == "number" or v102 == "boolean" or v102 == "nil" or v102 == "cdata" or v102 == "ctype" then
        v100:puts((l_tostring_0(v101)));
        return;
    elseif v102 == "table" then
        v100:putTable(v101);
        return;
    else
        v100:puts("<", v102, " ", v100:getId(v101), ">");
        return;
    end;
end;
v0.inspect = function(v104, v105) --[[ Line: 336 ]] --[[ Name: inspect ]]
    -- upvalues: v60 (copy), v41 (copy), v72 (copy)
    v105 = v105 or {};
    local v106 = v105.depth or 1e999;
    local v107 = v105.newline or "\n";
    local v108 = v105.indent or "  ";
    local l_process_0 = v105.process;
    if l_process_0 then
        v104 = v60(l_process_0, v104, {}, {});
    end;
    local v110 = setmetatable({
        depth = v106, 
        level = 0, 
        buffer = {}, 
        ids = {}, 
        maxIds = {}, 
        newline = v107, 
        indent = v108, 
        tableAppearances = v41(v104)
    }, v72);
    v110:putValue(v104);
    return table.concat(v110.buffer);
end;
setmetatable(v0, {
    __call = function(_, ...) --[[ Line: 365 ]] --[[ Name: __call ]]
        -- upvalues: v0 (copy)
        return v0.inspect(...);
    end
});
return v0;