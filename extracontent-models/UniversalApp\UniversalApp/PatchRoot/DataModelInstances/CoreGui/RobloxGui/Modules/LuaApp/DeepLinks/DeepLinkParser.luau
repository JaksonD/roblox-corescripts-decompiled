local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.StringUtilities.ParseQuery);
local v4 = require(script.Parent.PreserveCasePaths);
local function v8(v5, v6) --[[ Line: 11 ]] --[[ Name: matchPath ]]
    local v7 = {
        string.find(v6, v5)
    };
    if #v7 > 0 then
        table.remove(v7, 1);
        table.remove(v7, 1);
        return v7;
    else
        return nil;
    end;
end;
local function v18(v9, v10) --[[ Line: 23 ]] --[[ Name: findMatch ]]
    -- upvalues: v8 (copy)
    local l_ipairs_0 = ipairs;
    local v12 = v10 or {};
    for _, v14 in l_ipairs_0(v12) do
        local v15, v16 = unpack(v14);
        local v17 = v8(v15, v9);
        if v17 then
            return v16, v17;
        end;
    end;
    return nil;
end;
local function v20(v19) --[[ Line: 35 ]] --[[ Name: defaultListKeyMapper ]]
    return v19 .. "[]";
end;
local function v29(v21, v22, v23, v24) --[[ Line: 39 ]] --[[ Name: resolveUrl ]]
    -- upvalues: v1 (copy), v18 (copy), v3 (copy)
    v1.isType(v24, "string", "url");
    local v25, v26 = unpack(string.split(v24, "?"));
    local v27, v28 = v18(v25, v22);
    if type(v27) == "function" then
        table.insert(v28, (v3(v26, v23)));
        table.insert(v28, v21);
        return v27(unpack(v28));
    else
        warn("DeepLinkParser: URL not supported: " .. v25);
        return {};
    end;
end;
preserveCase = function(v30) --[[ Line: 54 ]] --[[ Name: preserveCase ]]
    -- upvalues: v4 (copy)
    local v31, _ = unpack(string.split(v30, "?"));
    for _, v34 in pairs(v4) do
        if v31 == v34 then
            return true;
        end;
    end;
    return false;
end;
local v35 = {};
v35.__index = v35;
v35.new = function(v36, v37) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy), v35 (copy)
    local v38 = {
        mappings = v36 or {}, 
        keymapper = v37 or v20
    };
    setmetatable(v38, v35);
    return v38;
end;
v35.resolve = function(v39, v40, v41) --[[ Line: 76 ]] --[[ Name: resolve ]]
    -- upvalues: v29 (copy)
    if not preserveCase(v40) then
        v40 = string.lower(v40);
    end;
    return v29(v41, v39.mappings, v39.keymapper, v40);
end;
v35.matches = function(v42, v43) --[[ Line: 83 ]] --[[ Name: matches ]]
    -- upvalues: v18 (copy)
    v43 = string.lower(v43);
    local v44 = unpack(string.split(v43, "?"));
    return type((v18(v44, v42.mappings))) == "function";
end;
return v35;