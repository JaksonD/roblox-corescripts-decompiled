local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v5 = require(l_Parent_0.Colors);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v7 = v2.PureComponent:extend("Notification");
v7.render = function(v8) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), l_AppFonts_0 (copy), v6 (copy)
    local l_locale_0 = v8.props.locale;
    local l_noticeKey_0 = v8.props.noticeKey;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, -10, 0, 45), 
        LayoutOrder = 0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        ExclamationPoint = v2.createElement("ImageLabel", {
            Size = UDim2.new(0, 16, 0, 16), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/InspectMenu/ico_alert_tilt.png", 
            ImageColor3 = v5.White, 
            LayoutOrder = 1
        }), 
        PartOfBundleText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -30, 1, 0), 
            TextColor3 = v5.White, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            TextWrapped = true, 
            TextScaled = true, 
            TextSize = 12, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v6:FormatByKeyForLocale(l_noticeKey_0, l_locale_0)
        }, {
            UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            })
        })
    });
end;
return v3.UNSTABLE_connect2(function(v11, _) --[[ Line: 54 ]]
    return {
        locale = v11.locale
    };
end)(v7);