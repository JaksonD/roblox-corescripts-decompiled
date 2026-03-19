local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_useCursor_0 = v2.App.SelectionCursor.useCursor;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local v9 = l_Images_0["icons/navigation/pushRight"];
SeeAllTile = function(v10) --[[ Line: 31 ]] --[[ Name: SeeAllTile ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_useCursor_0 (copy), v9 (copy), v1 (copy), l_ImageSetLabel_0 (copy)
    local v11 = if l_FFlagSduiServerCompat_0 then v10.size else v10.Size;
    local v12 = if l_FFlagSduiServerCompat_0 then v10.layoutOrder else v10.LayoutOrder;
    local v13 = l_useDesignTokens_0();
    local v14 = l_useLocalization_0({
        seeAll = "Feature.Home.ActionSeeAll"
    });
    local v15 = UDim.new(0, v13.Global.Space_100);
    local v16 = l_useCursor_0(v15);
    local l_Subheader_0 = v13.Semantic.Typography.Subheader;
    local l_Color3_0 = v13.Semantic.Color.Text.Emphasis.Color3;
    local l_Color3_1 = v13.Semantic.Color.Icon.Emphasis.Color3;
    local l_Transparency_0 = v13.Semantic.Color.Icon.Emphasis.Transparency;
    local v21 = v10.title or v14.seeAll;
    local v22 = v10.icon or v9;
    local l_Medium_0 = v13.Semantic.Icon.Size.Medium;
    return v1.createElement("TextButton", {
        AutoButtonColor = false, 
        Text = "", 
        Size = v11, 
        LayoutOrder = v12, 
        BackgroundTransparency = v13.Semantic.Color.BackgroundUi.Default.Transparency, 
        BackgroundColor3 = v13.Semantic.Color.BackgroundUi.Default.Color3, 
        [v1.Event.Activated] = v10.onActivated, 
        SelectionImageObject = v16
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = v15
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v13.Global.Space_50)
        }), 
        Icon = v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(l_Medium_0, l_Medium_0), 
            BackgroundTransparency = 1, 
            Image = v22, 
            ImageColor3 = l_Color3_1, 
            ImageTransparency = l_Transparency_0, 
            LayoutOrder = 1
        }), 
        Title = v1.createElement("TextLabel", {
            Text = v21, 
            Size = UDim2.new(1, 0, 0, l_Subheader_0.FontSize), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            LayoutOrder = 2, 
            Font = l_Subheader_0.Font, 
            TextSize = l_Subheader_0.FontSize, 
            TextColor3 = l_Color3_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        })
    });
end;
return SeeAllTile;