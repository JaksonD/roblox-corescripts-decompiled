local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v6 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v9 = require(l_script_FirstAncestor_0.Analytics.sendButtonClickEvent);
local function v11(v10) --[[ Line: 19 ]] --[[ Name: selectScreenSize ]]
    return v10.ScreenSize;
end;
return function(v12) --[[ Line: 23 ]] --[[ Name: ErrorScreen ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), l_useSelector_0 (copy), v11 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v9 (copy)
    local l_onRetry_0 = v12.onRetry;
    local l_onCancel_0 = v12.onCancel;
    local l_featureName_0 = v12.featureName;
    local v16 = l_useLocalization_0({
        title = "Amp.ErrorScreen.Title", 
        bodyText = "Amp.ErrorScreen.BodyText", 
        buttonRetry = "Amp.ErrorScreen.Retry", 
        buttonCancel = "Amp.ErrorScreen.Cancel"
    });
    local v17 = if v12.analyticsService then v12.analyticsService else v5.EventStream;
    local v18 = l_useSelector_0(v11);
    return v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = v18, 
        title = v16.title, 
        bodyText = v16.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = function() --[[ Line: 48 ]] --[[ Name: onActivated ]]
                            -- upvalues: v9 (ref), v17 (copy), l_featureName_0 (copy), l_onCancel_0 (copy)
                            v9(v17, "AmpErrorScreen", l_featureName_0, "Cancel");
                            l_onCancel_0();
                        end, 
                        text = v16.buttonCancel
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = function() --[[ Line: 59 ]] --[[ Name: onActivated ]]
                            -- upvalues: v9 (ref), v17 (copy), l_featureName_0 (copy), l_onRetry_0 (copy)
                            v9(v17, "AmpErrorScreen", l_featureName_0, "Retry");
                            l_onRetry_0();
                        end, 
                        text = v16.buttonRetry
                    }
                }
            }
        }
    });
end;