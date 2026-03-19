local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_VerticalScrollView_0 = v5.App.Container.VerticalScrollView;
local v7 = require(l_CorePackages_0.Packages.Signals);
local v8 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.Resources.Constants);
local v11 = require(l_Parent_0.Thunks.SendFeedbackThunk);
local v12 = require(l_Parent_0.Actions.SetFeedbackFlowState);
local v13 = require(l_Parent_0.Actions.SetFeedbackReason);
local v14 = require(l_Parent_0.Components.TextEntryField);
local v15 = require(l_Parent_0.Components.ModalDialog);
local v16 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RadioButtonList_0 = v5.App.InputButton.RadioButtonList;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments);
local v25 = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("ExperienceStateCaptureSelectionBugFix");
local l_FFlagTopBarSignalizeScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize;
local v28 = v2.PureComponent:extend("FeedbackReportDialog");
v28.validateProps = v4.strictInterface({
    isReportDialogOpen = v4.boolean, 
    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v4.Vector2, 
    closeDialog = v4.optional(v4.callback), 
    reportCategory = v4.optional(v4.string)
});
v28.init = function(v29) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: v25 (copy), l_game_EngineFeature_0 (copy), l_ExperienceStateCaptureService_0 (copy), v10 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v8 (copy), v7 (copy)
    if v25 then
        v29.state = {
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = "", 
            correctTranslationText = "", 
            additionalCommentsText = "", 
            numFeedbackSubmissionAttempts = 0, 
            isGenericSelection = false
        };
        if l_game_EngineFeature_0 then
            v29.state.shouldDisplayFeedbackImage = false;
            v29.state.feedbackImageUri = "";
        end;
    else
        v29.state = {
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = "", 
            correctTranslationText = "", 
            additionalCommentsText = "", 
            numFeedbackSubmissionAttempts = 0
        };
        if l_game_EngineFeature_0 then
            v29.state.shouldDisplayFeedbackImage = false;
            v29.state.feedbackImageUri = "";
        end;
    end;
    v29.calculateFieldHeight = function(v30, v31, v32) --[[ Line: 99 ]]
        if v30 < 180 and v32 then
            return v31 * 5;
        else
            return v31 * (v30 / 45 + 2);
        end;
    end;
    v29.resetLocalState = function() --[[ Line: 108 ]]
        -- upvalues: v25 (ref), v29 (copy), l_game_EngineFeature_0 (ref), l_ExperienceStateCaptureService_0 (ref)
        if v25 then
            v29:setState({
                isGenericSelection = false
            });
        end;
        if l_game_EngineFeature_0 then
            v29:setState({
                shouldDisplayFeedbackImage = false, 
                feedbackImageUri = ""
            });
        end;
        v29:setState({
            correctTranslationText = "", 
            additionalCommentsText = "", 
            feedbackText = "", 
            feedbackOriginalText = "", 
            feedbackIdentifier = ""
        });
        v29.props.setFeedbackReason(0);
        l_ExperienceStateCaptureService_0:ResetHighlight();
    end;
    v29.setInstanceRelatedReportDialogState = function(v33) --[[ Line: 134 ]]
        -- upvalues: v29 (copy), l_game_EngineFeature_0 (ref), v25 (ref)
        if v33:IsA("TextBox") then
            v29:setState({
                feedbackText = v33.PlaceholderText, 
                feedbackOriginalText = v33.LocalizationMatchedSourceText, 
                feedbackIdentifier = v33.LocalizationMatchIdentifier
            });
            if l_game_EngineFeature_0 then
                v29:setState({
                    feedbackText = if v33.PlaceholderText == "" then v33.Text else v33.PlaceholderText
                });
            end;
            if v25 then
                v29:setState({
                    isGenericSelection = false
                });
                return;
            end;
        elseif v33:IsA("TextLabel") or v33:IsA("TextButton") then
            v29:setState({
                feedbackText = v33.Text, 
                feedbackOriginalText = v33.LocalizationMatchedSourceText, 
                feedbackIdentifier = v33.LocalizationMatchIdentifier
            });
            if v25 then
                v29:setState({
                    isGenericSelection = false
                });
                return;
            end;
        elseif l_game_EngineFeature_0 then
            if v33:IsA("ImageLabel") or v33:IsA("ImageButton") then
                v29:setState({
                    shouldDisplayFeedbackImage = true, 
                    feedbackImageUri = v33.Image
                });
                return;
            elseif v33:IsA("Decal") then
                v29:setState({
                    shouldDisplayFeedbackImage = true, 
                    feedbackImageUri = v33.Texture
                });
                return;
            elseif v33:IsA("MeshPart") then
                if v33.TextureContent.SourceType == Enum.ContentSourceType.Uri then
                    v29:setState({
                        shouldDisplayFeedbackImage = true, 
                        feedbackImageUri = v33.TextureID
                    });
                    return;
                elseif v33.MeshContent.SourceType == Enum.ContentSourceType.Uri then
                    v29:setState({
                        shouldDisplayFeedbackImage = true, 
                        feedbackImageUri = v33.MeshId
                    });
                    return;
                else
                    local l_SurfaceAppearance_0 = v33:FindFirstChildOfClass("SurfaceAppearance");
                    if l_SurfaceAppearance_0 and l_SurfaceAppearance_0.ColorMap then
                        v29:setState({
                            shouldDisplayFeedbackImage = true, 
                            feedbackImageUri = l_SurfaceAppearance_0.ColorMap
                        });
                        return;
                    end;
                end;
            end;
        elseif v25 then
            v29:setState({
                feedbackText = v33.ClassName, 
                feedbackOriginalText = v33.ClassName, 
                feedbackIdentifier = "", 
                isGenericSelection = true
            });
        end;
    end;
    l_ExperienceStateCaptureService_0.ItemSelectedInCaptureMode:Connect(function(v35) --[[ Line: 210 ]]
        -- upvalues: v29 (copy), v10 (ref)
        v29.resetLocalState();
        v29.setInstanceRelatedReportDialogState(v35);
        v29.props.setFeedbackFlowState(v10.State.CurrentlyLeavingFeedback);
    end);
    v29.onCorrectTranslationTextChanged = function(v36) --[[ Line: 217 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            correctTranslationText = v36
        });
    end;
    v29.onAdditionalCommentsTextChanged = function(v37) --[[ Line: 223 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            additionalCommentsText = v37
        });
    end;
    v29.onSubmitFeedback = function() --[[ Line: 229 ]]
        -- upvalues: v29 (copy), l_game_EngineFeature_0 (ref), v10 (ref)
        v29:setState({
            numFeedbackSubmissionAttempts = v29.state.numFeedbackSubmissionAttempts + 1
        });
        v29.props.sendFeedback(v29.state.feedbackOriginalText, v29.state.feedbackText, v29.state.feedbackIdentifier, v29.state.correctTranslationText, v29.state.additionalCommentsText, v29.props.feedbackReason, v29.state.numFeedbackSubmissionAttempts);
        if l_game_EngineFeature_0 then
            v29.props.setFeedbackFlowState(v10.State.Default);
            v29.resetLocalState();
            return;
        else
            v29.resetLocalState();
            v29.props.setFeedbackFlowState(v10.State.Default);
            return;
        end;
    end;
    v29.onCancel = function() --[[ Line: 254 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v29 (copy), v10 (ref)
        if l_game_EngineFeature_0 then
            v29.props.setFeedbackFlowState(v10.State.Default);
            v29.resetLocalState();
            return;
        else
            v29.resetLocalState();
            v29.props.setFeedbackFlowState(v10.State.Default);
            return;
        end;
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v8.GetDisplayStore(false).getViewportSize;
        v29.disposeScreenSize = v7.createEffect(function(v39) --[[ Line: 267 ]]
            -- upvalues: v29 (copy), l_getViewportSize_0 (copy)
            v29:setState({
                screenSize = l_getViewportSize_0(v39)
            });
        end);
    end;
end;
v28.renderContents = function(v40, v41) --[[ Line: 275 ]] --[[ Name: renderContents ]]
    -- upvalues: l_withStyle_0 (copy), v24 (copy), v2 (copy), l_StyledTextLabel_0 (copy), l_game_EngineFeature_0 (copy), v16 (copy), v25 (copy), l_RadioButtonList_0 (copy), v14 (copy)
    return l_withStyle_0(function(v42) --[[ Line: 276 ]]
        -- upvalues: v41 (copy), v24 (ref), v2 (ref), l_StyledTextLabel_0 (ref), l_game_EngineFeature_0 (ref), v40 (copy), v16 (ref), v25 (ref), l_RadioButtonList_0 (ref), v14 (ref)
        local l_Theme_0 = v42.Theme;
        local l_Font_0 = v42.Font;
        local v45 = {
            v41.untranslated, 
            v41.accuracyIssue, 
            v41.spellingOrGrammarIssue, 
            v41.inappropriateOrDerogatory
        };
        if v24() then
            return v2.createFragment({
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                SelectedTextHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = if l_game_EngineFeature_0 and v40.state.shouldDisplayFeedbackImage then v41.imageSelectionHeader else v41.textSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 1, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                SelectedTextLabel = if l_game_EngineFeature_0 and v40.state.shouldDisplayFeedbackImage then v2.createElement("ImageLabel", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 72), 
                    Image = v40.state.feedbackImageUri, 
                    ScaleType = Enum.ScaleType.Fit, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }) else v2.createElement(v16, {
                    LayoutOrder = 2, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, 0, 0, v40.calculateFieldHeight(string.len(v40.state.feedbackText), 14, false)), 
                    Text = if v25 then (if v40.state.isGenericSelection then v41.genericSelectionWrapper else v40.state.feedbackText) or "" else v40.state.feedbackText or "", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TranslationProblemsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v41.problemDropdownSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 3, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                TranslationProblemsListFrame = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 160), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    RadioButtonList = v2.createElement(l_RadioButtonList_0, {
                        radioButtons = v45, 
                        onActivated = function(v46) --[[ Line: 358 ]] --[[ Name: onActivated ]]
                            -- upvalues: v40 (ref)
                            v40.props.setFeedbackReason(v46);
                        end, 
                        currentValue = v40.props.feedbackReason, 
                        elementSize = UDim2.new(1, 0, 0, 40)
                    })
                }), 
                CorrectTranslationHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v41.correctTranslationHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 5, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                CorrectTranslationTextEntryField = v2.createElement(v14, {
                    LayoutOrder = 6, 
                    enabled = true, 
                    text = v40.state.correctTranslationText, 
                    textChanged = v40.onCorrectTranslationTextChanged, 
                    maxTextLength = math.max(string.len(v40.state.correctTranslationText), 180), 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v41.correctTranslationPlaceholder, 
                    Size = UDim2.new(1, 0, 0, v40.calculateFieldHeight(string.len(v40.state.correctTranslationText), 14, true))
                }), 
                AdditionalCommentsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v41.additionalCommentsHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 7, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                AdditionalCommentsTextEntryField = v2.createElement(v14, {
                    LayoutOrder = 8, 
                    enabled = true, 
                    text = v40.state.additionalCommentsText, 
                    textChanged = v40.onAdditionalCommentsTextChanged, 
                    maxTextLength = 180, 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v41.additionalCommentsPlaceholder, 
                    Size = UDim2.new(1, 0, 0, 90)
                })
            });
        else
            return v2.createFragment({
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                SelectedTextHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = if l_game_EngineFeature_0 and v40.state.shouldDisplayFeedbackImage then v41.imageSelectionHeader else v41.textSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 1, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                SelectedTextLabel = if l_game_EngineFeature_0 and v40.state.shouldDisplayFeedbackImage then v2.createElement("ImageLabel", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 72), 
                    Image = v40.state.feedbackImageUri, 
                    ScaleType = Enum.ScaleType.Fit, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }) else v2.createElement(v16, {
                    LayoutOrder = 2, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0, v40.calculateFieldHeight(string.len(v40.state.feedbackText), 18, false)), 
                    Text = if v25 then (if v40.state.isGenericSelection then v41.genericSelectionWrapper else v40.state.feedbackText) or "" else v40.state.feedbackText or "", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                CorrectTranslationHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v41.correctTranslationHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 3, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                CorrectTranslationTextEntryField = v2.createElement(v14, {
                    LayoutOrder = 4, 
                    enabled = true, 
                    text = v40.state.correctTranslationText, 
                    textChanged = v40.onCorrectTranslationTextChanged, 
                    maxTextLength = math.max(string.len(v40.state.correctTranslationText), 180), 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v41.correctTranslationPlaceholder, 
                    Size = UDim2.new(1, 0, 0, v40.calculateFieldHeight(string.len(v40.state.correctTranslationText), 18, true))
                }), 
                AdditionalCommentsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v41.additionalCommentsHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 5, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                AdditionalCommentsTextEntryField = v2.createElement(v14, {
                    LayoutOrder = 6, 
                    enabled = true, 
                    text = v40.state.additionalCommentsText, 
                    textChanged = v40.onAdditionalCommentsTextChanged, 
                    maxTextLength = 180, 
                    autoFocusOnEnabled = false, 
                    PlaceholderText = v41.additionalCommentsPlaceholder, 
                    Size = UDim2.new(1, 0, 0, 90)
                }), 
                TranslationProblemsHeader = v2.createElement(l_StyledTextLabel_0, {
                    text = v41.problemDropdownSelectionHeader, 
                    size = UDim2.new(1, 0, 0, 72), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    richText = true, 
                    layoutOrder = 7, 
                    fluidSizing = true, 
                    automaticSize = Enum.AutomaticSize.X
                }), 
                RadioButtonList = v2.createElement(l_RadioButtonList_0, {
                    radioButtons = v45, 
                    onActivated = function(v47) --[[ Line: 540 ]] --[[ Name: onActivated ]]
                        -- upvalues: v40 (ref)
                        v40.props.setFeedbackReason(v47);
                    end, 
                    currentValue = v40.props.feedbackReason, 
                    elementSize = UDim2.new(1, 0, 0, 40), 
                    layoutOrder = 8
                })
            });
        end;
    end);
end;
v28.render = function(v48) --[[ Line: 552 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v2 (copy), v15 (copy), v10 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v24 (copy), l_VerticalScrollView_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    return l_withLocalization_0({
        mainHeader = "CoreScripts.Feedback.FeedbackReportDialog.MainHeader", 
        cancel = "CoreScripts.Feedback.FeedbackReportDialog.Cancel", 
        submitFeedback = "CoreScripts.Feedback.FeedbackReportDialog.SubmitFeedback", 
        untranslated = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.Untranslated", 
        accuracyIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.AccuracyIssue", 
        spellingOrGrammarIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.SpellingOrGrammarIssue", 
        inappropriateOrDerogatory = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.InappropriateOrDerogatory", 
        textSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.TextSelectionHeader", 
        correctTranslationHeader = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationHeader", 
        correctTranslationPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationPlaceholder", 
        additionalCommentsHeader = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsHeader", 
        additionalCommentsPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsPlaceholder", 
        problemDropdownSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.ProblemDropdownSelectionHeader", 
        genericSelectionWrapper = {
            "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationObjectPlaceholder"; 
            ObjectType = v48.state.feedbackText
        }, 
        imageSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.ImageSelectionHeader"
    })(function(v49) --[[ Line: 572 ]]
        -- upvalues: v2 (ref), v15 (ref), v48 (copy), v10 (ref), l_FFlagTopBarSignalizeScreenSize_0 (ref), v24 (ref), l_VerticalScrollView_0 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref)
        return v2.createElement(v15, {
            visible = v48.props.feedbackFlowState == v10.State.CurrentlyLeavingFeedback, 
            screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then v48.state.screenSize else v48.props.screenSize, 
            titleText = v49.mainHeader, 
            showCloseButton = v24() and true or false, 
            contents = v2.createElement(l_VerticalScrollView_0, {
                useAutomaticCanvasSize = false, 
                canvasSizeY = if v24() then UDim.new(0, 600 + v48.calculateFieldHeight(string.len(v48.state.feedbackText), 14, false) * 2) else UDim.new(1, 550)
            }, v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Contents = v48:renderContents(v49)
            })), 
            actionButtons = v2.createElement(l_ButtonStack_0, {
                buttonHeight = 36, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v48.onCancel, 
                            text = v49.cancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = false, 
                            onActivated = v48.onSubmitFeedback, 
                            text = v49.submitFeedback
                        }
                    }
                }
            }), 
            onDismiss = v48.onCancel, 
            onBackButtonActivated = if v48.props.canNavigateBack then v48.navigateBack else nil
        });
    end);
end;
v28.willUnmount = function(v50) --[[ Line: 629 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v50.disposeScreenSize();
    end;
end;
return v3.connect(function(v51) --[[ Line: 636 ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    return {
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v51.displayOptions.screenSize, 
        feedbackFlowState = v51.feedbackFlowState.feedbackFlowState, 
        feedbackReason = v51.feedbackFlowState.feedbackReason
    };
end, function(v52) --[[ Line: 642 ]]
    -- upvalues: v11 (copy), v12 (copy), v13 (copy)
    return {
        sendFeedback = function(v53, v54, v55, v56, v57, v58, v59) --[[ Line: 644 ]] --[[ Name: sendFeedback ]]
            -- upvalues: v52 (copy), v11 (ref)
            v52(v11(v53, v54, v55, v56, v57, v58, v59));
        end, 
        setFeedbackFlowState = function(v60) --[[ Line: 665 ]] --[[ Name: setFeedbackFlowState ]]
            -- upvalues: v52 (copy), v12 (ref)
            v52(function(v61) --[[ Line: 666 ]]
                -- upvalues: v12 (ref), v60 (copy)
                v61:dispatch(v12(v60));
            end);
        end, 
        setFeedbackReason = function(v62) --[[ Line: 670 ]] --[[ Name: setFeedbackReason ]]
            -- upvalues: v52 (copy), v13 (ref)
            v52(function(v63) --[[ Line: 671 ]]
                -- upvalues: v13 (ref), v62 (copy)
                v63:dispatch(v13(v62));
            end);
        end
    };
end)(v28);