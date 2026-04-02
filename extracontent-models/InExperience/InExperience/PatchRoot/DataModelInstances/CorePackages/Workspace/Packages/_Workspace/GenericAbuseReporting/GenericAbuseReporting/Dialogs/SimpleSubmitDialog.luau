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
local l_FFlagRemoveDependencyArrayAntipattern_0 = v6.FFlagRemoveDependencyArrayAntipattern;
local function _(v37) --[[ Line: 73 ]] --[[ Name: getScreenSizeOffset ]]
    -- upvalues: l_FFlagAddAbuseReportOffsetForLandscape_0 (copy)
    if l_FFlagAddAbuseReportOffsetForLandscape_0 then
        if v37.X > v37.Y then
            return 180;
        else
            return 100;
        end;
    else
        return 100;
    end;
end;
local function _(v39, v40) --[[ Line: 82 ]] --[[ Name: getContentRightPadding ]]
    if v39.Y > v40.Y then
        return 16;
    else
        return 1;
    end;
end;
return function(v42) --[[ Line: 86 ]] --[[ Name: SubmitDialog ]]
    -- upvalues: v29 (copy), v5 (copy), v3 (copy), l_useTokens_0 (copy), v4 (copy), l_useLayerCollector_0 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v31 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v30 (copy), l_useLocalization_0 (copy), v11 (copy), l_createNextOrder_0 (copy), v15 (copy), v14 (copy), l_View_0 (copy), l_Text_0 (copy), l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 (copy), v28 (copy), l_GenericReportLink_0 (copy), l_PartialPageModal_0 (copy), v16 (copy), l_ButtonType_0 (copy), l_CloseButtonIcon_0 (copy), l_ScrollView_0 (copy), l_FFlagAddAbuseReportOffsetForLandscape_0 (copy), l_ScrollBarVisibility_0 (copy), v13 (copy), l_StyledTextLabel_0 (copy), v12 (copy)
    local v43 = v29();
    local v44 = v5.useFocusGuiObject();
    local v45 = v3.useLastInputMode();
    local v46 = l_useTokens_0();
    local v47, v48 = v4.useState(false);
    local v49, v50 = v4.useState("");
    local v51, v52 = v4.useState("");
    local v53, v54 = v4.useState("");
    local v55 = v4.useRef(nil);
    local v56, v57 = v4.useState(Vector2.zero);
    local v58, v59 = v4.useState(Vector2.zero);
    local v60, v61 = v4.useState(0);
    local v62, v63 = v4.useState(0);
    local v64 = v4.useRef(nil);
    local v65, v66 = v4.useState(0);
    local v67 = v4.useRef(nil);
    local v68, v69 = v4.useState(0);
    local v70, v71 = v4.useState(96);
    local v72 = l_useLayerCollector_0();
    local l_absoluteSize_0 = v72.absoluteSize;
    v4.useEffect(function() --[[ Line: 109 ]]
        -- upvalues: v71 (copy), v56 (copy), v65 (copy), v62 (copy), v60 (copy)
        v71((math.max(96, v56.Y - (v65 - v62) - v60 - 20)));
    end, {
        v56.Y, 
        v65, 
        v62, 
        v60
    });
    v4.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: v64 (copy), v61 (copy), v66 (copy)
        if v64.current then
            v61(v64.current.AbsoluteSize.Y);
            v66(v64.current.AbsolutePosition.Y);
        end;
    end, {
        v64.current, 
        l_absoluteSize_0
    });
    v4.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: v55 (copy), v59 (copy), v57 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (ref), v63 (copy)
        if v55.current then
            local l_ScrollingFrame_0 = v55.current:FindFirstChildWhichIsA("ScrollingFrame");
            if l_ScrollingFrame_0 then
                l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 129 ]]
                    -- upvalues: v59 (ref), l_ScrollingFrame_0 (copy), v57 (ref)
                    v59(l_ScrollingFrame_0.AbsoluteWindowSize);
                    v57(l_ScrollingFrame_0.AbsoluteCanvasSize);
                end);
                if l_FFlagChatLineReportingFocusFixesEnabled_0 then
                    l_ScrollingFrame_0.Selectable = false;
                end;
            end;
            v63(v55.current.AbsolutePosition.Y);
            return;
        else
            v57(Vector2.zero);
            return;
        end;
    end, {
        v55.current, 
        l_absoluteSize_0
    });
    v4.useEffect(function() --[[ Line: 143 ]]
        -- upvalues: v67 (copy), v69 (copy)
        if v67.current then
            v69(v67.current.AbsoluteContentSize.Y);
        end;
    end, {
        v67.current
    });
    local v75 = v4.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v49 (copy), v42 (copy), v53 (copy), v48 (copy)
        if v49 ~= "" then
            v42.onSubmit(v49, v53);
            return;
        elseif v42.reportCategoryDefaultKey ~= nil then
            v42.onSubmit(v42.reportCategoryDefaultKey, v53);
            return;
        else
            v48(true);
            return;
        end;
    end, {
        v42.onSubmit, 
        v49, 
        v53, 
        v48
    });
    local v78 = v4.useCallback(function(v76) --[[ Line: 162 ]]
        -- upvalues: v50 (copy), v43 (copy), v31 (ref), l_FFlagChatLineReportingFocusFixesEnabled_0 (ref), v45 (copy), v64 (copy), v44 (copy)
        v50(v76);
        v43(v31({
            reason_selection = v76
        }));
        if l_FFlagChatLineReportingFocusFixesEnabled_0 and v45 == "Focus" and v64.current then
            local l_FirstChild_0 = v64.current:FindFirstChild("SpawnButton", true);
            if l_FirstChild_0 and l_FirstChild_0:IsA("GuiObject") then
                v44(l_FirstChild_0);
            end;
        end;
    end, if l_FFlagChatLineReportingFocusFixesEnabled_0 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v43, 
        v44, 
        v45
    } else l_dependencyArray_0(v43, v44, v45) else {
        v43
    });
    local v80 = v4.useCallback(function(v79) --[[ Line: 186 ]]
        -- upvalues: v54 (copy), v43 (copy), v30 (ref)
        v54(v79);
        v43(v30({
            comment_added = #v79 > 0
        }));
    end, {
        v43
    });
    local v81 = if v42.localizationKeys then l_useLocalization_0(v42.localizationKeys) else v11();
    local v82 = l_useLocalization_0({
        submitDialogReasonSubheading = "Feature.ReportAbuse.Label.WhatWasWrong", 
        selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne", 
        submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappened", 
        submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment", 
        defaultKey = v42.reportCategories[1].localizationKey
    });
    local v83 = l_createNextOrder_0();
    local v84 = v4.createElement(v15, {
        options = v42.reportCategories, 
        screenSize = l_absoluteSize_0, 
        maxHeight = v70, 
        menuItemHeight = 48, 
        isDropdownError = v47, 
        setDropdownError = v48, 
        onSelectedAbuseType = v78, 
        reportCategoryDefaultKey = v42.reportCategoryDefaultKey, 
        setDescription = v52, 
        isDisabled = v42.isDisabled
    });
    local v85 = v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v83()
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
                Text = v82.defaultKey, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                tag = "size-full content-muted"
            })
        })
    });
    local v86 = nil;
    if l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 then
        v86 = v4.useMemo(function() --[[ Line: 249 ]]
            -- upvalues: v4 (ref), l_View_0 (ref), v28 (ref), l_GenericReportLink_0 (ref)
            return function() --[[ Line: 250 ]]
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
        screenSize = Vector2.new(l_absoluteSize_0.X * (v42.scaleDialog and v42.scaleDialog.X or 1), (l_absoluteSize_0.Y - v72.insets.top) * (v42.scaleDialog and v42.scaleDialog.Y or 1)), 
        position = UDim2.new(0.5, 0, 0, v72.insets.top + v16), 
        anchorPoint = Vector2.new(0.5, 0), 
        title = v81.formTitle, 
        onCloseClicked = v42.onAbandon, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = v75, 
                        text = v81.formSubmit
                    }
                }
            }
        }, 
        footerContent = if l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 then v42.footerContent or v28 and v86 or nil else v42.footerContent, 
        closeButtonIcon = if v42.useBackButton then l_CloseButtonIcon_0.Back else nil
    }, {
        SubmitContainer = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0)
        }, {
            SubmitReportFrame = v4.createElement(l_ScrollView_0, {
                Size = UDim2.new(1, 0, 0, (math.min(l_absoluteSize_0.Y - v72.insets.top - (if l_FFlagAddAbuseReportOffsetForLandscape_0 then l_absoluteSize_0.X > l_absoluteSize_0.Y and 180 or 100 else 100) - (l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 and v42.footerContent == nil and v28 and 25 or 0), v68 + 50 + 50))), 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromOffset(0, 0), 
                    scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }, 
                ref = v55
            }, {
                Layout = v4.createElement(v14, {
                    Padding = UDim.new(0, 16), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Ref = v67
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 16), 
                    PaddingBottom = UDim.new(0, 16), 
                    PaddingLeft = UDim.new(0, 1), 
                    PaddingRight = UDim.new(0, v56.Y > v58.Y and 16 or 1)
                }), 
                TopCustomComponent = v42.topCustomComponent, 
                ReportReasonFrame = v4.createElement(v13, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ZIndex = 2, 
                    LayoutOrder = v83()
                }, {
                    Layout = v4.createElement(v14, {
                        Padding = UDim.new(0, 14), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    ReportReasonSubheading = v4.createElement(l_StyledTextLabel_0, {
                        text = "1. " .. v82.submitDialogReasonSubheading, 
                        fontStyle = v46.Typography.TitleLarge, 
                        colorStyle = v46.Color.Content.Default, 
                        layoutOrder = v83(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    DropdownPosition = v4.createElement(v13, {
                        AutomaticSize = Enum.AutomaticSize.None, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        ZIndex = 2, 
                        LayoutOrder = v83(), 
                        ref = v64
                    }, {
                        ReportReasonPrompt = if v42.isReportCategoryReadonly then v85 else v84
                    }), 
                    ReportReasonSubtext = if v47 then v4.createElement(l_StyledTextLabel_0, {
                        text = v82.selectOnePrompt, 
                        fontStyle = v46.Typography.BodySmall, 
                        colorStyle = v46.Color.System.Alert, 
                        layoutOrder = v83(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }) else if v51 ~= "" then v4.createElement(l_StyledTextLabel_0, {
                        text = v51, 
                        fontStyle = v46.Typography.BodySmall, 
                        colorStyle = v46.Color.Content.Default, 
                        layoutOrder = v83(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }) else nil, 
                    Padding = if not (v51 == "") or v47 then v4.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 10)
                    }) else nil
                }), 
                ReportCommentFrame = v4.createElement(v13, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v83()
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
                        text = "2. " .. v82.submitDialogCommentSubheading, 
                        fontStyle = v46.Typography.TitleLarge, 
                        colorStyle = v46.Color.Content.Default, 
                        layoutOrder = v83(), 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    CommentTextField = v4.createElement(v12, {
                        layoutOrder = v83(), 
                        text = v53, 
                        placeholderText = v82.submitDialogTextBoxPlaceholder, 
                        onUpdate = v80
                    })
                })
            })
        })
    });
end;