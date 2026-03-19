local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.ReactUtils);
local v8 = require(l_Parent_1.Cryo);
local v9 = require(l_Parent_1.Foundation);
local l_Toast_0 = v9.Toast;
local l_KeyLabel_0 = v9.KeyLabel;
local l_View_0 = v9.View;
local l_StateLayerAffordance_0 = v9.Enums.StateLayerAffordance;
local l_ControlState_0 = v9.Enums.ControlState;
local l_InputTypeConstants_0 = require(l_Parent_1.InputType).InputTypeConstants;
local l_useInputType_0 = v6.Hooks.useInputType;
local l_EventConnection_0 = v7.EventConnection;
local l_useFocusGuiObject_0 = require(l_Parent_1.ReactFocusNavigation).useFocusGuiObject;
local v19 = require(l_Parent_0.constants);
return v5.memo(v5.forwardRef(function(v20, _) --[[ Line: 39 ]] --[[ Name: ClientNotificationWrapper ]]
    -- upvalues: v5 (copy), l_useInputType_0 (copy), l_useFocusGuiObject_0 (copy), l_ControlState_0 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), v8 (copy), l_Toast_0 (copy), l_InputTypeConstants_0 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy), l_KeyLabel_0 (copy), v19 (copy)
    local v22 = v5.useRef(nil);
    local v23, v24 = v5.useBinding(false);
    local v25, v26 = v5.useBinding(Enum.SelectionBehavior.Escape);
    local v27 = l_useInputType_0();
    local v28 = l_useFocusGuiObject_0();
    local v32 = if v20.onHover then v5.useCallback(function(v29) --[[ Line: 48 ]]
        -- upvalues: v20 (copy), l_ControlState_0 (ref)
        local l_onHover_0 = v20.onHover;
        local v31 = true;
        if v29 ~= l_ControlState_0.Hover then
            v31 = true;
            if v29 ~= l_ControlState_0.Pressed then
                v31 = v29 == l_ControlState_0.SelectedPressed;
            end;
        end;
        l_onHover_0(v31);
    end, {
        v20.onHover
    }) else nil;
    local v33 = l_HttpService_0:JSONDecode(v20.notificationInfo);
    local v34 = {};
    if v33.Buttons then
        for v35, v36 in ipairs(v33.Buttons) do
            table.insert(v34, {
                text = v36.Text, 
                variant = v36.ButtonType, 
                onActivated = function() --[[ Line: 64 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_GuiService_0 (ref), v20 (copy), v35 (copy)
                    l_GuiService_0:OnNotificationInteraction(v20.notificationId, v35 - 1);
                end
            });
        end;
    end;
    return v5.createElement(l_View_0, {
        tag = "auto-xy", 
        GroupTransparency = if v20.transparency ~= nil then v20.transparency else nil, 
        onStateChanged = v32, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        SelectionGroup = v23, 
        SelectionBehaviorUp = v25, 
        SelectionBehaviorDown = v25, 
        SelectionBehaviorLeft = v25, 
        SelectionBehaviorRight = v25, 
        ref = v22
    }, v8.Dictionary.join(v20.children or {}, {
        Toast = v5.createElement(l_Toast_0, {
            title = v33.Title, 
            text = v33.Text, 
            icon = v33.Icon, 
            actions = v34, 
            width = v20.width
        }), 
        KeyLabelView = if v27 == l_InputTypeConstants_0.Gamepad and #v34 > 0 then v5.createElement(l_View_0, {
            tag = "size-1400-1400 padding-medium anchor-top-right position-top-right"
        }, {
            EventConnection = v5.createElement(l_EventConnection_0, {
                event = l_UserInputService_0.InputBegan, 
                callback = function(v37) --[[ Line: 101 ]] --[[ Name: callback ]]
                    -- upvalues: v28 (copy), v20 (copy)
                    if v37.KeyCode == Enum.KeyCode.ButtonB then
                        v28(nil);
                        v20.onPause(false);
                    end;
                end
            }), 
            KeyLabel = v5.createElement(l_KeyLabel_0, {
                Size = UDim2.fromScale(1, 1), 
                keyCode = Enum.KeyCode.ButtonStart, 
                holdBehavior = {
                    holdTime = v19.MenuButtonPressHoldTime, 
                    resetTime = v19.MenuButtonPressResetTime, 
                    onBeginHold = function() --[[ Line: 114 ]] --[[ Name: onBeginHold ]]
                        -- upvalues: v20 (copy)
                        v20.onPause(true);
                    end, 
                    onEndHold = function(v38) --[[ Line: 117 ]] --[[ Name: onEndHold ]]
                        -- upvalues: v34 (copy), v20 (copy), v24 (copy), v26 (copy), v28 (copy), v22 (copy)
                        if v38 then
                            if #v34 == 1 then
                                v20.onPause(false);
                                v34[1].onActivated();
                                return;
                            else
                                v24(true);
                                v26(Enum.SelectionBehavior.Stop);
                                v28(v22.current);
                                return;
                            end;
                        else
                            v20.onPause(false);
                            return;
                        end;
                    end
                }
            })
        }) else nil
    }));
end));