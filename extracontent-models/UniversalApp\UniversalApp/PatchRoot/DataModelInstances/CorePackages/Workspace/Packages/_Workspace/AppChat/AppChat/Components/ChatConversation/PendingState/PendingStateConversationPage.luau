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
local v17 = {
    topBarHeight = 0, 
    networkErrorText = "PLACEHOLDER There was a network error, please try again later", 
    onConversationUnmount = function(_) --[[ Line: 47 ]] --[[ Name: onConversationUnmount ]]

    end, 
    navigateToToast = function(_) --[[ Line: 48 ]] --[[ Name: navigateToToast ]]

    end, 
    navigateBack = function() --[[ Line: 49 ]] --[[ Name: navigateBack ]]

    end, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowIneligibleModal = false
};
return l_memo_0(function(v18) --[[ Line: 57 ]] --[[ Name: PendingStateConversationPage ]]
    -- upvalues: v3 (copy), v17 (copy), l_useStyle_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), l_useRef_0 (copy), v12 (copy), l_useEffect_0 (copy), v4 (copy), v13 (copy), v14 (copy)
    local v19 = v3.Dictionary.join(v17, v18);
    local v20 = l_useStyle_0();
    local v21 = v19.style or v20;
    local v22, v23 = l_useState_0(0);
    local v25 = l_useCallback_0(function(v24) --[[ Line: 63 ]]
        -- upvalues: v23 (copy)
        v23(v24);
    end, l_dependencyArray_0(v23));
    local v26 = l_useCallback_0(function() --[[ Line: 67 ]]
        -- upvalues: v19 (copy)
        v19.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v19.networkErrorText
                }
            }
        });
    end, l_dependencyArray_0(v19.navigateToToast, v19.networkErrorText));
    local v27 = l_useRef_0(v12.Default);
    local v31 = l_useCallback_0(function(_, v29, v30) --[[ Line: 79 ]]
        -- upvalues: v19 (copy), v27 (copy), v12 (ref)
        if not v19.wideMode and v29 == Enum.SwipeDirection.Right and v30 == 1 then
            v27.current = v12.SwipedRight;
            v19.navigateBack();
        end;
    end, {
        v19.wideMode, 
        v19.navigateBack
    });
    l_useEffect_0(function() --[[ Line: 86 ]]
        -- upvalues: v19 (copy), v27 (copy), v12 (ref)
        return function() --[[ Line: 87 ]]
            -- upvalues: v19 (ref), v27 (ref), v12 (ref)
            v19.onConversationUnmount(v27.current);
            v27.current = v12.Default;
        end;
    end, {});
    return v4.createElement("TextButton", {
        BackgroundColor3 = v21.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Transparency = v21.Tokens.Global.Color.None.Transparency, 
        Text = "", 
        LayoutOrder = v19.layoutOrder, 
        [v4.Event.TouchSwipe] = v31
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PendingStateIndicator = v4.createElement(v13, {
            layoutOrder = 1, 
            size = UDim2.new(1, 0, 1, -v22)
        }), 
        ConversationBottomModal = v4.createElement(v14, {
            conversationId = v19.conversationId, 
            showNetworkErrorToast = v26, 
            layoutOrder = 2, 
            onHeightChanged = v25
        })
    });
end);