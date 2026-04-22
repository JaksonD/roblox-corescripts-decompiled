local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_View_0 = require(l_CorePackages_0.Packages.Foundation).View;
local v5 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local l_ShareTargetGamePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies;
local v13 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums);
local v14 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.installReducer);
local v15 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Constants);
local l_ProfileTypes_0 = v13.ProfileTypes;
local v17 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.ProfileWrapperContext);
local v18 = require(script.Parent.PlayerProfile);
local function v21(v19) --[[ Line: 29 ]] --[[ Name: createStore ]]
    -- upvalues: v2 (copy), v15 (copy), v14 (copy)
    local v20 = v2.combineReducers({
        [v15.RODUX_KEY] = v14()
    });
    return v2.Store.new(v20, v19 or {}, {
        v2.thunkMiddleware
    });
end;
return function(v22) --[[ Line: 42 ]] --[[ Name: PlayerProfileContainer ]]
    -- upvalues: v1 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_AvatarPolicies_0 (copy), l_SharePolicies_0 (copy), l_ShareTargetGamePolicies_0 (copy), v17 (copy), l_ProfileTypes_0 (copy), v13 (copy), l_CoreScriptsRootProvider_0 (copy), v3 (copy), v21 (copy), v5 (copy), l_View_0 (copy), v18 (copy)
    local v23 = v1.useRef(nil);
    return v1.createElement(l_RoactAppPolicy_0.Provider, {
        policy = {
            l_AppFeaturePolicies_0, 
            l_ChatPolicies_0, 
            l_AvatarPolicies_0, 
            l_SharePolicies_0, 
            l_ShareTargetGamePolicies_0
        }
    }, {
        ProfileWrapperProvider = v1.createElement(v17.Provider, {
            value = {
                profileId = tostring(v22.userId), 
                profileType = l_ProfileTypes_0.User, 
                sourceInfo = {
                    source = v13.Sources.InExperienceProfile, 
                    contextualInfoType = ""
                }, 
                navigateTo = {
                    qRCodePage = function() --[[ Line: 63 ]] --[[ Name: qRCodePage ]]

                    end, 
                    previousView = function(_) --[[ Line: 64 ]] --[[ Name: previousView ]]

                    end, 
                    itemDetails = function(_) --[[ Line: 65 ]] --[[ Name: itemDetails ]]

                    end, 
                    itemOrBundleDetails = function(_, _) --[[ Line: 66 ]] --[[ Name: itemOrBundleDetails ]]

                    end, 
                    catalogSearch = function(_) --[[ Line: 67 ]] --[[ Name: catalogSearch ]]

                    end, 
                    tryOnItem = function(_, _, _, _) --[[ Line: 68 ]] --[[ Name: tryOnItem ]]

                    end, 
                    inspectAvatar = v22.inspectAvatar, 
                    editUsername = function() --[[ Line: 76 ]] --[[ Name: editUsername ]]

                    end, 
                    openLeaveRobloxAlertUIBlox = function(_) --[[ Line: 77 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]

                    end, 
                    closeLeaveRobloxAlert = function() --[[ Line: 78 ]] --[[ Name: closeLeaveRobloxAlert ]]

                    end
                }, 
                externalAnalytics = {
                    catalogAnalytics = {}
                }
            }
        }, {
            CoreScriptsRootProvider = v1.createElement(l_CoreScriptsRootProvider_0, {}, {
                RoduxStore = v1.createElement(v3.StoreProvider, {
                    store = v21()
                }, {
                    ResponsiveProvider = v1.createElement(v5.ContainerRef.Provider, {
                        value = v23
                    }, {
                        PlayerProfileContainer = v1.createElement(l_View_0, {
                            tag = "size-full", 
                            ref = v23
                        }, {
                            PlayerProfile = v1.createElement(v18, {
                                userId = v22.userId, 
                                closePage = v22.closePage
                            })
                        })
                    })
                })
            })
        })
    });
end;