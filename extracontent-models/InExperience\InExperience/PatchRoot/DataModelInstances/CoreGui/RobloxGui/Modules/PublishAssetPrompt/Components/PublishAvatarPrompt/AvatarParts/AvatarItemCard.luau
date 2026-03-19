local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v3 = require(script.Parent.AvatarPartViewport);
return function(v4) --[[ Line: 22 ]] --[[ Name: AvatarItemCard ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), v3 (copy)
    local v5 = l_useStyle_0();
    local l_Font_0 = v5.Font;
    local l_Theme_0 = v5.Theme;
    local l_asset_0 = v4.asset;
    local l_CaptionHeader_0 = l_Font_0.CaptionHeader;
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local v11 = true;
    if typeof(l_asset_0) ~= "table" then
        v11 = l_asset_0:IsA("MeshPart") or l_asset_0:IsA("Accessory");
    end;
    assert(v11, "Assert that asset is a table, MeshPart, or Accessory");
    local l_bodyName_0 = v4.bodyName;
    v11 = v4.partName;
    local v13 = l_bodyName_0 and v11;
    local v14 = nil;
    if l_bodyName_0 and v11 then
        assert(l_bodyName_0, "bodyName is nil");
        assert(v11, "partName is nil");
        v14 = l_bodyName_0 .. "'s " .. v11;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v4.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 5)
        }), 
        AvatarPartViewport = v1.createElement(v3, {
            asset = l_asset_0, 
            LayoutOrder = 1, 
            viewportSize = v4.viewportSize
        }), 
        TitleText = v13 and v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Text = v14, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(1, 0, 0, 50), 
            TextColor3 = l_Color_0, 
            TextWrapped = true, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.RelativeSize * l_Font_0.BaseSize, 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;