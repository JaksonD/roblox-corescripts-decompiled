local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local v3 = require(l_Common_0.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Components.GameDetails.SocialMediaButton);
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local v8 = v3.PureComponent:extend("SocialMediaGroup");
v8.render = function(v9) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy)
    local l_LayoutOrder_0 = v9.props.LayoutOrder;
    local l_socialLinks_0 = v9.props.socialLinks;
    if not l_socialLinks_0 or #l_socialLinks_0 == 0 then
        return nil;
    else
        local v12 = {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            })
        };
        for v13, v14 in ipairs(v9.props.socialLinks) do
            v12["SocialButton_" .. v14.type] = v3.createElement(v5, {
                Size = UDim2.new(0, 44, 0, 44), 
                LayoutOrder = v13, 
                socialType = v14.type, 
                socialUrl = v14.url, 
                index = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v13 else nil, 
                impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v9.props.impressionsTag else nil, 
                universeId = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then v9.props.universeId else nil
            });
        end;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 44), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, v12);
    end;
end;
return v4.connect(function(v15, v16) --[[ Line: 59 ]]
    local v17 = v15.GameSocialLinks[v16.universeId];
    return {
        socialLinks = v17 and v17.externalLinks
    };
end)(v8);