local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.RobloxAppEnums);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_AppPage_0 = v3.AppPage;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v13 = require(l_script_FirstAncestor_0.Networking.GroupsNetworking);
local v14 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local v15 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatform);
local v16 = require(l_script_FirstAncestor_0.Hooks.getAvailableCommunityComponents);
local v17 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v18 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v20 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformRefreshOnWebviewClose);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local v24 = ("%*share/g/%%s"):format(l_Url_0.BASE_URL);
return {
    [v18.ProfileActions.CopyLink] = v21 and function(v25) --[[ Line: 42 ]]
        -- upvalues: v18 (copy), v20 (copy), l_default_0 (copy), l_Contexts_0 (copy), v24 (copy), l_SetCurrentToastMessage_0 (copy), v17 (copy)
        return {
            text = v25.localized[v18.ProfileActions.CopyLink], 
            onActivated = function() --[[ Line: 45 ]] --[[ Name: onActivated ]]
                -- upvalues: v25 (copy), v20 (ref), l_default_0 (ref), l_Contexts_0 (ref), v24 (ref), l_SetCurrentToastMessage_0 (ref), v17 (ref)
                v25.analytics.fireAnalyticsEvent(v20.ContextualMenuButtonCopyLink, {
                    buttonSurface = v25.buttonSurface
                });
                l_default_0:setClipboardText({
                    context = l_Contexts_0.ProfileCard, 
                    text = string.format(v24, v25.profileId)
                });
                v25.dispatch(l_SetCurrentToastMessage_0({
                    toastMessage = v17.LinkCopied
                }));
            end
        };
    end or nil, 
    [v18.ProfileActions.JoinCommunity] = v21 and function(v26) --[[ Line: 63 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v18 (copy), v20 (copy), v13 (copy), v14 (copy), v16 (copy)
        return {
            variant = l_ButtonVariant_0.Emphasis, 
            text = v26.localized[v18.ProfileActions.JoinCommunity], 
            onActivated = function() --[[ Line: 67 ]] --[[ Name: onActivated ]]
                -- upvalues: v26 (copy), v20 (ref), v13 (ref), v14 (ref), v16 (ref)
                v26.analytics.fireAnalyticsEvent(v20.CTAButtonJoinCommunity, {
                    buttonSurface = v26.buttonSurface
                });
                return v26.dispatch(v13.JoinGroup.API({
                    groupId = v26.profileId
                })):andThen(function() --[[ Line: 76 ]]
                    -- upvalues: v26 (ref), v14 (ref), v16 (ref)
                    v26.dispatch(v14.API({
                        profileType = v26.profileType, 
                        profileId = v26.profileId, 
                        components = v16(), 
                        includeComponentOrdering = true
                    }));
                end);
            end
        };
    end or nil, 
    [v18.ProfileActions.CancelJoinCommunityRequest] = v21 and function(v27) --[[ Line: 90 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v18 (copy), v20 (copy), v13 (copy), v15 (copy)
        return {
            variant = l_ButtonVariant_0.Standard, 
            text = v27.localized[v18.ProfileActions.CancelJoinCommunityRequest], 
            onActivated = function() --[[ Line: 94 ]] --[[ Name: onActivated ]]
                -- upvalues: v27 (copy), v20 (ref), v13 (ref), v15 (ref), v18 (ref)
                v27.analytics.fireAnalyticsEvent(v20.CTAButtonCancelJoinCommunityRequest, {
                    buttonSurface = v27.buttonSurface
                });
                return v27.dispatch(v13.CancelJoinGroupRequest.API({
                    groupId = v27.profileId, 
                    userId = v27.localUserId
                })):andThen(function() --[[ Line: 104 ]]
                    -- upvalues: v27 (ref), v15 (ref), v18 (ref)
                    v27.dispatch(v15({
                        profileType = v27.profileType, 
                        profileId = v27.profileId, 
                        components = {
                            v18.Components.Actions
                        }
                    }));
                end);
            end
        };
    end or nil, 
    [v18.ProfileActions.ViewCommunity] = v21 and function(v28) --[[ Line: 119 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v18 (copy), v20 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), v17 (copy), v22 (copy), v14 (copy), v16 (copy)
        return {
            variant = l_ButtonVariant_0.SubEmphasis, 
            text = v28.localized[v18.ProfileActions.ViewCommunity], 
            onActivated = function() --[[ Line: 123 ]] --[[ Name: onActivated ]]
                -- upvalues: v28 (copy), v20 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v17 (ref), v22 (ref), v14 (ref), v16 (ref)
                v28.analytics.fireAnalyticsEvent(v20.CTAButtonViewCommunity, {
                    buttonSurface = v28.buttonSurface
                });
                v28.dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = l_UrlBuilder_0.user.group({
                        groupId = v28.profileId
                    }), 
                    extraProps = {
                        titleKey = v17.Community, 
                        onClose = function() --[[ Line: 133 ]] --[[ Name: onClose ]]
                            -- upvalues: v22 (ref), v28 (ref), v14 (ref), v16 (ref)
                            if v22 then
                                v28.dispatch(v14.API({
                                    profileType = v28.profileType, 
                                    profileId = v28.profileId, 
                                    components = v16(), 
                                    includeComponentOrdering = true
                                }));
                            end;
                        end
                    }
                }));
            end
        };
    end or nil, 
    [v18.ProfileActions.ViewFullProfile] = v23 and function(v29) --[[ Line: 151 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v18 (copy), v20 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), v17 (copy), v22 (copy), v14 (copy), v16 (copy)
        return {
            variant = l_ButtonVariant_0.SubEmphasis, 
            text = v29.localized[v18.ProfileActions.ViewFullProfile], 
            onActivated = function() --[[ Line: 155 ]] --[[ Name: onActivated ]]
                -- upvalues: v29 (copy), v20 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref), v17 (ref), v22 (ref), v14 (ref), v16 (ref)
                v29.analytics.fireAnalyticsEvent(v20.CTAButtonViewFullProfile, {
                    buttonSurface = v29.buttonSurface
                });
                v29.dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = l_UrlBuilder_0.new({
                        base = l_UrlBase_0.WWW, 
                        path = ("profiles/%*"):format(v29.profileId)
                    })(), 
                    extraProps = {
                        titleKey = v17.Profile, 
                        onClose = function() --[[ Line: 168 ]] --[[ Name: onClose ]]
                            -- upvalues: v22 (ref), v29 (ref), v14 (ref), v16 (ref)
                            if v22 then
                                v29.dispatch(v14.API({
                                    profileType = v29.profileType, 
                                    profileId = v29.profileId, 
                                    components = v16(), 
                                    includeComponentOrdering = true
                                }));
                            end;
                        end
                    }
                }));
            end
        };
    end or nil, 
    [v18.ProfileActions.LeaveCommunity] = v21 and function(v30) --[[ Line: 186 ]]
        -- upvalues: v18 (copy), v20 (copy), v13 (copy), v14 (copy), v16 (copy)
        return {
            text = v30.localized[v18.ProfileActions.LeaveCommunity], 
            onActivated = function() --[[ Line: 189 ]] --[[ Name: onActivated ]]
                -- upvalues: v30 (copy), v20 (ref), v13 (ref), v14 (ref), v16 (ref)
                v30.analytics.fireAnalyticsEvent(v20.ContextualMenuButtonLeaveCommunity, {
                    buttonSurface = v30.buttonSurface
                });
                return v30.dispatch(v13.LeaveGroup.API({
                    groupId = v30.profileId, 
                    userId = v30.localUserId
                })):andThen(function() --[[ Line: 199 ]]
                    -- upvalues: v30 (ref), v14 (ref), v16 (ref)
                    v30.dispatch(v14.API({
                        profileType = v30.profileType, 
                        profileId = v30.profileId, 
                        components = v16(), 
                        includeComponentOrdering = true
                    }));
                end);
            end
        };
    end or nil, 
    [v18.ProfileActions.MakePrimaryCommunity] = v21 and function(v31) --[[ Line: 213 ]]
        -- upvalues: v18 (copy), v20 (copy), v13 (copy), v15 (copy)
        return {
            text = v31.localized[v18.ProfileActions.MakePrimaryCommunity], 
            onActivated = function() --[[ Line: 216 ]] --[[ Name: onActivated ]]
                -- upvalues: v31 (copy), v20 (ref), v13 (ref), v15 (ref), v18 (ref)
                v31.analytics.fireAnalyticsEvent(v20.ContextualMenuButtonMakePrimaryCommunity, {
                    buttonSurface = v31.buttonSurface
                });
                return v31.dispatch(v13.MakePrimaryGroup.API({
                    groupId = v31.profileId
                })):andThen(function() --[[ Line: 225 ]]
                    -- upvalues: v31 (ref), v15 (ref), v18 (ref)
                    v31.dispatch(v15({
                        profileType = v31.profileType, 
                        profileId = v31.profileId, 
                        components = {
                            v18.Components.Actions
                        }
                    }));
                end);
            end
        };
    end or nil, 
    [v18.ProfileActions.RemovePrimaryCommunity] = v21 and function(v32) --[[ Line: 240 ]]
        -- upvalues: v18 (copy), v20 (copy), v13 (copy), v15 (copy)
        return {
            text = v32.localized[v18.ProfileActions.RemovePrimaryCommunity], 
            onActivated = function() --[[ Line: 243 ]] --[[ Name: onActivated ]]
                -- upvalues: v32 (copy), v20 (ref), v13 (ref), v15 (ref), v18 (ref)
                v32.analytics.fireAnalyticsEvent(v20.ContextualMenuButtonRemovePrimaryCommunity, {
                    buttonSurface = v32.buttonSurface
                });
                return v32.dispatch(v13.RemovePrimaryGroup.API()):andThen(function() --[[ Line: 248 ]]
                    -- upvalues: v32 (ref), v15 (ref), v18 (ref)
                    v32.dispatch(v15({
                        profileType = v32.profileType, 
                        profileId = v32.profileId, 
                        components = {
                            v18.Components.Actions
                        }
                    }));
                end);
            end
        };
    end or nil
};