local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.UIBlox);
local l_OpenTypeSupport_0 = v3.Utility.OpenTypeSupport;
local l_withStyle_0 = v3.Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v7 = require(l_Parent_0.AuthCommon);
local l_FitChildren_0 = v7.Components.FitChildren;
local l_FitTextLabel_0 = v7.Components.FitTextLabel;
local l_AuthStatefulRoundCornerBorder_0 = v7.Components.AuthStatefulRoundCornerBorder;
local l_PasswordBox_0 = v7.Components.PasswordBox;
local l_GenericTextBox_0 = v7.Components.GenericTextBox;
local l_IssueTracker_0 = v7.Components.IssueTracker;
local l_LoadingSpinner_0 = v3.App.Loading.LoadingSpinner;
local l_InputValidity_0 = v7.Enums.InputValidity;
local l_RegisterAuditContent_0 = v7.Components.RegisterAuditContent;
local v17 = v1.PureComponent:extend("CollapsingTextInputValidator");
local v18 = require(l_Parent_0.SharedFlags);
local l_GetFFlagLuaAppEnable10ftSignUpView_0 = v18.GetFFlagLuaAppEnable10ftSignUpView;
local l_GetFFlagEnableAuthStatefulTextInputUpdates_0 = v18.GetFFlagEnableAuthStatefulTextInputUpdates;
local l_FFlagSignUpTrackFailedRequest_0 = v18.FFlagSignUpTrackFailedRequest;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = v18.GetFFlagLuaAppEnableOpenTypeSupport;
local l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 = v18.GetFFlagLuaAppEnableOpenTypeSignUpPageFix;
local v24 = game:DefineFastFlag("UsernameValidatorSelectorPaddingFix", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = v18.GetFFlagEnableAuditForSinglePageSignUp;
local function _(v27, v28) --[[ Line: 50 ]] --[[ Name: computeIsInErrorState ]]
    -- upvalues: l_FFlagSignUpTrackFailedRequest_0 (copy), l_InputValidity_0 (copy)
    if l_FFlagSignUpTrackFailedRequest_0 and v27.hasFieldFailed then
        return true;
    elseif not v27.prerequisiteMet then
        return v28.textBoxFocused or v28.interactionBegan and v28.inputTextToValidate ~= "";
    elseif v28.inputTextToValidate == "" then
        return false;
    elseif v28.isInputTextValid == l_InputValidity_0.Invalid then
        return v28.interactionBegan;
    else
        return false;
    end;
end;
v17.defaultProps = {
    prerequisiteMet = true, 
    captureFocusOnTapStart = true
};
v17.init = function(v30) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: l_InputValidity_0 (copy), v1 (copy), l_FFlagSignUpTrackFailedRequest_0 (copy), l_withStyle_0 (copy), l_GetFFlagLuaAppEnable10ftSignUpView_0 (copy), l_game_EngineFeature_0 (copy), l_PasswordBox_0 (copy), l_GenericTextBox_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 (copy), l_OpenTypeSupport_0 (copy), v24 (copy)
    v30.state = {
        inputTextToValidate = "", 
        validatedInputText = "", 
        isInputTextValid = l_InputValidity_0.Unvalidated, 
        interactionBegan = false, 
        textBoxFocused = false, 
        textBoxHover = false, 
        issueSummaryHeight = 0, 
        issueFullListHeight = 0
    };
    v30.isMounted = false;
    v30.frameRef = v1.createRef();
    v30.getFrameRef = function() --[[ Line: 88 ]]
        -- upvalues: v30 (copy)
        return v30.props.frameRef or v30.frameRef;
    end;
    local v31, v32 = v1.createBinding(1);
    v30.issueSummaryTextTransparency = v31;
    v30.updateIssueSummaryTextTransparency = v32;
    v31, v32 = v1.createBinding(1);
    v30.issueFullListTextTransparency = v31;
    v30.updateIssueFullListTextTransparency = v32;
    v31, v32 = v1.createBinding(1);
    v30.issueCheckmarkTransparency = v31;
    v30.updateIssueCheckmarkTransparency = v32;
    v31, v32 = v1.createBinding(UDim2.new(1, 0, 0, 0));
    v30.issueTrackerHeight = v31;
    v30.updateIssueTrackerHeight = v32;
    v30.springOptions = {
        frequency = 3
    };
    v30.onSizeChange = function(v33, v34) --[[ Line: 101 ]]
        -- upvalues: v30 (copy)
        local l_AbsoluteSize_0 = v34.AbsoluteSize;
        if l_AbsoluteSize_0.X > 0 and l_AbsoluteSize_0.Y > 0 then
            spawn(function() --[[ Line: 107 ]]
                -- upvalues: v30 (ref), v33 (copy), l_AbsoluteSize_0 (copy)
                if v30.isMounted then
                    v30:setState({
                        [v33] = l_AbsoluteSize_0.Y
                    });
                end;
            end);
        end;
    end;
    v30.onIssueSummarySizeChange = function(v36) --[[ Line: 117 ]]
        -- upvalues: v30 (copy)
        v30.onSizeChange("issueSummaryHeight", v36);
    end;
    v30.onIssueFullListSizeChange = function(v37) --[[ Line: 121 ]]
        -- upvalues: v30 (copy)
        v30.onSizeChange("issueFullListHeight", v37);
    end;
    v30.textInputChangedCallback = function(v38) --[[ Line: 125 ]]
        -- upvalues: v30 (copy), l_InputValidity_0 (ref)
        spawn(function() --[[ Line: 126 ]]
            -- upvalues: v30 (ref), v38 (copy), l_InputValidity_0 (ref)
            if v30.isMounted then
                local l_Text_0 = v38.Text;
                local l_onInputTextChanged_0 = v30.props.onInputTextChanged;
                if l_onInputTextChanged_0 then
                    l_onInputTextChanged_0(l_Text_0, l_InputValidity_0.Unvalidated);
                end;
                v30:setState({
                    inputTextToValidate = l_Text_0, 
                    isInputTextValid = l_InputValidity_0.Unvalidated, 
                    interactionBegan = true
                });
            end;
        end);
    end;
    v30.onTextValidated = function(v41, v42, v43) --[[ Line: 144 ]]
        -- upvalues: v30 (copy), l_FFlagSignUpTrackFailedRequest_0 (ref)
        spawn(function() --[[ Line: 145 ]]
            -- upvalues: v30 (ref), v41 (copy), l_FFlagSignUpTrackFailedRequest_0 (ref), v42 (copy), v43 (copy)
            if v30.isMounted and v30.state.inputTextToValidate == v41 then
                local l_onInputTextValidated_0 = v30.props.onInputTextValidated;
                if l_onInputTextValidated_0 then
                    if l_FFlagSignUpTrackFailedRequest_0 then
                        l_onInputTextValidated_0(v41, v42, v43);
                    else
                        l_onInputTextValidated_0(v41, v42);
                    end;
                end;
                v30:setState({
                    validatedInputText = v41, 
                    isInputTextValid = v42
                });
            end;
        end);
    end;
    v30.onTextInputBoxFocused = function() --[[ Line: 165 ]]
        -- upvalues: v30 (copy)
        spawn(function() --[[ Line: 166 ]]
            -- upvalues: v30 (ref)
            if v30.isMounted then
                local v45 = v30.getFrameRef();
                if v30.props.textBoxFocusedCallback and v45.current then
                    v30.props.textBoxFocusedCallback(v45.current.AbsolutePosition);
                end;
                v30:setState({
                    textBoxFocused = true
                });
            end;
        end);
    end;
    v30.onMouseEnter = function() --[[ Line: 180 ]]
        -- upvalues: v30 (copy)
        if v30.isMounted then
            v30:setState({
                textBoxHover = true
            });
        end;
    end;
    v30.onMouseLeave = function() --[[ Line: 188 ]]
        -- upvalues: v30 (copy)
        if v30.isMounted then
            v30:setState({
                textBoxHover = false
            });
        end;
    end;
    v30.onTextInputBoxFocusLost = function() --[[ Line: 196 ]]
        -- upvalues: v30 (copy)
        spawn(function() --[[ Line: 197 ]]
            -- upvalues: v30 (ref)
            if v30.isMounted then
                if v30.props.textBoxFocusLostCallback then
                    v30.props.textBoxFocusLostCallback();
                end;
                v30:setState({
                    textBoxFocused = false
                });
            end;
        end);
    end;
    v30.onPositionChanged = function() --[[ Line: 210 ]]
        -- upvalues: v30 (copy)
        spawn(function() --[[ Line: 211 ]]
            -- upvalues: v30 (ref)
            if v30.isMounted and v30.state.textBoxFocused then
                local v46 = v30.getFrameRef();
                if v30.props.focusedTextBoxPositionChangedCallback and v46.current then
                    v30.props.focusedTextBoxPositionChangedCallback(v46.current.AbsolutePosition);
                end;
            end;
        end);
    end;
    v30.isInErrorState = function() --[[ Line: 221 ]]
        -- upvalues: v30 (copy), l_FFlagSignUpTrackFailedRequest_0 (ref), l_InputValidity_0 (ref)
        local l_props_0 = v30.props;
        local l_state_0 = v30.state;
        if l_FFlagSignUpTrackFailedRequest_0 and l_props_0.hasFieldFailed then
            return true;
        else
            local v49;
            if not l_props_0.prerequisiteMet then
                v49 = l_state_0.textBoxFocused;
                if not v49 then
                    v49 = l_state_0.interactionBegan;
                    if v49 then
                        return l_state_0.inputTextToValidate ~= "";
                    end;
                end;
            elseif l_state_0.inputTextToValidate == "" then
                return false;
            elseif l_state_0.isInputTextValid == l_InputValidity_0.Invalid then
                return l_state_0.interactionBegan;
            else
                v49 = false;
            end;
            return v49;
        end;
    end;
    v30.textInputBoxWithBorder = function() --[[ Line: 228 ]]
        -- upvalues: l_withStyle_0 (ref), v30 (copy), l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), l_game_EngineFeature_0 (ref), v1 (ref), l_PasswordBox_0 (ref), l_GenericTextBox_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 (ref), l_OpenTypeSupport_0 (ref), v24 (ref)
        return l_withStyle_0(function(v50) --[[ Line: 229 ]]
            -- upvalues: v30 (ref), l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), l_game_EngineFeature_0 (ref), v1 (ref), l_PasswordBox_0 (ref), l_GenericTextBox_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0 (ref), l_OpenTypeSupport_0 (ref), v24 (ref)
            local l_tokens_0 = v30.props.tokens;
            local l_Font_0 = v50.Font.Body.Font;
            local v53 = v50.Font.BaseSize * v50.Font.Body.RelativeSize;
            if l_GetFFlagLuaAppEnable10ftSignUpView_0() and l_tokens_0 then
                v53 = l_tokens_0.textBodySize;
            end;
            local l_Color_0 = v50.Theme.TextDefault.Color;
            local l_Transparency_0 = v50.Theme.TextDefault.Transparency;
            local l_Color_1 = v50.Theme.BackgroundUIContrast.Color;
            local l_Transparency_1 = v50.Theme.BackgroundUIContrast.Transparency;
            local l_Color_2 = v50.Theme.TextDefault.Color;
            local l_placeholderText_0 = v30.props.placeholderText;
            local l_textInputType_0 = v30.props.textInputType;
            local l_returnKeyType_0 = v30.props.returnKeyType;
            local v62 = v30.props.prefilledText or "";
            if l_textInputType_0 == Enum.TextInputType.Password or l_game_EngineFeature_0 and l_textInputType_0 == Enum.TextInputType.NewPassword then
                return v1.createElement(l_PasswordBox_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextSize = v53, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = "", 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor3 = nil, 
                    PlaceholderColor = l_Color_2, 
                    ReturnKeyType = l_returnKeyType_0, 
                    ManualFocusRelease = false, 
                    CaptureFocusOnTapStart = v30.props.captureFocusOnTapStart, 
                    Disabled = v30.props.disabled, 
                    onChangeText = v30.textInputChangedCallback, 
                    onFocused = v30.onTextInputBoxFocused, 
                    onFocusLost = v30.onTextInputBoxFocusLost, 
                    onMouseEnter = v30.onMouseEnter, 
                    onMouseLeave = v30.onMouseLeave, 
                    onReturnPressedFromOnScreenKeyboard = v30.props.onReturnPressedFromOnScreenKeyboard, 
                    IsKeyboardOverlayUsed = v30.props.IsKeyboardOverlayUsed, 
                    TextBoxRef = v30.props.textBoxRef, 
                    CentralOverlayBlocksInput = v30.props.centralOverlayBlocksInput, 
                    hidePassword = v30.props.hidePassword, 
                    onToggleCallback = v30.props.onToggleCallback, 
                    IsNewPassword = l_game_EngineFeature_0 and (l_textInputType_0 == Enum.TextInputType.NewPassword or l_textInputType_0 == Enum.TextInputType.NewPasswordShown)
                });
            else
                return v1.createElement(l_GenericTextBox_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v62, 
                    Font = l_Font_0, 
                    TextSize = v53, 
                    TextColor = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ClearTextOnFocus = false, 
                    Color = l_Color_1, 
                    Transparency = l_Transparency_1, 
                    TextInputType = l_textInputType_0, 
                    openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() and l_GetFFlagLuaAppEnableOpenTypeSignUpPageFix_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                    ReturnKeyType = l_returnKeyType_0, 
                    PaddingX = 12, 
                    PaddingY = v24 and 7 or nil, 
                    PlaceholderText = l_placeholderText_0, 
                    PlaceholderColor = l_Color_2, 
                    onChangeText = v30.textInputChangedCallback, 
                    onFocused = v30.onTextInputBoxFocused, 
                    onFocusLost = v30.onTextInputBoxFocusLost, 
                    onMouseEnter = v30.onMouseEnter, 
                    onMouseLeave = v30.onMouseLeave, 
                    onReturnPressedFromOnScreenKeyboard = v30.props.onReturnPressedFromOnScreenKeyboard, 
                    NextSelectionDown = v30.props.NextSelectionDown, 
                    TextBoxRef = v30.props.textBoxRef
                });
            end;
        end);
    end;
end;
v17.didMount = function(v63) --[[ Line: 324 ]] --[[ Name: didMount ]]
    -- upvalues: v2 (copy), l_InputValidity_0 (copy)
    v63.isMounted = true;
    v63.motor = v2.createGroupMotor({
        issueSummaryTextTransparency = 1, 
        issueFullListTextTransparency = 1, 
        issueCheckmarkTransparency = 1, 
        issueTrackerHeight = 0
    });
    v63.motor:onStep(function(v64) --[[ Line: 333 ]]
        -- upvalues: v63 (copy)
        v63.updateIssueSummaryTextTransparency(v64.issueSummaryTextTransparency);
        v63.updateIssueFullListTextTransparency(v64.issueFullListTextTransparency);
        v63.updateIssueCheckmarkTransparency(v64.issueCheckmarkTransparency);
        v63.updateIssueTrackerHeight(UDim2.new(1, 0, 0, v64.issueTrackerHeight));
    end);
    v63.motor:onComplete(function() --[[ Line: 340 ]]
        -- upvalues: v63 (copy)
        if v63.props.onAnimationStateChangeCallback then
            v63.props.onAnimationStateChangeCallback(v63.props.textInputType, false);
        end;
    end);
    v63.motor:start();
    local l_prefilledText_0 = v63.props.prefilledText;
    if l_prefilledText_0 and l_prefilledText_0 ~= "" then
        v63:setState({
            inputTextToValidate = l_prefilledText_0, 
            isInputTextValid = l_InputValidity_0.Unvalidated, 
            interactionBegan = false
        });
    end;
end;
v17.didUpdate = function(v66, v67, v68) --[[ Line: 358 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagSignUpTrackFailedRequest_0 (copy), l_InputValidity_0 (copy), v2 (copy)
    local l_textBoxFocused_0 = v66.state.textBoxFocused;
    local l_issueSummaryHeight_0 = v66.state.issueSummaryHeight;
    local l_issueFullListHeight_0 = v66.state.issueFullListHeight;
    local l_showDetailedError_0 = v66.props.showDetailedError;
    local v73 = v68.validatedInputText ~= "";
    local v74 = not l_textBoxFocused_0 or not v66.props.prerequisiteMet;
    local v75 = v66.state.validatedInputText ~= "";
    local l_props_1 = v66.props;
    local l_state_1 = v66.state;
    local v78 = l_FFlagSignUpTrackFailedRequest_0 and l_props_1.hasFieldFailed and true or if l_props_1.prerequisiteMet then l_state_1.inputTextToValidate ~= "" and l_state_1.isInputTextValid == l_InputValidity_0.Invalid and l_state_1.interactionBegan else l_state_1.textBoxFocused or l_state_1.interactionBegan and l_state_1.inputTextToValidate ~= "";
    l_props_1 = l_FFlagSignUpTrackFailedRequest_0 and v67.hasFieldFailed and true or if v67.prerequisiteMet then v68.inputTextToValidate ~= "" and v68.isInputTextValid == l_InputValidity_0.Invalid and v68.interactionBegan else v68.textBoxFocused or v68.interactionBegan and v68.inputTextToValidate ~= "";
    l_state_1 = nil;
    if l_showDetailedError_0 and v78 then
        v74 = false;
        v75 = true;
    end;
    l_state_1 = if not not l_textBoxFocused_0 or l_showDetailedError_0 and v78 then if v66.props.prerequisiteMet then l_issueFullListHeight_0 else l_issueSummaryHeight_0 else if v78 then l_issueSummaryHeight_0 else 0;
    local v79 = false;
    if v66.props.pillClicked then
        l_issueSummaryHeight_0 = 0;
        l_state_1 = 0;
        v66.props.resetPillClicked();
        v79 = true;
    end;
    if l_textBoxFocused_0 ~= v68.textBoxFocused or v73 ~= v75 or l_showDetailedError_0 and v78 or v78 ~= l_props_1 then
        v66.motor:setGoal({
            issueSummaryTextTransparency = v2.spring(v74 and 0 or 1, v66.springOptions), 
            issueFullListTextTransparency = v2.spring(v74 and 1 or 0, v66.springOptions), 
            issueCheckmarkTransparency = v2.spring(v75 and 0 or 1, v66.springOptions), 
            issueTrackerHeight = v2.spring(l_state_1, v66.springOptions)
        });
        if v66.props.onAnimationStateChangeCallback then
            v66.props.onAnimationStateChangeCallback(v66.props.textInputType, true);
            return;
        end;
    elseif l_issueSummaryHeight_0 ~= v68.issueSummaryHeight or l_issueFullListHeight_0 ~= v68.issueFullListHeight then
        if v79 then
            v66.motor:setGoal({
                issueTrackerHeight = v2.spring(l_state_1, v66.springOptions)
            });
        else
            v66.motor:setGoal({
                issueTrackerHeight = v2.instant(l_state_1)
            });
        end;
        if v66.props.onAnimationStateChangeCallback then
            v66.props.onAnimationStateChangeCallback(v66.props.textInputType, true);
        end;
    end;
end;
v17.willUnmount = function(v80) --[[ Line: 445 ]] --[[ Name: willUnmount ]]
    v80.isMounted = false;
    v80.motor:destroy();
end;
v17.render = function(v81) --[[ Line: 450 ]] --[[ Name: render ]]
    -- upvalues: l_AuthStatefulRoundCornerBorder_0 (copy), l_withStyle_0 (copy), l_GetFFlagLuaAppEnable10ftSignUpView_0 (copy), l_withLocalization_0 (copy), v1 (copy), l_FitChildren_0 (copy), l_FitTextLabel_0 (copy), l_LoadingSpinner_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), l_RegisterAuditContent_0 (copy), l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (copy), l_IssueTracker_0 (copy), l_FFlagSignUpTrackFailedRequest_0 (copy)
    local l_layoutOrder_0 = v81.props.layoutOrder;
    local l_titleTextKey_0 = v81.props.titleTextKey;
    local l_summaryErrorTextKey_0 = v81.props.summaryErrorTextKey;
    local l_validator_0 = v81.props.validator;
    local l_validatorAdditionalProps_0 = v81.props.validatorAdditionalProps;
    local l_inputTextToValidate_0 = v81.state.inputTextToValidate;
    local l_tokens_1 = v81.props.tokens;
    if not v81.props.prerequisiteMet then
        l_inputTextToValidate_0 = "";
    end;
    local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
    if v81.isInErrorState() then
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
    elseif v81.state.textBoxFocused then
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
    elseif v81.state.textBoxHover then
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Hover;
    end;
    return l_withStyle_0(function(v90) --[[ Line: 473 ]]
        -- upvalues: l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), l_tokens_1 (copy), l_withLocalization_0 (ref), l_titleTextKey_0 (copy), l_summaryErrorTextKey_0 (copy), v1 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (copy), v81 (copy), l_FitTextLabel_0 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_Default_0 (ref), l_LoadingSpinner_0 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), l_RegisterAuditContent_0 (ref), l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (ref), l_IssueTracker_0 (ref), l_validator_0 (copy), l_validatorAdditionalProps_0 (copy), l_inputTextToValidate_0 (ref), l_FFlagSignUpTrackFailedRequest_0 (ref)
        local v91 = v90.Font.BaseSize * v90.Font.CaptionHeader.RelativeSize;
        local v92 = 5;
        if l_GetFFlagLuaAppEnable10ftSignUpView_0() and l_tokens_1 then
            v92 = l_tokens_1.boxPadding;
            v91 = l_tokens_1.textCaptionHeaderSize;
        end;
        return l_withLocalization_0({
            titleText = l_titleTextKey_0, 
            summaryErrorText = l_summaryErrorTextKey_0
        })(function(v93) --[[ Line: 485 ]]
            -- upvalues: v1 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (ref), v81 (ref), v92 (ref), l_FitTextLabel_0 (ref), v90 (copy), v91 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_GetFFlagLuaAppEnable10ftSignUpView_0 (ref), l_tokens_1 (ref), l_Default_0 (ref), l_LoadingSpinner_0 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), l_RegisterAuditContent_0 (ref), l_titleTextKey_0 (ref), l_GetFFlagEnableAuthStatefulTextInputUpdates_0 (ref), l_IssueTracker_0 (ref), l_validator_0 (ref), l_validatorAdditionalProps_0 (ref), l_inputTextToValidate_0 (ref), l_FFlagSignUpTrackFailedRequest_0 (ref)
            return v1.createElement(l_FitChildren_0.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = l_FitChildren_0.FitAxis.Height, 
                BackgroundTransparency = 1, 
                [v1.Ref] = v81.getFrameRef(), 
                [v1.Change.AbsolutePosition] = v81.onPositionChanged
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v92)
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5), 
                    PaddingBottom = UDim.new(0, if v81.props.paddingBottomOverride then v81.props.paddingBottomOverride else 5)
                }), 
                Title = v1.createElement(l_FitTextLabel_0, {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = l_FitChildren_0.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v93.titleText or "", 
                    TextWrapped = true, 
                    Font = v90.Font.CaptionHeader.Font, 
                    TextSize = v91, 
                    TextColor3 = v90.Theme.TextEmphasis.Color, 
                    TextTransparency = v90.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TextInputBox = v1.createElement(l_AuthStatefulRoundCornerBorder_0, {
                    size = UDim2.new(1, 0, 0, if l_GetFFlagLuaAppEnable10ftSignUpView_0() and l_tokens_1 then l_tokens_1.textboxHeight else 36), 
                    layoutOrder = 1, 
                    borderState = l_Default_0
                }, {
                    textbox = v1.createElement(v81.textInputBoxWithBorder), 
                    loadingSpinner = if v81.props.shouldShowLoadingIcon then v1.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(16, 16), 
                        position = UDim2.new(1, -22, 0.5, 0), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    }) else nil
                }), 
                RegisterTitleAuditContent = if l_GetFFlagEnableAuditForSinglePageSignUp_0() and v81.props.enableAuditContentCapture and l_RegisterAuditContent_0 then v1.createElement(l_RegisterAuditContent_0, {
                    translationKey = l_titleTextKey_0, 
                    translatedSourceString = v93.titleText
                }) else nil, 
                AnimatedWrapper = v1.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    Size = v81.issueTrackerHeight
                }, {
                    Padding = v1.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, 12), 
                        PaddingLeft = if l_GetFFlagEnableAuthStatefulTextInputUpdates_0() then UDim.new(0, 0) else UDim.new(0, 12)
                    }), 
                    IssueSummaryWrapper = v1.createElement(l_FitChildren_0.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = l_FitChildren_0.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v1.Change.AbsoluteSize] = v81.onIssueSummarySizeChange
                    }, {
                        IssueSummaryText = v81.isInErrorState() and v1.createElement(l_FitTextLabel_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = l_FitChildren_0.FitAxis.Height, 
                            BackgroundTransparency = 1, 
                            Text = v93.summaryErrorText or "", 
                            TextWrapped = true, 
                            Font = v90.Font.CaptionBody.Font, 
                            TextSize = v90.Font.BaseSize * v90.Font.CaptionBody.RelativeSize, 
                            TextColor3 = v90.Theme.Alert.Color, 
                            TextTransparency = v81.issueSummaryTextTransparency, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    }), 
                    IssueTrackerWrapper = v1.createElement(l_FitChildren_0.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = l_FitChildren_0.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        [v1.Change.AbsoluteSize] = v81.onIssueFullListSizeChange
                    }, {
                        IssueTracker = v1.createElement(l_IssueTracker_0, {
                            validator = l_validator_0, 
                            validatorAdditionalProps = l_validatorAdditionalProps_0, 
                            textToValidate = l_inputTextToValidate_0, 
                            onTextValidated = v81.onTextValidated, 
                            contentTransparency = v81.issueFullListTextTransparency, 
                            checkmarkTransparency = v81.issueCheckmarkTransparency, 
                            updateIssueCondition = v81.props.updateIssueCondition, 
                            debounceTime = if l_FFlagSignUpTrackFailedRequest_0 then v81.props.debounceTime else nil
                        })
                    })
                })
            });
        end);
    end);
end;
return v17;