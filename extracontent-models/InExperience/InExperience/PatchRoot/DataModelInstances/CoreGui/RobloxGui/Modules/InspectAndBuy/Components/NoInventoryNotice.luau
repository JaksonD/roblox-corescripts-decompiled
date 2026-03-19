local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Colors);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v7 = v3.PureComponent:extend("NoInventoryNotice");
v7.render = function(v8) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy), l_AppFonts_0 (copy), v6 (copy)
    local l_locale_0 = v8.props.locale;
    local l_assets_0 = v8.props.assets;
    local l_isLoaded_0 = v8.props.isLoaded;
    local l_createElement_0 = v3.createElement;
    local v13 = "Frame";
    local v14 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    };
    local v15 = false;
    if next(l_assets_0) == nil then
        v15 = l_isLoaded_0;
    end;
    v14.Visible = v15;
    return l_createElement_0(v13, v14, {
        UIListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, 15), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        NotWearingImage = v3.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.25, 0, 0.25, 0), 
            LayoutOrder = 1, 
            Image = "rbxasset://textures/ui/InspectMenu/ico_isnt-wearing.png", 
            ImageColor3 = v5.White
        }, {
            UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })
        }), 
        NotWearingText = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.8, 0, 0.3, 0), 
            LayoutOrder = 2, 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v6:FormatByKeyForLocale("InGame.InspectMenu.Description.NoInventoryNotice", l_locale_0), 
            TextScaled = true, 
            TextColor3 = v5.White, 
            TextSize = 20, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true
        }, {
            UITextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            })
        })
    });
end;
return v4.UNSTABLE_connect2(function(v16, _) --[[ Line: 62 ]]
    return {
        assets = v16.assets, 
        locale = v16.locale, 
        isLoaded = v16.isLoaded
    };
end)(v7);