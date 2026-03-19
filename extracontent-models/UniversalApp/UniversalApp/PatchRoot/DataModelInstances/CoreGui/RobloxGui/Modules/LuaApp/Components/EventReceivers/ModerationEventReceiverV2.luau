local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v11 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local l_FFlagEnableNapDedicatedPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableNapDedicatedPage;
local l_SetModerationStatus_0 = require(l_CorePackages_0.Workspace.Packages.NotApprovedPageState).SetModerationStatus;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.NotApprovedPageState).Constants;
return function() --[[ Line: 41 ]] --[[ Name: ModerationEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v1 (copy), l_Constants_0 (copy), v4 (copy), l_mutedError_0 (copy), l_SetModerationStatus_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v10 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), v11 (copy), l_AppPage_0 (copy)
    local v15 = l_useDispatch_0();
    local v17 = l_useSelector_0(function(v16) --[[ Line: 43 ]]
        return v16.Moderation;
    end);
    v1.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v17 (copy), l_Constants_0 (ref), v4 (ref), l_mutedError_0 (ref), v15 (copy), l_SetModerationStatus_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v10 (ref), l_FFlagEnableNapDedicatedPage_0 (ref), v11 (ref), l_AppPage_0 (ref)
        if not v17 or not v17.userModerated or not v17.moderationDetail then
            return;
        else
            local l_moderationDetail_0 = v17.moderationDetail;
            local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
            local v20 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP[l_punishmentTypeDescription_0];
            v4.isNotNil(v20, "interventionType should not be nil");
            if v20 == nil then
                l_mutedError_0("ModerationEventReceiver Got Invalid Moderation Type: `" .. tostring(l_punishmentTypeDescription_0) .. "`");
                v20 = l_Constants_0.INTERVENTION_TYPES.None;
            end;
            if v20 == l_Constants_0.INTERVENTION_TYPES.None then
                v15(l_SetModerationStatus_0(false));
                return;
            elseif l_moderationDetail_0.selfServiceDeactivated == true then
                v15(l_SetCentralOverlay_0(l_CentralOverlayType_0.AccountReactivationPrompt, {
                    moderationDetail = l_moderationDetail_0, 
                    interventionType = v20, 
                    LogoutThunk = v10
                }));
                return;
            elseif l_FFlagEnableNapDedicatedPage_0 then
                v15(v11({
                    {
                        name = l_AppPage_0.NotApprovedPage, 
                        extraProps = {
                            moderationDetail = l_moderationDetail_0, 
                            interventionType = v20, 
                            LogoutThunk = v10
                        }
                    }
                }));
                return;
            else
                v15(l_SetCentralOverlay_0(l_CentralOverlayType_0.NotApprovedPage, {
                    moderationDetail = l_moderationDetail_0, 
                    interventionType = v20, 
                    LogoutThunk = v10
                }));
                return;
            end;
        end;
    end, {
        v17
    });
    return nil;
end;