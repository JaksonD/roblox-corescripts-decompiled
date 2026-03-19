local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Dash);
local l_useDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceType;
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
local v7 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsPeekView);
local v8 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsContainer);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppSduiEdpEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpEnabled;
local l_FFlagLuaAppSduiEdpLogExposure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpLogExposure;
local l_FStringLuaAppSduiEdpIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringLuaAppSduiEdpIxpLayer;
local _ = require(l_CorePackages_0.Workspace.Packages.SduiSharedUtilities);
local function v17(v16) --[[ Line: 53 ]] --[[ Name: renderGameDetailsPeekView ]]
    -- upvalues: v3 (copy), v7 (copy)
    return v3.createElement(v7, v16);
end;
local function v19(v18) --[[ Line: 57 ]] --[[ Name: renderExperienceDetailsPage ]]
    -- upvalues: v3 (copy), v8 (copy)
    return v3.createElement(v8, v18);
end;
return function(v20) --[[ Line: 61 ]] --[[ Name: ExperienceDetailsSelector ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), v4 (copy), l_FFlagLuaAppSduiEdpLogExposure_0 (copy), v3 (copy), l_IXPService_0 (copy), l_FStringLuaAppSduiEdpIxpLayer_0 (copy), l_useDeviceType_0 (copy), l_DeviceType_0 (copy), l_FFlagLuaAppSduiEdpEnabled_0 (copy), l_CorePackages_0 (copy), v17 (copy), v19 (copy)
    local v23 = l_useNavigationProps_0(function(v21, v22) --[[ Line: 62 ]]
        -- upvalues: l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref)
        if v21 ~= nil then
            return {
                universeId = v21, 
                source = v22.source, 
                index = v22.index, 
                onClose = v22.onClose, 
                mountAsFullView = v22.mountAsFullView, 
                mountAnimation = v22.mountAnimation, 
                referralSource = v22.referralSource, 
                onPeekViewClosed = v22.onPeekViewClosed, 
                showBackButton = v22.showBackButton, 
                experienceJoinData = v22.experienceJoinData, 
                placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v22.placeIdOverride else nil
            };
        else
            return nil;
        end;
    end);
    v20 = v4.join(v20, v23);
    if l_FFlagLuaAppSduiEdpLogExposure_0 then
        v3.useEffect(function() --[[ Line: 83 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringLuaAppSduiEdpIxpLayer_0 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppSduiEdpIxpLayer_0);
        end, {});
    end;
    local v24 = if v20.deviceType then v20.deviceType else l_useDeviceType_0();
    if v24 == l_DeviceType_0.Phone then
        if l_FFlagLuaAppSduiEdpEnabled_0 then
            local l_ExperienceDetailsPeekView_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).ExperienceDetailsPeekView;
            return v3.createElement(l_ExperienceDetailsPeekView_0, v20);
        else
            return v17(v20);
        end;
    else
        local v26 = v4.join(v20, {
            deviceType = v24
        });
        if l_FFlagLuaAppSduiEdpEnabled_0 then
            local l_ExperienceDetailsFullPage_0 = require(l_CorePackages_0.Workspace.Packages.GameDetail).ExperienceDetailsFullPage;
            return v3.createElement(l_ExperienceDetailsFullPage_0, v26);
        else
            return v19(v26);
        end;
    end;
end;