local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.InternalInput);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v8 = require(l_script_FirstAncestor_0.Components.Knob.getKnobSize);
local function v12(v9) --[[ Line: 30 ]] --[[ Name: computeProps ]]
    local l_Offset_0 = v9.knobSize.X.Offset;
    local v11 = (v9.size.height - l_Offset_0) / 2;
    return {
        input = {
            tag = v9.tag, 
            size = UDim2.fromOffset(v9.size.width, v9.size.height), 
            stroke = {
                thickness = v9.strokeThickness
            }
        }, 
        knob = {
            offPosition = UDim2.new(0, v11, 0.5, 0), 
            onPosition = UDim2.new(0, v9.size.width - l_Offset_0 - v11, 0.5, 0)
        }
    };
end;
local function v16(v13) --[[ Line: 54 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v6 (copy), v2 (copy), v12 (copy), v8 (copy)
    local v14 = if v6.FoundationToggleVisualUpdate then {
        input = {
            colors = {
                backgroundStyle = v13.Color.ActionStandard.Background, 
                hoverStyle = v13.Color.State.Hover, 
                checkedStyle = v13.Color.System.Contrast, 
                labelStyle = v13.Color.Content.Emphasis, 
                labelHoverStyle = v13.Color.Content.Emphasis
            }, 
            cursorRadius = UDim.new(0, v13.Radius.Circle)
        }
    } else {
        input = {
            checkedStyle = v13.Color.ActionEmphasis.Background, 
            cursorRadius = UDim.new(0, v13.Radius.Circle)
        }
    };
    local v15 = if v6.FoundationToggleVisualUpdate then {
        [v2.XSmall] = v12({
            tag = "radius-circle", 
            size = {
                width = v13.Size.Size_700, 
                height = v13.Size.Size_400
            }, 
            knobSize = v8(v13, v2.XSmall), 
            strokeThickness = v13.Stroke.None
        }), 
        [v2.Small] = v12({
            tag = "radius-circle", 
            size = {
                width = v13.Size.Size_800, 
                height = v13.Size.Size_500
            }, 
            knobSize = v8(v13, v2.Small), 
            strokeThickness = v13.Stroke.None
        }), 
        [v2.Medium] = v12({
            tag = "radius-circle", 
            size = {
                width = v13.Size.Size_1000, 
                height = v13.Size.Size_600
            }, 
            knobSize = v8(v13, v2.Medium), 
            strokeThickness = v13.Stroke.None
        }), 
        [v2.Large] = v12({
            tag = "radius-circle", 
            size = {
                width = v13.Size.Size_1100, 
                height = v13.Size.Size_600
            }, 
            knobSize = v8(v13, v2.Medium), 
            strokeThickness = v13.Stroke.None
        })
    } else {
        [v2.XSmall] = v12({
            tag = "radius-large", 
            size = {
                width = v13.Size.Size_700, 
                height = v13.Size.Size_300
            }, 
            knobSize = v8(v13, v2.XSmall)
        }), 
        [v2.Small] = v12({
            tag = "radius-large", 
            size = {
                width = v13.Size.Size_800, 
                height = v13.Size.Size_400
            }, 
            knobSize = v8(v13, v2.Small)
        }), 
        [v2.Medium] = v12({
            tag = "radius-large", 
            size = {
                width = v13.Size.Size_1000, 
                height = v13.Size.Size_500
            }, 
            knobSize = v8(v13, v2.Medium)
        }), 
        [v2.Large] = v12({
            tag = "radius-circle", 
            size = {
                width = v13.Size.Size_1600, 
                height = v13.Size.Size_900
            }, 
            knobSize = v8(v13, v2.Large)
        })
    };
    return {
        common = v14, 
        sizes = v15
    };
end;
return function(v17, v18) --[[ Line: 127 ]]
    -- upvalues: v7 (copy), v16 (copy), v4 (copy)
    local v19 = v7.useVariants("Toggle", v16, v17);
    return v4(v19.common, v19.sizes[v18]);
end;