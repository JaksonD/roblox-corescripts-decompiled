local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local l_Button_0 = v2.Button;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_InputSize_0 = v2.Enums.InputSize;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local v13 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local v16 = require(l_Parent_0.Analytics.EventNames);
local v17 = require(l_Parent_0.Thunks.PermissionPromptFinished);
return function(v18) --[[ Line: 30 ]]
    -- upvalues: v13 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v4 (copy), v16 (copy), v17 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v19 = v13();
    local v20 = l_useDispatch_0();
    local v21 = l_useLocalization_0({
        allow = "Feature.Captures.Action.Allow", 
        allowAccessToCapturesBody = "Feature.Captures.Body.AllowAccessToCaptures", 
        allowAccessToCapturesTitle = "Feature.Captures.Title.AllowAccessToCaptures", 
        dontAllow = "Feature.Captures.Action.DontAllow"
    });
    v4.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v19 (copy), v16 (ref)
        v19.fireEvent(v16.CapturePermissionsPromptViewed);
    end, {});
    local v22 = v4.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v19 (copy), v16 (ref), v20 (copy), v17 (ref), v18 (copy)
        v19.fireEvent(v16.CapturePermissionsPromptAccepted);
        v20(v17(v18.promptId, true));
    end, {
        v18.promptId
    });
    local v23 = v4.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy), v16 (ref), v20 (copy), v17 (ref), v18 (copy)
        v19.fireEvent(v16.CapturePermissionsPromptRejected);
        v20(v17(v18.promptId, false));
    end, {
        v18.promptId
    });
    return v4.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small
    }, {
        DialogTitle = v4.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "col align-x-center align-y-center auto-y gap-small size-full-0 margin-top-small"
        }, {
            DialogTitleText = v4.createElement(l_Text_0, {
                Text = v21.allowAccessToCapturesTitle, 
                tag = "auto-xy text-heading-small text-wrap"
            })
        }), 
        DialogContent = v4.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "col align-x-center align-y-center auto-y gap-small size-full-0 margin-none"
        }, {
            DialogContentText = v4.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v21.allowAccessToCapturesBody, 
                tag = "auto-xy text-body-small text-wrap padding-bottom-xsmall"
            }), 
            Buttons = v4.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "row align-x-center align-y-center auto-xy gap-medium"
            }, {
                AcceptButton = v4.createElement(l_Button_0, {
                    text = v21.allow, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v22, 
                    size = l_InputSize_0.Small, 
                    width = UDim.new(0.45, 0)
                }), 
                RejectButton = v4.createElement(l_Button_0, {
                    text = v21.dontAllow, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v23, 
                    size = l_InputSize_0.Small, 
                    width = UDim.new(0.45, 0)
                })
            })
        })
    });
end;