local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
l_Logging_0.warn("Lua App Bootcamp Enabled");
local v2 = {};
local v3 = require(script.Parent.Parent.LuaAppIntroBootcamp);
v2.runBootcamp = function(_) --[[ Line: 8 ]] --[[ Name: runBootcamp ]]
    -- upvalues: v3 (copy), l_Logging_0 (copy)
    for _, v6 in ipairs(v3) do
        l_Logging_0.warn(v6);
    end;
end;
return v2;