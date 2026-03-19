local l_Parent_0 = script:FindFirstAncestor("ToastLite").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.ToastRodux);
local v5 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v5.App.Dialog.Toast;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ToastType_0 = v4.Enums.ToastType;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v12 = {
    Info = l_Images_0["icons/logo/block"], 
    Warning = l_Images_0["icons/status/alert"], 
    Success = l_Images_0["icons/actions/accept"]
};
local v13 = {
    [l_ToastType_0.InformationMessage] = v12.Info, 
    [l_ToastType_0.SuccessConfirmation] = v12.Success, 
    [l_ToastType_0.NetworkingError] = v12.Warning
};
local v14 = {
    duration = 3, 
    springOptions = {
        frequency = 4, 
        damping = 1
    }
};
local function v16(v15) --[[ Line: 49 ]] --[[ Name: selectCurrentMessage ]]
    return v15.currentToastMessages[1];
end;
return function(v17) --[[ Line: 53 ]] --[[ Name: Toast ]]
    -- upvalues: v1 (copy), v14 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v16 (copy), l_useStyle_0 (copy), v2 (copy), v4 (copy), l_ToastType_0 (copy), v13 (copy), l_Toast_0 (copy)
    local v18 = v1.Dictionary.join(v14, v17);
    local v19 = l_useDispatch_0();
    local v20 = l_useSelector_0(v16);
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local v22 = v2.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v19 (copy), v4 (ref)
        v19(v4.Actions.RemoveCurrentToastMessage());
    end, {
        v19
    });
    local function v23() --[[ Line: 66 ]]
        -- upvalues: v20 (copy), v22 (copy)
        if v20 then
            v22();
        end;
    end;
    v2.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v20 (copy), v22 (copy)
        if v20 and (not next(v20) or not v20.toastTitle) then
            v22();
        end;
    end, {
        v20, 
        v22
    });
    if v20 == nil then
        return nil;
    else
        local l_toastType_0 = v20.toastType;
        local v25 = if l_toastType_0 == l_ToastType_0.QuickLaunchError then v23 else nil;
        local v26 = if l_toastType_0 ~= nil then v13[l_toastType_0] else nil;
        local v27 = UDim2.new(0.5, 0, 0, l_Tokens_0.Global.Space_250);
        return v2.createElement(l_Toast_0, {
            duration = v18.duration, 
            position = v27, 
            show = true, 
            springOptions = v18.springOptions, 
            toastContent = {
                iconImage = v26, 
                onActivated = v25, 
                onDismissed = v22, 
                sequenceNumber = v20.sequenceNumber, 
                toastSubtitle = v20.toastSubtitle, 
                toastTitle = v20.toastTitle
            }
        });
    end;
end;