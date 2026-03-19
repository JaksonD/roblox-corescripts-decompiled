local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local v7 = require(l_Modules_0.LuaApp.Flags.GetFStringDebugDefaultPageOverride);
local v8 = game:DefineFastFlag("LuaAppChartsPreloadingEnabled", false);
local v10 = {
    IsLuaGamesPagePreloadingEnabled = function(_) --[[ Line: 14 ]] --[[ Name: IsLuaGamesPagePreloadingEnabled ]]
        -- upvalues: v8 (copy)
        return v8 or not settings():GetFFlag("LuaAppGamesPagePreloadingDisabled");
    end
};
game:DefineFastInt("LuaAppLoginRollout", 0);
game:DefineFastInt("LuaAppLoginRolloutIos", 0);
v10.LuaAppLoginRolloutEnabledForDevice = function() --[[ Line: 20 ]] --[[ Name: LuaAppLoginRolloutEnabledForDevice ]]
    -- upvalues: l_UserInputService_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    local l_game_FastInt_0 = game:GetFastInt("LuaAppLoginRollout");
    if l_UserInputService_0:GetPlatform() == Enum.Platform.IOS then
        l_game_FastInt_0 = game:GetFastInt("LuaAppLoginRolloutIos");
    end;
    return (tonumber(l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId)) or 99) % 100 < l_game_FastInt_0;
end;
v10.LuaAppLoginUIEnabled = function() --[[ Line: 31 ]] --[[ Name: LuaAppLoginUIEnabled ]]
    -- upvalues: v10 (copy)
    return v10.LuaAppLoginRolloutEnabledForDevice();
end;
game:DefineFastInt("CrossDeviceLoginRollout2", 0);
v10.CrossDeviceLoginRolloutEnabledForDevice = function() --[[ Line: 36 ]] --[[ Name: CrossDeviceLoginRolloutEnabledForDevice ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    return (tonumber(l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId)) or 99) % 100 < game:GetFastInt("CrossDeviceLoginRollout2");
end;
game:DefineFastFlag("LuaAppEnableSinglePageSignUp", false);
v10.SinglePageSignUpEnabled = function() --[[ Line: 42 ]] --[[ Name: SinglePageSignUpEnabled ]]
    -- upvalues: v10 (copy)
    return game:GetFastFlag("LuaAppEnableSinglePageSignUp") or v10.LuaAppLoginRolloutEnabledForDevice();
end;
v10.WeChatLoginEnabled = function() --[[ Line: 46 ]] --[[ Name: WeChatLoginEnabled ]]
    return tonumber(settings():GetFVariable("LuaAppLoginMethod")) == 2;
end;
v10.GetDefaultAppPage = function() --[[ Line: 50 ]] --[[ Name: GetDefaultAppPage ]]
    -- upvalues: v7 (copy), v5 (copy)
    local v12 = v7();
    if #v12 > 0 then
        return v12;
    else
        return v5.Startup;
    end;
end;
v10.GetGamesTabName = function() --[[ Line: 61 ]] --[[ Name: GetGamesTabName ]]
    return "CommonUI.Features.Label.Discover";
end;
v10.LuaAuthEnabledForLuobu = function() --[[ Line: 65 ]] --[[ Name: LuaAuthEnabledForLuobu ]]
    return game:GetEngineFeature("LuobuLuaAuthEnabled");
end;
return v10;