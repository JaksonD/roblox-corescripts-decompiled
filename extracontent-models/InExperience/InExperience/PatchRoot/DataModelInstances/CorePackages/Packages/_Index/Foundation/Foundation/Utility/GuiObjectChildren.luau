local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.AspectRatio);
local v4 = require(l_script_FirstAncestor_0.Components.Padding);
local v5 = require(l_script_FirstAncestor_0.Utility.getTestIdTag);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v7) --[[ Line: 15 ]] --[[ Name: GuiObjectChildren ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v4 (copy)
    local l_testId_0 = v7.testId;
    return {
        Children = v2.createElement(v2.Fragment, {}, v7.children), 
        AspectRatio = if v7.aspectRatio ~= nil then v2.createElement(v3, {
            value = v7.aspectRatio, 
            testId = if l_testId_0 then ("%*--aspect-ratio"):format(l_testId_0) else nil
        }) else nil, 
        CornerRadius = if v7.cornerRadius ~= nil then v2.createElement("UICorner", {
            CornerRadius = v7.cornerRadius, 
            [v2.Tag] = v5(l_testId_0, "corner-radius")
        }) else nil, 
        FlexItem = if v7.flexItem ~= nil then v2.createElement("UIFlexItem", {
            FlexMode = v7.flexItem.FlexMode, 
            GrowRatio = v7.flexItem.GrowRatio, 
            ShrinkRatio = v7.flexItem.ShrinkRatio, 
            ItemLineAlignment = v7.flexItem.ItemLineAlignment, 
            [v2.Tag] = v5(l_testId_0, "flex-item")
        }) else nil, 
        ListLayout = if v7.layout ~= nil and v7.layout.FillDirection ~= nil then v2.createElement("UIListLayout", {
            FillDirection = v7.layout.FillDirection, 
            ItemLineAlignment = v7.layout.ItemLineAlignment, 
            HorizontalAlignment = v7.layout.HorizontalAlignment, 
            HorizontalFlex = v7.layout.HorizontalFlex, 
            VerticalAlignment = v7.layout.VerticalAlignment, 
            VerticalFlex = v7.layout.VerticalFlex, 
            Padding = v7.layout.Padding, 
            SortOrder = v7.layout.SortOrder, 
            Wraps = v7.layout.Wraps, 
            [v2.Tag] = v5(l_testId_0, "list-layout")
        }) else nil, 
        SizeConstraint = if v7.sizeConstraint ~= nil then v2.createElement("UISizeConstraint", {
            MaxSize = v7.sizeConstraint.MaxSize, 
            MinSize = v7.sizeConstraint.MinSize, 
            [v2.Tag] = v5(l_testId_0, "size-constraint")
        }) else nil, 
        Padding = if v7.padding ~= nil then v2.createElement(v4, {
            value = v7.padding, 
            testId = if l_testId_0 then ("%*--padding"):format(l_testId_0) else nil
        }) else nil, 
        Scale = if v7.scale ~= nil then v2.createElement("UIScale", {
            Scale = v7.scale, 
            [v2.Tag] = v5(l_testId_0, "scale")
        }) else nil, 
        Stroke = if v7.stroke ~= nil then v2.createElement("UIStroke", {
            Color = v7.stroke.Color, 
            Thickness = v7.stroke.Thickness, 
            Transparency = v7.stroke.Transparency, 
            LineJoinMode = v7.stroke.LineJoinMode, 
            BorderStrokePosition = v7.stroke.BorderStrokePosition, 
            [v2.Tag] = v5(l_testId_0, "stroke")
        }) else nil
    };
end;