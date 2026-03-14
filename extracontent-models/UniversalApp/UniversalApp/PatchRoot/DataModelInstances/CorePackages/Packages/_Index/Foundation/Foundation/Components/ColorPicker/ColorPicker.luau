local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.ColorPicker.BrickColorPicker);
local v4 = require(l_script_FirstAncestor_0.Enums.ColorInputMode);
local v5 = require(l_script_FirstAncestor_0.Components.ColorPicker.ColorInputs);
local v6 = require(l_script_FirstAncestor_0.Components.ColorPicker.ColorSlider);
local v7 = require(l_script_FirstAncestor_0.Enums.ColorSliderType);
local v8 = require(l_script_FirstAncestor_0.Components.ColorPicker.SVPicker);
local v9 = require(l_script_FirstAncestor_0.Components.View);
local v10 = require(l_script_FirstAncestor_0.Utility.Flags);
local v11 = require(l_script_FirstAncestor_0.Components.ColorPicker.colorUtils);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v16 = {
    initialAlpha = 1, 
    initialMode = v4.RGB, 
    testId = "--foundation-color-picker"
};
return function(v17) --[[ Line: 38 ]] --[[ Name: ColorPicker ]]
    -- upvalues: v4 (copy), v14 (copy), v16 (copy), v12 (copy), v10 (copy), v2 (copy), v11 (copy), v9 (copy), v13 (copy), v5 (copy), v3 (copy), v8 (copy), v6 (copy), v7 (copy)
    local v18 = v17.availableModes or {
        v4.RGB, 
        v4.HSV, 
        v4.Hex, 
        v4.Brick
    };
    local v19 = v14(v17, v16);
    local l_Color3_0 = v12().Color.Extended.Magenta.Magenta_700.Color3;
    local v21 = v19.initialColor or l_Color3_0;
    if not v10.FoundationColorPickerPartialHSV and typeof(v21) ~= "Color3" then
        v21 = l_Color3_0;
    end;
    local v22, v23 = v2.useBinding(v21);
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    if v10.FoundationColorPickerPartialHSV and type(v21) == "table" then
        local l_v21_0 = v21;
        v24 = l_v21_0.H / 360;
        v25 = (l_v21_0.S or 100) / 100;
        v26 = (l_v21_0.V or 100) / 100;
    else
        local v28, v29, v30 = v21:ToHSV();
        v24 = v28;
        v25 = v29;
        v26 = v30;
    end;
    local v31, v32 = v2.useBinding(v24);
    local v33, v34 = v2.useBinding(v25);
    local v35, v36 = v2.useBinding(v26);
    local v37, v38 = v2.useBinding(v19.initialAlpha or 1);
    local v39, v40 = v2.useState(v19.initialMode or v4.RGB);
    local v41 = v22:map(v11.toColor3);
    local v43 = if v10.FoundationColorPickerPartialHSV then v22:map(function(v42) --[[ Line: 73 ]]
        -- upvalues: v11 (ref)
        return not v11.isPartialHSV(v42);
    end) else v2.createBinding(true);
    local v44 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v19 (copy), v18 (copy), v40 (copy)
        local l_initialMode_0 = v19.initialMode;
        if l_initialMode_0 then
            local v46 = false;
            for _, v48 in v18 do
                if v48 == l_initialMode_0 then
                    v46 = true;
                    break;
                end;
            end;
            if not v46 then
                warn((("ColorPicker: initialMode %* is not in availableModes. Using first available mode."):format(l_initialMode_0)));
                v40(v18[1]);
            end;
        end;
    end, {
        v19.initialMode
    });
    local v51 = v2.useCallback(function(v49, v50) --[[ Line: 99 ]]
        -- upvalues: v23 (copy), v19 (copy)
        v23(v49);
        v19.onColorChanged(v49, v50);
    end, {
        v19.onColorChanged
    });
    local v53 = v2.useCallback(function(v52) --[[ Line: 104 ]]
        -- upvalues: v38 (copy), v19 (copy)
        v38(v52);
        if v19.onAlphaChanged then
            v19.onAlphaChanged(v52);
        end;
    end, {
        v19.onAlphaChanged
    });
    local v55 = v2.useCallback(function(v54) --[[ Line: 111 ]]
        -- upvalues: v23 (copy), v51 (copy)
        v23(v54.Color);
        v51(v54.Color, v54);
    end, {
        v51
    });
    local v56 = false;
    if v19.onAlphaChanged ~= nil then
        v56 = v39 ~= v4.Brick;
    end;
    local v58 = v2.useCallback(function(v57) --[[ Line: 118 ]]
        -- upvalues: v51 (copy)
        v51(v57, nil);
    end, {
        v51
    });
    local v59 = v2.useCallback(v11.createHSVUpdateHandler(v32, v34, v36, v58, v44), {
        v58, 
        v32, 
        v34, 
        v36, 
        v23
    });
    local v60 = v2.useCallback(v11.createColorInputChangeHandler(v58, v44, v32, v34, v36), {
        v58, 
        v44, 
        v32, 
        v34, 
        v36
    });
    v2.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: v10 (ref), v41 (copy), v22 (copy), v32 (copy), v34 (copy), v36 (copy)
        local v61 = nil;
        local v62 = nil;
        local v63 = nil;
        if v10.FoundationColorPickerPartialHSV then
            local v64, v65, v66 = v41:getValue():ToHSV();
            v61 = v64;
            v62 = v65;
            v63 = v66;
        else
            local v67, v68, v69 = v22:getValue():ToHSV();
            v61 = v67;
            v62 = v68;
            v63 = v69;
        end;
        v32(v61);
        v34(v62);
        v36(v63);
    end, {});
    return v2.createElement(v9, v13(v19, {
        tag = "col gap-medium auto-xy align-x-center"
    }), {
        ColorInputs = v2.createElement(v5, {
            color = v22, 
            alpha = v37, 
            onColorChanged = v60, 
            onAlphaChanged = if v56 then v53 else nil, 
            mode = v39, 
            onModeChanged = v40, 
            availableModes = v18, 
            LayoutOrder = 1, 
            testId = ("%*--input"):format(v19.testId)
        }), 
        BrickPicker = if v39 == v4.Brick then v2.createElement(v3, {
            selectedColor = if v10.FoundationColorPickerPartialHSV then v41 else v22, 
            onBrickColorChanged = v55, 
            LayoutOrder = 2, 
            testId = ("%*--brick-picker"):format(v19.testId)
        }) else nil, 
        SVPickerContainer = if v39 ~= v4.Brick then v2.createElement(v9, {
            tag = "auto-xy", 
            LayoutOrder = 2
        }, {
            SVPicker = v2.createElement(v8, {
                hue = v31, 
                saturation = v33, 
                value = v35, 
                onChanged = function(v70, v71) --[[ Line: 194 ]] --[[ Name: onChanged ]]
                    -- upvalues: v59 (copy), v31 (copy)
                    v59(v31:getValue(), v70, v71);
                end, 
                showSelectionKnob = not v10.FoundationColorPickerPartialHSV or v43:getValue(), 
                testId = ("%*--sv-picker"):format(v19.testId)
            })
        }) else nil, 
        HueSlider = if v39 ~= v4.Brick then v2.createElement(v6, {
            sliderType = v7.Hue, 
            value = v31, 
            onValueChanged = function(v72) --[[ Line: 209 ]] --[[ Name: onValueChanged ]]
                -- upvalues: v59 (copy), v33 (copy), v35 (copy)
                v59(v72, v33:getValue(), v35:getValue());
            end, 
            LayoutOrder = 3, 
            testId = ("%*--hue-slider"):format(v19.testId)
        }) else nil, 
        AlphaSlider = if v56 then v2.createElement(v6, {
            sliderType = v7.Alpha, 
            value = v37, 
            baseColor = if v10.FoundationColorPickerPartialHSV then v41 else v22, 
            onValueChanged = v53, 
            LayoutOrder = 4, 
            testId = ("%*--alpha-slider"):format(v19.testId)
        }) else nil
    });
end;