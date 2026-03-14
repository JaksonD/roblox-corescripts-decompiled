local l_Parent_0 = script:FindFirstAncestor("SocialBlockingModal").Parent;
local v1 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v5 = {
    BLOCK_TARGET_ALREADY_BLOCKED_ERROR = 1, 
    USER_BLOCKING_LIMIT_REACHED_API_ERROR = 2, 
    UNBLOCK_TARGET_NOT_BLOCKED_ERROR = 4, 
    PARENT_BLOCKED_TARGET_USER_ERROR = 14
};
return function() --[[ Line: 17 ]] --[[ Name: useShowToastOnError ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v1 (copy), v5 (copy), l_SetCurrentToastMessage_0 (copy)
    local v6 = l_useDispatch_0();
    local v7 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        blockLimitReachedToast = "Feature.Profile.Message.BlockError", 
        blocktargetAlreadyBlockedToast = "Feature.Friends.Error.TargetAlreadyBlockedError"
    });
    return v1.useCallback(function(v8) --[[ Line: 25 ]]
        -- upvalues: v5 (ref), v6 (copy), l_SetCurrentToastMessage_0 (ref), v7 (copy)
        local v9 = v8 and v8.Body and tonumber(v8.Body) or nil;
        if v9 == v5.BLOCK_TARGET_ALREADY_BLOCKED_ERROR then
            v6(l_SetCurrentToastMessage_0({
                toastMessage = v7.blocktargetAlreadyBlockedToast, 
                isLocalized = true
            }));
            return;
        elseif v9 == v5.USER_BLOCKING_LIMIT_REACHED_API_ERROR then
            v6(l_SetCurrentToastMessage_0({
                toastMessage = v7.blockLimitReachedToast, 
                isLocalized = true
            }));
            return;
        else
            v6(l_SetCurrentToastMessage_0({
                toastMessage = v7.somethingIsWrongToast, 
                isLocalized = true
            }));
            return;
        end;
    end, {
        v6, 
        v7
    });
end;