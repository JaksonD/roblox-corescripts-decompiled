local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugShowAccountSecurityPromptBanner);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptRollout);
return function() --[[ Line: 19 ]] --[[ Name: useShowSecurityBanner ]]
    -- upvalues: v2 (copy), l_useSelector_0 (copy), l_useLocalUserId_0 (copy), v6 (copy), v7 (copy), v5 (copy)
    local v9 = v2.useCallback(function(v8) --[[ Line: 21 ]]
        return v8.AccountSecurityPrompt and v8.AccountSecurityPrompt.promptType;
    end, {});
    local v10 = l_useSelector_0(v9) ~= nil;
    local v11 = l_useLocalUserId_0();
    return v6() and v7(v11) and v10 or v5();
end;