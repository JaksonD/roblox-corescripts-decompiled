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
local function v31(v19, v20, v21, v22, v23) --[[ Line: 39 ]] --[[ Name: createInput ]]
    -- upvalues: v10 (copy), v9 (copy), v3 (copy), v7 (copy), v2 (copy), v12 (copy), v6 (copy), v11 (copy)
    local v24 = v22 == v20.key:lower() and "" or ("-%*"):format((v20.key:lower()));
    local v25 = {
        size = v10.XSmall, 
        label = "", 
        width = v20.width or UDim.new(0, v19.Size.Size_1500), 
        LayoutOrder = v21, 
        testId = ("%*-%*%*"):format(v23, v22, v24)
    };
    if v20.key == v9.Hex then
        return v3.createElement(v7, v2.join({
            text = v20.value:getValue(), 
            onChanged = function(v26) --[[ Line: 61 ]] --[[ Name: onChanged ]]
                -- upvalues: v20 (copy)
                v20.handler(v26, v20.component);
            end, 
            placeholder = v20.placeholder or "0"
        }, v25));
    else
        local v27 = v20.value:getValue();
        if v12.FoundationColorPickerPartialHSV and v27 == nil then
            return v3.createElement(v6, v2.join({
                value = -1, 
                onChanged = function(v28) --[[ Line: 77 ]] --[[ Name: onChanged ]]
                    -- upvalues: v20 (copy)
                    if v28 ~= -1 then
                        v20.handler(v28, v20.component);
                    end;
                end, 
                controlsVariant = v11.Stacked, 
                minimum = v20.minimum or 0, 
                maximum = v20.maximum or 255, 
                step = v20.step or 1, 
                precision = v20.precision or 0, 
                formatAsString = function(_) --[[ Line: 87 ]] --[[ Name: formatAsString ]]
                    return "";
                end
            }, v25));
        else
            return v3.createElement(v6, v2.join({
                value = v27, 
                onChanged = function(v30) --[[ Line: 98 ]] --[[ Name: onChanged ]]
                    -- upvalues: v20 (copy)
                    v20.handler(v30, v20.component);
                end, 
                controlsVariant = v11.Stacked, 
                minimum = v20.minimum or 0, 
                maximum = v20.maximum or 255, 
                step = v20.step or 1, 
                precision = v20.precision or 0
            }, v25));
        end;
    end;
end;
local v32 = {
    alpha = v3.createBinding(1)
};
return function(v33) --[[ Line: 124 ]] --[[ Name: ColorInputs ]]
    -- upvalues: v9 (copy), v16 (copy), v32 (copy), v18 (copy), v3 (copy), v12 (copy), v14 (copy), v13 (copy), v31 (copy), v8 (copy), v15 (copy), v5 (copy), v10 (copy)
    local v34 = v33.availableModes or {
        v9.RGB, 
        v9.HSV, 
        v9.Hex, 
        v9.Brick
    };
    local v35 = v16(v33, v32);
    local v36 = v18();
    local v37 = v35.mode or v9.RGB;
    local l_color_0 = v35.color;
    local l_alpha_0 = v35.alpha;
    local v41 = v3.useCallback(function(v40) --[[ Line: 134 ]]
        -- upvalues: v35 (copy)
        if v35.onColorChanged then
            v35.onColorChanged(v40);
        end;
    end, {
        v35.onColorChanged
    });
    local l_onAlphaChanged_0 = v35.onAlphaChanged;
    local v43 = v35.onAlphaChanged ~= nil;
    local v46 = l_color_0:map(function(v44) --[[ Line: 144 ]]
        -- upvalues: v12 (ref), v14 (ref)
        if v12.FoundationColorPickerPartialHSV and v14.isPartialHSV(v44) then
            return {
                r = nil, 
                g = nil, 
                b = nil
            };
        else
            local v45 = if v12.FoundationColorPickerPartialHSV then v14.toColor3(v44) else v44;
            return {
                r = math.round(v45.R * 255), 
                g = math.round(v45.G * 255), 
                b = math.round(v45.B * 255)
            };
        end;
    end);
    local v51 = l_color_0:map(function(v47) --[[ Line: 159 ]]
        -- upvalues: v12 (ref)
        if v12.FoundationColorPickerPartialHSV and type(v47) == "table" then
            return {
                h = v47.H, 
                s = v47.S, 
                v = v47.V
            };
        else
            local v48, v49, v50 = v47:ToHSV();
            return {
                h = math.round(v48 * 360), 
                s = math.round(v49 * 100), 
                v = math.round(v50 * 100)
            };
        end;
    end);
    local v53 = v46:map(function(v52) --[[ Line: 172 ]]
        if v52.r ~= nil and v52.g ~= nil and v52.b ~= nil then
            return string.format("#%02X%02X%02X", v52.r, v52.g, v52.b);
        else
            return "";
        end;
    end);
    local v59 = v3.useCallback(function(v54, v55) --[[ Line: 180 ]]
        -- upvalues: v46 (copy), v12 (ref), v41 (copy)
        local v56 = math.clamp(v54, 0, 255);
        local v57 = table.clone(v46:getValue());
        v57[v55] = v56;
        if v12.FoundationColorPickerPartialHSV and (v57.r == nil or v57.g == nil or v57.b == nil) then
            return;
        else
            local v58 = Color3.fromRGB(v57.r, v57.g, v57.b);
            v41(v58);
            return;
        end;
    end, {
        v46, 
        v41
    });
    local v61 = v3.useCallback(function(v60) --[[ Line: 196 ]]
        -- upvalues: l_onAlphaChanged_0 (copy)
        if l_onAlphaChanged_0 then
            l_onAlphaChanged_0(v60);
        end;
    end, {
        l_onAlphaChanged_0
    });
    local v66 = v3.useCallback(function(v62, v63) --[[ Line: 202 ]]
        -- upvalues: v51 (copy), v12 (ref), v41 (copy)
        local v64 = table.clone(v51:getValue());
        if v12.FoundationColorPickerPartialHSV and v64[v63] == nil and v62 == 0 then
            return;
        else
            v64[v63] = math.clamp(v62, 0, v63 == "h" and 360 or 100);
            local v65 = Color3.fromHSV(v64.h / 360, (v64.s or 100) / 100, (v64.v or 100) / 100);
            v41(v65);
            return;
        end;
    end, {
        v51, 
        v41
    });
    local v73 = v3.useCallback(function(v67) --[[ Line: 216 ]]
        -- upvalues: v41 (copy)
        local v68 = v67:gsub("#", ""):upper();
        if v68:match("^%x%x%x%x%x%x$") then
            local v69 = tonumber(v68:sub(1, 2), 16);
            local v70 = tonumber(v68:sub(3, 4), 16);
            local v71 = tonumber(v68:sub(5, 6), 16);
            if v69 and v70 and v71 then
                local v72 = Color3.fromRGB(v69, v70, v71);
                v41(v72);
            end;
        end;
    end, {
        v41
    });
    local v83 = v3.useMemo(function() --[[ Line: 232 ]]
        -- upvalues: v9 (ref), v43 (copy), v34 (copy)
        local v74 = {
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
        if v43 then
            table.insert(v74, 2, {
                id = v9.RGBA, 
                text = v9.RGBA
            });
        end;
        local l_v34_0 = v34;
        if not l_v34_0 then
            return v74;
        else
            local v76 = {};
            for _, v78 in v74 do
                local l_id_0 = v78.id;
                for _, v81 in l_v34_0 do
                    local v82 = true;
                    if l_id_0 ~= v81 then
                        v82 = false;
                        if l_id_0 == v9.RGBA then
                            v82 = false;
                            if v81 == v9.RGB then
                                v82 = v43;
                            end;
                        end;
                    end;
                    if v82 then
                        table.insert(v76, v78);
                        break;
                    end;
                end;
            end;
            return v76;
        end;
    end, {
        v43
    });
    v3.useEffect(function() --[[ Line: 267 ]]
        -- upvalues: v37 (copy), v9 (ref), v43 (copy), v35 (copy)
        if v37 == v9.RGBA and not v43 and v35.onModeChanged then
            v35.onModeChanged(v9.RGB);
        end;
    end, {
        v37, 
        v43
    });
    local function v88() --[[ Line: 275 ]]
        -- upvalues: v37 (copy), v9 (ref), v13 (ref), v46 (copy), v51 (copy), v53 (copy), l_alpha_0 (copy), v59 (copy), v66 (copy), v73 (copy), v61 (copy), v36 (copy), v31 (ref), v35 (copy)
        if v37 == v9.Brick then
            return;
        else
            local v84 = v13.createInputConfigs(v46, v51, v53, l_alpha_0, v59, v66, v73, v61, v36)[v37];
            if not v84 then
                return;
            else
                local v85 = {};
                for v86, v87 in ipairs(v84) do
                    v85[v87.key .. "Input"] = v31(v36, v87, v86, v37:lower(), v35.testId);
                end;
                return v85;
            end;
        end;
    end;
    return v3.createElement(v8, v15(v35, {
        tag = "row gap-small auto-xy align-y-center"
    }), {
        ModeDropdown = if #v83 > 1 then v3.createElement(v5.Root, {
            items = v83, 
            value = v37, 
            onItemChanged = function(v89) --[[ Line: 314 ]] --[[ Name: onItemChanged ]]
                -- upvalues: v35 (copy)
                if v35.onModeChanged then
                    v35.onModeChanged(v89);
                end;
            end, 
            size = v10.XSmall, 
            label = "", 
            width = UDim.new(0, v36.Size.Size_2000), 
            testId = ("%*--mode-dropdown"):format(v35.testId)
        }) else nil, 
        Inputs = v3.createElement(v8, {
            tag = "row gap-small auto-xy"
        }, v88())
    });
end;