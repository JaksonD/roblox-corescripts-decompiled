local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_String_0 = v3.String;
local v7 = require(l_Parent_2.RegExp);
local v8 = require(l_Parent_1.utils.invariant);
local v9 = require(l_Parent_1.NavigationActions);
local v10 = require(l_Parent_0.pathToRegexp);
local l_compile_0 = v10.compile;
local l_pathToRegexp_0 = v10.pathToRegexp;
local v13 = require(l_Parent_0.queryString);
local v14 = require(l_Parent_0:FindFirstChild("ChildIsScreenRouterSymbol.roblox"));
local v15 = require(l_Parent_0:FindFirstChild("NullPathSymbol.roblox"));
local v16 = require(l_Parent_0.decodeURIComponent);
local v28 = {
    getParamsFromPath = function(v17, v18, v19) --[[ Line: 27 ]] --[[ Name: getParamsFromPath ]]
        -- upvalues: l_Array_0 (copy), v16 (copy)
        return (l_Array_0.reduce(l_Array_0.slice(v18, 2), function(v20, v21, v22) --[[ Line: 31 ]]
            -- upvalues: v19 (copy), v16 (ref)
            local v23 = v19[v22];
            if not v23 or v23.pattern == ".*" then
                return v20;
            else
                local l_name_0 = v23.name;
                local v25 = nil;
                if v21 then
                    local l_status_0, l_result_0 = pcall(v16, v21);
                    if l_status_0 then
                        v25 = l_result_0;
                    end;
                end;
                v20[l_name_0] = v25 or v21;
                return v20;
            end;
        end, table.clone(v17)));
    end
};
local function _(v29, v30) --[[ Line: 59 ]] --[[ Name: getRestOfPath ]]
    -- upvalues: l_Array_0 (copy)
    return v29[l_Array_0.findIndex(v30, function(v31) --[[ Line: 62 ]]
        return v31.pattern == ".*";
    end) + 1];
end;
local function v37(v33, v34) --[[ Line: 69 ]] --[[ Name: determineDelimiter ]]
    -- upvalues: l_Array_0 (copy), l_String_0 (copy)
    if l_Array_0.isArray(v34) then
        if #v34 == 1 then
            return v34[1];
        else
            for _, v36 in v34 do
                if l_String_0.startsWith(v33, v36) then
                    return v36;
                end;
            end;
            return nil;
        end;
    else
        return v34;
    end;
end;
v28.urlToPathAndParams = function(v38, v39) --[[ Line: 85 ]] --[[ Name: urlToPathAndParams ]]
    -- upvalues: v7 (copy), v13 (copy), v37 (copy)
    local v40 = v7("^(.*)\\?(.*)$"):exec(v38);
    local v41 = if v40 then v40[2] else v38;
    local v42 = if v40 then v40[3] else {};
    local v43 = v13.parse(v42);
    local v44 = v37(v41, v39);
    if v44 == nil or v44 == "" then
        v44 = "://";
    end;
    local v45 = string.split(v41, v44)[2];
    if v45 == nil then
        v45 = v41;
    end;
    if v45 == "/" then
        v45 = "";
    end;
    if string.sub(v45, -1, -1) == "/" then
        v45 = string.sub(v45, 1, -2);
    end;
    return {
        path = v45, 
        params = v43
    };
end;
v28.createPathParser = function(v46, v47, v48) --[[ Line: 112 ]] --[[ Name: createPathParser ]]
    -- upvalues: v15 (copy), v8 (copy), l_pathToRegexp_0 (copy), l_compile_0 (copy), l_Object_0 (copy), l_Array_0 (copy), v9 (copy), v28 (copy), v14 (copy)
    local v49 = v48.paths or {};
    local l_disableRouteNamePaths_0 = v48.disableRouteNamePaths;
    local v51 = {};
    local v52 = {};
    for v53 in v46 do
        local v54 = nil;
        if v49[v53] ~= nil then
            v54 = v49[v53];
        elseif type(v47[v53]) == "table" then
            v54 = v47[v53].path;
        end;
        if v54 == nil then
            v54 = if l_disableRouteNamePaths_0 then v15 else v53;
        end;
        local l_v8_0 = v8;
        local v56 = true;
        if v54 ~= v15 then
            v56 = type(v54) == "string";
        end;
        l_v8_0(v56, "Route path for %s must be specified as a string, or RoactNavigation.NoPath.", v53);
        l_v8_0 = v54 ~= v15;
        v56 = {};
        local v57 = nil;
        if l_v8_0 then
            v57 = l_pathToRegexp_0(v54, v56);
        end;
        local v58 = {};
        local v59 = true;
        if v54 ~= "" then
            v59 = not l_v8_0;
        end;
        local v60 = l_pathToRegexp_0(v59 and "(.*)" or ("%s/(.*)"):format(v54), v58);
        v51[v53] = {
            exactRe = v57, 
            exactReKeys = v56, 
            extendedPathRe = v60, 
            extendedPathReKeys = v58, 
            isWildcard = v59, 
            toPath = v54 == v15 and function() --[[ Line: 172 ]]
                return "";
            end or l_compile_0(v54)
        };
    end;
    v52 = l_Object_0.entries(v51);
    local function v88(v61, v62) --[[ Line: 180 ]] --[[ Name: getActionForPathAndParams ]]
        -- upvalues: v52 (ref), v46 (copy), l_Array_0 (ref), v9 (ref), v28 (ref)
        if v61 == nil then
            v61 = "";
        end;
        if v62 == nil then
            v62 = {};
        end;
        for _, v64 in v52 do
            local v65 = v64[1];
            local v66 = v64[2];
            local l_exactRe_0 = v66.exactRe;
            local l_exactReKeys_0 = v66.exactReKeys;
            local l_extendedPathRe_0 = v66.extendedPathRe;
            local l_extendedPathReKeys_0 = v66.extendedPathReKeys;
            local v71 = v46[v65];
            local v72 = l_exactRe_0 and l_exactRe_0:exec(v61);
            if v72 and v72.n ~= 0 then
                local v73 = l_extendedPathRe_0 and l_extendedPathRe_0:exec(v61);
                local v74 = nil;
                if v73 and v71 then
                    local v76 = v73[l_Array_0.findIndex(l_extendedPathReKeys_0, function(v75) --[[ Line: 62 ]]
                        return v75.pattern == ".*";
                    end) + 1];
                    v74 = v71.getActionForPathAndParams(v76, v62);
                end;
                return v9.navigate({
                    routeName = v65, 
                    params = v28.getParamsFromPath(v62, v72, l_exactReKeys_0), 
                    action = v74
                });
            end;
        end;
        for _, v78 in v52 do
            local v79 = v78[1];
            local v80 = v78[2];
            local l_extendedPathRe_1 = v80.extendedPathRe;
            local l_extendedPathReKeys_1 = v80.extendedPathReKeys;
            local v83 = v46[v79];
            local v84 = l_extendedPathRe_1 and l_extendedPathRe_1:exec(v61);
            if v84 and v84.n ~= 0 then
                local v86 = v84[l_Array_0.findIndex(l_extendedPathReKeys_1, function(v85) --[[ Line: 62 ]]
                    return v85.pattern == ".*";
                end) + 1];
                local v87 = nil;
                if v83 then
                    v87 = v83.getActionForPathAndParams(v86, v62);
                end;
                if v87 then
                    return v9.navigate({
                        routeName = v79, 
                        params = v28.getParamsFromPath(v62, v84, l_extendedPathReKeys_1), 
                        action = v87
                    });
                end;
            end;
        end;
        return nil;
    end;
    local function v103(v89) --[[ Line: 247 ]] --[[ Name: getPathAndParamsForRoute ]]
        -- upvalues: v46 (copy), v51 (copy), l_Array_0 (ref), l_Object_0 (ref), v14 (ref)
        local l_routeName_0 = v89.routeName;
        local l_params_0 = v89.params;
        local v92 = v46[l_routeName_0];
        local v93 = v51[l_routeName_0];
        local l_toPath_0 = v93.toPath;
        local l_exactReKeys_1 = v93.exactReKeys;
        local v96 = l_toPath_0(l_params_0);
        local v97 = {};
        if l_params_0 then
            for _, v101 in (l_Array_0.filter(l_Object_0.keys(l_params_0), function(v98) --[[ Line: 257 ]]
                -- upvalues: l_Array_0 (ref), l_exactReKeys_1 (copy)
                return not l_Array_0.find(l_exactReKeys_1, function(v99) --[[ Line: 258 ]]
                    -- upvalues: v98 (copy)
                    return v99.name == v98;
                end);
            end)) do
                v97[v101] = l_params_0[v101];
            end;
        end;
        if v92 and v92 ~= v14 then
            local v102 = v92.getPathAndParamsForState(v89);
            return {
                path = if v96 and v96 ~= "" then ("%s/%s"):format(v96, v102.path) else v102.path, 
                params = if v102.params then l_Object_0.assign(v97, v102.params) else v97
            };
        else
            return {
                path = v96, 
                params = v97
            };
        end;
    end;
    return {
        getActionForPathAndParams = v88, 
        getPathAndParamsForRoute = v103
    };
end;
return v28;