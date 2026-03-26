local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useRef_0 = v4.useRef;
local l_useState_0 = v4.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v12 = require(l_script_FirstAncestor_0.Analytics.Enums.ConversationExitType);
local v13 = require(script.Parent.PendingStateIndicator);
local v14 = require(script.Parent.PendingStateModalContainer);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v18 = {
    topBarHeight = 0, 
    networkErrorText = "PLACEHOLDER There was a network error, please try again later", 
    onConversationUnmount = function(_) --[[ Line: 49 ]] --[[ Name: onConversationUnmount ]]

    end, 
    navigateToToast = function(_) --[[ Line: 50 ]] --[[ Name: navigateToToast ]]

    end, 
    navigateBack = function() --[[ Line: 51 ]] --[[ Name: navigateBack ]]

    end, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowIneligibleModal = false
};
return l_memo_0(function(v19) --[[ Line: 59 ]] --[[ Name: PendingStateConversationPage ]]
    -- upvalues: v3 (copy), v18 (copy), l_useStyle_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useRef_0 (copy), v12 (copy), l_useEffect_0 (copy), v4 (copy), v13 (copy), v14 (copy)
    local v20 = v3.Dictionary.join(v18, v19);
    local v21 = l_useStyle_0();
    local v22 = v20.style or v21;
    local v23, v24 = l_useState_0(0);
    local v26 = l_useCallback_0(function(v25) --[[ Line: 66 ]]
        -- upvalues: v24 (copy)
        v24(v25);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v24
    } else l_dependencyArray_0(v24));
    local v27 = l_useCallback_0(function() --[[ Line: 75 ]]
        -- upvalues: v20 (copy)
        v20.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v20.networkErrorText
                }
            }
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20.navigateToToast, 
        v20.networkErrorText
    } else l_dependencyArray_0(v20.navigateToToast, v20.networkErrorText));
    local v28 = l_useRef_0(v12.Default);
    local v32 = l_useCallback_0(function(_, v30, v31) --[[ Line: 91 ]]
        -- upvalues: v20 (copy), v28 (copy), v12 (ref)
        if not v20.wideMode and v30 == Enum.SwipeDirection.Right and v31 == 1 then
            v28.current = v12.SwipedRight;
            v20.navigateBack();
        end;
    end, {
        v20.wideMode, 
        v20.navigateBack
    });
    l_useEffect_0(function() --[[ Line: 98 ]]
        -- upvalues: v20 (copy), v28 (copy), v12 (ref)
        return function() --[[ Line: 99 ]]
            -- upvalues: v20 (ref), v28 (ref), v12 (ref)
            v20.onConversationUnmount(v28.current);
            v28.current = v12.Default;
        end;
    end, {});
    return v4.createElement("TextButton", {
        BackgroundColor3 = v22.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Transparency = v22.Tokens.Global.Color.None.Transparency, 
        Text = "", 
        LayoutOrder = v20.layoutOrder, 
        [v4.Event.TouchSwipe] = v32
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PendingStateIndicator = v4.createElement(v13, {
            layoutOrder = 1, 
            size = UDim2.new(1, 0, 1, -v23)
        }), 
        ConversationBottomModal = v4.createElement(v14, {
            conversationId = v20.conversationId, 
            showNetworkErrorToast = v27, 
            layoutOrder = 2, 
            onHeightChanged = v26
        })
    });
end);