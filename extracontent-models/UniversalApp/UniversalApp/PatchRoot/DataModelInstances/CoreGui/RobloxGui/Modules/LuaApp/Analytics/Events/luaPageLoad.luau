local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v4, v5, v6, v7, v8) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_LocalizationService_0 (copy), v2 (copy)
    v3.isType(v5, "string", "eventContext");
    v3.isType(v6, "string", "name");
    if v7 ~= nil then
        if type(v7) == "number" then
            v7 = tostring(v7);
        end;
        if type(v7) ~= "string" then
            v7 = nil;
        end;
    end;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v10 = {
        page = v6, 
        detail = v7, 
        locale = l_RobloxLocaleId_0
    };
    if v8 ~= nil then
        v10 = v2.Dictionary.join(v10, v8);
    end;
    v4:setRBXEventStream(v5, "luaPageLoad", v10);
end;