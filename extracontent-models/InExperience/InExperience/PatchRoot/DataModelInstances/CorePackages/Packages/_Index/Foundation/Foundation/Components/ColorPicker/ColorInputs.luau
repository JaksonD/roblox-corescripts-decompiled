local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.Dropdown);
local v6 = require(l_script_FirstAncestor_0.Components.NumberInput);
local v7 = require(l_script_FirstAncestor_0.Components.TextInput);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Enums.ColorInputMode);
local v10 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v11 = require(l_script_FirstAncestor_0.Enums.NumberInputControlsVariant);
local v12 = require(l_script_FirstAncestor_0.Utility.Flags);
local v13 = require(l_script_FirstAncestor_0.Components.ColorPicker.colorInputUtils);
local v14 = require(l_script_FirstAncestor_0.Components.ColorPicker.colorUtils);
local v15 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v16 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v18 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local function v26(v19, v20, v21) --[[ Line: 39 ]] --[[ Name: createNumberInputElement ]]
    -- upvalues: v12 (copy), v3 (copy), v6 (copy), v2 (copy)
    local v22 = v19.value:getValue();
    if v12.FoundationColorPickerPartialHSV and v22 == nil then
        return v3.createElement(v6, v2.join({
            value = -1, 
            onChanged = function(v23) --[[ Line: 52 ]] --[[ Name: onChanged ]]
                -- upvalues: v19 (copy)
                if v23 ~= -1 then
                    v19.handler(v23, v19.component);
                end;
            end, 
            controlsVariant = v20, 
            minimum = v19.minimum or 0, 
            maximum = v19.maximum or 255, 
            step = v19.step or 1, 
            precision = v19.precision or 0, 
            formatAsString = function(_) --[[ Line: 62 ]] --[[ Name: formatAsString ]]
                return "";
            end
        }, v21));
    else
        return v3.createElement(v6, v2.join({
            value = v22, 
            onChanged = function(v25) --[[ Line: 73 ]] --[[ Name: onChanged ]]
                -- upvalues: v19 (copy)
                v19.handler(v25, v19.component);
            end, 
            controlsVariant = v20, 
            minimum = v19.minimum or 0, 
            maximum = v19.maximum or 255, 
            step = v19.step or 1, 
            precision = v19.precision or 0
        }, v21));
    end;
end;
local function v36(v27, v28, v29, v30, v31) --[[ Line: 85 ]] --[[ Name: renderInput ]]
    -- upvalues: v10 (copy), v12 (copy), v9 (copy), v3 (copy), v8 (copy), v7 (copy), v2 (copy), v26 (copy), v11 (copy)
    local v32 = v30 == v28.key:lower() and "" or ("-%*"):format((v28.key:lower()));
    local v33 = {
        size = v10.XSmall, 
        label = "", 
        width = if v12.FoundationColorPickerDesignUpdate then UDim.new(1, 0) else v28.width or UDim.new(0, v27.Size.Size_1500), 
        LayoutOrder = v29, 
        testId = ("%*-%*%*"):format(v31, v30, v32)
    };
    if v28.key == v9.Hex then
        if v12.FoundationColorPickerDesignUpdate then
            return v3.createElement(v8, {
                tag = "grow-1 size-0-full", 
                LayoutOrder = v29
            }, {
                Input = v3.createElement(v7, {
                    text = v28.value:getValue(), 
                    onChanged = function(v34) --[[ Line: 113 ]] --[[ Name: onChanged ]]
                        -- upvalues: v28 (copy)
                        v28.handler(v34, v28.component);
                    end, 
                    placeholder = v28.placeholder or "#000000", 
                    size = v10.XSmall, 
                    label = "", 
                    width = UDim.new(1, 0), 
                    testId = ("%*-%*"):format(v31, v30)
                })
            });
        else
            return v3.createElement(v7, v2.join({
                text = v28.value:getValue(), 
                onChanged = function(v35) --[[ Line: 128 ]] --[[ Name: onChanged ]]
                    -- upvalues: v28 (copy)
                    v28.handler(v35, v28.component);
                end, 
                placeholder = v28.placeholder or "0"
            }, v33));
        end;
    elseif v12.FoundationColorPickerDesignUpdate then
        return v3.createElement(v8, {
            tag = "grow-1 size-0-full", 
            LayoutOrder = v29
        }, {
            Input = v26(v28, v11.None, v33)
        });
    else
        return v26(v28, v11.Stacked, v33);
    end;
end;
local v37 = {
    alpha = v3.createBinding(1)
};
return function(v38) --[[ Line: 165 ]] --[[ Name: ColorInputs ]]
    -- upvalues: v9 (copy), v16 (copy), v37 (copy), v18 (copy), v3 (copy), v12 (copy), v14 (copy), v8 (copy), v7 (copy), v10 (copy), v13 (copy), v36 (copy), v15 (copy), v2 (copy), v5 (copy)
    local v39 = v38.availableModes or {
        v9.RGB, 
        v9.HSV, 
        v9.Hex, 
        v9.Brick
    };
    local v40 = v16(v38, v37);
    local v41 = v18();
    local v42 = v40.mode or v9.RGB;
    local l_color_0 = v40.color;
    local l_alpha_0 = v40.alpha;
    local v46 = v3.useCallback(function(v45) --[[ Line: 175 ]]
        -- upvalues: v40 (copy)
        if v40.onColorChanged then
            v40.onColorChanged(v45);
        end;
    end, {
        v40.onColorChanged
    });
    local l_onAlphaChanged_0 = v40.onAlphaChanged;
    local v48 = v40.onAlphaChanged ~= nil;
    local v51 = l_color_0:map(function(v49) --[[ Line: 185 ]]
        -- upvalues: v12 (ref), v14 (ref)
        if v12.FoundationColorPickerPartialHSV and v14.isPartialHSV(v49) then
            return {
                r = nil, 
                g = nil, 
                b = nil
            };
        else
            local v50 = if v12.FoundationColorPickerPartialHSV then v14.toColor3(v49) else v49;
            return {
                r = math.round(v50.R * 255), 
                g = math.round(v50.G * 255), 
                b = math.round(v50.B * 255)
            };
        end;
    end);
    local v56 = l_color_0:map(function(v52) --[[ Line: 200 ]]
        -- upvalues: v12 (ref)
        if v12.FoundationColorPickerPartialHSV and type(v52) == "table" then
            return {
                h = v52.H, 
                s = v52.S, 
                v = v52.V
            };
        else
            local v53, v54, v55 = v52:ToHSV();
            return {
                h = math.round(v53 * 360), 
                s = math.round(v54 * 100), 
                v = math.round(v55 * 100)
            };
        end;
    end);
    local v58 = v51:map(function(v57) --[[ Line: 213 ]]
        if v57.r ~= nil and v57.g ~= nil and v57.b ~= nil then
            return string.format("#%02X%02X%02X", v57.r, v57.g, v57.b);
        else
            return "";
        end;
    end);
    local v64 = v3.useCallback(function(v59, v60) --[[ Line: 221 ]]
        -- upvalues: v51 (copy), v12 (ref), v46 (copy)
        local v61 = math.clamp(v59, 0, 255);
        local v62 = table.clone(v51:getValue());
        v62[v60] = v61;
        if v12.FoundationColorPickerPartialHSV and (v62.r == nil or v62.g == nil or v62.b == nil) then
            return;
        else
            local v63 = Color3.fromRGB(v62.r, v62.g, v62.b);
            v46(v63);
            return;
        end;
    end, {
        v51, 
        v46
    });
    local v66 = v3.useCallback(function(v65) --[[ Line: 237 ]]
        -- upvalues: l_onAlphaChanged_0 (copy)
        if l_onAlphaChanged_0 then
            l_onAlphaChanged_0(v65);
        end;
    end, {
        l_onAlphaChanged_0
    });
    local v71 = v3.useCallback(function(v67, v68) --[[ Line: 243 ]]
        -- upvalues: v56 (copy), v12 (ref), v46 (copy)
        local v69 = table.clone(v56:getValue());
        if v12.FoundationColorPickerPartialHSV and v69[v68] == nil and v67 == 0 then
            return;
        else
            v69[v68] = math.clamp(v67, 0, v68 == "h" and 360 or 100);
            local v70 = Color3.fromHSV(v69.h / 360, (v69.s or 100) / 100, (v69.v or 100) / 100);
            v46(v70);
            return;
        end;
    end, {
        v56, 
        v46
    });
    local v78 = v3.useCallback(function(v72) --[[ Line: 257 ]]
        -- upvalues: v46 (copy)
        local v73 = v72:gsub("#", ""):upper();
        if v73:match("^%x%x%x%x%x%x$") then
            local v74 = tonumber(v73:sub(1, 2), 16);
            local v75 = tonumber(v73:sub(3, 4), 16);
            local v76 = tonumber(v73:sub(5, 6), 16);
            if v74 and v75 and v76 then
                local v77 = Color3.fromRGB(v74, v75, v76);
                v46(v77);
            end;
        end;
    end, {
        v46
    });
    local v88 = v3.useMemo(function() --[[ Line: 273 ]]
        -- upvalues: v9 (ref), v48 (copy), v39 (copy)
        local v79 = {
            {
                id = v9.RGB, 
                text = v9.RGB
            }, 
            {
                id = v9.HSV, 
                text = v9.HSV
            }, 
            {
                id = v9.Hex, 
                text = v9.Hex
            }, 
            {
                id = v9.Brick, 
                text = v9.Brick
            }
        };
        if v48 then
            table.insert(v79, 2, {
                id = v9.RGBA, 
                text = v9.RGBA
            });
        end;
        local l_v39_0 = v39;
        if not l_v39_0 then
            return v79;
        else
            local v81 = {};
            for _, v83 in v79 do
                local l_id_0 = v83.id;
                for _, v86 in l_v39_0 do
                    local v87 = true;
                    if l_id_0 ~= v86 then
                        v87 = false;
                        if l_id_0 == v9.RGBA then
                            v87 = false;
                            if v86 == v9.RGB then
                                v87 = v48;
                            end;
                        end;
                    end;
                    if v87 then
                        table.insert(v81, v83);
                        break;
                    end;
                end;
            end;
            return v81;
        end;
    end, {
        v48
    });
    v3.useEffect(function() --[[ Line: 308 ]]
        -- upvalues: v42 (copy), v9 (ref), v48 (copy), v40 (copy)
        if v42 == v9.RGBA and not v48 and v40.onModeChanged then
            v40.onModeChanged(v9.RGB);
        end;
    end, {
        v42, 
        v48
    });
    local function v93() --[[ Line: 316 ]]
        -- upvalues: v42 (copy), v9 (ref), v12 (ref), v3 (ref), v8 (ref), v7 (ref), l_color_0 (copy), v10 (ref), v40 (copy), v13 (ref), v51 (copy), v56 (copy), v58 (copy), l_alpha_0 (copy), v64 (copy), v71 (copy), v78 (copy), v66 (copy), v41 (copy), v36 (ref)
        if v42 == v9.Brick then
            if v12.FoundationColorPickerDesignUpdate then
                return {
                    BrickColorName = v3.createElement(v8, {
                        tag = "grow-1 size-0-full", 
                        LayoutOrder = 1
                    }, {
                        Input = v3.createElement(v7, {
                            text = BrickColor.new(l_color_0:getValue()).Name, 
                            onChanged = function() --[[ Line: 326 ]] --[[ Name: onChanged ]]

                            end, 
                            isDisabled = true, 
                            size = v10.XSmall, 
                            label = "", 
                            width = UDim.new(1, 0), 
                            testId = ("%*-brick-name"):format(v40.testId)
                        })
                    })
                };
            else
                return nil;
            end;
        else
            local v89 = v13.createInputConfigs(v51, v56, v58, l_alpha_0, v64, v71, v78, v66, v41)[v42];
            if not v89 then
                return nil;
            else
                local v90 = {};
                for v91, v92 in ipairs(v89) do
                    v90[v92.key .. "Input"] = v36(v41, v92, v91, v42:lower(), v40.testId);
                end;
                return v90;
            end;
        end;
    end;
    if v12.FoundationColorPickerDesignUpdate then
        return v3.createElement(v8, v15(v40, {
            tag = "row gap-xsmall size-full-600"
        }), v2.join({
            ModeDropdown = if #v88 > 1 then v3.createElement(v5.Root, {
                items = v88, 
                value = v42, 
                onItemChanged = function(v94) --[[ Line: 374 ]] --[[ Name: onItemChanged ]]
                    -- upvalues: v40 (copy)
                    if v40.onModeChanged then
                        v40.onModeChanged(v94);
                    end;
                end, 
                size = v10.XSmall, 
                label = "", 
                width = UDim.new(0, v41.Size.Size_1600), 
                testId = ("%*--mode-dropdown"):format(v40.testId)
            }) else nil
        }, (v93())));
    else
        return v3.createElement(v8, v15(v40, {
            tag = "row gap-small auto-xy align-y-center"
        }), {
            ModeDropdown = if #v88 > 1 then v3.createElement(v5.Root, {
                items = v88, 
                value = v42, 
                onItemChanged = function(v95) --[[ Line: 399 ]] --[[ Name: onItemChanged ]]
                    -- upvalues: v40 (copy)
                    if v40.onModeChanged then
                        v40.onModeChanged(v95);
                    end;
                end, 
                size = v10.XSmall, 
                label = "", 
                width = UDim.new(0, v41.Size.Size_2000), 
                testId = ("%*--mode-dropdown"):format(v40.testId)
            }) else nil, 
            Inputs = v3.createElement(v8, {
                tag = "row gap-small auto-xy"
            }, (v93()))
        });
    end;
end;