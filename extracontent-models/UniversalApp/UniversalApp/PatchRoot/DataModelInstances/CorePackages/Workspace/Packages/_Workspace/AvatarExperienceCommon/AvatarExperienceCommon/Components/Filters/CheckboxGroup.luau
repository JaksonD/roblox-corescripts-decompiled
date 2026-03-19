local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v4 = require(l_Parent_0.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local _ = require(l_Parent_0.Dash);
local v7 = require(script.Parent.CheckboxButtonItem);
local function v25(v8) --[[ Line: 65 ]] --[[ Name: CheckboxGroup ]]
    -- upvalues: v4 (copy), v1 (copy), l_Focusable_0 (copy), v7 (copy), l_View_0 (copy)
    local v9 = v4.useRefCache();
    local v10, v11 = v1.useBinding(0);
    local v12 = v4.useRefCache();
    local v16 = v1.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v8 (copy), v12 (copy), v11 (copy)
        local v13 = 0;
        for _, v15 in v8.items do
            v13 = v13 + (v12[v15.id].current or 0);
        end;
        v11(v13);
        if v8.onHeightChanged then
            v8.onHeightChanged(v13);
        end;
    end, {
        v8.items, 
        v12, 
        v11, 
        v8.onHeightChanged
    });
    local v17 = {
        layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 1)
        })
    };
    for v18, v19 in v8.items do
        local v20 = false;
        if v8.selectedValue then
            v20 = table.find(v8.selectedValue, v19.id) ~= nil;
        end;
        local v21 = v9["defaultChild-" .. v18];
        v17["checkboxItem" .. v19.id] = v1.createElement(l_Focusable_0[v7], {
            id = v19.id, 
            text = v19.text, 
            onActivated = v8.onActivated, 
            isSelected = v20, 
            isDisabled = v19.isDisabled, 
            layoutOrder = v18, 
            itemHeight = v8.itemHeight, 
            customView = v19.customView, 
            expandedView = v19.expandedView, 
            expandedViewHeight = v19.expandedViewHeight, 
            useDefaultControlState = v8.useDefaultControlState, 
            hideDivider = v8.hideDividers or v18 == #v8.items, 
            ref = v9[v18], 
            defaultChildRef = v21, 
            defaultChild = v21, 
            restorePreviousChildFocus = v20, 
            NextSelectionUp = if v18 > 1 then v9[v18 - 1] else nil, 
            NextSelectionDown = if v18 < #v8.items then v9[v18 + 1] else nil, 
            onHeightChanged = v1.useCallback(function(v22) --[[ Line: 116 ]]
                -- upvalues: v12 (copy), v19 (copy), v16 (copy)
                v12[v19.id].current = v22;
                v16();
            end, {
                v19.id, 
                v12, 
                v16
            })
        });
    end;
    local v23 = v8.items and #v8.items > 0;
    return v1.createElement(v23 and l_Focusable_0[l_View_0] or l_View_0, {
        defaultChild = v23 and v9[1] or nil, 
        Size = v10:map(function(v24) --[[ Line: 127 ]]
            return UDim2.new(1, 0, 0, v24);
        end), 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.layoutOrder, 
        NextSelectionLeft = v8.NextSelectionLeft, 
        NextSelectionRight = v8.NextSelectionRight, 
        NextSelectionDown = v8.NextSelectionDown, 
        NextSelectionUp = v8.NextSelectionUp, 
        restorePreviousChildFocus = v23 or nil, 
        ref = v8.frameRef
    }, v17);
end;
return v1.forwardRef(function(v26, v27) --[[ Line: 141 ]]
    -- upvalues: v1 (copy), v25 (copy), v2 (copy)
    return v1.createElement(v25, v2.Dictionary.join(v26, {
        frameRef = v27
    }));
end);