local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local v4 = require(l_script_FirstAncestor_0.Analytics);
local v5 = require(l_script_FirstAncestor_0.SocialTabContext);
local v6 = require(l_script_FirstAncestor_0.ContextUtils.compose);
local l_llama_0 = v3.llama;
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_withLocalization_0 = v3.withLocalization;
local l_UniversalAppPolicy_0 = v3.UniversalAppPolicy;
local v12 = require(script.mapStateToProps);
local v13 = require(script.mapDispatchToProps);
local v14 = require(script.Parent.SocialTabPage);
local v15 = require(l_script_FirstAncestor_0.UserCarousel);
local v16 = l_Roact_0.PureComponent:extend("SocialTabContainer");
local l_GetFFlagHideConnectPageWebViewItemsForVR_0 = v3.GetFFlagHideConnectPageWebViewItemsForVR;
local l_GetFFlagUseCommunitiesTranslation_0 = v2.GetFFlagUseCommunitiesTranslation;
v16.defaultProps = {};
v16.init = function(v19) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagUseCommunitiesTranslation_0 (copy)
    v19.localization = {
        socialText = "Feature.SocialTab.Label.Connect", 
        chatsText = "Feature.SocialTab.Label.Chats", 
        groupsText = l_GetFFlagUseCommunitiesTranslation_0() and "Feature.SocialTab.Label.Groups" or "CommonUI.Features.Label.sGroups"
    };
end;
v16.didMount = function(v20) --[[ Line: 37 ]] --[[ Name: didMount ]]
    v20.props.fetchFriendsRequestsCount();
end;
v16.render = function(v21) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v4 (copy), v5 (copy), l_Roact_0 (copy), v14 (copy), l_llama_0 (copy), v15 (copy)
    return l_withLocalization_0(v21.localization)(function(v22) --[[ Line: 42 ]]
        -- upvalues: v4 (ref), v5 (ref), l_Roact_0 (ref), v14 (ref), l_llama_0 (ref), v21 (copy), v15 (ref)
        return v4.with(function(v23) --[[ Line: 43 ]]
            -- upvalues: v5 (ref), l_Roact_0 (ref), v14 (ref), l_llama_0 (ref), v21 (ref), v15 (ref), v22 (copy)
            return v5.with(function(v24) --[[ Line: 44 ]]
                -- upvalues: l_Roact_0 (ref), v14 (ref), l_llama_0 (ref), v21 (ref), v23 (copy), v15 (ref), v22 (ref)
                return l_Roact_0.createElement(v14, l_llama_0.Dictionary.join(v21.props, {
                    analytics = v23, 
                    navigateToLuaAppPages = v24.navigateToLuaAppPages, 
                    renderUserCarousel = v15.render, 
                    wideMode = v24.wideMode, 
                    navigatingFromSocialTabEvent = v24.setNavigatingFromSocialTabEvent, 
                    isLuaProfilePageEnabled = v24.isLuaProfilePageEnabled, 
                    luaAddFriendsPageEnabled = v24.luaAddFriendsPageEnabled and true or false, 
                    closeCentralOverlay = v24.closeCentralOverlay, 
                    openLearnMoreLink = v24.openLearnMoreLink, 
                    showToast = v24.showToast
                }, v22));
            end);
        end);
    end);
end;
return v6(l_RoactRodux_0.connect(v12, v13), l_UniversalAppPolicy_0.connect(function(v25) --[[ Line: 68 ]]
    -- upvalues: l_GetFFlagHideConnectPageWebViewItemsForVR_0 (copy)
    local v26 = v25.getChatHeaderNotifications();
    local v27 = if l_GetFFlagHideConnectPageWebViewItemsForVR_0() then not v25.getWebViewSupport() else nil;
    return {
        enableDisplayNamePolicy = v25.getShowDisplayName(), 
        shouldShowGroupsTilePolicy = v25.getShouldShowGroupsTile(), 
        enableNotificationsPolicy = v26, 
        disableWebViewSupport = v27
    };
end))(v16);