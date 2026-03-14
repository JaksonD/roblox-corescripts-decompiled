local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Icon_0 = v3.Icon;
local l_KeyLabel_0 = v4.App.Menu.KeyLabel;
local l_KeyLabelUtilities_0 = v4.App.Menu.KeyLabelUtilities;
local l_StateLayer_0 = v4.Core.Control.StateLayer;
local l_Shortcut_0 = v4.App.Navigation.Shortcut;
local v13 = require(script.Parent.IconWithHoldAnimation);
local v14 = game:DefineFastFlag("ShortcutUseDispatchSyntheticEvent", false);
local _ = function(v15, v16) --[[ Line: 25 ]] --[[ Name: getKeyLabelsWidth ]]
    -- upvalues: l_KeyLabelUtilities_0 (copy)
    local v17 = 0;
    for _, v19 in v15 do
        v17 = v17 + l_KeyLabelUtilities_0.getKeyLabelWidth(v19, v16);
    end;
    return v17;
end;
local function v27(v21) --[[ Line: 33 ]] --[[ Name: useOnShortcutActivated ]]
    -- upvalues: v14 (copy), v2 (copy), v5 (copy)
    if v14 then
        local v22 = v2.useContext(v5.FocusNavigationContext);
        local v23 = v5.useDispatchSyntheticEvent();
        return (v2.useCallback(function() --[[ Line: 38 ]]
            -- upvalues: v21 (copy), v23 (copy), v22 (copy)
            if v21.hasProgress then
                v23(v21.eventName, v22.focusedGuiObject:getValue(), {
                    UserInputState = Enum.UserInputState.Begin, 
                    KeyCode = v21.inputKeyCode, 
                    UserInputType = Enum.UserInputType.None, 
                    immediateDispatch = true
                });
                return;
            else
                v23(v21.eventName, v22.focusedGuiObject:getValue(), {
                    UserInputState = Enum.UserInputState.End, 
                    KeyCode = v21.inputKeyCode, 
                    UserInputType = Enum.UserInputType.None, 
                    immediateDispatch = true
                });
                return;
            end;
        end, {
            v21.hasProgress, 
            v21.eventName, 
            v21.inputKeyCode, 
            v22, 
            v23
        }));
    else
        local v24 = v2.useContext(v5.FocusNavigationContext);
        return (v2.useMemo(function() --[[ Line: 59 ]]
            -- upvalues: v24 (copy), v21 (copy)
            return function() --[[ Line: 60 ]]
                -- upvalues: v24 (ref), v21 (ref)
                local v25 = v24._engineInterface.getSelection();
                if not v25 then
                    return;
                else
                    local v26 = v24.activeEventMap:getValue()[v21.inputKeyCode];
                    if v26 ~= v21.eventName then
                        return;
                    else
                        v24._eventPropagationService:propagateEvent(v25, v26, {
                            KeyCode = v21.inputKeyCode, 
                            UserInputState = Enum.UserInputState.Begin
                        }, false);
                        task.wait(0.1);
                        v24._eventPropagationService:propagateEvent(v25, v26, {
                            KeyCode = v21.inputKeyCode, 
                            UserInputState = Enum.UserInputState.End
                        }, false);
                        return;
                    end;
                end;
            end;
        end, {
            v24, 
            v21.inputKeyCode, 
            v21.eventName
        }));
    end;
end;
AppShortcut = function(v28) --[[ Line: 83 ]] --[[ Name: AppShortcut ]]
    -- upvalues: l_useStyle_0 (copy), l_useTokens_0 (copy), l_KeyLabelUtilities_0 (copy), v2 (copy), l_TextService_0 (copy), l_KeyLabel_0 (copy), v13 (copy), l_Icon_0 (copy), v27 (copy), l_Shortcut_0 (copy), l_StateLayer_0 (copy)
    local l_layoutOrder_0 = v28.layoutOrder;
    local l_item_0 = v28.item;
    local v31 = l_useStyle_0();
    local v32 = l_useTokens_0();
    local v33 = typeof(l_item_0.icon) == "table";
    local v34 = nil;
    local v35 = nil;
    if l_item_0.hasProgress then
        v34 = v32.Size.Size_1300 / 2;
        v35 = v32.Size.Size_1300 / 2;
    elseif v33 then
        local l_icon_0 = l_item_0.icon;
        local l_Font_0 = v31.Font;
        local v38 = 0;
        for _, v40 in l_icon_0 do
            v38 = v38 + l_KeyLabelUtilities_0.getKeyLabelWidth(v40, l_Font_0);
        end;
        v34 = v38;
        v35 = v32.Size.Size_900;
    else
        v34 = v32.Size.Size_600;
        v35 = v32.Size.Size_600;
    end;
    local v45 = v2.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: v32 (copy), l_TextService_0 (ref), l_item_0 (copy), v34 (ref)
        local l_XSmall_0 = v32.Gap.XSmall;
        local l_LabelMedium_0 = v32.Typography.LabelMedium;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_item_0.text, math.floor(l_LabelMedium_0.FontSize), l_LabelMedium_0.Font, Vector2.new(1e999, 1e999));
        local v44 = v34 + l_XSmall_0 + l_l_TextService_0_TextSize_0.X;
        return UDim2.new(0, v44, 1, 0);
    end, {
        v32, 
        v34, 
        l_item_0.text
    });
    local v46 = v2.useMemo(function() --[[ Line: 118 ]]
        -- upvalues: v45 (copy), v32 (copy)
        return v45 + UDim2.fromOffset(v32.Size.Size_100 * 2, 0);
    end, {
        v45, 
        v32
    });
    local v50 = v2.useMemo(function() --[[ Line: 122 ]]
        -- upvalues: v33 (copy), v2 (ref), l_item_0 (copy), l_KeyLabel_0 (ref)
        if v33 then
            local v47 = {
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            };
            for v48, v49 in l_item_0.icon do
                v47["KeyLabel_" .. tostring(v48)] = v2.createElement(l_KeyLabel_0, {
                    LayoutOrder = v48, 
                    keyCode = v49, 
                    iconThemeKey = "IconEmphasis"
                });
            end;
            return v47;
        else
            return nil;
        end;
    end, {
        v33, 
        l_item_0.icon, 
        v32
    });
    local v52 = v2.useCallback(function(v51) --[[ Line: 144 ]]
        -- upvalues: l_item_0 (copy), v2 (ref), v13 (ref), v34 (ref), v35 (ref), v32 (copy), v33 (copy), v50 (copy), l_Icon_0 (ref)
        if l_item_0.hasProgress then
            return v2.createElement(v13, {
                layoutOrder = v51.layoutOrder, 
                size = UDim2.fromOffset(v34, v35), 
                progress = l_item_0.progress, 
                icon = l_item_0.icon, 
                iconSize = v32.Size.Size_900 / 2
            });
        else
            return v2.createElement("Frame", {
                LayoutOrder = v51.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v34, v35)
            }, if v33 then v50 else {
                Icon = v2.createElement(l_Icon_0, {
                    name = l_item_0.icon, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            });
        end;
    end, {
        l_item_0.hasProgress, 
        l_item_0.progress, 
        l_item_0.icon, 
        v34, 
        v35, 
        v33, 
        v50
    });
    local v53 = v27(l_item_0);
    return v2.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        BackgroundTransparency = 1, 
        Size = v45
    }, {
        ShortcutFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            Shortcut = v2.createElement(l_Shortcut_0, {
                size = UDim2.fromScale(1, 1), 
                automaticSize = Enum.AutomaticSize.None, 
                iconLabelGap = v32.Gap.XSmall, 
                publicProps = l_item_0, 
                labelTextSize = v32.Typography.LabelMedium.FontSize, 
                labelColorStyle = v32.Color.Label, 
                labelFontStyle = v32.Typography.LabelMedium, 
                renderIcon = v52
            })
        }), 
        StateLayer = v2.createElement(l_StateLayer_0, {
            selectable = false, 
            cornerRadius = UDim.new(0, v32.Radius.Medium), 
            size = v46, 
            zIndex = 1, 
            onActivated = v53
        })
    });
end;
return v2.memo(AppShortcut);