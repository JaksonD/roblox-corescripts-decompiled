local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceUIKit");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXLookAndFeelBackgrounds_0 = v4.FFlagAXLookAndFeelBackgrounds;
local l_FFlagAXAddTransparencyToItemCardHeader_0 = v4.FFlagAXAddTransparencyToItemCardHeader;
local v7 = require(l_script_FirstAncestor_0.BackgroundLayers.BackgroundLayers);
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v4.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
return function(v9) --[[ Line: 24 ]] --[[ Name: ItemCardHeader ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), l_FFlagAXAddTransparencyToItemCardHeader_0 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), v7 (copy)
    local v10 = l_useDesignTokens_0();
    local v11 = UDim.new(0, v10.Semantic.Radius.Medium);
    return v2.createElement("Frame", {
        Size = if v9.Size then v9.Size else UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v10.Semantic.Color.Common.Placeholder.Color3, 
        BackgroundTransparency = if l_FFlagAXAddTransparencyToItemCardHeader_0 then v9.BackgroundTransparency or v10.Semantic.Color.Common.Placeholder.Transparency else v10.Semantic.Color.Common.Placeholder.Transparency, 
        LayoutOrder = v9.LayoutOrder, 
        ZIndex = v9.ZIndex, 
        ClipsDescendants = not l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 or nil
    }, {
        CornerRadius = v2.createElement("UICorner", {
            CornerRadius = v11
        }), 
        AspectRatio = if not v9.Size then v2.createElement("UIAspectRatioConstraint", {
            AspectRatio = v9.aspectRatio or 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }) else nil, 
        Backgrounds = if l_FFlagAXLookAndFeelBackgrounds_0 and v9.backgroundLayers then v2.createElement(v7, {
            backgroundLayers = v9.backgroundLayers, 
            cornerRadius = v11, 
            ZIndex = 0
        }) else nil, 
        ItemCardHeaderChildren = v2.createElement(v2.Fragment, nil, v9.children), 
        ItemCardHeaderOverlaySlot = v9.overlaySlot
    });
end;