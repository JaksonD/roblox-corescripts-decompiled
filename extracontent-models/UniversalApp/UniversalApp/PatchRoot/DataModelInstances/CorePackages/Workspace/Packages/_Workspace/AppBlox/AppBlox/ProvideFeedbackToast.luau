local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.CentralOverlay);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Localization);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.RobloxAppEnums);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.SharedFlags);
local l_CloseCentralOverlay_0 = v1.Thunks.CloseCentralOverlay;
local l_SetCentralOverlay_0 = v1.Actions.SetCentralOverlay;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_CentralOverlayType_0 = v6.CentralOverlayType;
local l_Toast_0 = v7.App.Dialog.Toast;
local _ = require(script.Parent.CheckboxFeedbackFormModal);
local v18 = require(script.Parent.SnackbarWrapper);
local v19 = game:DefineFastFlag("FixProvideFeedbackToastPositioning", false);
local l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 = v8.FFlagLuaAppUseSnackbarForProvideFeedbackToast;
return v4.memo(function(v21) --[[ Line: 56 ]] --[[ Name: ProvideFeedbackToast ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_CloseCentralOverlay_0 (copy), l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 (copy), v18 (copy), v19 (copy), l_useSelector_0 (copy), l_Toast_0 (copy)
    local v22 = l_useDispatch_0();
    local v23 = l_useTokens_0();
    local v24 = l_useLocalization_0({
        giveFeedback = "Feature.GameDetails.Action.GiveFeedback", 
        helpUsImprove = "Feature.GameDetails.Message.HelpImproveExperience"
    });
    local v25 = v4.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v21 (copy), v22 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        if v21.onToastActivated then
            task.spawn(v21.onToastActivated);
        end;
        v22(l_SetCentralOverlay_0(l_CentralOverlayType_0.CheckboxFeedbackFormModal, v21.feedbackFormProps));
    end, {
        v21.onToastActivated, 
        v22, 
        v21.feedbackFormProps
    });
    local v26 = v4.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v21 (copy), v22 (copy), l_CloseCentralOverlay_0 (ref)
        if v21.onToastDismissed then
            task.spawn(v21.onToastDismissed);
        end;
        v22(l_CloseCentralOverlay_0());
    end, {
        v21.onToastDismissed, 
        v22
    });
    if l_FFlagLuaAppUseSnackbarForProvideFeedbackToast_0 then
        return v4.createElement(v18, {
            titleText = v21.toastTitle or v24.helpUsImprove, 
            icon = v21.toastIcon, 
            buttonText = v21.toastButtonText or v24.giveFeedback, 
            onButtonActivated = v25, 
            closeSnackbar = v26, 
            autoDismissDelaySeconds = 5
        });
    else
        local v27 = {
            Color = v23.Inverse.Surface.Surface_0.Color3, 
            Transparency = v23.Inverse.Surface.Surface_0.Transparency
        };
        local v28 = nil;
        if v19 then
            local v30 = l_useSelector_0(function(v29) --[[ Line: 96 ]]
                return v29.GlobalGuiInset or {
                    left = 0, 
                    top = 0, 
                    right = 0, 
                    bottom = 0
                };
            end);
            local v32 = l_useSelector_0(function(v31) --[[ Line: 105 ]]
                return v31.TopBar.statusBarHeight;
            end);
            v28 = UDim2.new(0.5, 0, 0, v30.top + 20 + v32);
        end;
        return v4.createElement(l_Toast_0, {
            duration = 5, 
            position = if v19 then v28 else nil, 
            toastContent = {
                buttonText = v21.toastButtonText or v24.giveFeedback, 
                iconColorStyle = v27, 
                iconImage = v21.toastIcon, 
                onActivated = v25, 
                onAppeared = v21.onToastAppeared, 
                onDismissed = v26, 
                swipeUpDismiss = true, 
                toastTitle = v21.toastTitle or v24.helpUsImprove, 
                toastSubtitle = v21.toastSubtitle
            }
        });
    end;
end);