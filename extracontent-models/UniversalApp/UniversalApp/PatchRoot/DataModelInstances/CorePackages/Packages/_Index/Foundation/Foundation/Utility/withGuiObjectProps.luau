local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local v6 = require(l_script_FirstAncestor_0.Utility.getTestIdTag);
local v7 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = v5.FoundationGuiObjectInputSinkProperty and pcall(game.GetEngineFeature, game, "GuiObjectInputSink");
return function(v10, v11) --[[ Line: 52 ]] --[[ Name: withGuiObjectProps ]]
    -- upvalues: v7 (copy), v9 (copy), v3 (copy), v8 (copy), v2 (copy), v6 (copy)
    if type(v11) == "table" then
        v11.AutoLocalize = v10.AutoLocalize;
        v11.AutomaticSize = v10.AutomaticSize;
        v11.BackgroundColor3 = if v10.backgroundStyle then v7(v10.backgroundStyle, "Color3") else nil;
        v11.BackgroundTransparency = if v10.backgroundStyle then v7(v10.backgroundStyle, "Transparency") else nil;
        v11.BorderSizePixel = v10.BorderSizePixel;
        v11.BorderColor3 = v10.BorderColor3;
        v11.BorderMode = v10.BorderMode;
        v11.ClipsDescendants = v10.ClipsDescendants;
        if v9 then
            v11.InputSink = v10.InputSink;
        end;
        v11.Rotation = v10.Rotation;
        v11.SizeConstraint = v10.SizeConstraint;
        if v10.selection then
            v11.Selectable = v10.selection.Selectable;
            v11.SelectionImageObject = v10.selection.SelectionImageObject;
            v11.SelectionOrder = v10.selection.SelectionOrder;
            v11.NextSelectionDown = v10.selection.NextSelectionDown;
            v11.NextSelectionLeft = v10.selection.NextSelectionLeft;
            v11.NextSelectionRight = v10.selection.NextSelectionRight;
            v11.NextSelectionUp = v10.selection.NextSelectionUp;
        end;
        if v10.selectionGroup ~= nil then
            if type(v10.selectionGroup) == "boolean" or v3.isBinding(v10.selectionGroup) then
                v11.SelectionGroup = v10.selectionGroup;
            else
                local l_selectionGroup_0 = v10.selectionGroup;
                v11.SelectionGroup = true;
                v11.SelectionBehaviorUp = l_selectionGroup_0.SelectionBehaviorUp;
                v11.SelectionBehaviorDown = l_selectionGroup_0.SelectionBehaviorDown;
                v11.SelectionBehaviorLeft = l_selectionGroup_0.SelectionBehaviorLeft;
                v11.SelectionBehaviorRight = l_selectionGroup_0.SelectionBehaviorRight;
            end;
        end;
        v11.Size = v10.Size;
    end;
    local v13 = v8(v10, v11);
    v13[v2.Change.AbsoluteSize] = v10.onAbsoluteSizeChanged;
    v13.onAbsoluteSizeChanged = nil;
    v13[v2.Change.AbsolutePosition] = v10.onAbsolutePositionChanged;
    v13.onAbsolutePositionChanged = nil;
    local v14 = v6(v13.testId);
    if v13[v2.Tag] and v14 then
        local l_Tag_0 = v2.Tag;
        v13[l_Tag_0] = v13[l_Tag_0] .. " " .. v14;
    else
        v13[v2.Tag] = v13[v2.Tag] or v14;
    end;
    v13.testId = nil;
    return v13;
end;