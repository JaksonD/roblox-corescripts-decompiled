local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.RedirectToAppRouterScreen);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.RedirectToAvatarScreen);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapperScreens);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.withAppRouterParams);
return function(v9) --[[ Line: 31 ]] --[[ Name: buildMainStackConfigTable ]]
    -- upvalues: v7 (copy), v8 (copy), l_AvatarScreen_0 (copy), v3 (copy), v4 (copy), v6 (copy), v2 (copy)
    local v10 = {};
    if not v7[v9] then
        error("Initial route is not supported by AvatarExperienceWrapper: " .. tostring(v9));
    end;
    local v11 = v8(v7[v9]);
    local function _(v12, v13) --[[ Line: 39 ]] --[[ Name: addScreen ]]
        -- upvalues: v10 (copy)
        if not v10[v12] then
            v10[v12] = v13;
        end;
    end;
    local function _(v15) --[[ Line: 45 ]] --[[ Name: removeScreen ]]
        -- upvalues: v10 (copy)
        v10[v15] = nil;
    end;
    for _, v18 in l_AvatarScreen_0 do
        local v19 = v7[v18] ~= nil and v3 or v4;
        if not v10[v18] then
            v10[v18] = v19;
        end;
    end;
    for _, v21 in v6 do
        for v22, _ in v21 do
            v10[v22] = nil;
        end;
    end;
    v10[l_AvatarScreen_0.AvatarExperienceMainStackNavigator] = nil;
    v10[v9] = nil;
    return (v2.List.join({
        {
            [v9] = v11
        }
    }, v2.List.map(v2.Dictionary.keys(v10), function(v24) --[[ Line: 75 ]]
        -- upvalues: v10 (copy)
        return {
            [v24] = v10[v24]
        };
    end)));
end;