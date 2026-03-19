local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_Object_0 = v3.Object;
local l_String_0 = v3.String;
local l_Number_0 = v3.Number;
local v9 = require(l_Parent_1.RegExp);
local function _(v10) --[[ Line: 28 ]] --[[ Name: TypeError ]]
    return v10;
end;
local function v13(v12) --[[ Line: 32 ]] --[[ Name: encodeURIComponent ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:UrlEncode(v12);
end;
local function v16(v14) --[[ Line: 36 ]] --[[ Name: strictUriEncode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:UrlEncode(v14):gsub("[!'%(%)%*]", function(v15) --[[ Line: 37 ]]
        return ("%%%x"):format(v15:byte()):upper();
    end);
end;
local v17 = require(l_Parent_0.decodeURIComponent);
local v18 = require(l_Parent_0.splitOnFirst);
local v19 = nil;
local v20 = nil;
local v21 = {};
local function _(v22) --[[ Line: 51 ]] --[[ Name: newNumber ]]
    return tonumber(v22) or (0/0);
end;
local function v39(v24) --[[ Line: 55 ]] --[[ Name: encoderForArrayFormat ]]
    -- upvalues: l_Array_0 (copy), v19 (ref)
    local l_arrayFormat_0 = v24.arrayFormat;
    if l_arrayFormat_0 == "index" then
        return function(v26) --[[ Line: 58 ]]
            -- upvalues: v24 (copy), l_Array_0 (ref), v19 (ref)
            return function(v27, v28) --[[ Line: 59 ]]
                -- upvalues: v24 (ref), l_Array_0 (ref), v19 (ref), v26 (copy)
                local v29 = #v27;
                if v24.skipNull and v28 == nil then
                    return v27;
                elseif v28 == nil then
                    return l_Array_0.concat(v27, {
                        table.concat({
                            v19(v26, v24), 
                            "[", 
                            v29, 
                            "]"
                        }, "")
                    });
                else
                    return l_Array_0.concat(v27, {
                        table.concat({
                            v19(v26, v24), 
                            "[", 
                            v19(v29, v24), 
                            "]=", 
                            v19(v28, v24)
                        }, "")
                    });
                end;
            end;
        end;
    elseif l_arrayFormat_0 == "bracket" then
        return function(v30) --[[ Line: 88 ]]
            -- upvalues: v24 (copy), l_Array_0 (ref), v19 (ref)
            return function(v31, v32) --[[ Line: 89 ]]
                -- upvalues: v24 (ref), l_Array_0 (ref), v19 (ref), v30 (copy)
                if v24.skipNull and v32 == nil then
                    return v31;
                elseif v32 == nil then
                    return l_Array_0.concat(v31, {
                        table.concat({
                            v19(v30, v24), 
                            "[]"
                        }, "")
                    });
                else
                    return l_Array_0.concat(v31, {
                        table.concat({
                            v19(v30, v24), 
                            "[]=", 
                            v19(v32, v24)
                        }, "")
                    });
                end;
            end;
        end;
    elseif l_arrayFormat_0 == "comma" or l_arrayFormat_0 == "separator" then
        return function(v33) --[[ Line: 106 ]]
            -- upvalues: v19 (ref), v24 (copy)
            return function(v34, v35) --[[ Line: 107 ]]
                -- upvalues: v19 (ref), v33 (copy), v24 (ref)
                if v35 == nil or #v35 == 0 then
                    return v34;
                elseif #v34 == 0 then
                    return {
                        table.concat({
                            v19(v33, v24), 
                            "=", 
                            v19(v33, v24)
                        }, "")
                    };
                else
                    return {
                        table.concat({
                            v34, 
                            v19(v33, v24)
                        }, v24.arrayFormatSeparator)
                    };
                end;
            end;
        end;
    else
        return function(v36) --[[ Line: 124 ]]
            -- upvalues: v24 (copy), l_Array_0 (ref), v19 (ref)
            return function(v37, v38) --[[ Line: 125 ]]
                -- upvalues: v24 (ref), l_Array_0 (ref), v19 (ref), v36 (copy)
                if v24.skipNull and v38 == nil then
                    return v37;
                elseif v38 == nil then
                    return l_Array_0.concat(v37, {
                        v19(v36, v24)
                    });
                else
                    return l_Array_0.concat(v37, {
                        table.concat({
                            v19(v36, v24), 
                            "=", 
                            v19(v38, v24)
                        }, "")
                    });
                end;
            end;
        end;
    end;
end;
local function v58(v40) --[[ Line: 142 ]] --[[ Name: parserForArrayFormat ]]
    -- upvalues: v9 (copy), l_Array_0 (copy), v20 (ref)
    local v41 = nil;
    local l_arrayFormat_1 = v40.arrayFormat;
    if l_arrayFormat_1 == "index" then
        return function(v43, v44, v45) --[[ Line: 146 ]]
            -- upvalues: v41 (ref), v9 (ref)
            v41 = v9("\\[(\\d*)\\]$"):exec(v43);
            v43 = v43:gsub("%[%d*%]$", "");
            if not v41 then
                v45[v43] = v44;
                return;
            else
                if v45[v43] == nil then
                    v45[v43] = {};
                end;
                v45[v43][v41[2]] = v44;
                return;
            end;
        end;
    elseif l_arrayFormat_1 == "bracket" then
        return function(v46, v47, v48) --[[ Line: 163 ]]
            -- upvalues: v41 (ref), v9 (ref), l_Array_0 (ref)
            v41 = v9("(\\[\\])$"):exec(v46);
            v46 = v46:gsub("%[%]$", "");
            if not v41 then
                v48[v46] = v47;
                return;
            elseif v48[v46] == nil then
                v48[v46] = {
                    v47
                };
                return;
            else
                v48[v46] = l_Array_0.concat({}, v48[v46], v47);
                return;
            end;
        end;
    elseif l_arrayFormat_1 == "comma" or l_arrayFormat_1 == "separator" then
        return function(v49, v50, v51) --[[ Line: 180 ]]
            -- upvalues: v40 (copy), l_Array_0 (ref), v20 (ref)
            local v52 = false;
            if type(v50) == "string" then
                v52 = string.find(v50, v40.arrayFormatSeparator, 1, true) ~= nil;
            end;
            local v53 = nil;
            if v52 then
                v53 = l_Array_0.map(v50:split(v40.arrayFormatSeparator), function(v54) --[[ Line: 185 ]]
                    -- upvalues: v20 (ref), v40 (ref)
                    return v20(v54, v40);
                end);
            elseif v50 ~= nil then
                v53 = v20(v50, v40);
            end;
            v51[v49] = v53;
        end;
    else
        return function(v55, v56, v57) --[[ Line: 196 ]]
            -- upvalues: l_Array_0 (ref)
            if v57[v55] == nil then
                v57[v55] = v56;
                return;
            else
                v57[v55] = l_Array_0.concat({}, v57[v55], v56);
                return;
            end;
        end;
    end;
end;
local function _(v59) --[[ Line: 207 ]] --[[ Name: validateArrayFormatSeparator ]]
    if type(v59) ~= "string" or #v59 ~= 1 then
        error("arrayFormatSeparator must be single character string");
    end;
end;
v19 = function(v61, v62) --[[ Line: 213 ]] --[[ Name: encode ]]
    -- upvalues: v16 (copy), v13 (copy)
    if v62.encode then
        if v62.strict then
            return v16(v61);
        else
            return v13(v61);
        end;
    else
        return v61;
    end;
end;
v20 = function(v63, v64) --[[ Line: 225 ]] --[[ Name: decode ]]
    -- upvalues: v17 (copy)
    if v64.decode then
        return v17(v63);
    else
        return v63;
    end;
end;
local function v65(v66) --[[ Line: 233 ]] --[[ Name: keysSorter ]]
    -- upvalues: l_Array_0 (copy), v65 (copy), l_Object_0 (copy)
    if l_Array_0.isArray(v66) then
        return l_Array_0.sort(v66);
    elseif type(v66) == "table" then
        return l_Array_0.map(l_Array_0.sort(v65(l_Object_0.keys(v66)), function(v67, v68) --[[ Line: 239 ]]
            return (tonumber(v67) or (0/0)) - (tonumber(v68) or (0/0));
        end), function(v69) --[[ Line: 242 ]]
            -- upvalues: v66 (copy)
            return v66[v69];
        end);
    else
        return v66;
    end;
end;
local function _(v70) --[[ Line: 251 ]] --[[ Name: removeHash ]]
    local v71 = v70:find("#");
    if v71 ~= nil then
        v70 = v70:sub(1, v71 - 1);
    end;
    return v70;
end;
local function _(v73) --[[ Line: 260 ]] --[[ Name: getHash ]]
    local v74 = "";
    local v75 = v73:find("#");
    if v75 ~= nil then
        v74 = v73:sub(v75);
    end;
    return v74;
end;
local function v80(v77) --[[ Line: 270 ]] --[[ Name: extract ]]
    local l_v77_0 = v77;
    local v79 = l_v77_0:find("#");
    if v79 ~= nil then
        l_v77_0 = l_v77_0:sub(1, v79 - 1);
    end;
    v77 = l_v77_0;
    l_v77_0 = v77:find("?", 1, true);
    if l_v77_0 == nil then
        return "";
    else
        return v77:sub(l_v77_0 + 1);
    end;
end;
local function v83(v81, v82) --[[ Line: 280 ]] --[[ Name: parseValue ]]
    -- upvalues: l_Number_0 (copy), l_String_0 (copy)
    if v82.parseNumbers and not l_Number_0.isNaN(tonumber(v81) or (0/0)) and type(v81) == "string" and l_String_0.trim(v81) ~= "" then
        return tonumber(v81) or (0/0);
    else
        if v82.parseBooleans and v81 ~= nil and (string.lower(v81) == "true" or string.lower(v81) == "false") then
            v81 = string.lower(v81) == "true";
        end;
        return v81;
    end;
end;
local function v100(v84, v85) --[[ Line: 299 ]] --[[ Name: parse ]]
    -- upvalues: l_Object_0 (copy), v58 (copy), l_String_0 (copy), v18 (copy), v20 (ref), v83 (copy), l_Array_0 (copy), l_Boolean_0 (copy), v65 (copy)
    v85 = l_Object_0.assign({
        decode = true, 
        sort = true, 
        arrayFormat = "none", 
        arrayFormatSeparator = ",", 
        parseNumbers = false, 
        parseBooleans = false
    }, v85);
    local l_arrayFormatSeparator_0 = v85.arrayFormatSeparator;
    if type(l_arrayFormatSeparator_0) ~= "string" or #l_arrayFormatSeparator_0 ~= 1 then
        error("arrayFormatSeparator must be single character string");
    end;
    l_arrayFormatSeparator_0 = v58(v85);
    local v87 = {};
    if type(v84) ~= "string" then
        return v87;
    else
        v84 = string.gsub(l_String_0.trim(v84), "^[%?#&]", "");
        if v84 == "" then
            return v87;
        else
            for _, v89 in v84:split("&") do
                local v90 = v18(if v85.decode then string.gsub(v89, "%+", " ") else v89, "=");
                local v91 = v90[1];
                local v92 = v90[2];
                if v92 ~= nil and v85.arrayFormat ~= "comma" then
                    v92 = v20(v92, v85);
                end;
                l_arrayFormatSeparator_0(v20(v91, v85), v92, v87);
            end;
            for v93 in v87 do
                local v94 = v87[v93];
                if type(v94) == "table" then
                    for v95 in v94 do
                        v94[v95] = v83(v94[v95], v85);
                    end;
                else
                    v87[v93] = v83(v94, v85);
                end;
            end;
            if v85.sort == false then
                return v87;
            else
                local v96 = nil;
                v96 = if v85.sort == true then l_Array_0.sort(l_Object_0.keys(v87)) else l_Array_0.sort(l_Object_0.keys(v87), v85.sort);
                return l_Array_0.reduce(v96, function(v97, v98) --[[ Line: 363 ]]
                    -- upvalues: v87 (copy), l_Boolean_0 (ref), l_Array_0 (ref), v65 (ref)
                    local v99 = v87[v98];
                    if l_Boolean_0.toJSBoolean(v99) and type(v99) == "table" and not l_Array_0.isArray(v99) then
                        v97[v98] = v65(v99);
                        return v97;
                    else
                        v97[v98] = v99;
                        return v97;
                    end;
                end, {});
            end;
        end;
    end;
end;
v21.extract = v80;
v21.parse = v100;
v21.stringify = function(v101, v102) --[[ Line: 380 ]] --[[ Name: stringify ]]
    -- upvalues: l_Object_0 (copy), v39 (copy), l_Array_0 (copy), v19 (ref)
    if not v101 then
        return "";
    else
        v102 = l_Object_0.assign({
            encode = true, 
            strict = true, 
            arrayFormat = "none", 
            arrayFormatSeparator = ","
        }, v102);
        local l_arrayFormatSeparator_1 = v102.arrayFormatSeparator;
        if type(l_arrayFormatSeparator_1) ~= "string" or #l_arrayFormatSeparator_1 ~= 1 then
            error("arrayFormatSeparator must be single character string");
        end;
        l_arrayFormatSeparator_1 = v39(v102);
        local v104 = table.clone(v101);
        local v105 = l_Object_0.keys(v104);
        if v102.sort ~= false then
            l_Array_0.sort(v105, v102.sort);
        end;
        return table.concat(l_Array_0.filter(l_Array_0.map(v105, function(v106) --[[ Line: 414 ]]
            -- upvalues: v101 (copy), v19 (ref), v102 (ref), l_Array_0 (ref), l_arrayFormatSeparator_1 (copy)
            local v107 = v101[v106];
            if v107 == nil then
                return v19(v106, v102);
            elseif l_Array_0.isArray(v107) then
                return table.concat(l_Array_0.reduce(v107, l_arrayFormatSeparator_1(v106), {}), "&");
            else
                return v19(v106, v102) + "=" + v19(v107, v102);
            end;
        end), function(v108) --[[ Line: 430 ]]
            return v108.length > 0;
        end), "&");
    end;
end;
v21.parseUrl = function(v109, v110) --[[ Line: 438 ]] --[[ Name: parseUrl ]]
    -- upvalues: v100 (copy)
    local v111 = {};
    local l_v109_0 = v109;
    local v113 = l_v109_0:find("#");
    if v113 ~= nil then
        l_v109_0 = l_v109_0:sub(1, v113 - 1);
    end;
    v111.url = l_v109_0:split("?")[1] or "";
    local l_v100_0 = v100;
    l_v109_0 = v109;
    v113 = l_v109_0:find("#");
    if v113 ~= nil then
        l_v109_0 = l_v109_0:sub(1, v113 - 1);
    end;
    local l_l_v109_0_0 = l_v109_0;
    l_v109_0 = l_l_v109_0_0:find("?", 1, true);
    v111.query = l_v100_0(l_v109_0 == nil and "" or l_l_v109_0_0:sub(l_v109_0 + 1), v110);
    return v111;
end;
v21.stringifyUrl = function(v116, v117) --[[ Line: 445 ]] --[[ Name: stringifyUrl ]]
    -- upvalues: v21 (copy), l_Object_0 (copy)
    local l_url_0 = v116.url;
    local v119 = l_url_0:find("#");
    if v119 ~= nil then
        l_url_0 = l_url_0:sub(1, v119 - 1);
    end;
    local v120 = l_url_0:split("?")[1] or "";
    local v121 = v21.extract(v116.url);
    local v122 = v21.parse(v121);
    v119 = v116.url;
    local v123 = "";
    local v124 = v119:find("#");
    if v124 ~= nil then
        v123 = v119:sub(v124);
    end;
    l_url_0 = v123;
    v119 = l_Object_0.assign(v122, v116.query);
    v123 = v21.stringify(v119, v117);
    if v123 then
        v123 = ("?%s"):format(v123);
    end;
    return ("%s%s%s"):format(v120, v123, l_url_0);
end;
return v21;