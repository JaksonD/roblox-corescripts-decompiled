local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(script.Parent.TileContext);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v9 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v10 = {
    FillDirection = Enum.FillDirection.Vertical, 
    isContained = false, 
    testId = "--foundation-tile"
};
return v2.forwardRef(function(v11, v12) --[[ Line: 36 ]] --[[ Name: Tile ]]
    -- upvalues: v7 (copy), v10 (copy), v2 (copy), v4 (copy), v5 (copy), v9 (copy), v6 (copy)
    local v13 = v7(v11, v10);
    return v2.createElement(v4, v5(v13, {
        tag = {
            ["bg-shift-200"] = v13.isContained, 
            ["gap-small"] = not v13.isContained, 
            ["radius-medium"] = true
        }, 
        stateLayer = {
            affordance = v9.None
        }, 
        onStateChanged = v13.onStateChanged, 
        layout = {
            FillDirection = v13.FillDirection, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        Size = v13.Size, 
        ref = v12
    }), {
        TileContext = if v13.children then v2.createElement(v6.Provider, {
            value = {
                isContained = v13.isContained, 
                fillDirection = v13.FillDirection, 
                testId = v13.testId
            }
        }, v13.children) else nil
    });
end);