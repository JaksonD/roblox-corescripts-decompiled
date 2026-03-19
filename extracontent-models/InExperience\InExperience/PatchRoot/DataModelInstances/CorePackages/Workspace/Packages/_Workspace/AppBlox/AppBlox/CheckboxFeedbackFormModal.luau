local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.CentralOverlay);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.NavigationRodux);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_Parent_0.RobloxAppEnums);
local v9 = require(l_Parent_0.SharedFlags);
local v10 = require(l_Parent_0.UniversalAppPolicy);
local v11 = require(l_Parent_0.UrlBuilder);
local l_CloseCentralOverlay_0 = v1.Thunks.CloseCentralOverlay;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Checkbox_0 = v3.Checkbox;
local l_Dialog_0 = v3.Dialog;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_NavigateDown_0 = v5.Thunks.NavigateDown;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = v8.AppPage;
local l_useAppPolicy_0 = v10.useAppPolicy;
local l_UrlBuilder_0 = v11.UrlBuilder;
local l_FFlagFeedbackFormDynamicAbuseReporting_0 = v9.FFlagFeedbackFormDynamicAbuseReporting;
local v25 = game:DefineFastFlag("FixCheckboxFeedbackFormModalTermsOfUseWebView", false);
local v26 = game:DefineFastFlag("LuaAppSupportNewDefaultDialogBehavior", false);
local l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 = v9.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm;
local l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 = v9.FFlagLuaAppNotInterestedFeedbackFormTelemetry;
local v29 = game:DefineFastFlag("LuaAppCheckboxFeedbackFormTitleTextWrapping", false);
return v6.memo(function(v30) --[[ Line: 57 ]] --[[ Name: CheckboxFeedbackFormModal ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_CloseCentralOverlay_0 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (copy), v2 (copy), l_Checkbox_0 (copy), l_FFlagFeedbackFormDynamicAbuseReporting_0 (copy), v25 (copy), l_useAppPolicy_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), l_Dialog_0 (copy), v26 (copy), l_Text_0 (copy), v29 (copy), l_ButtonVariant_0 (copy), l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 (copy)
    local v31 = l_useDispatch_0();
    local v32 = l_useTokens_0();
    local v33 = l_useLocalization_0({
        submitText = "CommonUI.Controls.Action.Submit", 
        otherPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder", 
        termsOfUseText = {
            "Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse"; 
            underlineStart = "<u>", 
            underlineEnd = "</u>"
        }
    });
    local v35 = v6.useCallback(function(v34) --[[ Line: 70 ]]
        -- upvalues: v31 (copy), l_CloseCentralOverlay_0 (ref), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v30 (copy)
        v31(l_CloseCentralOverlay_0());
        if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 and v30.onClose then
            v30.onClose(v34);
        end;
    end, {
        v31, 
        v30.onClose
    });
    local v36, v37 = v6.useState({});
    local v42 = v6.useMemo(function() --[[ Line: 79 ]]
        -- upvalues: v2 (ref), v30 (copy), v6 (ref), l_Checkbox_0 (ref), v36 (copy), v37 (copy)
        return v2.List.map(v30.checkboxItems, function(v38, v39) --[[ Line: 80 ]]
            -- upvalues: v6 (ref), l_Checkbox_0 (ref), v36 (ref), v37 (ref)
            local l_id_0 = v38.id;
            return v6.createElement(l_Checkbox_0, {
                label = v38.text, 
                isChecked = v36[l_id_0] and true or false, 
                LayoutOrder = v39, 
                onActivated = function() --[[ Line: 86 ]] --[[ Name: onActivated ]]
                    -- upvalues: v36 (ref), l_id_0 (copy), v37 (ref)
                    local v41 = table.clone(v36);
                    if v41[l_id_0] then
                        v41[l_id_0] = false;
                        v37(v41);
                        return;
                    else
                        v41[l_id_0] = true;
                        v37(v41);
                        return;
                    end;
                end
            });
        end);
    end, {
        v30.checkboxItems, 
        v36
    });
    local v47, v48 = v6.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v30 (copy), v36 (copy)
        local v43 = false;
        local v44 = false;
        for _, v46 in v30.checkboxItems do
            if v36[v46.id] then
                if v46.triggersOtherTextbox then
                    v44 = true;
                else
                    v43 = true;
                end;
            end;
        end;
        return v43, v44;
    end, {
        v30.checkboxItems, 
        v36
    });
    local v49 = v6.useRef("");
    local v50, v51 = v6.useState(false);
    local v52 = if not v48 or v50 then (v47 or v48 and v50) and true or false else false;
    local v54 = v6.useCallback(function(v53) --[[ Line: 122 ]]
        -- upvalues: v49 (copy), v51 (copy)
        if not v53 then
            return;
        else
            if v53.Text:len() > 500 then
                v53.Text = v53.Text:sub(1, 500);
            end;
            v49.current = v53.Text;
            v51(v53.Text:len() >= 10);
            return;
        end;
    end, {});
    local v55 = v6.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v52 (copy), l_FFlagFeedbackFormDynamicAbuseReporting_0 (ref), v35 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref), v30 (copy), v36 (copy), v49 (copy)
        if not v52 then
            return;
        elseif l_FFlagFeedbackFormDynamicAbuseReporting_0 then
            v35(l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 and true or nil);
            v30.onSubmit(v36, v49.current);
            return;
        else
            task.spawn(v30.onSubmit, v36, v49.current);
            v35(l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 and true or nil);
            return;
        end;
    end, {
        v52, 
        v30.onSubmit, 
        v36, 
        v35
    });
    local v56 = nil;
    if v25 then
        v56 = l_useAppPolicy_0(function(v57) --[[ Line: 148 ]]
            return v57.getWebViewSupport();
        end);
    end;
    local v59 = v6.useCallback(function() --[[ Line: 154 ]]
        -- upvalues: v25 (ref), v31 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), v35 (copy), l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 (ref)
        if v25 then
            v31(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = l_UrlBuilder_0.static.about.terms(), 
                extraProps = {
                    title = ""
                }
            }, nil));
        else
            local v58 = {
                name = l_AppPage_0.GenericWebPage, 
                detail = l_UrlBuilder_0.static.about.terms()
            };
            v31(l_NavigateDown_0(v58));
        end;
        v35(not l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 and nil);
    end, {
        v31, 
        v35
    });
    local v60 = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v6.useCallback(function() --[[ Line: 179 ]]
        -- upvalues: v35 (copy)
        v35(false);
    end, {
        v35
    }) else nil;
    return v6.createElement(l_Dialog_0.Root, {
        onClose = if l_FFlagLuaAppNotInterestedFeedbackFormTelemetry_0 then v60 else v35, 
        hasBackdrop = v26 and true or nil
    }, {
        DialogTitle = if v30.dialogTitle then v6.createElement(l_Dialog_0.Title, {
            text = v30.dialogTitle
        }) else nil, 
        DialogText = v6.createElement(l_Dialog_0.Text, {
            Text = v30.dialogText, 
            LayoutOrder = 2
        }), 
        DialogContent = v6.createElement(l_Dialog_0.Content, {
            LayoutOrder = 3
        }, {
            CheckboxListWrapper = v6.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0)
            }, v2.Dictionary.union(v42, {
                Title = v6.createElement(l_Text_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    fontStyle = v32.Typography.TitleLarge, 
                    LayoutOrder = 0, 
                    Size = UDim2.fromScale(1, 0), 
                    Text = v30.checkboxListTitle, 
                    TextWrapped = v29 and true or nil, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                UIListLayout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, v32.Padding.Medium), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                })
            })), 
            OtherTextBoxContainer = if v48 then v6.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v32.Color.Shift.Shift_200.Color3, 
                BackgroundTransparency = v32.Color.Shift.Shift_200.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.fromScale(1, 0)
            }, {
                InputBox = v6.createElement("TextBox", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = v32.Typography.CaptionMedium.Font, 
                    LineHeight = v32.LineHeight.LineHeight_140, 
                    MultiLine = true, 
                    PlaceholderColor3 = v32.Color.Content.Muted.Color3, 
                    PlaceholderText = v33.otherPlaceholderText, 
                    Size = UDim2.new(1, 0, 0, v32.Size.Size_1000), 
                    Text = v49.current, 
                    TextColor3 = v32.Color.Content.Default.Color3, 
                    TextSize = v32.Typography.CaptionMedium.FontSize, 
                    TextTransparency = v32.Color.Content.Default.Transparency, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    [v6.Change.Text] = v54
                }, {
                    UISizeConstraint = v6.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(1e999, v32.Size.Size_3000)
                    })
                }), 
                UIPadding = v6.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, v32.Padding.Small), 
                    PaddingLeft = UDim.new(0, v32.Padding.Small), 
                    PaddingRight = UDim.new(0, v32.Padding.Small), 
                    PaddingTop = UDim.new(0, v32.Padding.Small)
                }), 
                UICorner = v6.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v32.Radius.Medium)
                })
            }) else nil, 
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v32.Padding.XLarge), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            })
        }), 
        DialogActions = v6.createElement(l_Dialog_0.Actions, {
            actions = {
                {
                    isDisabled = not v52, 
                    onActivated = v55, 
                    text = v33.submitText, 
                    variant = l_ButtonVariant_0.Standard
                }
            }, 
            LayoutOrder = 4
        }), 
        DisclaimerText = if (not l_FFlagLuaAppMakeDisclaimerOptInForFeedbackForm_0 or v30.showTermsOfUseDisclaimer) and (not v25 or v56) then v6.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = Enum.Font.BuilderSansMedium, 
            LayoutOrder = 5, 
            LineHeight = v32.LineHeight.LineHeight_140, 
            RichText = true, 
            Size = UDim2.fromScale(1, 0), 
            Text = v33.termsOfUseText, 
            TextColor3 = v32.Color.Content.Muted.Color3, 
            TextSize = v32.FontSize.FontSize_300, 
            TextTransparency = v32.Color.Content.Muted.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            [v6.Event.Activated] = v59
        }) else nil
    });
end);