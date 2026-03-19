local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local v7 = require(l_Parent_0.Actions.DeleteWarningModalClosed);
local v8 = require(l_Parent_0.Utils.recordDeleteWarningModalOptOut);
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useScreenSize_0 = v5.useScreenSize;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useState_0 = v3.useState;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v17 = require(l_Parent_0.Constants);
local v18 = require(l_Parent_0.Analytics.EventNames);
local v19 = require(l_Parent_0.Analytics.useAnalytics);
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v6.App.InputButton.Checkbox;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
return function(v23) --[[ Line: 35 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useStyle_0 (copy), v19 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v17 (copy), l_useState_0 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v7 (copy), v18 (copy), v8 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_Checkbox_0 (copy)
    local v24 = l_useScreenSize_0();
    local v25 = l_useStyle_0();
    local v26 = v19();
    local v27 = l_useDispatch_0();
    local v28 = l_useLocalization_0({
        alertBody = "Feature.Captures.Label.DeleteCaptureInfo", 
        alertBodyPlural = "Feature.Captures.Label.DeleteCapturesWarning", 
        alertTitle = "Feature.Captures.Title.DeleteCaptureWarning", 
        alertTitlePlural = "Feature.Captures.Title.DeleteMultipleCapturesWarning", 
        cancelCTA = "Feature.Captures.Action.DeleteCaptureWarningCancel", 
        deleteCTA = "Feature.Captures.Action.DeleteCaptureWarningConfirm", 
        optOutText = "Feature.Captures.Label.DeleteCaptureWarningOptOut"
    });
    local l_Theme_0 = v25.Theme;
    local v31 = l_useSelector_0(function(v30) --[[ Line: 54 ]]
        -- upvalues: v17 (ref)
        return v30[v17.RoduxKey].Carousel.IsDeleteWarningModalOpen;
    end);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 58 ]]
        -- upvalues: v17 (ref)
        return v32[v17.RoduxKey].CaptureManager.SelectedCaptures;
    end);
    local v34, v35 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 64 ]]
        -- upvalues: v31 (copy), v35 (copy)
        if v31 then
            v35(false);
        end;
    end, {
        v31, 
        v35
    });
    local v36 = l_useCallback_0(function() --[[ Line: 70 ]]
        -- upvalues: v27 (copy), v7 (ref), v26 (copy), v18 (ref)
        v27(v7());
        v26.fireEvent(v18.CapturesDeleteWarningModalCancelPressed);
    end, {});
    local v37 = l_useCallback_0(function() --[[ Line: 75 ]]
        -- upvalues: v23 (copy), v34 (copy), v8 (ref), v26 (copy), v18 (ref), v27 (copy), v7 (ref)
        v23.deleteItem();
        if v34 then
            v8(v26);
        end;
        v26.fireEvent(v18.CapturesDeleteWarningModalDeletePressed);
        v27(v7());
    end, {
        v26, 
        v34, 
        v23.deleteItem
    });
    return v3.createElement("TextButton", {
        Active = true, 
        AutoButtonColor = false, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.fromScale(1, 1), 
        Visible = v31, 
        ZIndex = v23.zIndex
    }, {
        Alert = v3.createElement(l_InteractiveAlert_0, {
            bodyText = if #v33 > 1 then v28.alertBodyPlural else v28.alertBody, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v36, 
                            text = v28.cancelCTA
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v37, 
                            text = v28.deleteCTA
                        }
                    }
                }
            }, 
            isMiddleContentFocusable = false, 
            middleContent = function() --[[ Line: 116 ]] --[[ Name: middleContent ]]
                -- upvalues: v3 (ref), l_Checkbox_0 (ref), v28 (copy), v34 (copy), v35 (copy)
                return v3.createElement(l_Checkbox_0, {
                    text = v28.optOutText, 
                    isSelected = v34, 
                    isDisabled = false, 
                    onActivated = function() --[[ Line: 121 ]] --[[ Name: onActivated ]]
                        -- upvalues: v35 (ref), v34 (ref)
                        v35(not v34);
                    end
                });
            end, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v24, 
            title = if #v33 > 1 then v28.alertTitlePlural else v28.alertTitle
        })
    });
end;