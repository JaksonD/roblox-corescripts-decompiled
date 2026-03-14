local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.DisplayType);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugShowAccountSecurityPromptBanner);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptRollout);
local l_GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled_0 = require(l_CorePackages_0.Workspace.Packages.PromptAssignments).Flags.GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled;
local l_GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled_0 = require(l_CorePackages_0.Workspace.Packages.PromptAssignments).Flags.GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEmail2SVUpsellPopUpEnabled);
local l_GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled_0 = require(l_CorePackages_0.Workspace.Packages.PromptAssignments).Flags.GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSeconds);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPollingIntervalSeconds);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsVisible);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPopUpSpawnDelay);
local v17 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Helpers.GetDaysRemainingToForceResetString);
local v18 = game:DefineFastFlag("PromptBannerWaitInSmallIntervals", false);
local l_FFlagPasskeyUpsellFilteringEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPasskeyUpsellFilteringEnabled;
local v20 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Helpers.FilterOutPasskeyUpsell);
local v21 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v22 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.GetPromptAssignments);
local v23 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v24 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v25 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v26 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v27 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v28 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.PromptConstants);
local v29 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v30 = require(l_Modules_0.Common.Roact);
local v31 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v32 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v33 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v35 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v36 = require(l_Modules_0.LuaApp.Components.Generic.TouchFriendlyIconButton);
local v37 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v38 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptTypeWithEvent);
local v39 = require(l_Modules_0.LuaApp.withLocalization);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_withStyle_0 = v4.Style.withStyle;
local v48 = nil;
local v49 = l_Images_0["icons/status/alert"];
local v50 = l_Images_0["icons/navigation/close"];
local l_Red_0 = v4.App.Style.Colors.Red;
local v52 = {
    [v29.ChangePasswordSuspectedCompromise] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.UnusualActivityDetected", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordClickHereStyled", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity"
    }, 
    [v29.ChangePasswordBreachedCredential] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.YourPasswordMightBeStolen", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.NoChangeForceReset", 
        descriptionEndSingular = "Feature.AccountSecurityPrompt.Description.NoChangeForceResetSingular", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordClickHereStyled"
    }, 
    [v29.AccountRestoresPolicyUpdate] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpdate", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.AuthenticatorSetupPromptClickHere", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyWithDate", 
        settingsTitle = "CommonUI.Features.Label.Settings"
    }, 
    [v29.AccountRestoresPolicyUpdateV2] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.KeepYourAccountSafeShort", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.AuthenticatorSetupPromptNewShort", 
        settingsTitle = "CommonUI.Features.Label.Help"
    }, 
    [v29.AccountRestoresPolicyUpdateV3] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpdateV3", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyUpdateV3Short", 
        settingsTitle = "CommonUI.Features.Label.Settings"
    }, 
    [v29.Email2SVUpsell] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.Email2SVUpsell", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.Email2SVUpsellMessageBody", 
        settingsTitle = "CommonUI.Features.Label.Settings"
    }
};
local v53 = v30.PureComponent:extend(script.Name);
v53.defaultProps = {
    isInteractive = true
};
v53.init = function(v54) --[[ Line: 129 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagPasskeyUpsellFilteringEnabled_0 (copy), v20 (copy), v29 (copy), v5 (copy), v48 (ref), v13 (copy), v27 (copy), v28 (copy), v23 (copy)
    v54:setState({
        requestInFlightForDismissButton = false, 
        forceRenderValue = 0
    });
    v54.refreshPromptState = function() --[[ Line: 136 ]]
        -- upvalues: v54 (copy), l_FFlagPasskeyUpsellFilteringEnabled_0 (ref), v20 (ref), v29 (ref), v5 (ref), v48 (ref), v13 (ref)
        v54.props.getPromptAssignments(v54.props.networking):andThen(function(v55) --[[ Line: 139 ]]
            -- upvalues: l_FFlagPasskeyUpsellFilteringEnabled_0 (ref), v20 (ref), v29 (ref), v5 (ref), v54 (ref), v48 (ref), v13 (ref)
            local v56 = nil;
            local v57 = nil;
            local v58 = nil;
            if l_FFlagPasskeyUpsellFilteringEnabled_0 then
                v55 = v20(v55);
            end;
            if #v55 > 0 then
                v56 = v55[1].isGeneric;
                v57 = v29.fromRawValue(v55[1].promptType);
                if v57 ~= nil then
                    v58 = v55[1].metadata;
                elseif v57 == nil and typeof(v55[1].metadata) == "table" and v5.fromRawValue(v55[1].metadata.displayType) ~= nil then
                    v57 = v55[1].promptType;
                    v58 = v55[1].metadata;
                else
                    v56 = nil;
                end;
            end;
            if v57 ~= v54.props.promptType then
                v48 = nil;
            end;
            local v59 = v13();
            if v59 >= 0 and v48 ~= nil and v59 <= DateTime.now().UnixTimestamp - v48.UnixTimestamp then
                v48 = nil;
                if v54.isMounted then
                    v54:setState({
                        forceRenderValue = v54.state.forceRenderValue + 1
                    });
                end;
            end;
            v54.props.updatePromptType(v54.props.analytics, v56, v57, v58);
        end):catch(function(_) --[[ Line: 201 ]]

        end):await();
    end;
    v54.disablePromptAssignment = function(v61) --[[ Line: 207 ]]
        -- upvalues: v54 (copy), v27 (ref)
        v54:setState({
            requestInFlightForDismissButton = true
        });
        v54.props.updatePromptAssignment(v54.props.networking, v54.props.promptType, v61 and v27.DismissPrompt or v27.DisablePrompt):andThen(function() --[[ Line: 219 ]]
            -- upvalues: v54 (ref)
            v54.props.updatePromptType(v54.props.analytics, nil, nil, nil);
            v54.refreshPromptState();
            spawn(function() --[[ Line: 229 ]]
                -- upvalues: v54 (ref)
                if not v54.isMounted then
                    return;
                else
                    v54:setState({
                        requestInFlightForDismissButton = false
                    });
                    return;
                end;
            end);
        end):catch(function(_) --[[ Line: 239 ]]
            -- upvalues: v54 (ref)
            if not v54.isMounted then
                return;
            else
                v54:setState({
                    requestInFlightForDismissButton = false
                });
                return;
            end;
        end);
    end;
    v54.handlePrimary = function(v63) --[[ Line: 251 ]]
        -- upvalues: v54 (copy), v29 (ref), v28 (ref), v23 (ref)
        return function() --[[ Line: 252 ]]
            -- upvalues: v54 (ref), v29 (ref), v28 (ref), v63 (copy), v23 (ref)
            if v54.props.promptType == v29.AccountRestoresPolicyUpdate then
                task.spawn(v54.disablePromptAssignment);
                v54.props.openWebView(v28.getWebViewUrlAccountSettings(), v63);
                return;
            elseif v54.props.promptType == v29.AccountRestoresPolicyUpdateV2 then
                task.spawn(v54.disablePromptAssignment);
                v54.props.openWebView(v28.getWebViewUrlHelpPage(), v63);
                return;
            elseif v54.props.promptType == v29.AccountRestoresPolicyUpdateV3 then
                v54.props.navigateToSecuritySettings();
                return;
            elseif v54.props.promptType == v29.Email2SVUpsell then
                v54.props.openWebView(v28.getWebViewUrlEmailHighlight(), v63);
                return;
            elseif v54.props.isGeneric then
                return;
            else
                v54.props.openOverlayWithModalState(v23.ChangePasswordIntro);
                return;
            end;
        end;
    end;
    v54.handleDismissOrDisable = function() --[[ Line: 273 ]]
        -- upvalues: v54 (copy), v29 (ref), v23 (ref)
        if v54.props.promptType == v29.AccountRestoresPolicyUpdate or v54.props.promptType == v29.AccountRestoresPolicyUpdateV2 or v54.props.promptType == v29.AccountRestoresPolicyUpdateV3 or v54.props.isGeneric then
            v54.disablePromptAssignment();
            return;
        elseif v54.props.promptType == v29.Email2SVUpsell then
            v54.disablePromptAssignment(true);
            return;
        else
            v54.props.openOverlayWithModalState(v23.ChangePasswordDismissConfirmation);
            return;
        end;
    end;
end;
v53.didMount = function(v64) --[[ Line: 289 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v8 (copy), v14 (copy), v15 (copy), v18 (copy)
    v64.isMounted = true;
    spawn(function() --[[ Line: 293 ]]
        -- upvalues: v64 (copy), v7 (ref), v8 (ref), v14 (ref), v15 (ref), v18 (ref)
        while v64.isMounted and v7() and v8(v64.props.userId) do
            local l_lastUpdatedPromptTypeAt_0 = v64.props.lastUpdatedPromptTypeAt;
            local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
            local v67 = nil;
            v67 = if v64.props.promptType == nil then v14() else v15();
            if l_lastUpdatedPromptTypeAt_0 == nil or l_UnixTimestampMillis_0 - l_lastUpdatedPromptTypeAt_0.UnixTimestampMillis > v67 * 1000 then
                v64.refreshPromptState();
            end;
            if v18 then
                local v68 = os.clock() + v67;
                while os.clock() < v68 and v64.isMounted do
                    wait(1);
                end;
            else
                wait(v67);
            end;
        end;
        if v64.isMounted then
            v64.props.updatePromptType(v64.props.analytics, nil, nil, nil);
        end;
    end);
end;
v53.willUnmount = function(v69) --[[ Line: 345 ]] --[[ Name: willUnmount ]]
    v69.isMounted = false;
end;
v53.wrapInFrame = function(v70, v71) --[[ Line: 349 ]] --[[ Name: wrapInFrame ]]
    -- upvalues: v30 (copy)
    local l_Position_0 = v70.props.Position;
    local l_Size_0 = v70.props.Size;
    local v74 = v70.props[v30.Change.AbsoluteSize];
    return v30.createElement("Frame", {
        [v30.Change.AbsoluteSize] = v74, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = l_Position_0, 
        Size = l_Size_0 or UDim2.fromScale(1, 0)
    }, v71);
end;
v53.renderInternal = function(v75) --[[ Line: 364 ]] --[[ Name: renderInternal ]]
    -- upvalues: v6 (copy), v29 (copy), v52 (copy), l_GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled_0 (copy), l_GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled_0 (copy), l_GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled_0 (copy), v11 (copy), v30 (copy), v21 (copy), v23 (copy), v48 (ref), v16 (copy), l_withStyle_0 (copy), v39 (copy), v17 (copy), l_LocalizationService_0 (copy), l_Red_0 (copy), l_ImageSetLabel_0 (copy), v49 (copy), l_StyledTextLabel_0 (copy), l_LoadingSpinner_0 (copy), v36 (copy), v50 (copy)
    local l_isGeneric_0 = v75.props.isGeneric;
    local l_promptType_0 = v75.props.promptType;
    local l_metadata_0 = v75.props.metadata;
    local v79 = false;
    if l_metadata_0 ~= nil then
        v79 = true;
        if l_metadata_0.showBanner ~= nil then
            v79 = l_metadata_0.showBanner == false;
        end;
    end;
    local l_isInteractive_0 = v75.props.isInteractive;
    local l_designTokens_0 = v75.props.designTokens;
    local v82 = if l_designTokens_0 then l_designTokens_0.strokeColor else nil;
    local v83 = if l_designTokens_0 then l_designTokens_0.cornerRadius else nil;
    local l_requestInFlightForDismissButton_0 = v75.state.requestInFlightForDismissButton;
    if v6() and not l_promptType_0 then
        l_promptType_0 = v29.ChangePasswordSuspectedCompromise;
    end;
    local v85 = v52[l_promptType_0];
    local v86 = l_GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled_0() and l_promptType_0 == v29.AuthenticatorUpsell;
    local v87 = l_GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled_0() and l_promptType_0 == v29.BroaderAuthenticatorUpsell;
    local v88 = l_GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled_0() and l_promptType_0 == v29.AccountRestoresPolicyUpsell;
    local v89 = v11() and l_promptType_0 == v29.Email2SVUpsell;
    if l_isGeneric_0 then
        v85 = if l_metadata_0 ~= nil and l_metadata_0.bodyResource ~= nil and l_metadata_0.headerResource ~= nil then {
            descriptionStart = "Feature.AccountSecurityPrompt." .. l_metadata_0.bodyResource, 
            bannerHeader = "Feature.AccountSecurityPrompt." .. l_metadata_0.headerResource
        } else {};
    elseif v85 == nil and not v86 and not v87 and not v88 and (not v89 or v79) then
        return nil;
    end;
    local v90 = true;
    if l_isGeneric_0 then
        v90 = false;
    end;
    local v91 = l_promptType_0 ~= v29.ChangePasswordBreachedCredential;
    if l_isGeneric_0 and typeof(l_metadata_0) == "table" and l_metadata_0.showXButtonForDisable == false then
        v91 = false;
    end;
    if not l_isInteractive_0 then
        v91 = false;
    end;
    local v92 = UDim2.new(0, 65, 0, 0);
    local v93 = UDim2.new(1, -65, 0, 0);
    local v94 = l_promptType_0 ~= v29.AccountRestoresPolicyUpdateV3;
    if l_isGeneric_0 and typeof(l_metadata_0) == "table" and l_metadata_0.showAlertIcon == false then
        v94 = false;
    end;
    if not v94 then
        v92 = UDim2.new(0, 0, 0, 0);
        v93 = UDim2.new(1, v91 and -15 or 0, 0, 0);
    end;
    return v30.createElement(v21.Consumer, {
        render = function(v95) --[[ Line: 459 ]] --[[ Name: render ]]
            -- upvalues: l_metadata_0 (copy), v86 (copy), v87 (copy), v23 (ref), v88 (copy), v89 (copy), v79 (copy), v48 (ref), v16 (ref), v75 (copy), l_withStyle_0 (ref), v39 (ref), v85 (ref), l_promptType_0 (ref), v29 (ref), v17 (ref), l_LocalizationService_0 (ref), v30 (ref), v90 (ref), l_isInteractive_0 (copy), v91 (ref), v94 (ref), l_Red_0 (ref), l_ImageSetLabel_0 (ref), v49 (ref), v92 (ref), v93 (ref), l_StyledTextLabel_0 (ref), l_requestInFlightForDismissButton_0 (copy), l_LoadingSpinner_0 (ref), v36 (ref), v50 (ref), v82 (copy), v83 (copy)
            local v96 = v95 == "Home";
            local v97 = false;
            if l_metadata_0 ~= nil then
                v97 = false;
                if l_metadata_0.pageRestriction == "PAGE_RESTRICTION_HOME_PAGE" then
                    v97 = v96 ~= true;
                end;
            end;
            if v97 then
                return nil;
            else
                local v98 = nil;
                if v86 or v87 then
                    v98 = v23.AuthenticatorUpsellIntro;
                elseif v88 then
                    v98 = v23.AccountRestoresPolicyUpsell;
                elseif v89 and v79 then
                    v98 = v23.Email2SVUpsell;
                end;
                if v98 ~= nil then
                    if v48 == nil then
                        local v99 = v16();
                        if v99 >= 0 then
                            task.delay(v99, function() --[[ Line: 493 ]]
                                -- upvalues: v75 (ref), v98 (ref)
                                v75.props.openOverlayWithModalState(v98);
                            end);
                        else
                            v75.props.openOverlayWithModalState(v98);
                        end;
                        v48 = DateTime.now();
                    end;
                    return nil;
                else
                    return l_withStyle_0(function(v100) --[[ Line: 506 ]]
                        -- upvalues: v39 (ref), v85 (ref), l_promptType_0 (ref), v29 (ref), v17 (ref), l_metadata_0 (ref), l_LocalizationService_0 (ref), v30 (ref), v90 (ref), v75 (ref), l_isInteractive_0 (ref), v91 (ref), v94 (ref), l_Red_0 (ref), l_ImageSetLabel_0 (ref), v49 (ref), v92 (ref), v93 (ref), l_StyledTextLabel_0 (ref), l_requestInFlightForDismissButton_0 (ref), l_LoadingSpinner_0 (ref), v36 (ref), v50 (ref), v82 (ref), v83 (ref)
                        local l_Color_0 = v100.Theme.TextLink.Color;
                        local v102 = string.format("rgb(%d, %d, %d)", math.round(l_Color_0.R * 255), math.round(l_Color_0.G * 255), (math.round(l_Color_0.B * 255)));
                        return v39(v85)(function(v103) --[[ Line: 515 ]]
                            -- upvalues: v102 (copy), l_promptType_0 (ref), v29 (ref), v17 (ref), l_metadata_0 (ref), l_LocalizationService_0 (ref), v30 (ref), v90 (ref), v75 (ref), l_isInteractive_0 (ref), v100 (copy), v91 (ref), v94 (ref), l_Red_0 (ref), l_ImageSetLabel_0 (ref), v49 (ref), v92 (ref), v93 (ref), l_StyledTextLabel_0 (ref), l_requestInFlightForDismissButton_0 (ref), l_LoadingSpinner_0 (ref), v36 (ref), v50 (ref), v82 (ref), v83 (ref)
                            if v103 == nil or v103.bannerHeader == nil or v103.bannerHeader == "" or v103.descriptionStart == nil or v103.descriptionStart == "" then
                                return nil;
                            else
                                local v104 = v103.descriptionStart:gsub("{styleTagStart}", "<font color=\"" .. v102 .. "\">"):gsub("{styleTagEnd}", "</font>"):gsub("{linkStart}", "<font color=\"" .. v102 .. "\">"):gsub("{linkEnd}", "</font>");
                                local v105 = v103.descriptionEnd ~= nil and v103.descriptionEnd:gsub("{styleTagStart}", "<font color=\"" .. v102 .. "\">"):gsub("{styleTagEnd}", "</font>") or nil;
                                local v106 = false;
                                if l_promptType_0 == v29.ChangePasswordBreachedCredential then
                                    v105 = v17(v103.descriptionEndSingular, v103.descriptionEnd, l_metadata_0.forceResetTimestamp);
                                elseif l_promptType_0 == v29.AccountRestoresPolicyUpdate then
                                    v106 = true;
                                    v104 = v104:gsub("{date}", DateTime.fromIsoDate(l_metadata_0.accountRestoresPolicyEffectiveTimestamp):FormatUniversalTime("D MMM YYYY", l_LocalizationService_0.RobloxLocaleId or "en-us"));
                                end;
                                return l_promptType_0 and {
                                    BannerFrame = v30.createElement("TextButton", {
                                        [v30.Event.Activated] = if v90 then v75.handlePrimary(v103.settingsTitle) else nil, 
                                        AutoButtonColor = l_isInteractive_0, 
                                        AutomaticSize = Enum.AutomaticSize.Y, 
                                        BackgroundColor3 = v100.Theme.SystemPrimaryContent.Color, 
                                        BackgroundTransparency = v100.Theme.SystemPrimaryContent.Transparency, 
                                        BorderSizePixel = 0, 
                                        Size = UDim2.fromScale(1, 0), 
                                        Text = "", 
                                        SelectionImageObject = v75.props.selectionCursor
                                    }, {
                                        Padding = v30.createElement("UIPadding", {
                                            PaddingLeft = UDim.new(0, 15), 
                                            PaddingRight = UDim.new(0, 15), 
                                            PaddingTop = UDim.new(0, 15), 
                                            PaddingBottom = UDim.new(0, 15)
                                        }), 
                                        BannerLeftFrame = v30.createElement("Frame", {
                                            AutomaticSize = Enum.AutomaticSize.Y, 
                                            BackgroundTransparency = 1, 
                                            BorderSizePixel = 0, 
                                            Size = UDim2.fromScale(v91 and 0.9 or 1, 0)
                                        }, {
                                            IconFrame = v94 and v30.createElement("Frame", {
                                                BackgroundTransparency = 0, 
                                                BackgroundColor3 = l_Red_0, 
                                                BorderSizePixel = 0, 
                                                Size = UDim2.fromOffset(50, 50)
                                            }, {
                                                UICorner = v30.createElement("UICorner", {
                                                    CornerRadius = UDim.new(0, 10)
                                                }), 
                                                Icon = v30.createElement(l_ImageSetLabel_0, {
                                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                                    BackgroundTransparency = 1, 
                                                    Image = v49, 
                                                    Position = UDim2.fromScale(0.5, 0.5), 
                                                    Size = UDim2.fromOffset(36, 36)
                                                })
                                            }), 
                                            HeaderContentFrame = v30.createElement("Frame", {
                                                AutomaticSize = Enum.AutomaticSize.Y, 
                                                BackgroundTransparency = 1, 
                                                BorderSizePixel = 0, 
                                                Position = v92, 
                                                Size = v93
                                            }, {
                                                ListLayout = v30.createElement("UIListLayout", {
                                                    FillDirection = Enum.FillDirection.Vertical, 
                                                    SortOrder = Enum.SortOrder.LayoutOrder
                                                }), 
                                                Header = v30.createElement(l_StyledTextLabel_0, {
                                                    layoutOrder = 1, 
                                                    automaticSize = Enum.AutomaticSize.Y, 
                                                    colorStyle = v100.Theme.SystemPrimaryDefault, 
                                                    fontStyle = v100.Font.Header1, 
                                                    lineHeight = 1, 
                                                    size = UDim2.new(1, 0, 0, 0), 
                                                    text = v103.bannerHeader, 
                                                    textXAlignment = Enum.TextXAlignment.Left, 
                                                    textYAlignment = Enum.TextYAlignment.Top
                                                }), 
                                                Spacer = v30.createElement("Frame", {
                                                    LayoutOrder = 2, 
                                                    BackgroundTransparency = 1, 
                                                    BorderSizePixel = 0, 
                                                    Size = UDim2.fromOffset(0, 15)
                                                }), 
                                                ContentDescriptionLabel = v30.createElement(l_StyledTextLabel_0, {
                                                    layoutOrder = 3, 
                                                    automaticSize = Enum.AutomaticSize.Y, 
                                                    colorStyle = v100.Theme.TextDefault, 
                                                    fontStyle = v100.Font.Body, 
                                                    lineHeight = 1, 
                                                    size = UDim2.new(1, 0, 0, 0), 
                                                    text = (not not v106 or v105 == nil) and v104 or v104 .. " " .. v105, 
                                                    textXAlignment = Enum.TextXAlignment.Left, 
                                                    textYAlignment = Enum.TextYAlignment.Bottom
                                                }), 
                                                Spacer2 = v106 and v30.createElement("Frame", {
                                                    LayoutOrder = 4, 
                                                    BackgroundTransparency = 1, 
                                                    BorderSizePixel = 0, 
                                                    Size = UDim2.fromOffset(0, 15)
                                                }) or nil, 
                                                ContentDescriptionLabel2 = v106 and v30.createElement(l_StyledTextLabel_0, {
                                                    layoutOrder = 5, 
                                                    automaticSize = Enum.AutomaticSize.Y, 
                                                    colorStyle = v100.Theme.TextDefault, 
                                                    fontStyle = v100.Font.Body, 
                                                    lineHeight = 1, 
                                                    size = UDim2.new(1, 0, 0, 0), 
                                                    text = v105, 
                                                    textXAlignment = Enum.TextXAlignment.Left, 
                                                    textYAlignment = Enum.TextYAlignment.Bottom
                                                }) or nil
                                            })
                                        }), 
                                        DismissButton = v91 and (l_requestInFlightForDismissButton_0 and v30.createElement(l_LoadingSpinner_0, {
                                            position = UDim2.new(1, -15, 0, 15), 
                                            size = UDim2.new(0, 28, 0, 28), 
                                            anchorPoint = Vector2.new(0.5, 0.5)
                                        }) or v30.createElement(v36, {
                                            icon = v50, 
                                            iconColor = v100.Theme.TextDefault.Color, 
                                            iconPosition = UDim2.new(1, -15, 0, 15), 
                                            iconSize = 28, 
                                            iconTransparency = v100.Theme.TextDefault.Transparency, 
                                            onActivated = v75.handleDismissOrDisable, 
                                            Position = UDim2.fromScale(0.9, 0), 
                                            Size = UDim2.new(0.1, 0, 0.5, 0), 
                                            useUIBloxImageSet = true
                                        })) or nil, 
                                        UIStroke = if v82 then v30.createElement("UIStroke", {
                                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                                            Color = v82.Color3, 
                                            Transparency = v82.Transparency, 
                                            Thickness = 1
                                        }) else nil, 
                                        UICorner = if v83 then v30.createElement("UICorner", {
                                            CornerRadius = v83
                                        }) else nil
                                    })
                                } or nil;
                            end;
                        end);
                    end);
                end;
            end;
        end
    });
end;
v53.render = function(v107) --[[ Line: 731 ]] --[[ Name: render ]]
    return v107:wrapInFrame(v107:renderInternal());
end;
v53 = v33.connect(function(v108, _) --[[ Line: 735 ]]
    return {
        lastUpdatedPromptTypeAt = v108.AccountSecurityPrompt.lastUpdatedPromptTypeAt, 
        isGeneric = v108.AccountSecurityPrompt.isGeneric, 
        promptType = v108.AccountSecurityPrompt.promptType, 
        metadata = v108.AccountSecurityPrompt.metadata, 
        userId = v108.LocalUserId
    };
end, function(v110) --[[ Line: 743 ]]
    -- upvalues: v22 (copy), v35 (copy), v26 (copy), v25 (copy), v24 (copy), v38 (copy), v37 (copy)
    return {
        getPromptAssignments = function(v111) --[[ Line: 745 ]] --[[ Name: getPromptAssignments ]]
            -- upvalues: v110 (copy), v22 (ref)
            return v110(v22(v111));
        end, 
        openOverlayWithModalState = function(v112) --[[ Line: 748 ]] --[[ Name: openOverlayWithModalState ]]
            -- upvalues: v110 (copy), v35 (ref), v26 (ref)
            return v110(v35(v26.AccountSecurityPromptOverlay, {
                modalState = v112
            }));
        end, 
        openWebView = function(v113, v114) --[[ Line: 751 ]] --[[ Name: openWebView ]]
            -- upvalues: v110 (copy), v25 (ref)
            return v110(v25(v113, v114));
        end, 
        navigateToSecuritySettings = function() --[[ Line: 754 ]] --[[ Name: navigateToSecuritySettings ]]
            -- upvalues: v110 (copy), v24 (ref)
            v110(v24());
        end, 
        updatePromptType = function(v115, v116, v117, v118) --[[ Line: 757 ]] --[[ Name: updatePromptType ]]
            -- upvalues: v110 (copy), v38 (ref)
            return v110(v38(v115, v116, v117, v118));
        end, 
        updatePromptAssignment = function(v119, v120, v121) --[[ Line: 760 ]] --[[ Name: updatePromptAssignment ]]
            -- upvalues: v110 (copy), v37 (ref)
            return v110(v37(v119, v120, v121));
        end
    };
end)(v53);
v53 = l_RoactServices_0.connect({
    analytics = v31, 
    networking = v32
})(v53);
return function(v122) --[[ Line: 771 ]]
    -- upvalues: l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_useDesignTokens_0 (copy), v30 (copy), v53 (ref), v3 (copy)
    local v123 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v124 = l_useDesignTokens_0();
    return v30.createElement(v53, v3.Dictionary.join(v122, {
        designTokens = v124.LuaApps.Banner.securityBanner, 
        selectionCursor = v123
    }));
end;