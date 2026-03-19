local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Models.UserModerationApi.RestrictionSource);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v9 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v10 = require(l_Modules_0.LuaApp.Thunks.Moderation.ApiFetchAccessStatus);
local v11 = require(l_Modules_0.LuaApp.Util.ChallengeError);
return function() --[[ Line: 32 ]] --[[ Name: AccountLockEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v1 (copy), v7 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    local v12 = l_useDispatch_0();
    local v14 = l_useSelector_0(function(v13) --[[ Line: 34 ]]
        return v13.UserAccess;
    end);
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v14 (copy), v7 (ref), v12 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (ref)
        if not v14 or not v14.restrictionDetail or v14.restrictionDetail.source ~= v7.AccountLock then
            return;
        else
            v12(l_SetCentralOverlay_0(l_CentralOverlayType_0.AccountLockModal, {
                Logout = v8, 
                ResetNavigationHistory = v9, 
                ApiFetchAccessStatus = v10, 
                ChallengeError = v11
            }));
            return;
        end;
    end, {
        v14
    });
    return nil;
end;