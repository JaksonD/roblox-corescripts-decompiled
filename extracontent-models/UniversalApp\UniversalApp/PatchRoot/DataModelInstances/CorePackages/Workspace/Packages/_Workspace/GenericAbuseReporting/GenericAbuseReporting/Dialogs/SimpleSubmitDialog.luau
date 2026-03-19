local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DsaIllegalContentReporting);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.Foundation);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.LocalizationKeys.useLocalizedStrings);
local v12 = require(l_script_FirstAncestor_0.Common.CommentTextField);
local v13 = require(l_script_FirstAncestor_0.Common.Frame);
local v14 = require(l_script_FirstAncestor_0.Common.UIListLayout);
local v15 = require(l_script_FirstAncestor_0.Common.ReasonDropdown);
local v16 = require(l_script_FirstAncestor_0.Common.MODAL_POSITION_OFFSET);
local l_PartialPageModal_0 = v7.App.Dialog.Modal.PartialPageModal;
local l_CloseButtonIcon_0 = v7.App.Dialog.Enum.CloseButtonIcon;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local l_useLayerCollector_0 = v7.Core.Layout.LayerCollector.useLayerCollector;
local l_useTokens_0 = v8.Hooks.useTokens;
local l_View_0 = v8.View;
local l_ScrollView_0 = v8.ScrollView;
local l_ScrollBarVisibility_0 = v8.Enums.ScrollBarVisibility;
local l_Text_0 = v8.Text;
local l_GenericReportLink_0 = v2.GenericReportLink;
local v28 = v2.isShowGenericIllegalContentReportingLink();
local v29 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsDispatch);
local v30 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormCommentUpdated);
local v31 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormReasonSelected);
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local l_FFlagChatLineReportingFocusFixesEnabled_0 = v6.FFlagChatLineReportingFocusFixesEnabled;
local l_FFlagAddAbuseReportOffsetForLandscape_0 = v6.FFlagAddAbuseReportOffsetForLandscape;
local l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 = v6.FFlagAddGenericIllegalReportingToTwoStepFlow;
local function _(v36) --[[ Line: 71 ]] --[[ Name: getScreenSizeOffset ]]
    -- upvalues: l_FFlagAddAbuseReportOffsetForLandscape_0 (copy)
    if l_FFlagAddAbuseReportOffsetForLandscape_0 then
        if v36.X > v36.Y then
            return 180;
        else
            return 100;
        end;
    else
        return 100;
    end;
end;
local function _(v38, v39) --[[ Line: 80 ]] --[[ Name: getContentRightPadding ]]
    if v38.Y > v39.Y then
        return 16;
    else
        return 1;
    end;
end;
return function(v41) --[[ Line: 84 ]] --[[ Name: SubmitDialog ]]
    -- upvalues: v29 (copy), v5 (copy), v3 (copy), l_useTokens_0 (copy), v4 (copy), l_useLayerCollector_0 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v31 (copy), l_dependencyArray_0 (copy), v30 (copy), l_useLocalization_0 (copy), v11 (copy), l_createNextOrder_0 (copy), v15 (copy), v14 (copy), l_View_0 (copy), l_Text_0 (copy), l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 (copy), v28 (copy), l_GenericReportLink_0 (copy), l_PartialPageModal_0 (copy), v16 (copy), l_ButtonType_0 (copy), l_CloseButtonIcon_0 (copy), l_ScrollView_0 (copy), l_FFlagAddAbuseReportOffsetForLandscape_0 (copy), l_ScrollBarVisibility_0 (copy), v13 (copy), l_StyledTextLabel_0 (copy), v12 (copy)
    local v42 = v29();
    local v43 = v5.useFocusGuiObject();
    local v44 = v3.useLastInputMode();
    local v45 = l_useTokens_0();
    local v46, v47 = v4.useState(false);
    local v48, v49 = v4.useState("");
    local v50, v51 = v4.useState("");
    local v52, v53 = v4.useState("");
    local v54 = v4.useRef(nil);
    local v55, v56 = v4.useState(Vector2.zero);
    local v57, v58 = v4.useState(Vector2.zero);
    local v59, v60 = v4.useState(0);
    local v61, v62 = v4.useState(0);
    local v63 = v4.useRef(nil);
    local v64, v65 = v4.useState(0);
    local v66 = v4.useRef(nil);
    local v67, v68 = v4.useState(0);
    local v69, v70 = v4.useState(96);
    local v71 = l_useLayerCollector_0();
    local l_absoluteSize_0 = v71.absoluteSize;
    v4.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v70 (copy), v55 (copy), v64 (copy), v61 (copy), v59 (copy)
        v70((math.max(96, v55.Y - (v64 - v61) - v59 - 20)));
    end, {
        v55.Y, 
        v64, 
        v61, 
        v59
    });
    v4.useEffect(function() --[[ Line: 116 ]]
        -- upvalues: v63 (copy), v60 (copy), v65 (copy)
        if v63.current then
            v60(v63.current.AbsoluteSize.Y);
            v65(v63.current.AbsolutePosition.Y);
        end;
    end, {
        v63.current, 
        l_absoluteSize_0
    });
    v4.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v54 (copy), v58 (copy), v56 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (ref), v62 (copy)
        if v54.current then
            local l_ScrollingFrame_0 = v54.current:FindFirstChildWhichIsA("ScrollingFrame");
            if l_ScrollingFrame_0 then
                l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 127 ]]
                    -- upvalues: v58 (ref), l_ScrollingFrame_0 (copy), v56 (ref)
                    v58(l_ScrollingFrame_0.AbsoluteWindowSize);
                    v56(l_ScrollingFrame_0.AbsoluteCanvasSize);
                end);
                if l_FFlagChatLineReportingFocusFixesEnabled_0 then
                    l_ScrollingFrame_0.Selectable = false;
                end;
            end;
            v62(v54.current.AbsolutePosition.Y);
            return;
        else
            v56(Vector2.zero);
            return;
        end;
    end, {
        v54.current, 
        l_absoluteSize_0
    });
    v4.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: v66 (copy), v68 (copy)
        if v66.current then
            v68(v66.current.AbsoluteContentSize.Y);
        end;
    end, {
        v66.current
    });
    local v74 = v4.useCallback(function() --[[ Line: 147 ]]
        -- upvalues: v48 (copy), v41 (copy), v52 (copy), v47 (copy)
        if v48 ~= "" then
            v41.onSubmit(v48, v52);
            return;
        elseif v41.reportCategoryDefaultKey ~= nil then
            v41.onSubmit(v41.reportCategoryDefaultKey, v52);
            return;
        else
            v47(true);
            return;
        end;
    end, {
        v41.onSubmit, 
        v48, 
        v52, 
        v47
    });
    local v77 = v4.useCallback(function(v75) --[[ Line: 160 ]]
        -- upvalues: v49 (copy), v42 (copy), v31 (ref), l_FFlagChatLineReportingFocusFixesEnabled_0 (ref), v44 (copy), v63 (copy), v43 (copy)
        v49(v75);
        v42(v31({
            reason_selection = v75
        }));
        if l_FFlagChatLineReportingFocusFixesEnabled_0 and v44 == "Focus" and v63.current then
            local l_FirstChild_0 = v63.current:FindFirstChild("SpawnButton", true);
            if l_FirstChild_0 and l_FirstChild_0:IsA("GuiObject") then
                v43(l_FirstChild_0);
            end;
        end;
    end, if l_FFlagChatLineReportingFocusFixesEnabled_0 then l_dependencyArray_0(v42, v43, v44) else {
        v42
    });
    local v79 = v4.useCallback(function(v78) --[[ Line: 182 ]]
        -- upvalues: v53 (copy), v42 (copy), v30 (ref)
        v53(v78);
        v42(v30({
            comment_added = #v78 > 0
        }));
    end, {
        v42
    });
    local v80 = if v41.localizationKeys then l_useLocalization_0(v41.localizationKeys) else v11();
    local v81 = l_useLocalization_0({
        submitDialogReasonSubheading = "Feature.ReportAbuse.Label.WhatWasWrong", 
        selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne", 
        submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappened", 
        submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment", 
        defaultKey = v41.reportCategories[1].localizationKey
    });
    local v82 = l_createNextOrder_0();
    local v83 = v4.createElement(v15, {
        options = v41.reportCategories, 
        screenSize = l_absoluteSize_0, 
        maxHeight = v69, 
        menuItemHeight = 48, 
        isDropdownError = v46, 
        setDropdownError = v47, 
        onSelectedAbuseType = v77, 
        reportCategoryDefaultKey = v41.reportCategoryDefaultKey, 
        setDescription = v51, 
        isDisabled = v41.isDisabled
    });
    local v84 = v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v82()
    }, {
        Layout = v4.createElement(v14, {
            Padding = UDim.new(0, 7), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 15)
        }), 
        TextFrame = v4.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 48), 
            tag = "radius-medium stroke-standard stroke-system-neutral padding-left-small"
        }, {
            Text = v4.createElement(l_Text_0, {
                Text = v81.defaultKey, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                tag = "size-full content-muted"
            })
        })
    });
    local v85 = nil;
    if l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 then
        v85 = v4.useMemo(function() --[[ Line: 245 ]]
            -- upvalues: v4 (ref), l_View_0 (ref), v28 (ref), l_GenericReportLink_0 (ref)
            return function() --[[ Line: 246 ]]
                -- upvalues: v4 (ref), l_View_0 (ref), v28 (ref), l_GenericReportLink_0 (ref)
                return v4.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col padding-x-xlarge padding-top-small"
                }, {
                    GenericReportingLink = if v28 then v4.createElement(l_GenericReportLink_0, {
                        layoutOrder = 2
                    }) else nil
                });
            end;
        end, {});
    end;
    return v4.createElement(l_PartialPageModal_0, {
        screenSize = Vector2.new(l_absoluteSize_0.X * (v41.scaleDialog and v41.scaleDialog.X or 1), (l_absoluteSize_0.Y - v71.insets.top) * (v41.scaleDialog and v41.scaleDialog.Y or 1)), 
        position = UDim2.new(0.5, 0, 0, v71.insets.top + v16), 
        anchorPoint = Vector2.new(0.5, 0), 
        title = v80.formTitle, 
        onCloseClicked = v41.onAbandon, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v74, 
                        text = v80.formSubmit
                    }
                }
            }
        }, 
        footerContent = if l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 then v41.footerContent or v28 and v85 or nil else v41.footerContent, 
        closeButtonIcon = if v41.useBackButton then l_CloseButtonIcon_0.Back else nil
    }, {
        SubmitContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0)
        }, {
            SubmitReportFrame = v4.createElement(l_ScrollView_0, {
                Size = UDim2.new(1, 0, 0, (math.min(l_absoluteSize_0.Y - v71.insets.top - (if l_FFlagAddAbuseReportOffsetForLandscape_0 then l_absoluteSize_0.X > l_absoluteSize_0.Y and 180 or 100 else 100) - (l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 and v41.footerContent == nil and v28 and 25 or 0), v67 + 50 + 50))), 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromOffset(0, 0), 
                    scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }, 
                ref = v54
            }, {
                Layout = v4.createElement(v14, {
                    Padding = UDim.new(0, 16), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Ref = v66
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16), 
                    PaddingBottom = UDim.new(0, 16), 
                    PaddingLeft = UDim.new(0, 1), 
                    PaddingRight = UDim.new(0, v55.Y > v57.Y and 16 or 1)
                }), 
                TopCustomComponent = v41.topCustomComponent, 
                ReportReasonFrame = v4.createElement(v13, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ZIndex = 2, 
                    LayoutOrder = v82()
                }, {
                    Layout = v4.createElement(v14, {
                        Padding = UDim.new(0, 14), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    ReportReasonSubheading = v4.createElement(l_StyledTextLabel_0, {
                        text = "1. " .. v81.submitDialogReasonSubheading, 
                        fontStyle = v45.Typography.TitleLarge, 
                        colorStyle = v45.Color.Content.Default, 
                        layoutOrder = v82(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    DropdownPosition = v4.createElement(v13, {
                        AutomaticSize = Enum.AutomaticSize.None, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        ZIndex = 2, 
                        LayoutOrder = v82(), 
                        ref = v63
                    }, {
                        ReportReasonPrompt = if v41.isReportCategoryReadonly then v84 else v83
                    }), 
                    ReportReasonSubtext = if v46 then v4.createElement(l_StyledTextLabel_0, {
                        text = v81.selectOnePrompt, 
                        fontStyle = v45.Typography.BodySmall, 
                        colorStyle = v45.Color.System.Alert, 
                        layoutOrder = v82(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }) else if v50 ~= "" then v4.createElement(l_StyledTextLabel_0, {
                        text = v50, 
                        fontStyle = v45.Typography.BodySmall, 
                        colorStyle = v45.Color.Content.Default, 
                        layoutOrder = v82(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }) else nil, 
                    Padding = if not (v50 == "") or v46 then v4.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 10)
                    }) else nil
                }), 
                ReportCommentFrame = v4.createElement(v13, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v82()
                }, {
                    Layout = v4.createElement(v14, {
                        Padding = UDim.new(0, 14), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 15)
                    }), 
                    ReportCommentSubheading = v4.createElement(l_StyledTextLabel_0, {
                        text = "2. " .. v81.submitDialogCommentSubheading, 
                        fontStyle = v45.Typography.TitleLarge, 
                        colorStyle = v45.Color.Content.Default, 
                        layoutOrder = v82(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    CommentTextField = v4.createElement(v12, {
                        layoutOrder = v82(), 
                        text = v52, 
                        placeholderText = v81.submitDialogTextBoxPlaceholder, 
                        onUpdate = v79
                    })
                })
            })
        })
    });
end;