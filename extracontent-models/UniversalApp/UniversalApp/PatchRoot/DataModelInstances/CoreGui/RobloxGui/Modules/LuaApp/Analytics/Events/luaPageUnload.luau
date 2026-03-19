local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames);
local _ = function(v6) --[[ Line: 11 ]]
    -- upvalues: v5 (copy)
    local v7 = v5();
    if v7 and #v7 > 0 then
        for _, v9 in string.split(v7, ",") do
            if v9 == v6 then
                return true;
            end;
        end;
    end;
    return false;
end;
return function(v11, v12, v13, v14, v15) --[[ Line: 23 ]]
    -- upvalues: v3 (copy), v5 (copy), l_LocalizationService_0 (copy), v4 (copy)
    local v16 = false;
    v3.isType(v12, "string", "eventContext");
    v3.isType(v13, "string", "name");
    local v17 = v5();
    local v18;
    if v17 and #v17 > 0 then
        for _, v20 in string.split(v17, ",") do
            if v20 == v13 then
                v18 = true;
                v16 = true;
            end;
            if v16 then
                break;
            end;
        end;
    end;
    if not v16 then
        v18 = false;
    end;
    v16 = false;
    if v18 then
        if v14 ~= nil then
            if type(v14) == "number" then
                v14 = tostring(v14);
            end;
            if type(v14) ~= "string" then
                v14 = nil;
            end;
        end;
        v18 = l_LocalizationService_0.RobloxLocaleId;
        v17 = {
            page = v13, 
            detail = v14, 
            locale = v18
        };
        if v15 then
            v17 = v4.Dictionary.join(v17, v15);
        end;
        v11:setRBXEventStream(v12, "luaPageUnload", v17);
    end;
end;