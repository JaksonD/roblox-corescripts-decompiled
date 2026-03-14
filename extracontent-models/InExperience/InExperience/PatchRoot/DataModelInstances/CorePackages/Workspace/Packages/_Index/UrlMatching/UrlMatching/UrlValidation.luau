local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.Regex);
local v3 = require(l_Parent_0.RegExp);
local v4 = require(l_Parent_0.StringUtilities);
local l_StringSplit_0 = v4.StringSplit;
local l_StringTrim_0 = v4.StringTrim;
local l_ParseQuery_0 = v4.ParseQuery;
local _ = require(script.Parent.Types);
local function v13(v9, v10) --[[ Line: 19 ]] --[[ Name: filterParams ]]
    -- upvalues: v1 (copy)
    return v1.List.filter(v9, function(v11) --[[ Line: 20 ]]
        -- upvalues: v10 (copy)
        local v12 = true;
        if v11.optional ~= v10 then
            v12 = not v10 and v11.optional == nil;
        end;
        return v12;
    end);
end;
local function _(v14) --[[ Line: 25 ]] --[[ Name: requiredParams ]]
    -- upvalues: v13 (copy)
    return v13(v14, false);
end;
local function _(v16) --[[ Line: 29 ]] --[[ Name: optionalParams ]]
    -- upvalues: v13 (copy)
    return v13(v16, true);
end;
local function _(v18) --[[ Line: 33 ]] --[[ Name: mapValidToArgName ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v19) --[[ Line: 34 ]]
        -- upvalues: v2 (ref), v18 (copy), v3 (ref)
        local v20 = v2.matchWhole(v2.oneOrMore(v19.pattern));
        local v21 = v18[v19.name];
        if v21 ~= nil and v3(v20):exec(v21) then
            return v19.name;
        else
            return nil;
        end;
    end;
end;
local function v44(v23, v24) --[[ Line: 44 ]] --[[ Name: validateParams ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v25 = v23 or {};
    local l_filter_0 = v1.List.filter;
    local l_v24_0 = v24;
    local v28 = false;
    local l_v28_0 = v28 --[[ copy: 6 -> 10 ]];
    l_filter_0 = l_filter_0(l_v24_0, function(v30) --[[ Line: 20 ]]
        -- upvalues: l_v28_0 (copy)
        local v31 = true;
        if v30.optional ~= l_v28_0 then
            v31 = not l_v28_0 and v30.optional == nil;
        end;
        return v31;
    end);
    l_v24_0 = function(v32) --[[ Line: 34 ]]
        -- upvalues: v2 (ref), v25 (copy), v3 (ref)
        local v33 = v2.matchWhole(v2.oneOrMore(v32.pattern));
        local v34 = v25[v32.name];
        if v34 ~= nil and v3(v33):exec(v34) then
            return v32.name;
        else
            return nil;
        end;
    end;
    local v35 = v1.List.filterMap(l_filter_0, l_v24_0);
    if #v35 ~= #l_filter_0 then
        return false, {};
    else
        v28 = v1.List.filter;
        local l_v24_1 = v24;
        local v37 = true;
        local l_v37_0 = v37 --[[ copy: 9 -> 11 ]];
        v28 = v28(l_v24_1, function(v39) --[[ Line: 20 ]]
            -- upvalues: l_v37_0 (copy)
            local v40 = true;
            if v39.optional ~= l_v37_0 then
                v40 = not l_v37_0 and v39.optional == nil;
            end;
            return v40;
        end);
        l_v24_1 = v1.List.filterMap(v28, l_v24_0);
        local v41 = v1.List.join(v35, l_v24_1);
        v37 = v1.List.toSet(v41);
        return true, (v1.Dictionary.filter(v25, function(_, v43) --[[ Line: 59 ]]
            -- upvalues: v37 (copy)
            return v37[v43] ~= nil;
        end));
    end;
end;
local function v55(v45, v46) --[[ Line: 65 ]] --[[ Name: validatePathParams ]]
    -- upvalues: v1 (copy), v44 (copy)
    local v47 = #v45;
    local l_filter_1 = v1.List.filter;
    local l_v46_0 = v46;
    local v50 = false;
    if v47 < #l_filter_1(l_v46_0, function(v51) --[[ Line: 20 ]]
        -- upvalues: v50 (copy)
        local v52 = true;
        if v51.optional ~= v50 then
            v52 = not v50 and v51.optional == nil;
        end;
        return v52;
    end) then
        return false, {};
    else
        v47 = v1.Dictionary.map(v46, function(v53, v54) --[[ Line: 73 ]]
            -- upvalues: v45 (copy)
            return v45[v54], v53.name;
        end);
        return v44(v47, v46);
    end;
end;
local function v66(v56, v57) --[[ Line: 79 ]] --[[ Name: validateUrlParams ]]
    -- upvalues: l_StringTrim_0 (copy), l_StringSplit_0 (copy), l_ParseQuery_0 (copy), v1 (copy), v55 (copy), v44 (copy)
    local v58 = if v56.path then l_StringTrim_0(v56.path, "/") else "";
    local v59 = if v58 ~= "" then l_StringSplit_0(v58, "/") else {};
    local v60 = l_ParseQuery_0(v56.query);
    v60 = v1.Dictionary.map(v60, function(v61) --[[ Line: 84 ]]
        if #v61 == 1 then
            return v61[1];
        else
            return v61;
        end;
    end);
    local v62, v63 = v55(v59, v57.pathParams or {});
    if not v62 then
        return false, {};
    else
        local v64, v65 = v44(v60, v57.queryParams or {});
        if not v64 then
            return false, {};
        else
            return true, v1.Dictionary.union(v63, v65);
        end;
    end;
end;
return {
    validateUrlMatch = function(v67, v68) --[[ Line: 101 ]] --[[ Name: validateUrlMatch ]]
        -- upvalues: v3 (copy), v66 (copy)
        for v69, v70 in v68 do
            if v3(v69, "i"):test(v67.matchedPath) then
                local v71, v72 = v66(v67.url, v70);
                if v71 then
                    return v71, v70.paramCallback(v72);
                end;
            end;
        end;
        return false, nil;
    end, 
    validateUrlParams = v66
};