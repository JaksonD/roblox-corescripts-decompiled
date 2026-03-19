local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.GlobalConfig);
local v7 = require(l_Parent_0.Components.ThemedTextLabel);
local l_KeyLabel_0 = l_UIBlox_0.App.Menu.KeyLabel;
local v9 = require(l_Parent_0.Components.PointerLabel);
local v10 = require(l_Parent_0.Components.Divider);
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = l_t_0.strictInterface({
    actionDescription = l_t_0.string, 
    inputs = l_t_0.table, 
    isList = l_t_0.optional(l_t_0.boolean), 
    hasDivider = l_t_0.boolean, 
    LayoutOrder = l_t_0.integer
});
local function v18(v13, v14, v15) --[[ Line: 30 ]] --[[ Name: renderHorizontalSpacer ]]
    -- upvalues: l_Roact_0 (copy), v7 (copy)
    local v16 = v15 and UDim2.new(0, 19, 0, 24) or UDim2.new(0, 19, 0, 16);
    local v17 = v15 and Enum.TextYAlignment.Bottom;
    return l_Roact_0.createElement(v7, {
        themeKey = "TextEmphasis", 
        fontKey = "Header1", 
        Text = v13, 
        Size = v16, 
        TextYAlignment = v17, 
        LayoutOrder = v14
    });
end;
local function v21(v19, v20) --[[ Line: 44 ]] --[[ Name: renderKey ]]
    -- upvalues: l_Roact_0 (copy), l_KeyLabel_0 (copy), v9 (copy)
    if v19.EnumType == Enum.KeyCode then
        return l_Roact_0.createElement(l_KeyLabel_0, {
            keyCode = v19, 
            textThemeKey = "TextEmphasis", 
            LayoutOrder = v20
        });
    else
        return l_Roact_0.createElement(v9, {
            input = v19, 
            LayoutOrder = v20
        });
    end;
end;
local function v32(v22, v23) --[[ Line: 60 ]] --[[ Name: renderInputIconContainer ]]
    -- upvalues: l_Roact_0 (copy), v21 (copy), v18 (copy)
    local v24 = {};
    local v25 = not v23 and 7 or 0;
    v24.ListLayout = l_Roact_0.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, v25)
    });
    local v26 = 1;
    for v27, v28 in ipairs(v22) do
        if typeof(v28) ~= "table" then
            v24["input" .. v27] = v21(v28, v26);
            v26 = v26 + 1;
            if v23 and v27 == #v22 then
                v24.Elipses = v18("...", v26, true);
            end;
        else
            for v29, v30 in ipairs(v28) do
                local v31 = string.format("%d_%d", v27, v29);
                v24["groupedInput" .. v31] = v21(v30, v26);
                v26 = v26 + 1;
                if v29 < #v28 then
                    v24["groupedDivider" .. v31] = v18("+", v26);
                    v26 = v26 + 1;
                end;
            end;
        end;
        if not v23 and v27 < #v22 then
            v24["divider" .. v27] = v18("/", v26);
            v26 = v26 + 1;
        end;
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 1, 0), 
        Position = UDim2.new(1, 0, 0, 0)
    }, v24);
end;
return function(v33) --[[ Line: 115 ]] --[[ Name: ControlEntry ]]
    -- upvalues: v6 (copy), v12 (copy), v11 (copy), l_Roact_0 (copy), v7 (copy), v10 (copy), v32 (copy)
    if v6.propValidation then
        assert(v12(v33));
    end;
    return v11({
        actionDescription = v33.actionDescription
    })(function(v34) --[[ Line: 122 ]]
        -- upvalues: l_Roact_0 (ref), v33 (copy), v7 (ref), v10 (ref), v32 (ref)
        return l_Roact_0.createElement("Frame", {
            LayoutOrder = v33.LayoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 50)
        }, {
            ActionLabel = l_Roact_0.createElement(v7, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(0, 200, 0, 22), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Text = v34.actionDescription
            }), 
            Divider = v33.hasDivider and l_Roact_0.createElement(v10, {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, -1)
            }), 
            Inputs = v32(v33.inputs, v33.isList)
        });
    end);
end;