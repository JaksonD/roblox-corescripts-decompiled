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
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local v14 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_useLayoutSlots_0 = v12.useLayoutSlots;
local l_FFlagRemoveTitleAddEyebrowReport_0 = v4.FFlagRemoveTitleAddEyebrowReport;
local l_FFlagAddReportCharacterLimit_0 = v4.FFlagAddReportCharacterLimit;
local l_FFlagAddLayoutSlotsToReport_0 = v4.FFlagAddLayoutSlotsToReport;
return v3.memo(function(v20) --[[ Line: 46 ]] --[[ Name: CommentNode ]]
    -- upvalues: v3 (copy), l_FFlagAddReportCharacterLimit_0 (copy), v14 (copy), l_useArTranslation_0 (copy), l_FFlagAddLayoutSlotsToReport_0 (copy), l_useLayoutSlots_0 (copy), v11 (copy), l_Sheet_0 (copy), l_FFlagRemoveTitleAddEyebrowReport_0 (copy), v10 (copy), v13 (copy), l_TextArea_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v21, v22 = v3.useBinding(v20.initialValue or "");
    local v23, v24 = v3.useState(false);
    local v25 = if l_FFlagAddReportCharacterLimit_0 then v14.mergeTranslationParams else nil;
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    if l_FFlagAddLayoutSlotsToReport_0 then
        v27 = l_useLayoutSlots_0();
        v28 = v27.Body;
        v29 = v27.Actions;
    end;
    local v31 = v3.useCallback(function(v30) --[[ Line: 59 ]]
        -- upvalues: v22 (copy), l_FFlagAddReportCharacterLimit_0 (ref), v20 (copy), v24 (copy), v11 (ref)
        v22(v30);
        if l_FFlagAddReportCharacterLimit_0 and v20.maxLength then
            v24(v11(v30) > v20.maxLength);
        end;
    end, {
        v20.maxLength
    });
    local v32 = v3.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v20 (copy), v21 (copy)
        if v20.onNext then
            v20.onNext(v21:getValue());
        end;
    end, {
        v21, 
        v20.onNext
    });
    local v34 = v3.useCallback(function(v33) --[[ Line: 77 ]]
        -- upvalues: v20 (copy), v25 (copy), l_translateIntoString_0 (copy), v11 (ref)
        if v20.helperText and v20.maxLength and v25 then
            return l_translateIntoString_0(v25(v20.helperText, {
                currentLength = tostring(v11(v33)), 
                maxLength = tostring(v20.maxLength)
            }));
        elseif v20.helperText then
            return l_translateIntoString_0(v20.helperText);
        else
            return nil;
        end;
    end, {
        v20.helperText, 
        v20.maxLength
    });
    return v3.createElement(v3.Fragment, nil, {
        Content = v3.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v28 else l_Sheet_0.Content, nil, {
            Eyebrow = if l_FFlagRemoveTitleAddEyebrowReport_0 then v3.createElement(v10, {
                eyebrow = v20.eyebrow, 
                layoutOrder = 0
            }) else nil, 
            Title = v3.createElement(v13, {
                input = v20.title, 
                tag = "size-full-0 auto-y text-heading-medium padding-bottom-small", 
                LayoutOrder = 1, 
                layoutOrder = l_FFlagRemoveTitleAddEyebrowReport_0 and 1 or nil
            }), 
            TextArea = v3.createElement(l_TextArea_0, {
                text = v21, 
                hint = if l_FFlagAddReportCharacterLimit_0 and v20.helperText then v21:map(function(v35) --[[ Line: 107 ]]
                    -- upvalues: v34 (copy)
                    return v34(v35);
                end) else nil, 
                numLines = 6, 
                onChanged = v31, 
                label = l_translateIntoString_0(v20.textAreaLabel), 
                placeholder = l_translateIntoString_0(v20.placeholder or ""), 
                hasError = if l_FFlagAddReportCharacterLimit_0 then v23 else false, 
                width = UDim.new(1, 0), 
                LayoutOrder = 2, 
                layoutOrder = l_FFlagRemoveTitleAddEyebrowReport_0 and 2 or nil
            })
        }), 
        Actions = if v20.onNext then v3.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v29 else l_Sheet_0.Actions, nil, {
            Button = v3.createElement(l_Button_0, {
                text = l_translateIntoString_0(v20.nextButtonText or ""), 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = l_FillBehavior_0.Fill, 
                isLoading = v20.isSubmitting, 
                isDisabled = if l_FFlagAddReportCharacterLimit_0 then v20.isSubmitting or v23 else v20.isSubmitting, 
                onActivated = v32
            })
        }) else nil
    });
end);