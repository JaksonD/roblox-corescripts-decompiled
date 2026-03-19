local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Icon_0 = v3.Icon;
local l_InputLabel_0 = v3.InputLabel;
local l_View_0 = v3.View;
local l_IconSize_0 = v3.Enums.IconSize;
local l_ControlState_0 = v3.Enums.ControlState;
local l_InputLabelSize_0 = v3.Enums.InputLabelSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = v3.Hooks.useTokens;
local function v28(v12, v13, v14, v15, v16) --[[ Line: 30 ]] --[[ Name: createButtons ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v17 = l_useTokens_0();
    local v18 = {};
    local v19, v20 = v2.useState(v16 or "");
    for v21, v22 in pairs(v12) do
        local v23, v24 = v2.useState(false);
        local v25 = v2.useCallback(function() --[[ Line: 43 ]]
            -- upvalues: v20 (copy), v22 (copy), v14 (copy), v15 (copy), v13 (copy), v24 (copy)
            v20(v22.value);
            v14(v22.value, v22.text);
            if v15 then
                v15(v13[v22.value]);
            end;
            v24(true);
        end, {
            v14, 
            v15, 
            v24
        });
        local v27 = v2.useCallback(function(v26) --[[ Line: 52 ]]
            -- upvalues: l_ControlState_0 (ref), v24 (copy)
            if v26 == l_ControlState_0.Hover or v26 == l_ControlState_0.Pressed then
                v24(true);
                return;
            else
                v24(false);
                return;
            end;
        end, {
            v24, 
            v25
        });
        table.insert(v18, v2.createElement(l_View_0, {
            tag = "auto-xy col gap-xsmall padding-bottom-xsmall"
        }, {
            ButtonContainer = v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y radius-medium row flex-between", 
                onStateChanged = v27, 
                onActivated = v25
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 4), 
                    PaddingRight = UDim.new(0, 4), 
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10)
                }), 
                Button = v2.createElement(l_InputLabel_0, {
                    Text = v22.text, 
                    textStyle = if v23 then v17.Color.Content.Emphasis else v17.Color.Content.Default, 
                    onActivated = v25, 
                    onHover = v24, 
                    size = l_InputLabelSize_0.Medium
                }), 
                Icon = if v22.value == v19 then v2.createElement(l_Icon_0, {
                    name = "icons/status/success_small", 
                    size = l_IconSize_0.Small
                }) else nil
            }), 
            Divider = v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y", 
                stroke = {
                    Thickness = 0.5, 
                    Color = v17.Color.Content.Default.Color3, 
                    Transparency = next(v12, v21) ~= nil and v17.Color.Content.Default.Transparency or 1
                }
            })
        }));
    end;
    return v18;
end;
return function(v29) --[[ Line: 112 ]] --[[ Name: ButtonList ]]
    -- upvalues: v2 (copy), v1 (copy), l_useLocalization_0 (copy), v28 (copy), l_View_0 (copy)
    local v31 = v2.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: v1 (ref), v29 (copy)
        return v1.Dictionary.map(v29.options, function(v30) --[[ Line: 114 ]]
            return v30.localizationKey, v30.value;
        end);
    end);
    local v33 = v2.useMemo(function() --[[ Line: 119 ]]
        -- upvalues: v1 (ref), v29 (copy)
        return v1.Dictionary.map(v29.options, function(v32) --[[ Line: 120 ]]
            return v32.descriptionLocalizationKey, v32.value;
        end);
    end);
    local v34 = l_useLocalization_0(v31);
    local v35 = l_useLocalization_0(v33);
    local v37 = v2.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: v1 (ref), v29 (copy), v34 (copy)
        return v1.List.map(v29.options, function(v36) --[[ Line: 129 ]]
            -- upvalues: v34 (ref)
            return {
                text = v34[v36.value] or "", 
                value = v36.value
            };
        end);
    end, {
        v29.options, 
        v34
    });
    local v38 = v28(v37, v35, v29.onSelected, v29.setDescription, v29.defaultValue);
    return v2.createElement(l_View_0, {
        tag = "size-full col"
    }, {
        v38
    });
end;