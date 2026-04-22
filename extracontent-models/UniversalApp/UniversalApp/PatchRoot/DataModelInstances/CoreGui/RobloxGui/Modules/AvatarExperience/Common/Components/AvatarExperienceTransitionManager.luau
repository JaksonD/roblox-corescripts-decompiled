local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ResetSortAndFiltersThunk);
local v13 = require(l_Modules_0.AvatarExperience.Common.Thunks.StoreAndClearTryOns);
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_SetCameraButtonStatus_0 = v14.Actions.SetCameraButtonStatus;
local l_SetCameraButtonErrorOccurred_0 = v14.Actions.SetCameraButtonErrorOccurred;
local v17 = require(l_Modules_0.LuaApp.mutedError);
local v18 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v19 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_getCameraOptIn_0 = require(l_CorePackages_0.Workspace.Packages.CameraOptIn).getCameraOptIn;
local v24 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v25 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v26 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXResetAnalyticsMetadataOnFilterReset);
local v27 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.transition");
local v28 = {
    toastMessage = "Feature.FaceChat.Subtitle.FeatureDisabled", 
    isLocalized = false, 
    toastType = v18.InformationMessage
};
local v29 = nil;
return function(_) --[[ Line: 58 ]] --[[ Name: AvatarExperienceTransitionManager ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v9 (copy), l_getUseSelectorDeepEquals_0 (copy), l_usePrevious_0 (copy), l_useAvatarRoute_0 (copy), v8 (copy), v22 (copy), v24 (copy), v25 (copy), v27 (copy), l_AvatarScreenProperties_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v13 (copy), v26 (copy), v12 (copy), v11 (copy), l_getCameraOptIn_0 (copy), v29 (ref), l_FaceAnimatorService_0 (copy), l_SetCameraButtonStatus_0 (copy), l_SetCameraButtonErrorOccurred_0 (copy), v19 (copy), v28 (copy), v17 (copy), v3 (copy)
    local v31 = l_useDispatch_0();
    local v32 = l_useSelector_0(v9.isAvatarExperienceRoute, l_getUseSelectorDeepEquals_0());
    local v33 = l_usePrevious_0(v32);
    local v34 = l_useAvatarRoute_0();
    local v35 = l_usePrevious_0(v34);
    local v36 = v8(v22);
    local v37 = v24.useTestVariables(v25.EnabledForUser);
    local function v40() --[[ Line: 68 ]] --[[ Name: onLeaveAvatarExperience ]]
        -- upvalues: v27 (ref), v35 (copy), l_AvatarScreenProperties_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v31 (copy), v13 (ref), v26 (ref), v12 (ref), v11 (ref)
        v27:debug("Leaving AvatarExperience");
        local v38 = if v35 then v35.opaque.name else nil;
        local v39 = v38 and l_AvatarScreenProperties_0[v38] and l_AvatarScreenProperties_0[v38].isMultiTryOn;
        if not l_FFlagAXMISEnableMultiShopping_0 and v39 then
            v31(v13());
        end;
        if v26 then
            v31(v12());
            return;
        else
            v31(v11());
            return;
        end;
    end;
    local function _() --[[ Line: 85 ]] --[[ Name: onEnterAvatarExperience ]]
        -- upvalues: v27 (ref)
        v27:debug("Entering AvatarExperience");
    end;
    local function v44() --[[ Line: 89 ]] --[[ Name: handleTransitions ]]
        -- upvalues: v33 (copy), v32 (copy), v40 (copy), v37 (copy), v9 (ref), l_getCameraOptIn_0 (ref), v36 (copy), v29 (ref), l_FaceAnimatorService_0 (ref), v31 (copy), l_SetCameraButtonStatus_0 (ref), l_SetCameraButtonErrorOccurred_0 (ref), v19 (ref), v28 (ref), v17 (ref), v27 (ref)
        if v33 and not v32 then
            v40();
            return;
        else
            if v32 and not v33 then
                if v37 and v9.isUserCameraEligible() then
                    l_getCameraOptIn_0(v36, true):andThen(function(v42) --[[ Line: 96 ]]
                        -- upvalues: v29 (ref), l_FaceAnimatorService_0 (ref), v31 (ref), l_SetCameraButtonStatus_0 (ref), l_SetCameraButtonErrorOccurred_0 (ref), v19 (ref), v28 (ref), v17 (ref)
                        if v29 ~= v42 then
                            l_FaceAnimatorService_0:Init(v42, false);
                            l_FaceAnimatorService_0.TrackerError:Connect(function(v43) --[[ Line: 100 ]]
                                -- upvalues: v31 (ref), l_SetCameraButtonStatus_0 (ref), l_SetCameraButtonErrorOccurred_0 (ref), v19 (ref), v28 (ref), v17 (ref)
                                v31(l_SetCameraButtonStatus_0(false));
                                v31(l_SetCameraButtonErrorOccurred_0(true));
                                v31(v19(v28));
                                v17(string.format("Universal App Camera FaceAnimatorService TrackerError: %s", (tostring(v43))));
                            end);
                            v29 = v42;
                        end;
                    end);
                end;
                v27:debug("Entering AvatarExperience");
            end;
            return;
        end;
    end;
    v3.useEffect(v44, {
        v32, 
        v33, 
        v35
    });
    return nil;
end;