local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.Constants);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Foundation);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Text_0 = v5.Text;
local l_Button_0 = v5.Button;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_ButtonSize_0 = v5.Enums.ButtonSize;
local l_FillBehavior_0 = v5.Enums.FillBehavior;
local l_View_0 = v5.View;
local l_Images_0 = v4.App.ImageSet.Images;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v15 = require(l_Parent_0.NotificationModalsManager);
local v16 = l_Images_0["icons/actions/accept"];
local v17 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local l_useLayerCollector_0 = v4.Core.Layout.LayerCollector.useLayerCollector;
getDynamicViewTagForTranslatedText = function(v19, v20, v21) --[[ Line: 33 ]] --[[ Name: getDynamicViewTagForTranslatedText ]]
    -- upvalues: v2 (copy)
    local v22 = "align-x-center align-y-center row";
    local v23 = string.len(v19) + string.len(v20);
    if v2.MAX_CHARACTERS_IN_SHORT_LINE <= v23 and v21 < v2.SMALL_SCREEN_THRESHOLD or v2.MAX_CHARACTERS_IN_LONG_LINE <= v23 then
        v22 = "align-x-center align-y-center col flex-fill";
    end;
    return v22;
end;
InterventionFeedbackFooter = function(v24) --[[ Line: 45 ]] --[[ Name: InterventionFeedbackFooter ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_useLayerCollector_0 (copy), l_useStyle_0 (copy), v15 (copy), v16 (copy), v17 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_FillBehavior_0 (copy)
    local v25 = l_useLocalization_0(v2.localizationKeys);
    local v26 = l_useLayerCollector_0();
    local v27 = getDynamicViewTagForTranslatedText(v25.MistakeText, v25.LetUsKnowLinkText, v26.absoluteSize.X);
    local v28 = l_useStyle_0();
    local function v29() --[[ Line: 55 ]] --[[ Name: handleMistakeActivated ]]
        -- upvalues: v24 (copy), v15 (ref), v16 (ref), v25 (copy), v28 (copy), v17 (ref)
        v24.onDismiss();
        v15.SetUIBloxToast({
            iconImage = v16, 
            toastTitle = v25.TakeALookText, 
            toastSubtitle = v25.FeedbackHelpsText, 
            sequenceNumber = DateTime.now().UnixTimestamp, 
            iconColorStyle = {
                Color = v28.Tokens.Semantic.Color.Common.Success.Color3, 
                Transparency = 0
            }
        });
        v17.sendAnalyticsEvent(v17.Constants.EventTypes.AppealClicked, v24.interventionType, v24.renderTimestamp, v24.eventId, v24.violatingChatLine, v24.duration);
    end;
    return v3.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        tag = v27, 
        Wraps = true
    }, {
        MistakeTextLabelFrame = v3.createElement(l_View_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, 0, 0, v2.TIMEOUT_INLINE_HEIGHT), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1
        }, {
            MistakeTextLabel = v3.createElement(l_Text_0, {
                Text = v25.MistakeText, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                tag = "padding-small text-align-x-center size-1200-900", 
                AutomaticSize = Enum.AutomaticSize.X
            })
        }), 
        LinkFrame = v3.createElement(l_View_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(0.5, 0, 0, v2.TIMEOUT_INLINE_HEIGHT), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            Button = v3.createElement(l_Button_0, {
                text = v25.LetUsKnowLinkText, 
                variant = l_ButtonVariant_0.Text, 
                onActivated = v29, 
                size = l_ButtonSize_0.Small, 
                fillBehavior = l_FillBehavior_0.Fill
            })
        })
    });
end;
return InterventionFeedbackFooter;