local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Dash);
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
local v6 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsPeekView);
local v7 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsContainer);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local function v11(v10) --[[ Line: 41 ]] --[[ Name: renderGameDetailsPeekView ]]
    -- upvalues: v2 (copy), v6 (copy)
    return v2.createElement(v6, v10);
end;
local function v13(v12) --[[ Line: 45 ]] --[[ Name: renderExperienceDetailsPage ]]
    -- upvalues: v2 (copy), v7 (copy)
    return v2.createElement(v7, v12);
end;
return function(v14) --[[ Line: 49 ]] --[[ Name: ExperienceDetailsSelector ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), v3 (copy), l_useDeviceType_0 (copy), l_DeviceType_0 (copy), v11 (copy), v13 (copy)
    local v17 = l_useNavigationProps_0(function(v15, v16) --[[ Line: 50 ]]
        -- upvalues: l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        if v15 ~= nil then
            return {
                universeId = v15, 
                source = v16.source, 
                index = v16.index, 
                onClose = v16.onClose, 
                mountAsFullView = v16.mountAsFullView, 
                mountAnimation = v16.mountAnimation, 
                referralSource = v16.referralSource, 
                onPeekViewClosed = v16.onPeekViewClosed, 
                showBackButton = v16.showBackButton, 
                experienceJoinData = v16.experienceJoinData, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v16.placeIdOverride else nil
            };
        else
            return nil;
        end;
    end);
    v14 = v3.join(v14, v17);
    local v18 = if v14.deviceType then v14.deviceType else l_useDeviceType_0();
    if v18 == l_DeviceType_0.Phone then
        return v11(v14);
    else
        local v19 = v3.join(v14, {
            deviceType = v18
        });
        return v13(v19);
    end;
end;