local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_ProfileTypes_0 = v4.ProfileTypes;
local l_EnableCommunityProfilePageIXP_0 = v4.EnableCommunityProfilePageIXP;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenVerifiedBadgeModal);
local v11 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v12 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v13 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailsPlayWithFriends);
local v15 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines);
local v16 = require(l_Modules_0.LuaApp.Thunks.OpenRefundPolicyLearnMorePage);
local v17 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppAddIgrsRatingToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp;
return function(v21) --[[ Line: 27 ]] --[[ Name: useExperienceDetailsNavigation ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v8 (copy), v11 (copy), v13 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v14 (copy), v12 (copy), v10 (copy), v9 (copy), v15 (copy), v16 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v17 (copy), l_EnableCommunityProfilePageIXP_0 (copy), l_AppPage_0 (copy), l_ProfileTypes_0 (copy)
    local v22 = l_useDispatch_0();
    return (v3.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v22 (copy), v8 (ref), v11 (ref), v13 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v21 (copy), v14 (ref), v12 (ref), v10 (ref), v9 (ref), v15 (ref), v16 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v17 (ref), l_EnableCommunityProfilePageIXP_0 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
        return {
            navigateBack = function() --[[ Line: 31 ]] --[[ Name: navigateBack ]]
                -- upvalues: v22 (ref), v8 (ref)
                return v22(v8());
            end, 
            openLeaveRobloxAlertUIBlox = function(v23) --[[ Line: 34 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
                -- upvalues: v22 (ref), v11 (ref)
                v22(v11(v23));
            end, 
            openMoreContextualMenu = function(v24, v25, v26, v27) --[[ Line: 37 ]] --[[ Name: openMoreContextualMenu ]]
                -- upvalues: v22 (ref), v13 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v21 (ref)
                v22(v13(v24, v25, nil, v26, if l_FFlagHideCloseButtonEdp_0 then v27 else nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v21 else nil));
            end, 
            openShareContextualMenu = function(v28, v29, v30) --[[ Line: 49 ]] --[[ Name: openShareContextualMenu ]]
                -- upvalues: v22 (ref), v14 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v21 (ref)
                v22(v14(v28, v29, if l_FFlagHideCloseButtonEdp_0 then v30 else nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v21 else nil));
            end, 
            closeAlert = function() --[[ Line: 59 ]] --[[ Name: closeAlert ]]
                -- upvalues: v22 (ref), v12 (ref)
                v22(v12());
            end, 
            openVerifiedBadgeModal = function() --[[ Line: 62 ]] --[[ Name: openVerifiedBadgeModal ]]
                -- upvalues: v22 (ref), v10 (ref)
                v22(v10());
            end, 
            openCreatorPage = function(v31) --[[ Line: 65 ]] --[[ Name: openCreatorPage ]]
                -- upvalues: v22 (ref), v9 (ref)
                v22(v9(v31));
            end, 
            openExperienceGuidelinesExplained = function(v32, v33) --[[ Line: 68 ]] --[[ Name: openExperienceGuidelinesExplained ]]
                -- upvalues: v22 (ref), v15 (ref)
                v22(v15(v32, v33));
            end, 
            openRefundPolicyLearnMorePage = function(v34) --[[ Line: 71 ]] --[[ Name: openRefundPolicyLearnMorePage ]]
                -- upvalues: v22 (ref), v16 (ref)
                v22(v16(v34));
            end, 
            openWebview = l_FFlagLuaAppAddIgrsRatingToEdp_0 and function(v35, v36) --[[ Line: 75 ]]
                -- upvalues: v22 (ref), v17 (ref)
                v22(v17(v35, v36));
            end or nil, 
            openCommunityProfilePage = l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and function(v37, v38) --[[ Line: 80 ]]
                -- upvalues: v22 (ref), v9 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
                v22(v9({
                    name = l_AppPage_0.ProfilePlatform, 
                    detail = v37, 
                    extraProps = {
                        profileType = l_ProfileTypes_0.Community, 
                        source = v38
                    }
                }));
            end or nil, 
            openUserProfilePage = function(v39, v40) --[[ Line: 91 ]] --[[ Name: openUserProfilePage ]]
                -- upvalues: v22 (ref), v9 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
                v22(v9({
                    name = l_AppPage_0.ProfilePlatform, 
                    detail = v39, 
                    extraProps = {
                        profileType = l_ProfileTypes_0.User, 
                        source = v40
                    }
                }));
            end
        };
    end, {
        v22
    }));
end;