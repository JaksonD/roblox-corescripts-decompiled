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
local v12 = require(l_Modules_0.AvatarExperience.Common.Thunks.StoreAndClearTryOns);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonStatus);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonErrorOccurred);
local v15 = require(l_Modules_0.LuaApp.mutedError);
local v16 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v17 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local v20 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_getCameraOptIn_0 = require(l_CorePackages_0.Workspace.Packages.CameraOptIn).getCameraOptIn;
local v22 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v23 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v24 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.transition");
local v25 = {
    toastMessage = "Feature.FaceChat.Subtitle.FeatureDisabled", 
    isLocalized = false, 
    toastType = v16.InformationMessage
};
local v26 = nil;
return function(_) --[[ Line: 54 ]] --[[ Name: AvatarExperienceTransitionManager ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v9 (copy), l_getUseSelectorDeepEquals_0 (copy), l_usePrevious_0 (copy), l_useAvatarRoute_0 (copy), v8 (copy), v20 (copy), v22 (copy), v23 (copy), v24 (copy), l_AvatarScreenProperties_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v12 (copy), v11 (copy), l_getCameraOptIn_0 (copy), v26 (ref), l_FaceAnimatorService_0 (copy), v13 (copy), v14 (copy), v17 (copy), v25 (copy), v15 (copy), v3 (copy)
    local v28 = l_useDispatch_0();
    local v29 = l_useSelector_0(v9.isAvatarExperienceRoute, l_getUseSelectorDeepEquals_0());
    local v30 = l_usePrevious_0(v29);
    local v31 = l_useAvatarRoute_0();
    local v32 = l_usePrevious_0(v31);
    local v33 = v8(v20);
    local v34 = v22.useTestVariables(v23.EnabledForUser);
    local function v37() --[[ Line: 64 ]] --[[ Name: onLeaveAvatarExperience ]]
        -- upvalues: v24 (ref), v32 (copy), l_AvatarScreenProperties_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v28 (copy), v12 (ref), v11 (ref)
        v24:debug("Leaving AvatarExperience");
        local v35 = if v32 then v32.opaque.name else nil;
        local v36 = v35 and l_AvatarScreenProperties_0[v35] and l_AvatarScreenProperties_0[v35].isMultiTryOn;
        if not l_FFlagAXMISEnableMultiShopping_0 and v36 then
            v28(v12());
        end;
        v28(v11());
    end;
    local function _() --[[ Line: 77 ]] --[[ Name: onEnterAvatarExperience ]]
        -- upvalues: v24 (ref)
        v24:debug("Entering AvatarExperience");
    end;
    local function v41() --[[ Line: 81 ]] --[[ Name: handleTransitions ]]
        -- upvalues: v30 (copy), v29 (copy), v37 (copy), v34 (copy), v9 (ref), l_getCameraOptIn_0 (ref), v33 (copy), v26 (ref), l_FaceAnimatorService_0 (ref), v28 (copy), v13 (ref), v14 (ref), v17 (ref), v25 (ref), v15 (ref), v24 (ref)
        if v30 and not v29 then
            v37();
            return;
        else
            if v29 and not v30 then
                if v34 and v9.isUserCameraEligible() then
                    l_getCameraOptIn_0(v33, true):andThen(function(v39) --[[ Line: 88 ]]
                        -- upvalues: v26 (ref), l_FaceAnimatorService_0 (ref), v28 (ref), v13 (ref), v14 (ref), v17 (ref), v25 (ref), v15 (ref)
                        if v26 ~= v39 then
                            l_FaceAnimatorService_0:Init(v39, false);
                            l_FaceAnimatorService_0.TrackerError:Connect(function(v40) --[[ Line: 92 ]]
                                -- upvalues: v28 (ref), v13 (ref), v14 (ref), v17 (ref), v25 (ref), v15 (ref)
                                v28(v13(false));
                                v28(v14(true));
                                v28(v17(v25));
                                v15(string.format("Universal App Camera FaceAnimatorService TrackerError: %s", (tostring(v40))));
                            end);
                            v26 = v39;
                        end;
                    end);
                end;
                v24:debug("Entering AvatarExperience");
            end;
            return;
        end;
    end;
    v3.useEffect(v41, {
        v29, 
        v30, 
        v32
    });
    return nil;
end;