local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.getTestIdTag);
local v6 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v7 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
return function(v8, v9) --[[ Line: 43 ]] --[[ Name: withGuiObjectProps ]]
    -- upvalues: v6 (copy), v3 (copy), v7 (copy), v2 (copy), v5 (copy)
    if type(v9) == "table" then
        v9.AutoLocalize = v8.AutoLocalize;
        v9.AutomaticSize = v8.AutomaticSize;
        v9.BackgroundColor3 = if v8.backgroundStyle then v6(v8.backgroundStyle, "Color3") else nil;
        v9.BackgroundTransparency = if v8.backgroundStyle then v6(v8.backgroundStyle, "Transparency") else nil;
        v9.BorderSizePixel = v8.BorderSizePixel;
        v9.BorderColor3 = v8.BorderColor3;
        v9.BorderMode = v8.BorderMode;
        v9.ClipsDescendants = v8.ClipsDescendants;
        v9.Rotation = v8.Rotation;
        v9.SizeConstraint = v8.SizeConstraint;
        if v8.selection then
            v9.Selectable = v8.selection.Selectable;
            v9.SelectionImageObject = v8.selection.SelectionImageObject;
            v9.SelectionOrder = v8.selection.SelectionOrder;
            v9.NextSelectionDown = v8.selection.NextSelectionDown;
            v9.NextSelectionLeft = v8.selection.NextSelectionLeft;
            v9.NextSelectionRight = v8.selection.NextSelectionRight;
            v9.NextSelectionUp = v8.selection.NextSelectionUp;
        end;
        if v8.selectionGroup ~= nil then
            if type(v8.selectionGroup) == "boolean" or v3.isBinding(v8.selectionGroup) then
                v9.SelectionGroup = v8.selectionGroup;
            else
                local l_selectionGroup_0 = v8.selectionGroup;
                v9.SelectionGroup = true;
                v9.SelectionBehaviorUp = l_selectionGroup_0.SelectionBehaviorUp;
                v9.SelectionBehaviorDown = l_selectionGroup_0.SelectionBehaviorDown;
                v9.SelectionBehaviorLeft = l_selectionGroup_0.SelectionBehaviorLeft;
                v9.SelectionBehaviorRight = l_selectionGroup_0.SelectionBehaviorRight;
            end;
        end;
        v9.Size = v8.Size;
    end;
    local v11 = v7(v8, v9);
    v11[v2.Change.AbsoluteSize] = v8.onAbsoluteSizeChanged;
    v11.onAbsoluteSizeChanged = nil;
    v11[v2.Change.AbsolutePosition] = v8.onAbsolutePositionChanged;
    v11.onAbsolutePositionChanged = nil;
    local v12 = v5(v11.testId);
    if v11[v2.Tag] and v12 then
        local l_Tag_0 = v2.Tag;
        v11[l_Tag_0] = v11[l_Tag_0] .. " " .. v12;
    else
        v11[v2.Tag] = v11[v2.Tag] or v12;
    end;
    v11.testId = nil;
    return v11;
end;