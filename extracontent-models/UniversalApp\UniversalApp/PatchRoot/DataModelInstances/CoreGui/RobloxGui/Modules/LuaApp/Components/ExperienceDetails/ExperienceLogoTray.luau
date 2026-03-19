local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local l_sendSocialLinkClickEvent_0 = v4.Events.sendSocialLinkClickEvent;
local l_sendOpenLeavingRobloxModalEvent_0 = v4.Events.sendOpenLeavingRobloxModalEvent;
local v7 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local v8 = require(script.Parent.LogoTray);
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v10 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppAmazonSocialLinkEdp);
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local v13 = {
    [v7.Twitter] = l_Images_0["icons/brands/x"], 
    [v7.Facebook] = l_Images_0["icons/brands/facebook"], 
    [v7.Discord] = l_Images_0["icons/brands/discord"], 
    [v7.RobloxGroup] = l_Images_0["icons/logo/block"], 
    [v7.YouTube] = l_Images_0["icons/brands/youtube"], 
    [v7.Twitch] = l_Images_0["icons/brands/twitch"], 
    [v7.Guilded] = l_Images_0["icons/brands/guilded"], 
    [v7.Amazon] = if v10 then l_Images_0["icons/brands/amazon_simple"] else nil
};
local function v14() --[[ Line: 32 ]]

end;
local v15 = v2.PureComponent:extend("ExperienceLogoTray");
v15.validateProps = v3.strictInterface({
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
v15.defaultProps = {
    openLeaveRobloxAlertUIBlox = v14, 
    closeAlert = v14
};
v15.init = function(v16) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), l_sendSocialLinkClickEvent_0 (copy), v7 (copy), l_sendOpenLeavingRobloxModalEvent_0 (copy)
    v16.createItems = function(v17) --[[ Line: 56 ]]
        -- upvalues: v13 (ref)
        local v18 = {};
        local v19 = {};
        for _, v21 in ipairs(v17) do
            local l_type_0 = v21.type;
            if v13[l_type_0] ~= nil then
                table.insert(v18, {
                    key = l_type_0, 
                    logo = v13[l_type_0]
                });
                v19[l_type_0] = v21.url;
            end;
        end;
        return v18, v19;
    end;
    local function _(v23, v24) --[[ Line: 74 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v16 (copy), v7 (ref)
        return function() --[[ Line: 75 ]]
            -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v16 (ref), v23 (copy), v24 (copy), v7 (ref)
            if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                l_sendSocialLinkClickEvent_0({
                    assignment_id = tonumber(v16.props.universeId), 
                    assignment_type = "game", 
                    social_link_type = v23, 
                    social_link_url = v24, 
                    social_link_display_type = "badge"
                });
            end;
            local l_v24_0 = v24;
            if v23 == v7.Twitter then
                local v26 = v24:match("twitter.com/+([a-zA-Z0-9_]+)/*");
                if v26 ~= nil then
                    l_v24_0 = "twitter://user?screen_name=" .. v26;
                end;
            end;
            local l_linking_0 = v16.props.linking;
            l_linking_0:openURL(l_v24_0):andThen(function(v28) --[[ Line: 94 ]]
                -- upvalues: l_linking_0 (copy), v24 (ref)
                if v28 == false then
                    l_linking_0:openURL(v24);
                end;
            end);
            v16.props.closeAlert();
        end;
    end;
    v16.getItemClickCallback = function(v30) --[[ Line: 103 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendOpenLeavingRobloxModalEvent_0 (ref), v16 (copy), l_sendSocialLinkClickEvent_0 (ref), v7 (ref)
        return function(v31) --[[ Line: 104 ]]
            -- upvalues: v30 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendOpenLeavingRobloxModalEvent_0 (ref), v16 (ref), l_sendSocialLinkClickEvent_0 (ref), v7 (ref)
            local v32 = v30[v31];
            if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                l_sendOpenLeavingRobloxModalEvent_0({
                    assignment_id = tonumber(v16.props.universeId), 
                    assignment_type = "game", 
                    social_link_type = v31, 
                    social_link_display_type = "badge"
                });
            end;
            v16.props.openLeaveRobloxAlertUIBlox(function() --[[ Line: 75 ]]
                -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), l_sendSocialLinkClickEvent_0 (ref), v16 (ref), v31 (copy), v32 (copy), v7 (ref)
                if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                    l_sendSocialLinkClickEvent_0({
                        assignment_id = tonumber(v16.props.universeId), 
                        assignment_type = "game", 
                        social_link_type = v31, 
                        social_link_url = v32, 
                        social_link_display_type = "badge"
                    });
                end;
                local l_v32_0 = v32;
                if v31 == v7.Twitter then
                    local v34 = v32:match("twitter.com/+([a-zA-Z0-9_]+)/*");
                    if v34 ~= nil then
                        l_v32_0 = "twitter://user?screen_name=" .. v34;
                    end;
                end;
                local l_linking_1 = v16.props.linking;
                l_linking_1:openURL(l_v32_0):andThen(function(v36) --[[ Line: 94 ]]
                    -- upvalues: l_linking_1 (copy), v32 (ref)
                    if v36 == false then
                        l_linking_1:openURL(v32);
                    end;
                end);
                v16.props.closeAlert();
            end);
        end;
    end;
end;
v15.render = function(v37) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy)
    local v38, v39 = v37.createItems(v37.props.socialLinks);
    return v2.createElement(v8, {
        layoutOrder = 1, 
        itemList = v38, 
        handleItemClick = v37.getItemClickCallback(v39), 
        impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v37.props.impressionsTag else nil, 
        onAbsolutePositionChanged = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v37.props.onAbsolutePositionChanged else nil, 
        forwardRef = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v37.props.forwardRef else nil
    });
end;
return v15;