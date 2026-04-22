local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v3 = require(l_CorePackages_0.Packages.React);
local l_ProfileTypes_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes;
local v5 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenVerifiedBadgeModal);
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v12 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore);
local v13 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailsPlayWithFriends);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines);
local v15 = require(l_Modules_0.LuaApp.Thunks.OpenRefundPolicyLearnMorePage);
local v16 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppAddIgrsRatingToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp;
return function(v20) --[[ Line: 27 ]] --[[ Name: useExperienceDetailsNavigation ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v7 (copy), v10 (copy), v12 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v13 (copy), v11 (copy), v9 (copy), v8 (copy), v14 (copy), v15 (copy), l_FFlagLuaAppAddIgrsRatingToEdp_0 (copy), v16 (copy), v5 (copy), l_AppPage_0 (copy), l_ProfileTypes_0 (copy)
    local v21 = l_useDispatch_0();
    return (v3.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v21 (copy), v7 (ref), v10 (ref), v12 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v20 (copy), v13 (ref), v11 (ref), v9 (ref), v8 (ref), v14 (ref), v15 (ref), l_FFlagLuaAppAddIgrsRatingToEdp_0 (ref), v16 (ref), v5 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
        return {
            navigateBack = function() --[[ Line: 31 ]] --[[ Name: navigateBack ]]
                -- upvalues: v21 (ref), v7 (ref)
                return v21(v7());
            end, 
            openLeaveRobloxAlertUIBlox = function(v22) --[[ Line: 34 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
                -- upvalues: v21 (ref), v10 (ref)
                v21(v10(v22));
            end, 
            openMoreContextualMenu = function(v23, v24, v25, v26) --[[ Line: 37 ]] --[[ Name: openMoreContextualMenu ]]
                -- upvalues: v21 (ref), v12 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v20 (ref)
                v21(v12(v23, v24, nil, v25, if l_FFlagHideCloseButtonEdp_0 then v26 else nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v20 else nil));
            end, 
            openShareContextualMenu = function(v27, v28, v29) --[[ Line: 49 ]] --[[ Name: openShareContextualMenu ]]
                -- upvalues: v21 (ref), v13 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v20 (ref)
                v21(v13(v27, v28, if l_FFlagHideCloseButtonEdp_0 then v29 else nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v20 else nil));
            end, 
            closeAlert = function() --[[ Line: 59 ]] --[[ Name: closeAlert ]]
                -- upvalues: v21 (ref), v11 (ref)
                v21(v11());
            end, 
            openVerifiedBadgeModal = function() --[[ Line: 62 ]] --[[ Name: openVerifiedBadgeModal ]]
                -- upvalues: v21 (ref), v9 (ref)
                v21(v9());
            end, 
            openCreatorPage = function(v30) --[[ Line: 65 ]] --[[ Name: openCreatorPage ]]
                -- upvalues: v21 (ref), v8 (ref)
                v21(v8(v30));
            end, 
            openExperienceGuidelinesExplained = function(v31, v32) --[[ Line: 68 ]] --[[ Name: openExperienceGuidelinesExplained ]]
                -- upvalues: v21 (ref), v14 (ref)
                v21(v14(v31, v32));
            end, 
            openRefundPolicyLearnMorePage = function(v33) --[[ Line: 71 ]] --[[ Name: openRefundPolicyLearnMorePage ]]
                -- upvalues: v21 (ref), v15 (ref)
                v21(v15(v33));
            end, 
            openWebview = l_FFlagLuaAppAddIgrsRatingToEdp_0 and function(v34, v35) --[[ Line: 75 ]]
                -- upvalues: v21 (ref), v16 (ref)
                v21(v16(v34, v35));
            end or nil, 
            openCommunityProfilePage = v5.FFlagIsSetupEnabled and function(v36, v37) --[[ Line: 80 ]]
                -- upvalues: v21 (ref), v8 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
                v21(v8({
                    name = l_AppPage_0.ProfilePlatform, 
                    detail = v36, 
                    extraProps = {
                        profileType = l_ProfileTypes_0.Community, 
                        source = v37
                    }
                }));
            end or nil, 
            openUserProfilePage = function(v38, v39) --[[ Line: 91 ]] --[[ Name: openUserProfilePage ]]
                -- upvalues: v21 (ref), v8 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
                v21(v8({
                    name = l_AppPage_0.ProfilePlatform, 
                    detail = v38, 
                    extraProps = {
                        profileType = l_ProfileTypes_0.User, 
                        source = v39
                    }
                }));
            end
        };
    end, {
        v21
    }));
end;