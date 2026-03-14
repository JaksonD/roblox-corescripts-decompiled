local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.LocalizationKeys.useLocalizedStrings);
local l_useLayerCollector_0 = v4.Core.Layout.LayerCollector.useLayerCollector;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v12 = require(l_script_FirstAncestor_0.Common.ButtonList);
local v13 = require(l_script_FirstAncestor_0.Common.CommentTextField);
local _ = require(l_script_FirstAncestor_0.Common.ReasonDropdown);
local v15 = require(l_script_FirstAncestor_0.Common.ScrollViewGradient);
local v16 = require(l_script_FirstAncestor_0.Common.SideModal);
local v17 = require(l_script_FirstAncestor_0.Common.SideModalDropdownButton);
local function _(v18, v19) --[[ Line: 43 ]] --[[ Name: getContentRightPadding ]]
    if v18.Y > v19.Y then
        return 16;
    else
        return 1;
    end;
end;
return function(v21) --[[ Line: 47 ]] --[[ Name: DualDropdownSubmitDialog ]]
    -- upvalues: l_useTokens_0 (copy), l_useLayerCollector_0 (copy), v2 (copy), v6 (copy), l_useLocalization_0 (copy), l_createNextOrder_0 (copy), l_View_0 (copy), v16 (copy), v15 (copy), l_Text_0 (copy), v17 (copy), v13 (copy), v12 (copy)
    local v22 = l_useTokens_0();
    local l_absoluteSize_0 = l_useLayerCollector_0().absoluteSize;
    local v24, v25 = v2.useState(false);
    local v26, v27 = v2.useState(false);
    local v28, v29 = v2.useState("");
    local v30, v31 = v2.useState("");
    local v32, v33 = v2.useState("");
    local v34, v35 = v2.useState("");
    local v36, v37 = v2.useState("");
    local v38, v39 = v2.useState(false);
    local v40, v41 = v2.useState(false);
    local v42, v43 = v2.useState(false);
    local v44, v45 = v2.useState("");
    local v46 = v2.useRef(nil);
    local v47, v48 = v2.useState(Vector2.zero);
    local v49, v50 = v2.useState(Vector2.zero);
    local v51 = v6();
    local v52 = l_useLocalization_0({
        submitDialogProblemSubheading = "Feature.ReportAbuse.Label.WhatWasWrong", 
        submitDialogSurfaceSubheading = "Feature.ReportAbuse.Label.WhereDidItHappen", 
        selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne", 
        submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional", 
        submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment", 
        submitDialogOptional = "Feature.ReportAbuse.Label.Optional", 
        chooseOne = "Feature.ReportAbuse.Label.ChooseOne"
    });
    local v53 = l_createNextOrder_0();
    v2.useLayoutEffect(function() --[[ Line: 80 ]]
        -- upvalues: v46 (copy), v48 (copy), v50 (copy)
        if v46.current then
            local l_ScrollingFrame_0 = v46.current:FindFirstChildWhichIsA("ScrollingFrame");
            if l_ScrollingFrame_0 then
                v48(l_ScrollingFrame_0.AbsoluteCanvasSize);
                v50(l_ScrollingFrame_0.AbsoluteWindowSize);
                local v55 = l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 89 ]]
                    -- upvalues: v48 (ref), l_ScrollingFrame_0 (copy)
                    v48(l_ScrollingFrame_0.AbsoluteCanvasSize);
                end);
                local v56 = l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 94 ]]
                    -- upvalues: v50 (ref), l_ScrollingFrame_0 (copy)
                    v50(l_ScrollingFrame_0.AbsoluteWindowSize);
                end);
                return function() --[[ Line: 97 ]]
                    -- upvalues: v55 (copy), v56 (copy)
                    v55:Disconnect();
                    v56:Disconnect();
                end;
            end;
        else
            v48(Vector2.zero);
            v50(Vector2.zero);
        end;
        return function() --[[ Line: 106 ]]

        end;
    end, {
        v46.current, 
        l_absoluteSize_0
    });
    local v57 = v2.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v21 (copy), v28 (copy), v34 (copy), v44 (copy)
        v21.onSubmit(v28, v34, v44);
    end, {
        v21.onSubmit, 
        v28, 
        v34, 
        v44
    });
    local v58 = v2.useCallback(function() --[[ Line: 113 ]]
        -- upvalues: v28 (copy), v34 (copy), v25 (copy), v27 (copy)
        if v28 ~= "" and v34 ~= "" then
            return true;
        else
            if v28 == "" then
                v25(true);
            end;
            if v34 == "" then
                v27(true);
            end;
            return false;
        end;
    end, {
        v28, 
        v34, 
        v25, 
        v27
    });
    local v59 = v2.useCallback(function() --[[ Line: 127 ]]
        -- upvalues: v39 (copy), v41 (copy)
        v39(false);
        v41(false);
    end, {
        v39, 
        v41
    });
    return v2.createElement(l_View_0, {
        tag = "size-full auto-xy"
    }, {
        ReportFlowModal = v2.createElement(v16, {
            screenSize = l_absoluteSize_0, 
            buttonProps = {
                text = v51.formSubmit, 
                onActivated = v57, 
                validateState = v58
            }, 
            footerContent = v21.footerContent, 
            onAbandon = v21.onAbandon, 
            title = v51.formTitle, 
            width = math.min(400, l_absoluteSize_0.X - 50), 
            height = math.min(500, l_absoluteSize_0.Y - 50)
        }, {
            SubmitReportFrame = v2.createElement(v15, {
                Size = UDim2.new(1, 0, 1, 0), 
                ref = v46, 
                gradientHeight = 40
            }, {
                Layout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 30), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 1), 
                    PaddingRight = UDim.new(0, v47.Y > v49.Y and 16 or 1)
                }), 
                ReportProblemFrame = v2.createElement(l_View_0, {
                    ZIndex = 3, 
                    tag = "size-full-0 auto-y col align-x-left", 
                    LayoutOrder = v53()
                }, {
                    ProblemHeading = v2.createElement(l_Text_0, {
                        Text = "1. " .. v52.submitDialogProblemSubheading, 
                        fontStyle = v22.Typography.TitleLarge, 
                        textStyle = v22.Color.Content.Emphasis, 
                        tag = "auto-xy padding-bottom-medium", 
                        LayoutOrder = v53()
                    }), 
                    ProblemDropdownPosition = v2.createElement(l_View_0, {
                        Size = UDim2.new(1, 0, 0, 48), 
                        tag = "col align-x-left", 
                        LayoutOrder = v53()
                    }, {
                        ProblemDropdown = v2.createElement(v17, {
                            setDropdownError = v25, 
                            onActivated = function() --[[ Line: 185 ]] --[[ Name: onActivated ]]
                                -- upvalues: v39 (copy), v43 (copy)
                                v39(true);
                                v43(false);
                            end, 
                            title = v52.submitDialogProblemSubheading, 
                            text = v30 ~= "" and v30 or v52.chooseOne, 
                            isDropdownError = v24
                        }), 
                        ProblemSubtext = v2.createElement(l_Text_0, {
                            Text = v24 and v52.selectOnePrompt or v32, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fontStyle = v22.Typography.BodySmall, 
                            textStyle = v24 and v22.Color.System.Alert or v22.Color.Content.Muted, 
                            tag = "auto-xy padding-top-xxsmall", 
                            LayoutOrder = v53()
                        })
                    })
                }), 
                ReportSurfaceFrame = v2.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col align-x-left", 
                    LayoutOrder = v53()
                }, {
                    SurfaceHeading = v2.createElement(l_Text_0, {
                        Text = "2. " .. v52.submitDialogSurfaceSubheading, 
                        fontStyle = v22.Typography.TitleLarge, 
                        textStyle = v22.Color.Content.Emphasis, 
                        tag = "auto-xy padding-bottom-medium", 
                        LayoutOrder = v53()
                    }), 
                    SurfaceDropdownPosition = v2.createElement(l_View_0, {
                        Size = UDim2.new(1, 0, 0, 48), 
                        tag = "col align-x-left", 
                        LayoutOrder = v53()
                    }, {
                        SurfaceDropdown = v2.createElement(v17, {
                            setDropdownError = v27, 
                            onActivated = function() --[[ Line: 224 ]] --[[ Name: onActivated ]]
                                -- upvalues: v41 (copy), v43 (copy)
                                v41(true);
                                v43(false);
                            end, 
                            title = v52.submitDialogSurfaceSubheading, 
                            text = v34 ~= "" and v36 or v52.chooseOne, 
                            isDropdownError = v26
                        }), 
                        SurfaceSubtext = v2.createElement(l_Text_0, {
                            Text = v26 and v52.selectOnePrompt or "", 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fontStyle = v22.Typography.BodySmall, 
                            textStyle = v22.Color.System.Alert, 
                            tag = "auto-xy padding-top-xxsmall", 
                            LayoutOrder = v53()
                        })
                    })
                }), 
                ReportCommentFrame = v2.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col align-x-left", 
                    LayoutOrder = v53()
                }, {
                    CommentHeading = v2.createElement(l_Text_0, {
                        Text = "3. " .. v52.submitDialogCommentSubheading, 
                        fontStyle = v22.Typography.TitleLarge, 
                        textStyle = v22.Color.Content.Emphasis, 
                        tag = "auto-xy padding-bottom-medium", 
                        LayoutOrder = v53()
                    }), 
                    CommentTextContainer = v2.createElement(l_View_0, {
                        tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium", 
                        LayoutOrder = v53()
                    }, {
                        CommentTextField = v2.createElement(v13, {
                            text = v44, 
                            backgroundColor3 = v22.Color.Surface.Surface_100.Color3, 
                            placeholderText = v52.submitDialogTextBoxPlaceholder, 
                            onUpdate = v45, 
                            layoutOrder = v53()
                        })
                    }), 
                    CommentSubtext = v2.createElement(l_Text_0, {
                        Text = v52.submitDialogOptional, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fontStyle = v22.Typography.CaptionSmall, 
                        tag = "auto-xy padding-top-xxsmall", 
                        LayoutOrder = v53()
                    })
                })
            })
        }), 
        DropdownSideModalBackground = if not not v38 or v40 then v2.createElement(l_View_0, {
            tag = "size-full"
        }, {
            DropdownSideModalContainer = v2.createElement(l_View_0, {
                tag = "size-full"
            }, {
                DropdownSideModal = v2.createElement(v16, {
                    screenSize = l_absoluteSize_0, 
                    title = if v38 then v52.submitDialogProblemSubheading else v52.submitDialogSurfaceSubheading, 
                    width = math.min(400, l_absoluteSize_0.X - 50) - 50, 
                    height = math.min(500, l_absoluteSize_0.Y - 50) - 50, 
                    onAbandon = v59, 
                    closeWithAnimation = v42
                }, {
                    ScrollView = v2.createElement(v15, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        gradientHeight = 48
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        ButtonList = v2.createElement(v12, {
                            options = if v38 then v21.reportProblems else v21.reportSurfaces, 
                            onSelected = function(v60, v61) --[[ Line: 304 ]] --[[ Name: onSelected ]]
                                -- upvalues: v38 (copy), v29 (copy), v31 (copy), v25 (copy), v43 (copy), v35 (copy), v37 (copy), v27 (copy)
                                if v38 then
                                    v29(v60);
                                    v31(v61);
                                    v25(false);
                                    v43(true);
                                    return;
                                else
                                    v35(v60);
                                    v37(v61);
                                    v27(false);
                                    v43(true);
                                    return;
                                end;
                            end, 
                            setDescription = if v38 then v33 else nil, 
                            defaultValue = if v38 then v28 else v34
                        })
                    })
                })
            })
        }) else nil
    });
end;