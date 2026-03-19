local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactIs);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v7 = require(l_script_FirstAncestor_0.Constants);
local v8 = require(l_Components_0.Icon);
local v9 = require(l_Components_0.Image);
local _ = require(l_Components_0.Types);
local v11 = require(l_Components_0.View);
local v12 = require(l_script_FirstAncestor_0.Utility.blendTransparencies);
local v13 = require(l_script_FirstAncestor_0.Utility.useBindable);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(script.Parent.useKnobVariants);
local v17 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
local v19 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v20 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v21 = require(l_script_FirstAncestor_0.Utility.Flags);
local v22 = {
    size = v20.Medium, 
    hasShadow = true, 
    isDisabled = false, 
    testId = "--foundation-knob"
};
return v4.memo(function(v23) --[[ Line: 49 ]] --[[ Name: Knob ]]
    -- upvalues: v15 (copy), v22 (copy), v17 (copy), l_usePresentationContext_0 (copy), v16 (copy), v19 (copy), v4 (copy), v13 (copy), v5 (copy), v11 (copy), v14 (copy), v21 (copy), v8 (copy), v12 (copy), v7 (copy), v3 (copy), v9 (copy)
    local v24 = v15(v23, v22);
    local v25 = v17();
    local v26 = l_usePresentationContext_0();
    local v27 = v16(v25, v24.size, v26 and v26.colorMode == v19.Inverse);
    local v28 = v24.style or v27.knob.style;
    local v30 = v4.useCallback(function(v29) --[[ Line: 57 ]]
        -- upvalues: v25 (copy)
        return {
            Color3 = v25.Color.Extended.White.White_100.Color3, 
            Transparency = v29.Transparency
        };
    end, {
        v25
    });
    local v31 = v13(if v24.stroke then v24.stroke.Transparency else nil);
    local v32 = v13(v28);
    local v33 = v13(v27.knob.style);
    local v37 = v4.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v27 (copy), v24 (copy), v5 (ref)
        local l_size_0 = v27.knob.size;
        if v24.stroke and v24.stroke.Thickness then
            if v5.isBinding(v24.stroke.Thickness) then
                return v24.stroke.Thickness:map(function(v35) --[[ Line: 72 ]]
                    -- upvalues: l_size_0 (ref)
                    return l_size_0 - UDim2.fromOffset(v35 * 2, v35 * 2);
                end);
            else
                local l_Thickness_0 = v24.stroke.Thickness;
                l_size_0 = l_size_0 - UDim2.fromOffset(l_Thickness_0 * 2, l_Thickness_0 * 2);
            end;
        end;
        return l_size_0;
    end, {
        v27, 
        v24.stroke
    });
    return v4.createElement(v11, v14(v24, {
        Size = v27.knob.size, 
        isDisabled = if v21.FoundationToggleVisualUpdate then v24.isDisabled else nil
    }), {
        Icon = if v21.FoundationToggleVisualUpdate and v24.icon then v4.createElement(v11, {
            tag = v27.knob.tag, 
            Size = v37, 
            ZIndex = 4, 
            backgroundStyle = v27.iconContainer.backgroundStyle
        }, v4.createElement(v8, {
            name = v24.icon.name, 
            variant = v24.icon.variant, 
            style = if v24.isDisabled then v33:map(function(v38) --[[ Line: 104 ]]
                -- upvalues: v12 (ref), v7 (ref)
                return {
                    Color3 = v38.Color3, 
                    Transparency = v12(v38.Transparency, v7.DISABLED_TRANSPARENCY)
                };
            end) else v27.knob.style, 
            size = v27.knob.iconSize, 
            testId = ("%*--icon"):format(v24.testId)
        })) else v4.createElement(v11, {
            tag = v27.knob.tag, 
            backgroundStyle = if v24.isDisabled then v32:map(function(v39) --[[ Line: 121 ]]
                -- upvalues: v12 (ref), v7 (ref)
                return {
                    Color3 = v39.Color3, 
                    Transparency = v12(v39.Transparency, v7.DISABLED_TRANSPARENCY)
                };
            end) else v28, 
            Size = v37, 
            stroke = v31:map(function(v40) --[[ Line: 130 ]]
                -- upvalues: v24 (copy), v3 (ref), v12 (ref), v7 (ref)
                local l_stroke_0 = v24.stroke;
                if v24.stroke and v40 ~= nil and v24.isDisabled then
                    l_stroke_0 = v3.join(l_stroke_0, {
                        Transparency = v12(v40, v7.DISABLED_TRANSPARENCY)
                    });
                end;
                return l_stroke_0;
            end):getValue(), 
            ZIndex = 4, 
            testId = ("%*--circle"):format(v24.testId)
        }), 
        Shadow = if not v24.hasShadow or v21.FoundationToggleVisualUpdate and v24.isDisabled then nil else v4.createElement(v9, {
            tag = v27.knobShadow.tag, 
            imageStyle = if v5.isBinding(v28) then v28:map(v30) else v30(v28), 
            Image = "component_assets/dropshadow_28", 
            Size = v27.knobShadow.size, 
            ZIndex = 3, 
            testId = ("%*--shadow"):format(v24.testId)
        })
    });
end);