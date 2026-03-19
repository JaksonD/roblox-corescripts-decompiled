local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local l_sendSocialLinkClickEvent_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).sendSocialLinkClickEvent;
local v5 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local v6 = require(script.Parent.LogoTray);
local v7 = require(script.Parent.Analytics.sendOpenLeavingRobloxModalEvent);
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v9 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppAmazonSocialLinkEdp);
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local v12 = {
    [v5.Twitter] = l_Images_0["icons/brands/x"], 
    [v5.Facebook] = l_Images_0["icons/brands/facebook"], 
    [v5.Discord] = l_Images_0["icons/brands/discord"], 
    [v5.RobloxGroup] = l_Images_0["icons/logo/block"], 
    [v5.YouTube] = l_Images_0["icons/brands/youtube"], 
    [v5.Twitch] = l_Images_0["icons/brands/twitch"], 
    [v5.Guilded] = l_Images_0["icons/brands/guilded"], 
    [v5.Amazon] = if v9 then l_Images_0["icons/brands/amazon_simple"] else nil
};
local function v13() --[[ Line: 31 ]]

end;
local v14 = v2.PureComponent:extend("ExperienceLogoTray");
v14.validateProps = v3.strictInterface({
    layoutOrder = v3.optional(v3.integer), 
    socialLinks = v3.table, 
    linking = v3.table, 
    openLeaveRobloxAlertUIBlox = v3.callback, 
    closeAlert = v3.callback, 
    impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.string else nil, 
    onAbsolutePositionChanged = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.optional(v3.callback) else nil, 
    forwardRef = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.optional(v3.table) else nil, 
    universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v3.string else nil
});
v14.defaultProps = {
    openLeaveRobloxAlertUIBlox = v13, 
    closeAlert = v13
};
v14.init = function(v15) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), l_sendSocialLinkClickEvent_0 (copy), v5 (copy), v7 (copy)
    v15.createItems = function(v16) --[[ Line: 55 ]]
        -- upvalues: v12 (ref)
        local v17 = {};
        local v18 = {};
        for _, v20 in ipairs(v16) do
            local l_type_0 = v20.type;
            if v12[l_type_0] ~= nil then
                table.insert(v17, {
                    key = l_type_0, 
                    logo = v12[l_type_0]
                });
                v18[l_type_0] = v20.url;
            end;
        end;
        return v17, v18;
    end;
    local function _(v22, v23) --[[ Line: 73 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v15 (copy), v5 (ref)
        return function() --[[ Line: 74 ]]
            -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v15 (ref), v22 (copy), v23 (copy), v5 (ref)
            if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                l_sendSocialLinkClickEvent_0({
                    assignment_id = tonumber(v15.props.universeId), 
                    assignment_type = "game", 
                    social_link_type = v22, 
                    social_link_url = v23, 
                    social_link_display_type = "badge"
                });
            end;
            local l_v23_0 = v23;
            if v22 == v5.Twitter then
                local v25 = v23:match("twitter.com/+([a-zA-Z0-9_]+)/*");
                if v25 ~= nil then
                    l_v23_0 = "twitter://user?screen_name=" .. v25;
                end;
            end;
            local l_linking_0 = v15.props.linking;
            l_linking_0:openURL(l_v23_0):andThen(function(v27) --[[ Line: 93 ]]
                -- upvalues: l_linking_0 (copy), v23 (ref)
                if v27 == false then
                    l_linking_0:openURL(v23);
                end;
            end);
            v15.props.closeAlert();
        end;
    end;
    v15.getItemClickCallback = function(v29) --[[ Line: 102 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v7 (ref), v15 (copy), l_sendSocialLinkClickEvent_0 (ref), v5 (ref)
        return function(v30) --[[ Line: 103 ]]
            -- upvalues: v29 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v7 (ref), v15 (ref), l_sendSocialLinkClickEvent_0 (ref), v5 (ref)
            local v31 = v29[v30];
            if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                v7({
                    assignment_id = tonumber(v15.props.universeId), 
                    assignment_type = "game", 
                    social_link_type = v30, 
                    social_link_display_type = "badge"
                });
            end;
            v15.props.openLeaveRobloxAlertUIBlox(function() --[[ Line: 74 ]]
                -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v15 (ref), v30 (copy), v31 (copy), v5 (ref)
                if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                    l_sendSocialLinkClickEvent_0({
                        assignment_id = tonumber(v15.props.universeId), 
                        assignment_type = "game", 
                        social_link_type = v30, 
                        social_link_url = v31, 
                        social_link_display_type = "badge"
                    });
                end;
                local l_v31_0 = v31;
                if v30 == v5.Twitter then
                    local v33 = v31:match("twitter.com/+([a-zA-Z0-9_]+)/*");
                    if v33 ~= nil then
                        l_v31_0 = "twitter://user?screen_name=" .. v33;
                    end;
                end;
                local l_linking_1 = v15.props.linking;
                l_linking_1:openURL(l_v31_0):andThen(function(v35) --[[ Line: 93 ]]
                    -- upvalues: l_linking_1 (copy), v31 (ref)
                    if v35 == false then
                        l_linking_1:openURL(v31);
                    end;
                end);
                v15.props.closeAlert();
            end);
        end;
    end;
end;
v14.render = function(v36) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy)
    local v37, v38 = v36.createItems(v36.props.socialLinks);
    return v2.createElement(v6, {
        layoutOrder = 1, 
        itemList = v37, 
        handleItemClick = v36.getItemClickCallback(v38), 
        impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v36.props.impressionsTag else nil, 
        onAbsolutePositionChanged = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v36.props.onAbsolutePositionChanged else nil, 
        forwardRef = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v36.props.forwardRef else nil
    });
end;
return v14;