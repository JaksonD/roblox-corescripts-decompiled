local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_sendSocialLinkClickEvent_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).sendSocialLinkClickEvent;
local v7 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.Analytics.sendOpenLeavingRobloxModalEvent);
local v8 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v10 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_Common_0 = l_Modules_0.Common;
local v12 = require(l_CorePackages_0.Packages.React);
local v13 = require(l_Common_0.Roact);
local v14 = require(l_Common_0.RoactRodux);
local v15 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v16 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v16.App.ImageSet.Images;
local l_ImageSetButton_0 = v16.Core.ImageSet.ImageSetButton;
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local v20 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppAmazonSocialLinkEdp);
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local v23 = {
    [v8.Twitter] = l_Images_0["icons/brands/x"], 
    [v8.Facebook] = l_Images_0["icons/brands/facebook"], 
    [v8.Discord] = l_Images_0["icons/brands/discord"], 
    [v8.RobloxGroup] = l_Images_0["icons/logo/block"], 
    [v8.YouTube] = l_Images_0["icons/brands/youtube"], 
    [v8.Twitch] = l_Images_0["icons/brands/twitch"], 
    [v8.Guilded] = l_Images_0["icons/brands/guilded"], 
    [v8.Amazon] = if v20 then l_Images_0["icons/brands/amazon_simple"] else nil
};
local v24 = v13.PureComponent:extend("SocialMediaButton");
v24.init = function(v25) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), v7 (copy), v8 (copy), l_sendSocialLinkClickEvent_0 (copy)
    v25.state = {
        buttonPressed = false
    };
    v25.onInputBegan = function(_, v27) --[[ Line: 50 ]]
        -- upvalues: v25 (copy)
        if v27.UserInputState == Enum.UserInputState.Begin and (v27.UserInputType == Enum.UserInputType.Touch or v27.UserInputType == Enum.UserInputType.MouseButton1) and not v25.state.buttonPressed then
            v25:setState({
                buttonPressed = true
            });
        end;
    end;
    v25.onInputEnded = function() --[[ Line: 66 ]]
        -- upvalues: v25 (copy)
        if v25.state.buttonPressed then
            v25:setState({
                buttonPressed = false
            });
        end;
    end;
    v25.onActivated = function() --[[ Line: 74 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v7 (ref), v25 (copy)
        if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
            v7({
                assignment_id = tonumber(v25.props.universeId), 
                assignment_type = "game", 
                social_link_type = v25.props.socialType, 
                social_link_display_type = "badge"
            });
        end;
        v25.props.openLeaveRobloxAlertUIBlox(v25.openUrl);
    end;
    v25.getUriParams = function() --[[ Line: 86 ]]
        -- upvalues: v25 (copy), v8 (ref)
        if v25.props.socialType == v8.Twitter then
            local v28 = v25.props.socialUrl:match("twitter.com/+([a-zA-Z0-9_]+)/*");
            if v28 ~= nil then
                return {
                    app_uri = "twitter://user?screen_name=" .. v28, 
                    web_uri = v25.props.socialUrl
                };
            end;
        end;
        return {
            app_uri = v25.props.socialUrl, 
            web_uri = v25.props.socialUrl
        };
    end;
    v25.openUrl = function() --[[ Line: 105 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v25 (copy)
        if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
            l_sendSocialLinkClickEvent_0({
                assignment_id = tonumber(v25.props.universeId), 
                assignment_type = "game", 
                social_link_type = v25.props.socialType, 
                social_link_url = v25.props.socialUrl, 
                social_link_display_type = "badge"
            });
        end;
        local v29 = v25.getUriParams();
        v25.props.linking:openURL(v29.app_uri):andThen(function(v30) --[[ Line: 116 ]]
            -- upvalues: v25 (ref), v29 (copy)
            if v30 == false then
                v25.props.linking:openURL(v29.web_uri);
            end;
        end);
        v25.props.closeAlert();
    end;
end;
v24.render = function(v31) --[[ Line: 126 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_ImageSetButton_0 (copy), v23 (copy), v20 (copy)
    local l_Size_0 = v31.props.Size;
    local l_socialType_0 = v31.props.socialType;
    local l_LayoutOrder_0 = v31.props.LayoutOrder;
    local l_buttonPressed_0 = v31.state.buttonPressed;
    local l_SocialMediaButton_0 = v31.props.appTheme.GameDetails.SocialMediaButton;
    return v13.createElement(l_ImageSetButton_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Image = v23[l_socialType_0], 
        ImageTransparency = l_buttonPressed_0 and l_SocialMediaButton_0.OnPressTransparency or l_SocialMediaButton_0.Transparency, 
        ImageColor3 = v31.props.designTokens.Semantic.Color.Ui.Emphasis.Color3, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v13.Event.Activated] = v31.onActivated, 
        [v13.Event.InputBegan] = v31.onInputBegan, 
        [v13.Event.InputEnded] = v31.onInputEnded, 
        [v13.Ref] = if v20 then v31.props.forwardRef else nil
    });
end;
v24 = v15(v24);
local v40 = v14.connect(function(_) --[[ Line: 151 ]]

end, function(v38) --[[ Line: 151 ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        openLeaveRobloxAlertUIBlox = function(v39) --[[ Line: 153 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
            -- upvalues: v38 (copy), v9 (ref)
            v38(v9(v39));
        end, 
        closeAlert = function() --[[ Line: 156 ]] --[[ Name: closeAlert ]]
            -- upvalues: v38 (copy), v10 (ref)
            v38(v10());
        end
    };
end)(v24);
return l_RoactServices_0.connect({
    linking = l_AppLinking_0
})(function(v41) --[[ Line: 163 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v12 (copy), l_ImpressionsTagUtility_0 (copy), v5 (copy), v13 (copy), v40 (copy)
    local v42 = l_useDesignTokens_0();
    local v43 = nil;
    if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then
        v43 = v12.useRef(nil);
        v12.useEffect(function() --[[ Line: 169 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v43 (ref), v41 (copy)
            l_ImpressionsTagUtility_0.AddTag(v43, v41.impressionsTag, v41.index);
            return function() --[[ Line: 171 ]]
                -- upvalues: l_ImpressionsTagUtility_0 (ref), v43 (ref), v41 (ref)
                l_ImpressionsTagUtility_0.RemoveTag(v43, v41.impressionsTag, v41.index);
            end;
        end, {
            v43, 
            v41.impressionsTag, 
            v41.index
        });
    end;
    local v44 = v5.Dictionary.join(v41, {
        designTokens = v42, 
        forwardRef = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v43 else nil
    });
    return v13.createElement(v40, v44);
end);