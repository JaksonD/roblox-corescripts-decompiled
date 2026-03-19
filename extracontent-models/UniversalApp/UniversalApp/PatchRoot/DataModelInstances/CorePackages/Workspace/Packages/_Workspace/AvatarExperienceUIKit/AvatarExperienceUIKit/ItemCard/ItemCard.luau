local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v3 = require(l_Parent_0.UIBlox);
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v7 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v7.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
local l_FFlagAXMISEnableMultiShopping_0 = v7.FFlagAXMISEnableMultiShopping;
return (v1.forwardRef(function(v10, v11) --[[ Line: 27 ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_useTokens_0 (copy), v1 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy)
    local v12 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useSelectionCursor_0(l_CursorKind_0.RoundedRect) else nil;
    local v13 = l_useTokens_0();
    return v1.createElement("TextButton", {
        Selectable = if l_FFlagAXMISEnableMultiShopping_0 then v10.Selectable else nil, 
        SelectionImageObject = v12, 
        Text = "", 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v1.Event.Activated] = if v10.isDisabled then nil else v10.onActivated, 
        ref = v11, 
        Size = v10.Size, 
        AutomaticSize = v10.AutomaticSize, 
        LayoutOrder = v10.LayoutOrder, 
        SelectionGroup = true, 
        ClipsDescendants = not l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 or nil, 
        [v1.Tag] = v10.tag
    }, {
        ItemCardListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v13.Gap.Small)
        }), 
        ItemCardHeaderSlot = v10.headerSlot, 
        ItemCardFooterSlot = v10.footerSlot
    });
end));