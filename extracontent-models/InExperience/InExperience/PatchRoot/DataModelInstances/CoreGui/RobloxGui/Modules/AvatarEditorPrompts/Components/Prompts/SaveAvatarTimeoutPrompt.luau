local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_AXPartialPageModal_0 = v5.Components.AXPartialPageModal;
local l_getTimeoutStatusStore_0 = v5.Stores.getTimeoutStatusStore;
local l_formatTimeoutEndTime_0 = v5.Utils.formatTimeoutEndTime;
local v9 = require(l_CorePackages_0.Packages.Foundation);
local l_View_0 = v9.View;
local l_Text_0 = v9.Text;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_InputSize_0 = v9.Enums.InputSize;
local l_Parent_0 = script.Parent.Parent.Parent;
local v15 = require(l_Parent_0.Thunks.CloseOpenPrompt);
return function() --[[ Line: 25 ]] --[[ Name: SaveAvatarTimeoutPrompt ]]
    -- upvalues: l_useDispatch_0 (copy), l_getTimeoutStatusStore_0 (copy), l_useSignalState_0 (copy), v1 (copy), v15 (copy), l_useLocalization_0 (copy), l_formatTimeoutEndTime_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v16 = l_useDispatch_0();
    local v17 = l_getTimeoutStatusStore_0();
    local v18 = l_useSignalState_0(v17.getTimeoutDetails);
    local v19 = v1.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v16 (copy), v15 (ref)
        v16(v15);
    end, {
        v16
    });
    local v20 = l_useLocalization_0({
        rule = if v18 then "Feature.NotApproved." .. v18.labelTranslationKey else nil
    });
    local v21 = l_useLocalization_0({
        titleText = "Feature.Timeout.Prompt.SaveTitleText", 
        bodyText = {
            "Feature.Timeout.Prompt.BodyText"; 
            rule = v20.rule or "", 
            time = if v18 then l_formatTimeoutEndTime_0(v18.endDate) else ""
        }, 
        closeText = "Feature.Timeout.Label.OK"
    });
    return v1.createElement(l_AXPartialPageModal_0, {
        onBackgroundPress = v19, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v19, 
                        text = v21.closeText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, {
        ViewFrame = v1.createElement(l_View_0, {
            tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
        }, {
            PromptBodyTitle = v1.createElement(l_Text_0, {
                tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap", 
                Text = v21.titleText, 
                LayoutOrder = 2
            }), 
            PromptBodyText = v1.createElement(l_Text_0, {
                tag = "auto-xy text-align-x-left text-body-large text-wrap font-family-code", 
                Text = v21.bodyText, 
                LayoutOrder = 3
            })
        })
    });
end;