local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SharedFlags);
local l_Button_0 = v2.Button;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_FillBehavior_0 = v2.Enums.FillBehavior;
local l_Sheet_0 = v2.Sheet;
local l_TextArea_0 = v2.TextArea;
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Utils.getCodePointLength);
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_FFlagRemoveTitleAddEyebrowReport_0 = v4.FFlagRemoveTitleAddEyebrowReport;
local l_FFlagAddReportCharacterLimit_0 = v4.FFlagAddReportCharacterLimit;
return v3.memo(function(v17) --[[ Line: 42 ]] --[[ Name: CommentNode ]]
    -- upvalues: v3 (copy), l_FFlagAddReportCharacterLimit_0 (copy), v13 (copy), l_useArTranslation_0 (copy), v11 (copy), l_Sheet_0 (copy), l_FFlagRemoveTitleAddEyebrowReport_0 (copy), v10 (copy), v12 (copy), l_TextArea_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v18, v19 = v3.useBinding(v17.initialValue or "");
    local v20, v21 = v3.useState(false);
    local v22 = if l_FFlagAddReportCharacterLimit_0 then v13.mergeTranslationParams else nil;
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v25 = v3.useCallback(function(v24) --[[ Line: 48 ]]
        -- upvalues: v19 (copy), l_FFlagAddReportCharacterLimit_0 (ref), v17 (copy), v21 (copy), v11 (ref)
        v19(v24);
        if l_FFlagAddReportCharacterLimit_0 and v17.maxLength then
            v21(v11(v24) > v17.maxLength);
        end;
    end, {
        v17.maxLength
    });
    local v26 = v3.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v17 (copy), v18 (copy)
        if v17.onNext then
            v17.onNext(v18:getValue());
        end;
    end, {
        v18, 
        v17.onNext
    });
    local v28 = v3.useCallback(function(v27) --[[ Line: 66 ]]
        -- upvalues: v17 (copy), v22 (copy), l_translateIntoString_0 (copy), v11 (ref)
        if v17.helperText and v17.maxLength and v22 then
            return l_translateIntoString_0(v22(v17.helperText, {
                currentLength = tostring(v11(v27)), 
                maxLength = tostring(v17.maxLength)
            }));
        elseif v17.helperText then
            return l_translateIntoString_0(v17.helperText);
        else
            return nil;
        end;
    end, {
        v17.helperText, 
        v17.maxLength
    });
    return v3.createElement(v3.Fragment, nil, {
        Content = v3.createElement(l_Sheet_0.Content, nil, {
            Eyebrow = if l_FFlagRemoveTitleAddEyebrowReport_0 then v3.createElement(v10, {
                eyebrow = v17.eyebrow, 
                layoutOrder = 0
            }) else nil, 
            Title = v3.createElement(v12, {
                input = v17.title, 
                tag = "size-full-0 auto-y text-heading-medium padding-bottom-small", 
                LayoutOrder = 1, 
                layoutOrder = l_FFlagRemoveTitleAddEyebrowReport_0 and 1 or nil
            }), 
            TextArea = v3.createElement(l_TextArea_0, {
                text = v18, 
                hint = if l_FFlagAddReportCharacterLimit_0 and v17.helperText then v18:map(function(v29) --[[ Line: 96 ]]
                    -- upvalues: v28 (copy)
                    return v28(v29);
                end) else nil, 
                numLines = 6, 
                onChanged = v25, 
                label = l_translateIntoString_0(v17.textAreaLabel), 
                placeholder = l_translateIntoString_0(v17.placeholder or ""), 
                hasError = if l_FFlagAddReportCharacterLimit_0 then v20 else false, 
                width = UDim.new(1, 0), 
                LayoutOrder = 2, 
                layoutOrder = l_FFlagRemoveTitleAddEyebrowReport_0 and 2 or nil
            })
        }), 
        Actions = if v17.onNext then v3.createElement(l_Sheet_0.Actions, nil, {
            Button = v3.createElement(l_Button_0, {
                text = l_translateIntoString_0(v17.nextButtonText or ""), 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = l_FillBehavior_0.Fill, 
                isLoading = v17.isSubmitting, 
                isDisabled = if l_FFlagAddReportCharacterLimit_0 then v17.isSubmitting or v20 else v17.isSubmitting, 
                onActivated = v26
            })
        }) else nil
    });
end);