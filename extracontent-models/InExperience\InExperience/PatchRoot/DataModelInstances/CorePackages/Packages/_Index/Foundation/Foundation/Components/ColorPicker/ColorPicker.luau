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
local function _(v17) --[[ Line: 41 ]] --[[ Name: resolveInitialHSV ]]
    -- upvalues: v10 (copy)
    if v10.FoundationColorPickerPartialHSV and type(v17) == "table" then
        return v17.H / 360, (v17.S or 100) / 100, (v17.V or 100) / 100;
    else
        return v17:ToHSV();
    end;
end;
return function(v19) --[[ Line: 49 ]] --[[ Name: ColorPicker ]]
    -- upvalues: v4 (copy), v14 (copy), v16 (copy), v12 (copy), v10 (copy), v2 (copy), v11 (copy), v9 (copy), v13 (copy), v5 (copy), v3 (copy), v8 (copy), v6 (copy), v7 (copy)
    local v20 = v19.availableModes or {
        v4.RGB, 
        v4.HSV, 
        v4.Hex, 
        v4.Brick
    };
    local v21 = v14(v19, v16);
    local l_Color3_0 = v12().Color.Extended.Magenta.Magenta_700.Color3;
    local v23 = v21.initialColor or l_Color3_0;
    if not v10.FoundationColorPickerPartialHSV and typeof(v23) ~= "Color3" then
        v23 = l_Color3_0;
    end;
    local v24, v25 = v2.useBinding(v23);
    local l_v23_0 = v23;
    local v27, v28, v29;
    if v10.FoundationColorPickerPartialHSV and type(l_v23_0) == "table" then
        v27 = l_v23_0.H / 360;
        v28 = (l_v23_0.S or 100) / 100;
        v29 = (l_v23_0.V or 100) / 100;
    else
        local v30, v31, v32 = l_v23_0:ToHSV();
        v27 = v30;
        v28 = v31;
        v29 = v32;
    end;
    local v33;
    l_v23_0, v33 = v2.useBinding(v27);
    local v34, v35 = v2.useBinding(v28);
    local v36, v37 = v2.useBinding(v29);
    local v38, v39 = v2.useBinding(v21.initialAlpha or 1);
    local v40, v41 = v2.useState(v21.initialMode or v4.RGB);
    local v42 = v24:map(v11.toColor3);
    local v44 = if v10.FoundationColorPickerPartialHSV then v24:map(function(v43) --[[ Line: 76 ]]
        -- upvalues: v11 (ref)
        return not v11.isPartialHSV(v43);
    end) else v2.createBinding(true);
    local v45 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v21 (copy), v20 (copy), v41 (copy)
        local l_initialMode_0 = v21.initialMode;
        if l_initialMode_0 then
            local v47 = false;
            for _, v49 in v20 do
                if v49 == l_initialMode_0 then
                    v47 = true;
                    break;
                end;
            end;
            if not v47 then
                warn((("ColorPicker: initialMode %* is not in availableModes. Using first available mode."):format(l_initialMode_0)));
                v41(v20[1]);
            end;
        end;
    end, {
        v21.initialMode
    });
    local v52 = v2.useCallback(function(v50, v51) --[[ Line: 102 ]]
        -- upvalues: v25 (copy), v21 (copy)
        v25(v50);
        v21.onColorChanged(v50, v51);
    end, {
        v21.onColorChanged
    });
    local v54 = v2.useCallback(function(v53) --[[ Line: 107 ]]
        -- upvalues: v39 (copy), v21 (copy)
        v39(v53);
        if v21.onAlphaChanged then
            v21.onAlphaChanged(v53);
        end;
    end, {
        v21.onAlphaChanged
    });
    local v56 = v2.useCallback(function(v55) --[[ Line: 114 ]]
        -- upvalues: v10 (ref), v25 (copy), v52 (copy)
        if not v10.FoundationColorPickerDesignUpdate then
            v25(v55.Color);
        end;
        v52(v55.Color, v55);
    end, {
        v52
    });
    local v57 = if v10.FoundationColorPickerDesignUpdate then v21.onAlphaChanged ~= nil else v21.onAlphaChanged ~= nil and v40 ~= v4.Brick;
    local v59 = v2.useCallback(function(v58) --[[ Line: 125 ]]
        -- upvalues: v52 (copy)
        v52(v58, nil);
    end, {
        v52
    });
    local v60 = v2.useCallback(v11.createHSVUpdateHandler(v33, v35, v37, v59, v45), {
        v59, 
        v33, 
        v35, 
        v37, 
        v25
    });
    local v61 = v2.useCallback(v11.createColorInputChangeHandler(v59, v45, v33, v35, v37), {
        v59, 
        v45, 
        v33, 
        v35, 
        v37
    });
    v2.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: v10 (ref), v42 (copy), v24 (copy), v33 (copy), v35 (copy), v37 (copy)
        local v62 = nil;
        local v63 = nil;
        local v64 = nil;
        if v10.FoundationColorPickerPartialHSV then
            local v65, v66, v67 = v42:getValue():ToHSV();
            v62 = v65;
            v63 = v66;
            v64 = v67;
        else
            local v68, v69, v70 = v24:getValue():ToHSV();
            v62 = v68;
            v63 = v69;
            v64 = v70;
        end;
        v33(v62);
        v35(v63);
        v37(v64);
    end, {});
    return v2.createElement(v9, v13(v21, if v10.FoundationColorPickerDesignUpdate then {
        tag = "col gap-small auto-y padding-small size-full-0"
    } else {
        tag = "col gap-medium auto-xy align-x-center"
    }), {
        ColorInputs = v2.createElement(v5, {
            color = v24, 
            alpha = v38, 
            onColorChanged = v61, 
            onAlphaChanged = if v57 then v54 else nil, 
            mode = v40, 
            onModeChanged = v41, 
            availableModes = v20, 
            LayoutOrder = 1, 
            testId = ("%*--input"):format(v21.testId)
        }), 
        BrickPicker = if v40 == v4.Brick then v2.createElement(v3, {
            selectedColor = if v10.FoundationColorPickerPartialHSV then v42 else v24, 
            onBrickColorChanged = v56, 
            LayoutOrder = 2, 
            testId = ("%*--brick-picker"):format(v21.testId)
        }) else nil, 
        SVPickerContainer = if v40 ~= v4.Brick then v2.createElement(v9, if v10.FoundationColorPickerDesignUpdate then {
            Size = UDim2.new(1, 0, 0, 156), 
            LayoutOrder = 2
        } else {
            tag = "auto-xy", 
            LayoutOrder = 2
        }, {
            SVPicker = v2.createElement(v8, {
                hue = l_v23_0, 
                saturation = v34, 
                value = v36, 
                onChanged = function(v71, v72) --[[ Line: 216 ]] --[[ Name: onChanged ]]
                    -- upvalues: v60 (copy), l_v23_0 (copy)
                    v60(l_v23_0:getValue(), v71, v72);
                end, 
                onDragStarted = v21.onDragStarted, 
                onDragEnded = v21.onDragEnded, 
                showSelectionKnob = not v10.FoundationColorPickerPartialHSV or v44:getValue(), 
                testId = ("%*--sv-picker"):format(v21.testId)
            })
        }) else nil, 
        HueSlider = if v40 ~= v4.Brick then v2.createElement(v6, {
            sliderType = v7.Hue, 
            value = l_v23_0, 
            onValueChanged = function(v73) --[[ Line: 234 ]] --[[ Name: onValueChanged ]]
                -- upvalues: v60 (copy), v34 (copy), v36 (copy)
                v60(v73, v34:getValue(), v36:getValue());
            end, 
            onDragStarted = v21.onDragStarted, 
            onDragEnded = v21.onDragEnded, 
            LayoutOrder = 3, 
            testId = ("%*--hue-slider"):format(v21.testId)
        }) else nil, 
        AlphaSlider = if v57 then v2.createElement(v6, {
            sliderType = v7.Alpha, 
            value = v38, 
            baseColor = if v10.FoundationColorPickerPartialHSV then v42 else v24, 
            onValueChanged = v54, 
            onDragStarted = v21.onDragStarted, 
            onDragEnded = v21.onDragEnded, 
            LayoutOrder = 4, 
            testId = ("%*--alpha-slider"):format(v21.testId)
        }) else nil
    });
end;