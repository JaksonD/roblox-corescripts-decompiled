local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = require(l_Parent_0.Localization);
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v7.Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixResaleLimitedPrice);
local v11 = l_Images_0["icons/common/robux"];
return function(v12) --[[ Line: 27 ]] --[[ Name: PriceFooter ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v8 (copy), v10 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v11 (copy)
    local v13 = l_useStyle_0();
    local l_Font_0 = v13.Font;
    local l_Theme_0 = v13.Theme;
    local v16 = l_Font_0.BaseSize * l_Font_0.SubHeader1.RelativeSize;
    local v17 = Vector2.new(v16, v16);
    local v18 = l_useLocalization_0({
        freeText = v8.CatalogLabelFree, 
        offSaleText = v8.CatalogLabelOffSale
    });
    local v19 = nil;
    local v20 = false;
    if v12.isOffSale then
        if v10 and v12.lowestResalePrice and v12.lowestResalePrice > 0 then
            v19 = tostring(v12.lowestResalePrice);
            v20 = true;
        else
            v19 = v18.offSaleText;
        end;
    elseif v12.price == 0 then
        v19 = v18.freeText;
    elseif v12.price then
        v19 = tostring(v12.price);
        v20 = true;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 20), 
        Position = UDim2.fromOffset(0, -4)
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 4)
        }), 
        Icon = if v20 then v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Image = v11, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            Size = UDim2.fromOffset(v17.X, v17.Y)
        }) else nil, 
        Text = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, if v20 then -(v17.X + 4) else 0, 1, 0), 
            Font = l_Font_0.SubHeader1.Font, 
            TextColor3 = l_Theme_0.SecondaryContent.Color, 
            TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
            TextSize = v16, 
            Text = v19, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;