local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local _ = require(l_Parent_0.Configs.ConfigTypes);
local v5 = require(l_Parent_0.Constants);
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_Enums_0 = v3.Enums;
local l_useTokens_0 = v3.Hooks.useTokens;
local v12 = require(l_Parent_0.Enums.ExtraKeysEnum);
local v15 = v2.memo(function(v13) --[[ Line: 45 ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_Text_0 (copy)
    local v14 = l_useLocalization_0({
        action = v13.action
    });
    return v2.createElement(l_Text_0, {
        Text = v14.action, 
        tag = "auto-xy text-align-x-center text-align-y-center text-title-large"
    });
end);
local v27 = v2.memo(function(v16) --[[ Line: 56 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v12 (copy), v5 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy)
    local v17 = l_useTokens_0();
    local v22 = v2.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v16 (copy), v12 (ref), v5 (ref)
        local v18 = {};
        for _, v20 in ipairs(v16.buttons) do
            if v20 ~= v12.TouchPad then
                local _ = nil;
                v18[v20] = if v16.isSpatial then v5.HELP_PAGE.GAMEPAD_ICON_MAP_SPATIAL[v20] else if v5.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[v16.platform] then if v16.platform == Enum.Platform.PS5 and v5.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v20] ~= nil then v5.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v20] else v5.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[v20] else v5.HELP_PAGE.GAMEPAD_ICON_MAP_XBOX[v20];
            elseif v5.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[v16.platform] then
                if v16.platform == Enum.Platform.PS5 and v5.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v20] ~= nil then
                    v18[v20] = v5.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION_5[v20];
                else
                    v18[v20] = v5.HELP_PAGE.GAMEPAD_ICON_MAP_PLAYSTATION[v20];
                end;
            end;
        end;
        return v18;
    end, {
        v16.buttons
    });
    local v26 = v2.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: v16 (copy), v2 (ref), l_View_0 (ref), v17 (copy), v22 (copy), v5 (ref), l_Icon_0 (ref), l_Enums_0 (ref)
        local v23 = {};
        if v16.addBlankIcon and v16.layoutOrderReversed then
            table.insert(v23, v2.createElement(l_View_0, {
                Size = UDim2.fromOffset(v17.Size.Size_600, v17.Size.Size_600), 
                BackgroundTransparency = 1, 
                LayoutOrder = -1, 
                key = "BlankIconBefore"
            }));
        end;
        for v24, v25 in v22 do
            table.insert(v23, v2.createElement(l_View_0, {
                tag = "align-x-center align-y-center auto-xy", 
                LayoutOrder = v5.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[v24], 
                key = v5.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[v24]
            }, {
                Icon = v2.createElement(l_Icon_0, {
                    name = v25, 
                    size = l_Enums_0.IconSize.Large
                })
            }));
        end;
        return v23;
    end, {
        v22, 
        v16.addBlankIcon, 
        v16.layoutOrderReversed
    });
    return v2.createElement(l_View_0, {
        tag = "align-x-center align-y-center auto-xy gap-xsmall row"
    }, v26);
end);
local v38 = v2.memo(function(v28) --[[ Line: 141 ]]
    -- upvalues: v2 (copy), v5 (copy), l_View_0 (copy), v15 (copy), v27 (copy)
    local v36, v37 = v2.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: v28 (copy), v5 (ref), v2 (ref), l_View_0 (ref), v15 (ref), v27 (ref)
        local v29 = {};
        local v30 = {};
        for v31, v32 in v28.controls do
            if v32.gamepadInput then
                local l_gamepadInput_0 = v32.gamepadInput;
                local l_input_0 = l_gamepadInput_0.input;
                if l_input_0 == nil then
                    l_input_0 = if v28.isSpatial then l_gamepadInput_0.spatialGamepadInput else if v5.HELP_PAGE.GAMEPAD_PLAYSTATION_PLATFORMS[v28.platform] then l_gamepadInput_0.playstationInput else l_gamepadInput_0.xboxInput;
                end;
                if l_input_0 ~= nil and #l_input_0 > 0 then
                    local v35 = v5.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[l_input_0[1]];
                    if v28.layoutOrderReversed then
                        v35 = -v35;
                    end;
                    table.insert(v29, v2.createElement(l_View_0, {
                        tag = "align-y-center auto-x col size-0-1000", 
                        LayoutOrder = v35, 
                        key = "Text-" .. v31
                    }, {
                        ActionText = v2.createElement(v15, {
                            action = v32.label
                        })
                    }));
                    table.insert(v30, v2.createElement(l_View_0, {
                        tag = "align-y-center auto-x col size-0-1000", 
                        LayoutOrder = v35, 
                        key = "Icon-" .. v31
                    }, {
                        IconContainer = v2.createElement(v27, {
                            buttons = l_input_0, 
                            platform = v28.platform, 
                            addBlankIcon = v28.addBlankIcon, 
                            layoutOrderReversed = v28.layoutOrderReversed, 
                            isSpatial = v28.isSpatial
                        })
                    }));
                end;
            end;
        end;
        return v29, v30;
    end, {
        v28.controls, 
        v28.platform, 
        v28.addBlankIcon, 
        v28.layoutOrderReversed
    });
    return v2.createElement(l_View_0, {
        tag = "row auto-xy gap-small"
    }, {
        TextCol = v2.createElement(l_View_0, {
            tag = {
                ["col auto-xy align-x-right"] = not v28.layoutOrderReversed, 
                ["col auto-xy align-x-left"] = v28.layoutOrderReversed
            }, 
            LayoutOrder = v28.layoutOrderReversed and 3 or 1
        }, v36), 
        IconCol = v2.createElement(l_View_0, {
            tag = "col auto-xy", 
            LayoutOrder = 2
        }, v37)
    });
end);
return v2.memo(v38);