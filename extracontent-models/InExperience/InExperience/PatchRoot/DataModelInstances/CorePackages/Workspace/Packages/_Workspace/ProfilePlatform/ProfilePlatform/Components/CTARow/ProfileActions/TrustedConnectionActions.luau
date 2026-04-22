local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_Parent_0.RobloxAppEnums);
local v5 = require(l_Parent_0.DataHydration);
local v6 = require(l_Parent_0.SocialLuaAnalytics);
local l_Images_0 = v2.App.ImageSet.Images;
local l_AppPage_0 = v4.AppPage;
local l_Sources_0 = v6.Analytics.Enums.Sources;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v11 = require(l_script_FirstAncestor_0.Networking.NetworkingFriends);
local v12 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v13 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_FFlagProfilePlatformAddTC_0 = v3.FFlagProfilePlatformAddTC;
local l_FFlagTCShareLinkSenderUI_0 = v3.FFlagTCShareLinkSenderUI;
local l_FFlagTCUnifyNavigationEntry_0 = v3.FFlagTCUnifyNavigationEntry;
local l_FFlagLegacyProfileTCIndicator_0 = v3.FFlagLegacyProfileTCIndicator;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagPendingIncomingTrustedConnection);
local v21 = if l_FFlagLegacyProfileTCIndicator_0 then v5.TrustedConnections.TrustedConnectionsStore.get() else nil;
return {
    [v13.ProfileActions.RemoveTrustedConnection] = function(v22) --[[ Line: 32 ]]
        -- upvalues: v13 (copy), v15 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v21 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v12 (copy), v11 (copy)
        return {
            text = v22.localized[v13.ProfileActions.RemoveTrustedConnection], 
            onActivated = function() --[[ Line: 35 ]] --[[ Name: onActivated ]]
                -- upvalues: v22 (copy), v15 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v21 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v12 (ref), v11 (ref)
                v22.analytics.fireAnalyticsEvent(v15.ContextualMenuButtonRemoveTrustedConnection, {
                    buttonSurface = v22.buttonSurface
                });
                if l_FFlagLegacyProfileTCIndicator_0 then
                    return v21.removeTrustedConnectionRequest(v22.profileId):andThen(function() --[[ Line: 40 ]]
                        -- upvalues: v22 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v12 (ref)
                        v22.dispatch(l_SetCurrentToastMessage_0({
                            toastMessage = v22.localized.trustedConnectionRemovedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                            isLocalized = true
                        }));
                        return v22.dispatch(v12(v22.profileId));
                    end);
                else
                    return v22.dispatch(v11.RemoveTC.API(v22.profileId)):andThen(function() --[[ Line: 49 ]]
                        -- upvalues: v22 (ref), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v12 (ref)
                        v22.dispatch(l_SetCurrentToastMessage_0({
                            toastMessage = v22.localized.trustedConnectionRemovedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                            isLocalized = true
                        }));
                        return v22.dispatch(v12(v22.profileId));
                    end);
                end;
            end
        };
    end, 
    [v13.ProfileActions.AddTrustedConnection] = l_FFlagProfilePlatformAddTC_0 and function(v23) --[[ Line: 63 ]]
        -- upvalues: v13 (copy), v15 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy), l_AppPage_0 (copy), l_Sources_0 (copy), v12 (copy)
        return {
            text = v23.localized[v13.ProfileActions.AddTrustedConnection], 
            onActivated = function() --[[ Line: 66 ]] --[[ Name: onActivated ]]
                -- upvalues: v23 (copy), v15 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), l_AppPage_0 (ref), l_Sources_0 (ref), v12 (ref)
                v23.analytics.fireAnalyticsEvent(v15.ContextualMenuButtonAddTrustedConnection, {
                    buttonSurface = v23.buttonSurface
                });
                if l_FFlagTCUnifyNavigationEntry_0 then
                    v23.navigation.push(l_AppPage_0.TrustedContactsModal, {
                        props = {
                            userId = v23.profileId, 
                            source = l_Sources_0.ProfilePlatform, 
                            onRequestSent = function() --[[ Line: 75 ]] --[[ Name: onRequestSent ]]
                                -- upvalues: v23 (ref), v12 (ref)
                                return v23.dispatch(v12(v23.profileId));
                            end
                        }
                    });
                    return;
                else
                    v23.navigation.push(l_AppPage_0.TrustedContactsModal, {
                        userId = v23.profileId, 
                        source = l_Sources_0.ProfilePlatform, 
                        onRequestSent = function() --[[ Line: 84 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v23 (ref), v12 (ref)
                            return v23.dispatch(v12(v23.profileId));
                        end
                    });
                    return;
                end;
            end
        };
    end or nil, 
    [v13.ProfileActions.AddTrustedConnectionViaLink] = l_FFlagTCShareLinkSenderUI_0 and function(v24) --[[ Line: 95 ]]
        -- upvalues: v13 (copy), v15 (copy), l_Sources_0 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy), l_AppPage_0 (copy), v12 (copy)
        return {
            text = v24.localized[v13.ProfileActions.AddTrustedConnection], 
            onActivated = function() --[[ Line: 98 ]] --[[ Name: onActivated ]]
                -- upvalues: v24 (copy), v15 (ref), l_Sources_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), l_AppPage_0 (ref), v12 (ref)
                v24.analytics.fireAnalyticsEvent(v15.ContextualMenuButtonAddTrustedConnection, {
                    buttonSurface = v24.buttonSurface, 
                    modalVariantOverride = l_Sources_0.ShareLinkSender
                });
                if l_FFlagTCUnifyNavigationEntry_0 then
                    v24.navigation.push(l_AppPage_0.TrustedContactsModal, {
                        props = {
                            userId = v24.profileId, 
                            source = l_Sources_0.ProfilePlatform, 
                            modalVariantOverride = l_Sources_0.ShareLinkSender, 
                            onRequestSent = function() --[[ Line: 109 ]] --[[ Name: onRequestSent ]]
                                -- upvalues: v24 (ref), v12 (ref)
                                return v24.dispatch(v12(v24.profileId));
                            end
                        }
                    });
                    return;
                else
                    v24.navigation.push(l_AppPage_0.TrustedContactsModal, {
                        userId = v24.profileId, 
                        source = l_Sources_0.ProfilePlatform, 
                        modalVariantOverride = l_Sources_0.ShareLinkSender, 
                        onRequestSent = function() --[[ Line: 119 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v24 (ref), v12 (ref)
                            return v24.dispatch(v12(v24.profileId));
                        end
                    });
                    return;
                end;
            end
        };
    end or nil, 
    [v13.ProfileActions.AddIncomingTrustedConnection] = l_FFlagProfilePlatformAddTC_0 and function(v25) --[[ Line: 130 ]]
        -- upvalues: v13 (copy), v15 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy), l_AppPage_0 (copy), v12 (copy)
        return {
            text = v25.localized[v13.ProfileActions.AddIncomingTrustedConnection], 
            onActivated = function() --[[ Line: 133 ]] --[[ Name: onActivated ]]
                -- upvalues: v25 (copy), v15 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), l_AppPage_0 (ref), v12 (ref)
                v25.analytics.fireAnalyticsEvent(v15.ContextualMenuButtonAddIncomingTrustedConnection, {
                    buttonSurface = v25.buttonSurface
                });
                if l_FFlagTCUnifyNavigationEntry_0 then
                    v25.navigation.push(l_AppPage_0.TrustedContactsModal, {
                        props = {
                            userId = v25.profileId, 
                            onRequestAccepted = function() --[[ Line: 141 ]] --[[ Name: onRequestAccepted ]]
                                -- upvalues: v25 (ref), v12 (ref)
                                return v25.dispatch(v12(v25.profileId));
                            end
                        }
                    });
                    return;
                else
                    v25.navigation.push(l_AppPage_0.TrustedContactsModal, {
                        userId = v25.profileId, 
                        onRequestAccepted = function() --[[ Line: 149 ]] --[[ Name: onRequestAccepted ]]
                            -- upvalues: v25 (ref), v12 (ref)
                            return v25.dispatch(v12(v25.profileId));
                        end
                    });
                    return;
                end;
            end
        };
    end or nil, 
    [v13.ProfileActions.PendingTrustedConnection] = l_FFlagProfilePlatformAddTC_0 and function(v26) --[[ Line: 160 ]]
        -- upvalues: v13 (copy)
        return {
            text = v26.localized[v13.ProfileActions.AddTrustedConnection], 
            isDisabled = true, 
            onActivated = function() --[[ Line: 164 ]] --[[ Name: onActivated ]]

            end
        };
    end or nil, 
    [v13.ProfileActions.PendingIncomingTrustedConnection] = v20 and function(v27) --[[ Line: 170 ]]
        -- upvalues: v13 (copy)
        return {
            text = v27.localized[v13.ProfileActions.AddIncomingTrustedConnection], 
            isDisabled = true, 
            onActivated = function() --[[ Line: 174 ]] --[[ Name: onActivated ]]

            end
        };
    end or nil
};