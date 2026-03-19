local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperience);
local v4 = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v5 = require(l_CorePackages_0.Packages.Cryo);
return {
    mockAvatarExperienceState = function(v6) --[[ Line: 82 ]] --[[ Name: mockAvatarExperienceState ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy)
        local v7 = {
            AvatarExperience = v3(nil, {}), 
            TopBar = {
                topBarHeight = 0, 
                statusBarHeight = 0
            }, 
            TabBarVisible = false, 
            Navigation = v4(nil, {}), 
            GlobalGuiInset = {
                left = 0, 
                top = 0, 
                right = 0, 
                bottom = 0
            }, 
            ScreenSize = Vector2.new(1000, 1000), 
            FetchingStatus = {}
        };
        local v8 = v6 or {};
        return (v5.Dictionary.join(v7, v8));
    end
};