local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.AuthAnalytics);
local l_authModalShown_0 = v4.Events.authModalShown;
local l_authButtonClick_0 = v4.Events.authButtonClick;
local l_EventStreamConstants_0 = v4.EventStreamConstants;
local l_InputSize_0 = v2.Enums.InputSize;
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useFocusGuiObject_0 = v3.useFocusGuiObject;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v15 = require(l_Parent_0.InputHandlers);
local v16 = {
    [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.Confirm, 
    [Enum.KeyCode.Return] = l_FocusNavigationEventNameEnum_0.Confirm
};
local function v20(v17) --[[ Line: 29 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v3 (copy), v16 (copy), v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v15 (copy)
    local v18 = v3.useEventMap(v16, v17);
    local v19 = v1.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v15 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.Confirm] = {
                handler = v15.onRelease(function() --[[ Line: 34 ]]

                end)
            }
        };
    end, {});
    return v3.useEventHandlerMap(v19, v18);
end;
return function(v21) --[[ Line: 46 ]] --[[ Name: SignUpExitModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_useFocusGuiObject_0 (copy), v1 (copy), v20 (copy), l_authModalShown_0 (copy), l_EventStreamConstants_0 (copy), l_authButtonClick_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v2 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v22 = l_useLocalization_0({
        cancel = "Authentication.SignUp.Action.Cancel", 
        confirm = "Authentication.SignUp.Action.ExitModalLeave", 
        title = "Authentication.SignUp.Label.ExitModalTitle", 
        subtitle = "Authentication.SignUp.Label.ExitModalSubtitle"
    });
    local v23 = l_useFocusGuiObject_0();
    local v24 = v1.useRef(nil);
    local v25 = v20(nil);
    v1.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v23 (copy), v24 (copy), l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref)
        v23(v24.current);
        l_authModalShown_0(l_EventStreamConstants_0.Context.SignUpExitModal, l_EventStreamConstants_0.State.Success);
    end, {});
    local v26 = v1.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v21 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.SignUpExitModal, l_EventStreamConstants_0.Button.SignUpExitModalLeave);
        v21.onConfirm();
    end, {
        v21.onConfirm
    });
    local v27 = v1.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v21 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.SignUpExitModal, l_EventStreamConstants_0.Button.SignUpExitModalCancel);
        v21.onClose();
    end, {
        v21.onClose
    });
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        ref = v25
    }, {
        DialogTitle = v1.createElement(l_Dialog_0.Title, {
            text = v22.title
        }), 
        DialogContent = v1.createElement(l_Dialog_0.Content, {}, {
            DialogView = v1.createElement(v2.View, {
                tag = "col fill auto-xy items-start gap-medium"
            }, {
                DialogText = v1.createElement(l_Dialog_0.Text, {
                    Text = v22.subtitle, 
                    LayoutOrder = 1
                }), 
                PrimaryButton = v1.createElement(v2.Button, {
                    text = v22.confirm, 
                    variant = l_ButtonVariant_0.Alert, 
                    size = l_InputSize_0.Small, 
                    width = UDim.new(1, 0), 
                    TextTruncate = Enum.TextTruncate.None, 
                    onActivated = v26, 
                    LayoutOrder = 2
                }), 
                SecondaryButton = v1.createElement(v2.Button, {
                    text = v22.cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    size = l_InputSize_0.Small, 
                    width = UDim.new(1, 0), 
                    TextTruncate = Enum.TextTruncate.None, 
                    onActivated = v27, 
                    LayoutOrder = 3, 
                    ref = v24
                })
            })
        })
    });
end;