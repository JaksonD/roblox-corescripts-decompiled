local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_sendAXCounterV2_0 = require(l_Parent_0.AvatarExperienceAnalytics).sendAXCounterV2;
local v6 = require(l_script_FirstAncestor_0.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v9 = require(l_Parent_0.AvatarExperienceCommon);
local l_AXPartialPageModal_0 = v9.Components.AXPartialPageModal;
local l_getTimeoutStatusStore_0 = v9.Stores.getTimeoutStatusStore;
local l_formatTimeoutEndTime_0 = v9.Utils.formatTimeoutEndTime;
local v13 = require(l_Parent_0.Foundation);
local l_View_0 = v13.View;
local l_Text_0 = v13.Text;
local l_ButtonVariant_0 = v13.Enums.ButtonVariant;
local l_InputSize_0 = v13.Enums.InputSize;
return function() --[[ Line: 30 ]] --[[ Name: TimeoutStatusPrompt ]]
    -- upvalues: l_useNavigation_0 (copy), l_getTimeoutStatusStore_0 (copy), l_useSignalState_0 (copy), v2 (copy), l_sendAXCounterV2_0 (copy), v6 (copy), v3 (copy), l_useLocalization_0 (copy), l_formatTimeoutEndTime_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v18 = l_useNavigation_0();
    local v19 = l_getTimeoutStatusStore_0();
    local v20 = l_useSignalState_0(v19.getTimeoutDetails);
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: l_sendAXCounterV2_0 (ref), v6 (ref), v20 (copy)
        l_sendAXCounterV2_0(v6.COUNTERS.TimeoutStatusPromptShown, {
            labelTranslationKey = if v20 then v20.labelTranslationKey else ""
        });
    end, {});
    local v21 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v18 (copy), v3 (ref)
        v18.dispatch(v3.Actions.back(nil));
    end, {
        v18
    });
    local v22 = l_useLocalization_0({
        rule = if v20 then "Feature.NotApproved." .. v20.labelTranslationKey else nil
    });
    local v23 = l_useLocalization_0({
        titleText = "Feature.Timeout.Prompt.TitleText", 
        bodyText = {
            "Feature.Timeout.Prompt.BodyText"; 
            rule = v22.rule, 
            time = if v20 then l_formatTimeoutEndTime_0(v20.endDate) else ""
        }, 
        closeText = "Feature.Timeout.Label.OK"
    });
    return v2.createElement(l_AXPartialPageModal_0, {
        onBackgroundPress = v21, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v21, 
                        text = v23.closeText, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium
                    }
                }
            }
        }
    }, {
        ViewFrame = v2.createElement(l_View_0, {
            tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
        }, {
            PromptBodyTitle = v2.createElement(l_Text_0, {
                tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap", 
                Text = v23.titleText, 
                LayoutOrder = 2
            }), 
            PromptBodyText = v2.createElement(l_Text_0, {
                tag = "auto-xy text-align-x-left text-body-large text-wrap font-family-code", 
                Text = v23.bodyText, 
                LayoutOrder = 3
            })
        })
    });
end;