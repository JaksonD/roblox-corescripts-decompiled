local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local l_sendSocialLinkClickEvent_0 = v6.Events.sendSocialLinkClickEvent;
local l_sendOpenLeavingRobloxModalEvent_0 = v6.Events.sendOpenLeavingRobloxModalEvent;
local v9 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_Common_0 = l_Modules_0.Common;
local v13 = require(l_CorePackages_0.Packages.React);
local v14 = require(l_Common_0.Roact);
local v15 = require(l_Common_0.RoactRodux);
local v16 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v17 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v17.App.ImageSet.Images;
local l_ImageSetButton_0 = v17.Core.ImageSet.ImageSetButton;
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local v21 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppAmazonSocialLinkEdp);
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local v24 = {
    [v9.Twitter] = l_Images_0["icons/brands/x"], 
    [v9.Facebook] = l_Images_0["icons/brands/facebook"], 
    [v9.Discord] = l_Images_0["icons/brands/discord"], 
    [v9.RobloxGroup] = l_Images_0["icons/logo/block"], 
    [v9.YouTube] = l_Images_0["icons/brands/youtube"], 
    [v9.Twitch] = l_Images_0["icons/brands/twitch"], 
    [v9.Guilded] = l_Images_0["icons/brands/guilded"], 
    [v9.Amazon] = if v21 then l_Images_0["icons/brands/amazon_simple"] else nil
};
local v25 = v14.PureComponent:extend("SocialMediaButton");
v25.init = function(v26) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), l_sendOpenLeavingRobloxModalEvent_0 (copy), v9 (copy), l_sendSocialLinkClickEvent_0 (copy)
    v26.state = {
        buttonPressed = false
    };
    v26.onInputBegan = function(_, v28) --[[ Line: 50 ]]
        -- upvalues: v26 (copy)
        if v28.UserInputState == Enum.UserInputState.Begin and (v28.UserInputType == Enum.UserInputType.Touch or v28.UserInputType == Enum.UserInputType.MouseButton1) and not v26.state.buttonPressed then
            v26:setState({
                buttonPressed = true
            });
        end;
    end;
    v26.onInputEnded = function() --[[ Line: 66 ]]
        -- upvalues: v26 (copy)
        if v26.state.buttonPressed then
            v26:setState({
                buttonPressed = false
            });
        end;
    end;
    v26.onActivated = function() --[[ Line: 74 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendOpenLeavingRobloxModalEvent_0 (ref), v26 (copy)
        if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
            l_sendOpenLeavingRobloxModalEvent_0({
                assignment_id = tonumber(v26.props.universeId), 
                assignment_type = "game", 
                social_link_type = v26.props.socialType, 
                social_link_display_type = "badge"
            });
        end;
        v26.props.openLeaveRobloxAlertUIBlox(v26.openUrl);
    end;
    v26.getUriParams = function() --[[ Line: 86 ]]
        -- upvalues: v26 (copy), v9 (ref)
        if v26.props.socialType == v9.Twitter then
            local v29 = v26.props.socialUrl:match("twitter.com/+([a-zA-Z0-9_]+)/*");
            if v29 ~= nil then
                return {
                    app_uri = "twitter://user?screen_name=" .. v29, 
                    web_uri = v26.props.socialUrl
                };
            end;
        end;
        return {
            app_uri = v26.props.socialUrl, 
            web_uri = v26.props.socialUrl
        };
    end;
    v26.openUrl = function() --[[ Line: 105 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v26 (copy)
        if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
            l_sendSocialLinkClickEvent_0({
                assignment_id = tonumber(v26.props.universeId), 
                assignment_type = "game", 
                social_link_type = v26.props.socialType, 
                social_link_url = v26.props.socialUrl, 
                social_link_display_type = "badge"
            });
        end;
        local v30 = v26.getUriParams();
        v26.props.linking:openURL(v30.app_uri):andThen(function(v31) --[[ Line: 116 ]]
            -- upvalues: v26 (ref), v30 (copy)
            if v31 == false then
                v26.props.linking:openURL(v30.web_uri);
            end;
        end);
        v26.props.closeAlert();
    end;
end;
v25.render = function(v32) --[[ Line: 126 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), l_ImageSetButton_0 (copy), v24 (copy), v21 (copy)
    local l_Size_0 = v32.props.Size;
    local l_socialType_0 = v32.props.socialType;
    local l_LayoutOrder_0 = v32.props.LayoutOrder;
    local l_buttonPressed_0 = v32.state.buttonPressed;
    local l_SocialMediaButton_0 = v32.props.appTheme.GameDetails.SocialMediaButton;
    return v14.createElement(l_ImageSetButton_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Image = v24[l_socialType_0], 
        ImageTransparency = l_buttonPressed_0 and l_SocialMediaButton_0.OnPressTransparency or l_SocialMediaButton_0.Transparency, 
        ImageColor3 = v32.props.designTokens.Semantic.Color.Ui.Emphasis.Color3, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v14.Event.Activated] = v32.onActivated, 
        [v14.Event.InputBegan] = v32.onInputBegan, 
        [v14.Event.InputEnded] = v32.onInputEnded, 
        [v14.Ref] = if v21 then v32.props.forwardRef else nil
    });
end;
v25 = v16(v25);
local v41 = v15.connect(function(_) --[[ Line: 151 ]]

end, function(v39) --[[ Line: 151 ]]
    -- upvalues: v10 (copy), v11 (copy)
    return {
        openLeaveRobloxAlertUIBlox = function(v40) --[[ Line: 153 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
            -- upvalues: v39 (copy), v10 (ref)
            v39(v10(v40));
        end, 
        closeAlert = function() --[[ Line: 156 ]] --[[ Name: closeAlert ]]
            -- upvalues: v39 (copy), v11 (ref)
            v39(v11());
        end
    };
end)(v25);
return l_RoactServices_0.connect({
    linking = l_AppLinking_0
})(function(v42) --[[ Line: 163 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v13 (copy), l_ImpressionsTagUtility_0 (copy), v5 (copy), v14 (copy), v41 (copy)
    local v43 = l_useDesignTokens_0();
    local v44 = nil;
    if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then
        v44 = v13.useRef(nil);
        v13.useEffect(function() --[[ Line: 169 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v44 (ref), v42 (copy)
            l_ImpressionsTagUtility_0.AddTag(v44, v42.impressionsTag, v42.index);
            return function() --[[ Line: 171 ]]
                -- upvalues: l_ImpressionsTagUtility_0 (ref), v44 (ref), v42 (ref)
                l_ImpressionsTagUtility_0.RemoveTag(v44, v42.impressionsTag, v42.index);
            end;
        end, {
            v44, 
            v42.impressionsTag, 
            v42.index
        });
    end;
    local v45 = v5.Dictionary.join(v42, {
        designTokens = v43, 
        forwardRef = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v44 else nil
    });
    return v14.createElement(v41, v45);
end);