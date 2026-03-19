local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local v7 = require(l_script_FirstAncestor_0.Constants);
local v8 = require(l_Components_0.Icon);
local v9 = require(l_Components_0.Image);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_Components_0.View);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Enums.NumberInputControlsVariant);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local v15 = require(script.Parent.useNumberInputVariants);
local function v20(v16) --[[ Line: 48 ]]
    -- upvalues: v4 (copy), v3 (copy), v11 (copy), v12 (copy)
    local v17 = v4();
    local v18 = UDim.new(0, v17.Radius.Medium);
    local v19 = v3.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v18 (copy), v17 (copy)
        return {
            radius = v18, 
            offset = v17.Size.Size_150, 
            borderWidth = v17.Stroke.Thicker
        };
    end, {
        v17
    });
    return v3.createElement(v11, v12(v16, {
        onActivated = v16.onActivated, 
        isDisabled = v16.isDisabled, 
        selection = {
            Selectable = not v16.isDisabled
        }, 
        cursor = v19, 
        padding = v16.padding, 
        cornerRadius = v18, 
        tag = v16.tag
    }), v16.children);
end;
local function v26(v21) --[[ Line: 77 ]] --[[ Name: SplitControls ]]
    -- upvalues: v4 (copy), v15 (copy), v6 (copy), v3 (copy), v11 (copy), v7 (copy), v8 (copy), v2 (copy)
    local v22 = v4();
    local v23 = v15(v22, v21.size, if v6.FoundationNumberInputFixControlSizes then v21.variant else nil);
    local v24 = math.ceil(v22.Stroke.Standard) * 2;
    local v25 = UDim2.fromOffset(v23.splitButton.size - v24, v23.splitButton.size - v24);
    return v3.createElement(v3.Fragment, {}, {
        ControlIncrement = v3.createElement(v11, {
            onActivated = v21.increment.onClick, 
            isDisabled = v21.increment.isDisabled, 
            padding = v23.button.padding, 
            Size = v25, 
            stroke = {
                Color = v22.Color.Stroke.Emphasis.Color3, 
                Transparency = math.lerp(v22.Color.Stroke.Emphasis.Transparency, 1, if v21.increment.isDisabled then v7.DISABLED_TRANSPARENCY else 0), 
                Thickness = v22.Stroke.Standard
            }, 
            tag = v23.splitButton.tag, 
            LayoutOrder = 1, 
            GroupTransparency = if v21.increment.isDisabled then v7.DISABLED_TRANSPARENCY else nil, 
            testId = ("%*--increment"):format(v21.testId)
        }, {
            Icon = v3.createElement(v8, {
                name = v2.Icon.PlusSmall, 
                size = if v6.FoundationNumberInputFixControlSizes then v21.size else nil, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                testId = ("%*--increment-icon"):format(v21.testId)
            })
        }), 
        ControlDecrement = v3.createElement(v11, {
            onActivated = v21.decrement.onClick, 
            isDisabled = v21.decrement.isDisabled, 
            padding = v23.button.padding, 
            Size = v25, 
            stroke = {
                Color = v22.Color.Stroke.Emphasis.Color3, 
                Transparency = math.lerp(v22.Color.Stroke.Emphasis.Transparency, 1, if v21.decrement.isDisabled then v7.DISABLED_TRANSPARENCY else 0), 
                Thickness = v22.Stroke.Standard
            }, 
            tag = v23.splitButton.tag, 
            LayoutOrder = -1, 
            GroupTransparency = if v21.decrement.isDisabled then v7.DISABLED_TRANSPARENCY else nil, 
            testId = ("%*--decrement"):format(v21.testId)
        }, {
            Icon = v3.createElement(v8, {
                name = v2.Icon.MinusSmall, 
                size = if v6.FoundationNumberInputFixControlSizes then v21.size else nil, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                testId = ("%*--decrement-icon"):format(v21.testId)
            })
        })
    });
end;
local function v32(v27) --[[ Line: 150 ]] --[[ Name: StackedControls ]]
    -- upvalues: v4 (copy), v15 (copy), v6 (copy), v3 (copy), v7 (copy), v11 (copy), v20 (copy), v9 (copy)
    local v28 = v4();
    local v29 = v15(v28, v27.size, if v6.FoundationNumberInputFixControlSizes then v27.variant else nil);
    local v30 = v3.useMemo(function() --[[ Line: 158 ]]
        -- upvalues: v28 (copy), v27 (copy), v7 (ref)
        return {
            Color3 = v28.Color.Stroke.Emphasis.Color3, 
            Transparency = if v27.increment.isDisabled then v7.DISABLED_TRANSPARENCY else 0
        };
    end, {
        v28, 
        v27.increment.isDisabled
    });
    local v31 = v3.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v28 (copy), v27 (copy), v7 (ref)
        return {
            Color3 = v28.Color.Stroke.Emphasis.Color3, 
            Transparency = if v27.decrement.isDisabled then v7.DISABLED_TRANSPARENCY else 0
        };
    end, {
        v28, 
        v27.decrement.isDisabled
    });
    return v3.createElement(v11, {
        tag = "col", 
        Size = UDim2.new(0, v29.button.width, 1, 0), 
        LayoutOrder = v27.LayoutOrder
    }, {
        ControlIncrement = v3.createElement(v20, {
            onActivated = v27.increment.onClick, 
            isDisabled = v27.increment.isDisabled, 
            padding = v29.button.padding, 
            tag = v29.upButton.tag, 
            testId = ("%*--increment"):format(v27.testId)
        }, {
            Icon = v3.createElement(v9, {
                Image = "component_assets/triangleUp_16", 
                imageStyle = v30, 
                tag = v29.icon.tag, 
                testId = ("%*--increment-icon"):format(v27.testId)
            })
        }), 
        ControlDecrement = v3.createElement(v20, {
            tag = v29.downButton.tag, 
            onActivated = v27.decrement.onClick, 
            isDisabled = v27.decrement.isDisabled, 
            padding = v29.button.padding, 
            testId = ("%*--decrement"):format(v27.testId)
        }, {
            Icon = v3.createElement(v9, {
                Image = "component_assets/triangleDown_16", 
                imageStyle = v31, 
                tag = v29.icon.tag, 
                testId = ("%*--decrement-icon"):format(v27.testId)
            })
        })
    });
end;
return function(v33) --[[ Line: 208 ]] --[[ Name: NumberInputControls ]]
    -- upvalues: v13 (copy), v3 (copy), v32 (copy), v26 (copy)
    if v33.variant == v13.Stacked then
        return v3.createElement(v32, v33);
    else
        return v3.createElement(v26, v33);
    end;
end;