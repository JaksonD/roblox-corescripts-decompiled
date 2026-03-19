local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.DsaIllegalContentReporting);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.React);
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_GenericReportLink_0 = v3.GenericReportLink;
local l_IconButton_0 = v4.IconButton;
local l_IconName_0 = v4.Enums.IconName;
local l_InputLabel_0 = v4.InputLabel;
local l_InputSize_0 = v4.Enums.InputSize;
local l_isShowGenericIllegalContentReportingLink_0 = v3.isShowGenericIllegalContentReportingLink;
local l_OptionSelectorGroup_0 = v4.OptionSelectorGroup;
local l_Sheet_0 = v4.Sheet;
local l_Text_0 = v4.Text;
local l_TextArea_0 = v4.TextArea;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local v22 = require(l_script_FirstAncestor_0.Common.SideModalDropdownButton);
local l_FFlagReportIPInfringement_0 = require(l_Parent_0.SharedFlags).FFlagReportIPInfringement;
return v6.memo(function(v24) --[[ Line: 48 ]] --[[ Name: DualDropdownReportV2 ]]
    -- upvalues: l_useTokens_0 (copy), v6 (copy), l_useLocalization_0 (copy), v2 (copy), l_FFlagReportIPInfringement_0 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonVariant_0 (copy), l_IconName_0 (copy), l_Text_0 (copy), l_InputLabel_0 (copy), l_InputSize_0 (copy), v22 (copy), l_TextArea_0 (copy), l_Button_0 (copy), l_isShowGenericIllegalContentReportingLink_0 (copy), l_GenericReportLink_0 (copy), l_OptionSelectorGroup_0 (copy)
    local v25 = l_useTokens_0();
    local v26, v27 = v6.useState(true);
    local v28, v29 = v6.useState("None");
    local v30, v31 = v6.useState(v24.preselected and v24.preselected.problem or nil);
    local v32, v33 = v6.useState(v24.preselected and v24.preselected.surface or nil);
    local v34, v35 = v6.useState("");
    local v36, v37 = v6.useState("None");
    local v38 = l_useLocalization_0({
        problemHeading = "Feature.ReportAbuse.Label.WhatWasWrong", 
        surfaceHeading = "Feature.ReportAbuse.Label.WhereDidItHappen", 
        selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne", 
        commentHeading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional", 
        textAreaPlaceholder = "Feature.SettingsHub.Label.ReportComment", 
        submitButton = "Feature.ReportAbuse.Action.Submit", 
        continueButton = "Feature.ReportAbuse.Action.Continue", 
        titleIpInfringement = "Feature.ReportAbuse.Title.SelectInSceneContinueYourReport"
    });
    local v40 = v6.useCallback(function(v39) --[[ Line: 69 ]]
        -- upvalues: v35 (copy)
        v35(v39);
    end, {});
    local v41 = v6.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v29 (copy)
        v29("Problem");
    end, {});
    local v42 = v6.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v29 (copy)
        v29("Surface");
    end, {});
    local v43 = v6.useCallback(function() --[[ Line: 81 ]]
        -- upvalues: v27 (copy), v24 (copy)
        v27(false);
        task.wait(0.3);
        v24.onClose();
    end, {
        v24.onClose
    });
    local v44 = v6.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v29 (copy)
        v29("None");
    end, {});
    local v50 = v6.useCallback(function(v45) --[[ Line: 91 ]]
        -- upvalues: v28 (copy), v2 (ref), v24 (copy), v31 (copy), v33 (copy), v44 (copy)
        if v28 == "Problem" then
            local v47 = v2.find(v24.problems, function(v46) --[[ Line: 93 ]]
                -- upvalues: v45 (copy)
                return v46.value == v45;
            end);
            v31(v47);
        else
            local v49 = v2.find(v24.surfaces, function(v48) --[[ Line: 98 ]]
                -- upvalues: v45 (copy)
                return v48.value == v45;
            end);
            v33(v49);
        end;
        v44();
    end, {
        v28, 
        v24.problems, 
        v24.surfaces, 
        v44
    });
    local v53 = v6.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: v30 (copy), v32 (copy), v37 (copy), v43 (copy), v24 (copy), v34 (copy)
        local v51 = if v30 ~= nil then v30.value else "";
        local v52 = if v32 ~= nil then v32.value else "";
        if v51 == "" and v52 == "" then
            v37("Both");
            return;
        elseif v51 == "" then
            v37("Problem");
            return;
        elseif v52 == "" then
            v37("Surface");
            return;
        else
            v37("None");
            v43();
            v24.onSubmit(v51, v52, v34);
            return;
        end;
    end, {
        v30, 
        v32, 
        v34, 
        v43, 
        v24.onSubmit
    });
    local v54 = l_FFlagReportIPInfringement_0 and v30 and v30.value == "ip infringement";
    local l_createElement_0 = v6.createElement;
    local l_Fragment_0 = v6.Fragment;
    local v57 = nil;
    local v58 = {};
    local l_createElement_1 = v6.createElement;
    local l_Root_0 = l_Sheet_0.Root;
    local v61 = {
        isOpen = v26, 
        onClose = v43
    };
    local v62 = {
        Header = v6.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = false
        }, v6.createElement(l_View_0, {
            tag = "size-full-0 auto-y row gap-medium align-y-center"
        }, {
            Icon = v6.createElement(l_IconButton_0, {
                variant = l_ButtonVariant_0.Utility, 
                icon = l_IconName_0.X, 
                onActivated = v43, 
                LayoutOrder = 1
            }), 
            Title = v6.createElement(l_Text_0, {
                Text = if v54 then v38.titleIpInfringement else v24.title, 
                RichText = true, 
                tag = "auto-xy text-wrap text-heading-small text-align-x-left", 
                LayoutOrder = 2
            })
        }))
    };
    local l_createElement_2 = v6.createElement;
    local l_Content_0 = l_Sheet_0.Content;
    local v65 = nil;
    local v66 = {};
    local l_createElement_3 = v6.createElement;
    local l_l_View_0_0 = l_View_0;
    local v69 = {
        tag = "size-full-0 auto-y col gap-small", 
        LayoutOrder = 1
    };
    local v70 = {
        ProblemHeading = v6.createElement(l_InputLabel_0, {
            Text = v38.problemHeading, 
            size = l_InputSize_0.Small, 
            LayoutOrder = 1
        })
    };
    local l_createElement_4 = v6.createElement;
    local l_v22_0 = v22;
    local v73 = {
        text = v30 and v30.label or v38.chooseOne, 
        onActivated = v41
    };
    local v74 = true;
    if v36 ~= "Problem" then
        v74 = v36 == "Both";
    end;
    v73.isDropdownError = v74;
    v73.layoutOrder = 2;
    v70.ProblemDropdownButton = l_createElement_4(l_v22_0, v73);
    v70.ProblemSubtext = v6.createElement(l_Text_0, {
        Text = (not (v36 ~= "Problem") or v36 == "Both") and v38.selectOnePrompt or "", 
        RichText = true, 
        textStyle = v25.Color.System.Alert, 
        tag = "auto-xy text-wrap text-align-x-left text-body-small", 
        LayoutOrder = 3
    });
    v66.ProblemFrame = l_createElement_3(l_l_View_0_0, v69, v70);
    if v54 then
        l_createElement_3 = nil;
    else
        l_createElement_3 = v6.createElement;
        l_l_View_0_0 = l_View_0;
        v69 = {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = 2
        };
        v70 = {
            SurfaceHeading = v6.createElement(l_InputLabel_0, {
                Text = v38.surfaceHeading, 
                size = l_InputSize_0.Small, 
                LayoutOrder = 1
            })
        };
        l_createElement_4 = v6.createElement;
        l_v22_0 = v22;
        v73 = {
            text = v32 and v32.label or v38.chooseOne, 
            onActivated = v42
        };
        v74 = true;
        if v36 ~= "Surface" then
            v74 = v36 == "Both";
        end;
        v73.isDropdownError = v74;
        v73.layoutOrder = 2;
        v70.SurfaceDropdownButton = l_createElement_4(l_v22_0, v73);
        v70.SurfaceSubtext = v6.createElement(l_Text_0, {
            Text = (not (v36 ~= "Surface") or v36 == "Both") and v38.selectOnePrompt or "", 
            RichText = true, 
            textStyle = v25.Color.System.Alert, 
            tag = "auto-xy text-wrap text-align-x-left text-body-small", 
            LayoutOrder = 3
        });
        l_createElement_3 = l_createElement_3(l_l_View_0_0, v69, v70);
    end;
    v66.ProblemSurface = l_createElement_3;
    v66.TextArea = if v54 then nil else v6.createElement(l_TextArea_0, {
        label = v38.commentHeading, 
        text = v34, 
        placeholder = v38.textAreaPlaceholder, 
        isRequired = false, 
        onChanged = v40, 
        width = UDim.new(1, 0), 
        LayoutOrder = 3
    });
    v62.Content = l_createElement_2(l_Content_0, v65, v66);
    v62.Actions = v6.createElement(l_Sheet_0.Actions, nil, {
        ActionsFrame = v6.createElement(l_View_0, {
            tag = "size-full-0 auto-xy col gap-small"
        }, {
            SubmitButton = v6.createElement(l_Button_0, {
                text = if v54 then v38.continueButton else v38.submitButton, 
                onActivated = v53, 
                variant = l_ButtonVariant_0.Emphasis, 
                width = UDim.new(1, 0), 
                LayoutOrder = 0
            }), 
            GenericReportLink = if l_isShowGenericIllegalContentReportingLink_0() then v6.createElement(l_GenericReportLink_0, {}) else nil
        })
    });
    v58.MainSheet = l_createElement_1(l_Root_0, v61, v62);
    v58.OptionSheet = v6.createElement(l_Sheet_0.Root, {
        isOpen = v28 ~= "None", 
        onClose = v44
    }, {
        Header = v6.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = false
        }, v6.createElement(l_View_0, {
            tag = "auto-xy row gap-medium align-y-center"
        }, {
            Icon = v6.createElement(l_IconButton_0, {
                variant = l_ButtonVariant_0.Utility, 
                icon = l_IconName_0.ChevronLargeLeft, 
                onActivated = v44, 
                LayoutOrder = 1
            }), 
            Title = v6.createElement(l_Text_0, {
                Text = v28 == "Problem" and v38.problemHeading or v38.surfaceHeading, 
                RichText = true, 
                tag = "auto-xy text-align-x-left text-wrap text-heading-small text-align-x-left", 
                LayoutOrder = 2
            })
        })), 
        Content = v6.createElement(l_Sheet_0.Content, nil, {
            Padding = v6.createElement(l_View_0, {
                tag = "padding-top-xxsmall", 
                LayoutOrder = 1
            }), 
            OptionsList = v6.createElement(l_OptionSelectorGroup_0.Root, {
                value = if v28 == "Problem" and v30 ~= nil then v30.value else if v28 == "Surface" and v32 ~= nil then v32.value else "", 
                onValueChanged = v50, 
                LayoutOrder = 2
            }, v2.map(v24[v28 == "Problem" and "problems" or "surfaces"], function(v75) --[[ Line: 283 ]]
                -- upvalues: v6 (ref), l_OptionSelectorGroup_0 (ref), l_InputSize_0 (ref)
                return v6.createElement(l_OptionSelectorGroup_0.Item, {
                    key = v75.value, 
                    value = v75.value, 
                    label = v75.label, 
                    description = v75.description, 
                    size = l_InputSize_0.Small
                });
            end))
        })
    });
    return l_createElement_0(l_Fragment_0, v57, v58);
end);