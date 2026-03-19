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
local v13 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_ProfileTypes_0 = v13.ProfileTypes;
local l_ProfileWrapperContext_0 = v13.ProfileWrapperContext;
local v16 = require(script.Parent.PlayerProfile);
local function v19(v17) --[[ Line: 27 ]] --[[ Name: createStore ]]
    -- upvalues: v2 (copy), v13 (copy)
    local v18 = v2.combineReducers({
        [v13.RoduxKey] = v13.installReducer()
    });
    return v2.Store.new(v18, v17 or {}, {
        v2.thunkMiddleware
    });
end;
return function(v20) --[[ Line: 40 ]] --[[ Name: PlayerProfileContainer ]]
    -- upvalues: v1 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_AvatarPolicies_0 (copy), l_SharePolicies_0 (copy), l_ShareTargetGamePolicies_0 (copy), l_ProfileWrapperContext_0 (copy), l_ProfileTypes_0 (copy), v13 (copy), l_CoreScriptsRootProvider_0 (copy), v3 (copy), v19 (copy), v5 (copy), l_View_0 (copy), v16 (copy)
    local v21 = v1.useRef(nil);
    return v1.createElement(l_RoactAppPolicy_0.Provider, {
        policy = {
            l_AppFeaturePolicies_0, 
            l_ChatPolicies_0, 
            l_AvatarPolicies_0, 
            l_SharePolicies_0, 
            l_ShareTargetGamePolicies_0
        }
    }, {
        ProfileWrapperProvider = v1.createElement(l_ProfileWrapperContext_0.Provider, {
            value = {
                profileId = tostring(v20.userId), 
                profileType = l_ProfileTypes_0.User, 
                sourceInfo = {
                    source = v13.Sources.InExperienceProfile, 
                    contextualInfoType = ""
                }, 
                navigateTo = {
                    qRCodePage = function() --[[ Line: 61 ]] --[[ Name: qRCodePage ]]

                    end, 
                    previousView = function(_) --[[ Line: 62 ]] --[[ Name: previousView ]]

                    end, 
                    itemDetails = function(_) --[[ Line: 63 ]] --[[ Name: itemDetails ]]

                    end, 
                    itemOrBundleDetails = function(_, _) --[[ Line: 64 ]] --[[ Name: itemOrBundleDetails ]]

                    end, 
                    catalogSearch = function(_) --[[ Line: 65 ]] --[[ Name: catalogSearch ]]

                    end, 
                    tryOnItem = function(_, _, _, _) --[[ Line: 66 ]] --[[ Name: tryOnItem ]]

                    end, 
                    inspectAvatar = v20.inspectAvatar, 
                    editUsername = function() --[[ Line: 74 ]] --[[ Name: editUsername ]]

                    end, 
                    openLeaveRobloxAlertUIBlox = function(_) --[[ Line: 75 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]

                    end, 
                    closeLeaveRobloxAlert = function() --[[ Line: 76 ]] --[[ Name: closeLeaveRobloxAlert ]]

                    end
                }, 
                externalAnalytics = {
                    catalogAnalytics = {}
                }
            }
        }, {
            CoreScriptsRootProvider = v1.createElement(l_CoreScriptsRootProvider_0, {}, {
                RoduxStore = v1.createElement(v3.StoreProvider, {
                    store = v19()
                }, {
                    ResponsiveProvider = v1.createElement(v5.ContainerRef.Provider, {
                        value = v21
                    }, {
                        PlayerProfileContainer = v1.createElement(l_View_0, {
                            tag = "size-full", 
                            ref = v21
                        }, {
                            PlayerProfile = v1.createElement(v16, {
                                userId = v20.userId, 
                                closePage = v20.closePage
                            })
                        })
                    })
                })
            })
        })
    });
end;