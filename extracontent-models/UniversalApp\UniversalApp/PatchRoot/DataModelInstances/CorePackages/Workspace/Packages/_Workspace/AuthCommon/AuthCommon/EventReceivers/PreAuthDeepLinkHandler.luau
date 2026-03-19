local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Thunks.User);
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local v4 = require(script.Parent.PreAuthDeepLinkMap);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePreAuthDeepLinkHandler);
local function v14(v6) --[[ Line: 50 ]] --[[ Name: parseQueryParams ]]
    local v7 = {};
    local _, v9 = string.find(v6, "?");
    if not v9 then
        return v7;
    else
        local v10 = string.sub(v6, v9 + 1);
        for v11 in string.gmatch(v10, "[^&]+") do
            local v12, v13 = string.match(v11, "([^=]+)=?(.*)");
            if v12 then
                v7[string.lower(v12)] = v13 or "";
            end;
        end;
        return v7;
    end;
end;
local function _(v15, v16) --[[ Line: 70 ]] --[[ Name: matchesPattern ]]
    return string.match(v16, v15) ~= nil;
end;
local function _() --[[ Line: 74 ]] --[[ Name: userIsAuthenticated ]]
    -- upvalues: v2 (copy)
    return v2.fromLocalStorage().userId ~= -1;
end;
local function v24(v19) --[[ Line: 78 ]] --[[ Name: isPreauthDeeplink ]]
    -- upvalues: v4 (copy)
    if not v19 or v19 == "" then
        return false;
    else
        local v20 = string.lower(v19);
        for _, v22 in ipairs(v4) do
            local l_regexPattern_0 = v22.regexPattern;
            if string.match(v20, l_regexPattern_0) ~= nil then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v33(v25, v26) --[[ Line: 94 ]] --[[ Name: firePreauthDeeplink ]]
    -- upvalues: v2 (copy), v4 (copy), v14 (copy)
    if not v25 or v25 == "" then
        return nil;
    else
        local v27 = string.lower(v25);
        local v28 = v2.fromLocalStorage().userId ~= -1;
        for _, v30 in ipairs(v4) do
            local l_regexPattern_1 = v30.regexPattern;
            if string.match(v27, l_regexPattern_1) ~= nil then
                if v30.preauthOnly and v28 then
                    return nil;
                else
                    local v32 = v14(v25);
                    return v30.handler(v32, v26);
                end;
            end;
        end;
        return nil;
    end;
end;
local function v37() --[[ Line: 117 ]] --[[ Name: registerPatterns ]]
    -- upvalues: v4 (copy), l_default_0 (copy)
    for _, v35 in ipairs(v4) do
        local v36 = v35.regexPattern:gsub("%%", "\\");
        l_default_0:registerURL(v36);
    end;
end;
if v5 then
    v37();
end;
return {
    isPreauthDeeplink = v24, 
    firePreauthDeeplink = v33
};