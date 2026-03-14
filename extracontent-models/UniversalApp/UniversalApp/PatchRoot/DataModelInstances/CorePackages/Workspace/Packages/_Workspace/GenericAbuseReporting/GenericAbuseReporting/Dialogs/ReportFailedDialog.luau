local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.LocalizationKeys.useLocalizedStrings);
local v6 = require(l_script_FirstAncestor_0.Common.MODAL_POSITION_OFFSET);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLayerCollector_0 = v3.Core.Layout.LayerCollector.useLayerCollector;
return function(v10) --[[ Line: 37 ]] --[[ Name: ReportFailedDialog ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), l_useLayerCollector_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy), v6 (copy), l_ButtonType_0 (copy)
    local v11 = v10.localizationKeys and l_useLocalization_0(v10.localizationKeys) or v5();
    local v12 = l_useLayerCollector_0();
    local l_absoluteSize_0 = v12.absoluteSize;
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = Vector2.new(l_absoluteSize_0.X, l_absoluteSize_0.Y - v12.insets.top), 
        title = v11.failedTitle, 
        bodyText = v11.failedDescription, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, v12.insets.top + v6), 
        buttonStackInfo = v10.buttonStackInfo or {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v10.onDismiss, 
                        text = v11.failedClose
                    }
                }
            }
        }, 
        middleContent = v10.middleContent
    });
end;