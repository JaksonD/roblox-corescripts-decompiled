local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_View_0 = v3.View;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Components.PreviewBox);
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_useLayoutSlots_0 = v10.useLayoutSlots;
return v4.memo(function(v16) --[[ Line: 39 ]] --[[ Name: ReviewNode ]]
    -- upvalues: l_useArTranslation_0 (copy), l_useLayoutSlots_0 (copy), v4 (copy), l_View_0 (copy), v9 (copy), v12 (copy), v11 (copy), v2 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), v3 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v18 = l_useLayoutSlots_0();
    local l_Body_0 = v18.Body;
    local l_Actions_0 = v18.Actions;
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement(l_Body_0, nil, v4.createElement(l_View_0, {
            tag = "col gap-large size-full-0 auto-y"
        }, {
            TitleContainer = v4.createElement(l_View_0, {
                tag = "col gap-medium size-full-0 auto-y", 
                LayoutOrder = 1
            }, {
                Eyebrow = v16.eyebrow and v4.createElement(v9, {
                    eyebrow = v16.eyebrow, 
                    layoutOrder = 1
                }), 
                Title = v4.createElement(v12, {
                    input = v16.title, 
                    tag = "size-full-0 auto-y text-heading-medium", 
                    layoutOrder = 2
                })
            }), 
            Preview = v16.preview and v4.createElement(v11, {
                preview = v16.preview, 
                layoutOrder = 2
            }), 
            DetailsContainer = v4.createElement(l_View_0, {
                tag = "col gap-medium size-full-0 auto-y", 
                LayoutOrder = 3
            }, v2.map(v16.details, function(v21) --[[ Line: 77 ]]
                -- upvalues: v4 (ref), l_View_0 (ref), v12 (ref)
                return v4.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y gap-xsmall"
                }, {
                    Heading = v4.createElement(v12, {
                        input = v21.heading, 
                        fontStyle = {
                            Font = Enum.Font.BuilderSansBold
                        }, 
                        tag = "size-full-0 auto-y text-body-medium", 
                        layoutOrder = 1
                    }), 
                    Text = v4.createElement(v12, {
                        input = v21.text, 
                        tag = "size-full-0 auto-y text-body-medium", 
                        layoutOrder = 2
                    })
                });
            end))
        })), 
        Actions = if v16.onNext then v4.createElement(l_Actions_0, nil, {
            Button = v4.createElement(l_Button_0, {
                text = l_translateIntoString_0(v16.nextButtonText), 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = v3.Enums.FillBehavior.Fill, 
                isLoading = v16.isSubmitting, 
                isDisabled = v16.isSubmitting, 
                onActivated = v16.onNext
            })
        }) else nil
    });
end);