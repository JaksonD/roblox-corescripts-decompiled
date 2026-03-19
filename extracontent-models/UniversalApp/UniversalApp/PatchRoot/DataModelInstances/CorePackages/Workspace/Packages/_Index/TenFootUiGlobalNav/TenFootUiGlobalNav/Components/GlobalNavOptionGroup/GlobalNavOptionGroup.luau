local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.GlobalNavOption);
local v5 = require(script.Parent.GlobalNavOptionTooltip);
local v6 = require(l_script_FirstAncestor_0.Components.utils.eraseKeys);
local function v15(v7, v8) --[[ Line: 17 ]] --[[ Name: makeButtonTooltipMap ]]
    -- upvalues: v3 (copy)
    local v11 = v3.List.filter(v7:GetDescendants(), function(v9, _) --[[ Line: 21 ]]
        return v9:IsA("ImageButton");
    end);
    return v3.List.foldLeft(v11, function(v12, v13, v14) --[[ Line: 25 ]]
        -- upvalues: v8 (copy)
        v12[v13] = if v8[v14] then v8[v14].label else nil;
        return v12;
    end, {});
end;
local function v20(v16, v17, v18) --[[ Line: 31 ]] --[[ Name: makeToolTipProps ]]
    local v19 = v18[v16];
    if v19 then
        return {
            label = v19, 
            xOffset = v16.AbsolutePosition.X - v17.AbsolutePosition.X + v16.Size.X.Offset / 2, 
            yOffset = v16.Position.Y.Offset + v16.Size.Y.Offset - 10
        };
    else
        return nil;
    end;
end;
return function(v21) --[[ Line: 54 ]] --[[ Name: GlobalNavOptionGroup ]]
    -- upvalues: v2 (copy), v6 (copy), v3 (copy), v4 (copy), v15 (copy), v20 (copy), v5 (copy)
    local v22, v23 = v2.useState(nil);
    local v24 = v6({
        "items", 
        "spacing"
    }, v21);
    local v27 = v3.List.map(v21.items, function(v25, v26) --[[ Line: 58 ]]
        -- upvalues: v2 (ref), v4 (ref)
        return v2.createElement(v4, {
            key = v25.label .. "-" .. v26, 
            icon = v25.icon, 
            onActivated = v25.onActivated
        });
    end);
    return v2.createElement("Frame", v3.Dictionary.join({
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, v24), v2.createElement("Frame", {
        Name = "Options", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v2.Event.SelectionChanged] = function(v28, _, _, v31) --[[ Line: 79 ]]
            -- upvalues: v15 (ref), v21 (copy), v23 (copy), v20 (ref)
            local v32 = v15(v28, v21.items);
            v23((v20(v31, v28, v32)));
        end
    }, v2.createElement("UIListLayout", {
        key = "globalNavOptionGroupLayout", 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, v21.spacing or 0)
    }), table.unpack(v27)), if v22 then v2.createElement(v5, v22) else nil);
end;