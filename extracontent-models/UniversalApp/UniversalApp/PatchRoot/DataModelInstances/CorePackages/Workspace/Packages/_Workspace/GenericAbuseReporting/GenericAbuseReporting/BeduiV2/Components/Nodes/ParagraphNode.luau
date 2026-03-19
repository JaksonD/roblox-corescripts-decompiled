local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SharedFlags);
local l_Button_0 = v2.Button;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Sheet_0 = v2.Sheet;
local v8 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_FFlagRemoveTitleAddEyebrowReport_0 = v4.FFlagRemoveTitleAddEyebrowReport;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = v4.FFlagSupportSubmissionOnAllReportNodes;
return v3.memo(function(v14) --[[ Line: 36 ]] --[[ Name: ParagraphNode ]]
    -- upvalues: l_useArTranslation_0 (copy), v3 (copy), l_Sheet_0 (copy), l_FFlagRemoveTitleAddEyebrowReport_0 (copy), v8 (copy), v9 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), v2 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    return v3.createElement(v3.Fragment, nil, {
        Content = v3.createElement(l_Sheet_0.Content, nil, {
            Eyebrow = if l_FFlagRemoveTitleAddEyebrowReport_0 then v3.createElement(v8, {
                eyebrow = v14.eyebrow, 
                layoutOrder = 0
            }) else nil, 
            Title = v3.createElement(v9, {
                input = v14.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            Paragraph = v3.createElement(v9, {
                input = v14.paragraph, 
                tag = "size-full-0 auto-y text-body-small", 
                layoutOrder = 2
            })
        }), 
        Actions = if v14.onNext then v3.createElement(l_Sheet_0.Actions, nil, v3.createElement(l_Button_0, {
            text = l_translateIntoString_0(v14.nextButtonText), 
            variant = l_ButtonVariant_0.Emphasis, 
            fillBehavior = v2.Enums.FillBehavior.Fill, 
            isLoading = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v14.isSubmitting else false, 
            isDisabled = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v14.isSubmitting else false, 
            onActivated = v14.onNext
        })) else nil
    });
end);