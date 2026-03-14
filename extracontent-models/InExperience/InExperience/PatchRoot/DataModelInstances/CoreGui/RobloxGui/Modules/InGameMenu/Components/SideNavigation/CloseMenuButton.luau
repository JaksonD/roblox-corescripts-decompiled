local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Cryo_0 = v1.Cryo;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.GlobalConfig);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v12 = l_t_0.strictInterface({
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback, 
    onSelectionGained = l_t_0.optional(l_t_0.callback), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    forwardRef = l_t_0.optional(l_t_0.table)
});
local function v15(v13, v14) --[[ Line: 29 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v10 (copy), v12 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), v9 (copy), l_CursorKind_0 (copy)
    if v10.propValidation then
        assert(v12(v13));
    end;
    return l_Roact_0.createElement(l_ImageSetButton_0, {
        AnchorPoint = v13.AnchorPoint, 
        BackgroundTransparency = 1, 
        Image = v9.Images.CloseButton, 
        Position = v13.Position, 
        Size = UDim2.new(0, 32, 0, 32), 
        LayoutOrder = v13.layoutOrder, 
        SelectionImageObject = v14(l_CursorKind_0.RoundedRect), 
        [l_Roact_0.Event.Activated] = v13.onActivated, 
        [l_Roact_0.Event.SelectionGained] = v13.onSelectionGained, 
        [l_Roact_0.Event.SelectionLost] = v13.onSelectionLost, 
        [l_Roact_0.Ref] = v13.forwardRef
    });
end;
local function v18(v16) --[[ Line: 50 ]] --[[ Name: CloseMenuButton ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), v15 (copy)
    return l_withSelectionCursorProvider_0(function(v17) --[[ Line: 51 ]]
        -- upvalues: v15 (ref), v16 (copy)
        return v15(v16, v17);
    end);
end;
return l_Roact_0.forwardRef(function(v19, v20) --[[ Line: 56 ]]
    -- upvalues: l_Roact_0 (copy), v18 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v18, l_Cryo_0.Dictionary.join(v19, {
        forwardRef = v20
    }));
end);