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
local l_LabelAbuseTypeMapping_0 = v9.Constants.LabelAbuseTypeMapping;
local v14 = require(l_Parent_0.Foundation);
local l_View_0 = v14.View;
local l_Text_0 = v14.Text;
local l_ButtonVariant_0 = v14.Enums.ButtonVariant;
local l_InputSize_0 = v14.Enums.InputSize;
return function() --[[ Line: 31 ]] --[[ Name: TimeoutStatusPrompt ]]
    -- upvalues: l_useNavigation_0 (copy), l_getTimeoutStatusStore_0 (copy), l_useSignalState_0 (copy), v2 (copy), l_sendAXCounterV2_0 (copy), v6 (copy), v3 (copy), l_LabelAbuseTypeMapping_0 (copy), l_useLocalization_0 (copy), l_formatTimeoutEndTime_0 (copy), l_AXPartialPageModal_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v19 = l_useNavigation_0();
    local v20 = l_getTimeoutStatusStore_0();
    local v21 = l_useSignalState_0(v20.getTimeoutDetails);
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: l_sendAXCounterV2_0 (ref), v6 (ref), v21 (copy)
        l_sendAXCounterV2_0(v6.COUNTERS.TimeoutStatusPromptShown, {
            labelTranslationKey = if v21 then v21.labelTranslationKey else ""
        });
    end, {});
    local v22 = v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v19 (copy), v3 (ref)
        v19.dispatch(v3.Actions.back(nil));
    end, {
        v19
    });
    local v23 = if v21 and l_LabelAbuseTypeMapping_0 then l_LabelAbuseTypeMapping_0[v21.labelTranslationKey] else nil;
    local v24 = l_useLocalization_0({
        rule = v23
    });
    local v25 = l_useLocalization_0({
        titleText = "Feature.Timeout.Prompt.TitleText", 
        bodyText = {
            "Feature.Timeout.Prompt.BodyText"; 
            rule = v24.rule, 
            time = if v21 then l_formatTimeoutEndTime_0(v21.endDate) else ""
        }, 
        closeText = "Feature.Timeout.Label.OK"
    });
    return v2.createElement(l_AXPartialPageModal_0, {
        onBackgroundPress = v22, 
        buttonStackProps = {
            rowLayout = false, 
            buttons = {
                {
                    props = {
                        onActivated = v22, 
                        text = v25.closeText, 
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
                Text = v25.titleText, 
                LayoutOrder = 2
            }), 
            PromptBodyText = v2.createElement(l_Text_0, {
                tag = "auto-xy text-align-x-left text-body-large text-wrap font-family-code", 
                Text = v25.bodyText, 
                LayoutOrder = 3
            })
        })
    });
end;