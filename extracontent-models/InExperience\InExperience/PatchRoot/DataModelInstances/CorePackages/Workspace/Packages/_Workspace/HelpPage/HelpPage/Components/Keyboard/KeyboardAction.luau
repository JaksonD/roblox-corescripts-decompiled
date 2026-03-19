local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Foundation);
local _ = require(l_Parent_0.Configs.ConfigTypes);
local v6 = require(l_Parent_0.Enums.ExtraKeysEnum);
local v7 = require(l_Parent_1.Localization);
local v8 = require(l_Parent_0.Constants);
local l_View_0 = v4.View;
local l_Text_0 = v4.Text;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_useLocalization_0 = v7.Hooks.useLocalization;
local l_KEYCODE_ORDER_0 = v8.HELP_PAGE.KEYCODE_ORDER;
local function v16(v14) --[[ Line: 45 ]] --[[ Name: getKeyCodeName ]]
    -- upvalues: v8 (copy), l_UserInputService_0 (copy)
    if v8.HELP_PAGE.KEYCODES_LOCALIZED[v14] then
        return {
            needsLocalization = true, 
            keyCodeName = v8.HELP_PAGE.KEYCODES_LOCALIZED[v14]
        };
    elseif v8.HELP_PAGE.KEYCODES_UNLOCALIZED[v14] then
        return {
            needsLocalization = false, 
            keyCodeName = v8.HELP_PAGE.KEYCODES_UNLOCALIZED[v14]
        };
    else
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v14);
        return {
            needsLocalization = false, 
            keyCodeName = l_l_UserInputService_0_StringForKeyCode_0
        };
    end;
end;
local function _(v17) --[[ Line: 65 ]] --[[ Name: getKeycodeLayoutOrder ]]
    -- upvalues: l_KEYCODE_ORDER_0 (copy), v6 (copy)
    if l_KEYCODE_ORDER_0[v17] then
        return l_KEYCODE_ORDER_0[v17];
    elseif v17 ~= v6.DPad and v17 ~= v6.TouchPad then
        return v17.Value;
    else
        return 1e999;
    end;
end;
local function v25(v19) --[[ Line: 75 ]] --[[ Name: KeyCodeComponent ]]
    -- upvalues: l_useTokens_0 (copy), v16 (copy), l_useLocalization_0 (copy), v8 (copy), v3 (copy), l_Text_0 (copy)
    local v20 = l_useTokens_0();
    local v21 = v16(v19.keyCode);
    local v22 = {};
    if v21.needsLocalization then
        v22[v21.keyCodeName] = v21.keyCodeName;
    end;
    local v23 = l_useLocalization_0(v22);
    local v24 = v21.needsLocalization and v23[v21.keyCodeName] or v21.keyCodeName;
    if v19.addSeparator then
        v24 = v8.HELP_PAGE.SEPARATORS.COMBO .. v24;
    end;
    return v3.createElement(l_Text_0, {
        tag = "auto-xy text-align-x-left text-wrap text-body-small", 
        textStyle = v20.Color.Extended.White.White_100, 
        Text = v24
    });
end;
local function v33(v26) --[[ Line: 97 ]] --[[ Name: KeyCodeComboComponent ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy), v8 (copy), v25 (copy)
    local v27 = l_useTokens_0();
    local v32 = v3.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v26 (copy), v3 (ref), l_View_0 (ref), l_Text_0 (ref), v27 (copy), v8 (ref), v25 (ref)
        local v28 = {};
        if v26.addSeparator then
            table.insert(v28, v3.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = -1e999, 
                key = "separator"
            }, {
                Separator = v3.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left text-truncate text-body-small", 
                    textStyle = v27.Color.Extended.White.White_100, 
                    Text = v8.HELP_PAGE.SEPARATORS.ALTERNATIVE
                })
            }));
        end;
        for v29, v30 in ipairs(v26.combo) do
            local v31 = v29 ~= 1;
            table.insert(v28, v3.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = v29, 
                key = v29
            }, {
                KeyCodeComponent = v3.createElement(v25, {
                    keyCode = v30, 
                    addSeparator = v31
                })
            }));
        end;
        return v28;
    end, {
        v26.combo, 
        v26.addSeparator
    });
    return v3.createElement(l_View_0, {
        tag = "row auto-xy wrap"
    }, v32);
end;
local function v50(v34) --[[ Line: 145 ]] --[[ Name: InputComponent ]]
    -- upvalues: v3 (copy), l_KEYCODE_ORDER_0 (copy), v6 (copy), l_View_0 (copy), v33 (copy)
    if v34.input == nil then
        return nil;
    else
        v3.useMemo(function() --[[ Line: 153 ]]
            -- upvalues: v34 (copy), l_KEYCODE_ORDER_0 (ref), v6 (ref)
            for _, v36 in ipairs(v34.input) do
                table.sort(v36, function(v37, v38) --[[ Line: 155 ]]
                    -- upvalues: l_KEYCODE_ORDER_0 (ref), v6 (ref)
                    return (if l_KEYCODE_ORDER_0[v37] then l_KEYCODE_ORDER_0[v37] else if v37 ~= v6.DPad and v37 ~= v6.TouchPad then v37.Value else 1e999) < if l_KEYCODE_ORDER_0[v38] then l_KEYCODE_ORDER_0[v38] else if v38 ~= v6.DPad and v38 ~= v6.TouchPad then v38.Value else 1e999;
                end);
            end;
            table.sort(v34.input, function(v39, v40) --[[ Line: 160 ]]
                -- upvalues: l_KEYCODE_ORDER_0 (ref), v6 (ref)
                if #v39 == #v40 then
                    for v41 = 1, #v39 do
                        if v39[v41] ~= v40[v41] then
                            local v42 = v39[v41];
                            local v43 = if l_KEYCODE_ORDER_0[v42] then l_KEYCODE_ORDER_0[v42] else if v42 ~= v6.DPad and v42 ~= v6.TouchPad then v42.Value else 1e999;
                            local v44 = v40[v41];
                            return v43 < if l_KEYCODE_ORDER_0[v44] then l_KEYCODE_ORDER_0[v44] else if v44 ~= v6.DPad and v44 ~= v6.TouchPad then v44.Value else 1e999;
                        end;
                    end;
                    return false;
                else
                    return #v39 < #v40;
                end;
            end);
        end, {
            v34.input
        });
        local v49 = v3.useMemo(function() --[[ Line: 175 ]]
            -- upvalues: v34 (copy), v3 (ref), l_View_0 (ref), v33 (ref)
            local v45 = {};
            for v46, v47 in ipairs(v34.input) do
                local v48 = v46 ~= 1;
                table.insert(v45, v3.createElement(l_View_0, {
                    tag = "auto-xy", 
                    LayoutOrder = v46, 
                    key = v46
                }, {
                    KeyCodeComboComponent = v3.createElement(v33, {
                        combo = v47, 
                        addSeparator = v48, 
                        layoutOrder = v46
                    })
                }));
            end;
            return v45;
        end, {
            v34.input
        });
        return v3.createElement(l_View_0, {
            tag = "row auto-xy wrap"
        }, v49);
    end;
end;
return v3.memo(function(v51) --[[ Line: 205 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_UserInputService_0 (copy), l_View_0 (copy), l_Text_0 (copy), v50 (copy)
    local v52 = l_useTokens_0();
    local v53 = l_useLocalization_0({
        actionText = v51.control.label
    });
    local l_keyboardInput_0 = v51.control.keyboardInput;
    local v56 = v3.useMemo(function() --[[ Line: 216 ]]
        -- upvalues: l_keyboardInput_0 (copy), l_UserInputService_0 (ref)
        if l_keyboardInput_0 == nil then
            return nil;
        else
            local l_input_0 = l_keyboardInput_0.input;
            if l_input_0 == nil then
                if l_UserInputService_0:GetPlatform() == Enum.Platform.OSX then
                    return l_keyboardInput_0.macInput;
                else
                    l_input_0 = l_keyboardInput_0.winInput;
                end;
            end;
            return l_input_0;
        end;
    end, {
        l_keyboardInput_0
    });
    if l_keyboardInput_0 == nil or v56 == nil then
        return nil;
    else
        return v3.createElement(l_View_0, {
            tag = "size-full-1100 row align-y-center align-x-left wrap flex-fill padding-x-small gap-small radius-xsmall", 
            backgroundStyle = v52.Color.Extended.Gray.Gray_800, 
            LayoutOrder = l_keyboardInput_0.layoutOrder, 
            ClipsDescendants = true
        }, {
            ActionLabelContainer = v3.createElement(l_View_0, {
                tag = "align-y-center align-x-left col", 
                LayoutOrder = 1
            }, {
                ActionLabel = v3.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left text-title-small text-wrap", 
                    textStyle = v52.Color.Extended.White.White_100, 
                    Text = v53.actionText
                })
            }), 
            InputLabelContainer = v3.createElement(l_View_0, {
                tag = "align-y-center align-x-left col", 
                LayoutOrder = 2, 
                testId = "input-label-container"
            }, {
                InputLabel = v3.createElement(v50, {
                    input = v56
                })
            })
        });
    end;
end);