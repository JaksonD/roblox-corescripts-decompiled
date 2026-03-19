local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_ExpandableTextArea_0 = v5.App.Text.ExpandableTextArea;
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v15 = v7.wrap(v6.strictInterface({
    compactNumberOfLines = v6.optional(v6.integer), 
    descriptionText = v6.optional(v6.string), 
    width = v6.optional(v6.integer), 
    Position = v6.optional(v6.UDim2), 
    LayoutOrder = v6.optional(v6.integer), 
    forwardRef = v6.optional(v6.table), 
    NextSelectionUp = if v13() then v6.optional(v6.table) else nil, 
    NextSelectionDown = v6.optional(v6.table)
}));
local function v28(v16, v17, v18) --[[ Line: 53 ]] --[[ Name: renderItemDescription ]]
    -- upvalues: v13 (copy), v3 (copy), l_ExpandableTextArea_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_ShimmerPanel_0 (copy)
    local v19 = v18.compactNumberOfLines or 3;
    local l_descriptionText_0 = v18.descriptionText;
    local l_Position_0 = v18.Position;
    local l_LayoutOrder_0 = v18.LayoutOrder;
    local v23 = if v13() then v18.NextSelectionUp else nil;
    local l_NextSelectionDown_0 = v18.NextSelectionDown;
    if l_descriptionText_0 then
        return v3.createElement(l_ExpandableTextArea_0, {
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_Position_0, 
            Text = l_descriptionText_0, 
            compactNumberOfLines = v19, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v23, 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_NextSelectionDown_0
        });
    else
        local l_Font_0 = v16.Font;
        local v26 = v19 * (l_Font_0.BaseSize * l_Font_0.Body.RelativeSize) + 5;
        local v27 = v26 + 30;
        return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v27), 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v23, 
            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_NextSelectionDown_0, 
            SelectionImageObject = v17
        }, {
            ShimmerPanel = v3.createElement(l_ShimmerPanel_0, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v26)
            })
        });
    end;
end;
local function v34(v29) --[[ Line: 94 ]] --[[ Name: ItemDescription ]]
    -- upvalues: v15 (copy), l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v28 (copy)
    assert(v15(v29));
    local l_LayoutOrder_1 = v29.LayoutOrder;
    local l_forwardRef_0 = v29.forwardRef;
    local v32 = l_useStyle_0();
    local v33 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        LayoutOrder = l_LayoutOrder_1, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        [v3.Ref] = l_forwardRef_0, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v29.NextSelectionDown, 
        SelectionImageObject = v33
    }, {
        v28(v32, v33, v29)
    });
end;
return v3.forwardRef(function(v35, v36) --[[ Line: 118 ]]
    -- upvalues: v3 (copy), v34 (copy), v2 (copy)
    return v3.createElement(v34, v2.Dictionary.join(v35, {
        forwardRef = v36
    }));
end);