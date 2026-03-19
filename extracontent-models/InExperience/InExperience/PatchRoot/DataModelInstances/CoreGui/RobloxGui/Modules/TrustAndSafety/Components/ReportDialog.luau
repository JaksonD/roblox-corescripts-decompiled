local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Dependencies);
local v8 = require(v7.GameIcon);
local v9 = require(v7.PlayerCell);
local v10 = require(v7.ThemedTextLabel);
local v11 = require(v7.withLocalization);
local v12 = require(v7.playerInterface);
local v13 = require(l_Parent_0.Actions.NavigateBack);
local v14 = require(l_Parent_0.Actions.EndReportFlow);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = require(l_Parent_0.Thunks.SendReport);
local v17 = require(l_Parent_0.Components.TextEntryField);
local v18 = require(l_Parent_0.Components.ModalDialog);
local v19 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialog);
local v20 = require(l_Parent_0.Components.ReportAnything.ScreenshotFlowStepHandler);
local v21 = require(l_Parent_0.Utility.SendAnalytics);
local v22 = require(l_Parent_0.Utility.SessionUtility);
local v23 = require(l_Parent_0.Utility.ScreenshotHelper);
local v24 = require(l_Parent_0.Flags.GetFFlagReportAnythingScreenshot);
local v25 = require(l_Parent_0.Flags.GetFFlagReportAnythingMultistepScreenshot);
local v26 = require(l_Parent_0.Actions.ScreenshotAnnotated);
local v27 = require(l_Parent_0.Thunks.FilterIdentifiedAvatars);
local l_Provider_0 = v5.Core.Style.Provider;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Colors_0 = v5.App.Style.Colors;
local l_DropdownMenu_0 = v5.App.Menu.DropdownMenu;
local l_isPlayerVerified_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.isPlayerVerified;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v37 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v38 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v39 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v40 = require(l_CorePackages_0.Packages.React);
local function v42(v41) --[[ Line: 52 ]]
    -- upvalues: v40 (copy), v38 (copy), v37 (copy), v1 (copy)
    if not v40.useContext(v38.Context).voiceEnabled then
        return nil;
    else
        return v40.createElement(v37, v1.Dictionary.join(v41, {}));
    end;
end;
local v43 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting);
local l_isShowUKOSAIllegalContentReportingLink_0 = v43.isShowUKOSAIllegalContentReportingLink;
local l_OSAReportLink_0 = v43.OSAReportLink;
local v46 = {
    "Swearing", 
    "Inappropriate Username", 
    "Bullying", 
    "Scamming", 
    "Dating", 
    "Cheating/Exploiting", 
    "Personal Question", 
    "Offsite Links"
};
local v47 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnHover = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnPress = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }
};
local v48 = v2.PureComponent:extend("ReportDialog");
v48.validateProps = v4.strictInterface({
    isReportDialogOpen = v4.boolean, 
    reportType = v4.optional(v4.valueOf(v15.ReportType)), 
    targetPlayer = v4.optional(v12), 
    placeName = v4.string, 
    screenSize = v4.Vector2, 
    screenshotAnnotationPoints = v4.array(v4.Vector2), 
    navigateBack = v4.optional(v4.callback), 
    canNavigateBack = v4.optional(v4.boolean), 
    sendReport = v4.callback, 
    closeDialog = v4.optional(v4.callback), 
    screenshotAnnotated = v4.optional(v4.callback), 
    reportCategory = v4.optional(v4.string), 
    currentPage = v4.string
});
v48.init = function(v49) --[[ Line: 114 ]] --[[ Name: init ]]
    v49.state = {
        reasonText = nil, 
        descriptionText = ""
    };
    v49.onReasonChanged = function(v50) --[[ Line: 120 ]]
        -- upvalues: v49 (copy)
        v49:setState({
            reasonText = v50
        });
    end;
    v49.onTextChanged = function(v51) --[[ Line: 126 ]]
        -- upvalues: v49 (copy)
        v49:setState({
            descriptionText = v51
        });
    end;
    v49.onReport = function(v52, v53) --[[ Line: 132 ]]
        -- upvalues: v49 (copy)
        local v54 = v49:getReason();
        v49.props.sendReport(v49.props.reportType, v49.props.targetPlayer, v54, v49.state.descriptionText, v49.props.reportCategory, v52, v53);
    end;
    v49.navigateBack = function() --[[ Line: 146 ]]
        -- upvalues: v49 (copy)
        v49.props.navigateBack(v49.state.reasonText, v49.state.descriptionText ~= "");
    end;
    v49.onCancel = function() --[[ Line: 150 ]]
        -- upvalues: v49 (copy)
        v49.props.closeDialog(v49.state.reasonText, v49.state.descriptionText ~= "");
    end;
    v49.onScreenshotAnnotated = function(v55) --[[ Line: 154 ]]
        -- upvalues: v49 (copy)
        v49.props.screenshotAnnotated(v49.props.reportCategory, v49.props.reportType, v55);
    end;
end;
v48.getReason = function(v56) --[[ Line: 159 ]] --[[ Name: getReason ]]
    -- upvalues: v15 (copy)
    if v56.props.reportType == v15.ReportType.Player then
        return v56.state.reasonText;
    elseif v56.props.reportType == v15.ReportType.Place then
        return "Inappropriate Content";
    else
        return nil;
    end;
end;
v48.canReport = function(v57) --[[ Line: 169 ]] --[[ Name: canReport ]]
    local v58 = v57:getReason() ~= nil;
    local v59 = utf8.len(utf8.nfcnormalize(v57.state.descriptionText));
    local v60 = false;
    if v59 >= 0 then
        v60 = v59 <= 160;
    end;
    return v58 and v60;
end;
v48.renderUKOSALink = function(_) --[[ Line: 176 ]] --[[ Name: renderUKOSALink ]]
    -- upvalues: l_isShowUKOSAIllegalContentReportingLink_0 (copy), v2 (copy), l_OSAReportLink_0 (copy)
    if not l_isShowUKOSAIllegalContentReportingLink_0() then
        return nil;
    else
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 40), 
            Position = UDim2.new(0, 0, 1, -45), 
            LayoutOrder = 99
        }, {
            OSALink = v2.createElement(l_OSAReportLink_0)
        });
    end;
end;
v48.renderPlayerInfo = function(v62) --[[ Line: 191 ]] --[[ Name: renderPlayerInfo ]]
    -- upvalues: v15 (copy), l_withStyle_0 (copy), v1 (copy), v47 (copy), v2 (copy), l_Provider_0 (copy), v9 (copy), l_isPlayerVerified_0 (copy), v42 (copy), l_default_0 (copy), v39 (copy)
    local v63 = v62.props.reportCategory == v15.Category.Voice;
    return l_withStyle_0(function(v64) --[[ Line: 194 ]]
        -- upvalues: v1 (ref), v47 (ref), v63 (copy), v62 (copy), v2 (ref), l_Provider_0 (ref), v9 (ref), l_isPlayerVerified_0 (ref), v42 (ref), l_default_0 (ref), v39 (ref)
        local v65 = v1.Dictionary.join(v64.Theme, v47);
        local v66 = v1.Dictionary.join(v64, {
            Theme = v65
        });
        local v67 = 0;
        if v63 and v62.props.isReportDialogOpen then
            v67 = v67 + 1;
        end;
        return v2.createElement(l_Provider_0, {
            style = v66
        }, {
            v2.createElement(v9, {
                userId = v62.props.targetPlayer.UserId, 
                username = v62.props.targetPlayer.Name, 
                displayName = v62.props.targetPlayer.DisplayName, 
                hasVerifiedBadge = l_isPlayerVerified_0(v62.props.targetPlayer), 
                isOnline = true, 
                isSelected = false, 
                LayoutOrder = 1, 
                key = tostring(v62.props.targetPlayer.UserId), 
                memoKey = v67
            }, {
                VoiceIndicator = v63 and v62.props.isReportDialogOpen and v2.createElement(v42, {
                    userId = tostring(v62.props.targetPlayer.UserId), 
                    hideOnError = true, 
                    iconStyle = "SpeakerLight", 
                    size = UDim2.fromOffset(36, 36), 
                    onClicked = function() --[[ Line: 225 ]] --[[ Name: onClicked ]]
                        -- upvalues: l_default_0 (ref), v62 (ref), v39 (ref)
                        l_default_0:ToggleMutePlayer(v62.props.targetPlayer.UserId, v39.VOICE_CONTEXT_TYPE.REPORT_MENU);
                    end
                }) or nil
            })
        });
    end);
end;
v48.renderDropDownMenu = function(v68) --[[ Line: 238 ]] --[[ Name: renderDropDownMenu ]]
    -- upvalues: l_isShowUKOSAIllegalContentReportingLink_0 (copy), v2 (copy), v11 (copy), v46 (copy), l_DropdownMenu_0 (copy)
    local v69 = l_isShowUKOSAIllegalContentReportingLink_0() and 64 or 72;
    if not v68.props.isReportDialogOpen then
        return nil;
    else
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, v69), 
            Size = UDim2.new(1, 0, 0, 48), 
            ZIndex = 10
        }, {
            DropDown = v11({
                menu1 = "CoreScripts.InGameMenu.Report.AbuseSwearing", 
                menu2 = "CoreScripts.InGameMenu.Report.AbuseUsername", 
                menu3 = "CoreScripts.InGameMenu.Report.AbuseBullying", 
                menu4 = "CoreScripts.InGameMenu.Report.AbuseScamming", 
                menu5 = "CoreScripts.InGameMenu.Report.AbuseDating", 
                menu6 = "CoreScripts.InGameMenu.Report.AbuseExploiting", 
                menu7 = "CoreScripts.InGameMenu.Report.AbusePersonalQuestion", 
                menu8 = "CoreScripts.InGameMenu.Report.AbuseOffsiteLink", 
                placeHolderText = "CoreScripts.InGameMenu.Report.AbuseTypePlaceHolder"
            })(function(v70) --[[ Line: 260 ]]
                -- upvalues: v46 (ref), v68 (copy), v2 (ref), l_DropdownMenu_0 (ref)
                local v71 = {};
                local v72 = {};
                for v73, v74 in ipairs(v46) do
                    local v75 = v70["menu" .. tostring(v73)];
                    table.insert(v71, {
                        text = v75
                    });
                    v72[v75] = v74;
                end;
                local function v78(v76) --[[ Line: 271 ]] --[[ Name: onDropDownChanged ]]
                    -- upvalues: v72 (copy), v68 (ref)
                    local v77 = v72[v76];
                    v68.onReasonChanged(v77);
                end;
                return v2.createElement(l_DropdownMenu_0, {
                    placeholder = v70.placeHolderText, 
                    onChange = v78, 
                    height = UDim.new(0, 48), 
                    screenSize = v68.props.screenSize, 
                    cellDatas = v71, 
                    showDropShadow = true, 
                    fixedListHeight = 171
                });
            end)
        });
    end;
end;
v48.renderPlayerContents = function(v79) --[[ Line: 290 ]] --[[ Name: renderPlayerContents ]]
    -- upvalues: v11 (copy), l_isShowUKOSAIllegalContentReportingLink_0 (copy), v2 (copy), v17 (copy)
    return v11({
        placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
    })(function(v80) --[[ Line: 293 ]]
        -- upvalues: l_isShowUKOSAIllegalContentReportingLink_0 (ref), v2 (ref), v79 (copy), v17 (ref)
        local v81 = l_isShowUKOSAIllegalContentReportingLink_0() and 118 or 132;
        local v82 = l_isShowUKOSAIllegalContentReportingLink_0() and -150 or -132;
        return v2.createFragment({
            PlayerInfo = v79:renderPlayerInfo(), 
            DropDownMenu = v79:renderDropDownMenu(), 
            TextField = v2.createElement(v17, {
                enabled = v79.props.isReportDialogOpen, 
                text = v79.state.descriptionText, 
                textChanged = v79.onTextChanged, 
                maxTextLength = 160, 
                autoFocusOnEnabled = false, 
                PlaceholderText = v80.placeHolderText, 
                Position = UDim2.fromOffset(0, v81), 
                Size = UDim2.new(1, 0, 1, v82)
            }), 
            OSALinkFrame = v79:renderUKOSALink()
        });
    end);
end;
v48.renderPlaceContents = function(v83) --[[ Line: 314 ]] --[[ Name: renderPlaceContents ]]
    -- upvalues: v11 (copy), l_isShowUKOSAIllegalContentReportingLink_0 (copy), v2 (copy), v8 (copy), v10 (copy), v17 (copy)
    return v11({
        labelText = {
            "CoreScripts.InGameMenu.Report.ReportingGame"; 
            RBX_NAME = v83.props.placeName
        }, 
        placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
    })(function(v84) --[[ Line: 321 ]]
        -- upvalues: l_isShowUKOSAIllegalContentReportingLink_0 (ref), v2 (ref), v8 (ref), v10 (ref), v17 (ref), v83 (copy)
        local v85 = l_isShowUKOSAIllegalContentReportingLink_0() and 12 or 24;
        local v86 = l_isShowUKOSAIllegalContentReportingLink_0() and 90 or 112;
        local v87 = l_isShowUKOSAIllegalContentReportingLink_0() and -135 or -112;
        return v2.createFragment({
            PlaceInfo = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(0, v85), 
                Size = UDim2.new(1, 0, 0, 64)
            }, {
                GameIcon = v2.createElement(v8, {
                    gameId = game.GameId, 
                    iconSize = 64, 
                    cornerRadius = UDim.new(0, 8)
                }), 
                Label = v2.createElement(v10, {
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, -76, 0, 40), 
                    Text = v84.labelText, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            TextField = v2.createElement(v17, {
                enabled = v83.props.isReportDialogOpen, 
                text = v83.state.descriptionText, 
                textChanged = v83.onTextChanged, 
                maxTextLength = 160, 
                autoFocusOnEnabled = false, 
                PlaceholderText = v84.placeHolderText, 
                Position = UDim2.fromOffset(0, v86), 
                Size = UDim2.new(1, 0, 1, v87)
            }), 
            OSALinkFrame = v83:renderUKOSALink()
        });
    end);
end;
v48.renderContents = function(v88) --[[ Line: 363 ]] --[[ Name: renderContents ]]
    -- upvalues: v15 (copy)
    if v88.props.reportType == v15.ReportType.Player then
        return v88:renderPlayerContents();
    elseif v88.props.reportType == v15.ReportType.Place then
        return v88:renderPlaceContents();
    else
        return nil;
    end;
end;
local v89 = {
    [v15.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat", 
    [v15.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat", 
    [v15.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other", 
    [v15.Category.Experience] = "CoreScripts.InGameMenu.Report.Title.Experience"
};
v48.categoryTitle = function(v90) --[[ Line: 380 ]] --[[ Name: categoryTitle ]]
    -- upvalues: v15 (copy), v89 (copy)
    if v90.props.reportType == v15.ReportType.Place then
        return v89[v15.Category.Experience];
    else
        return v89[v90.props.reportCategory] or "CoreScripts.InGameMenu.Report.ReportTitle";
    end;
end;
v48.render = function(v91) --[[ Line: 387 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v24 (copy), v15 (copy), v25 (copy), v40 (copy), v20 (copy), v23 (copy), v19 (copy), v2 (copy), v18 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    return v11({
        titleText = v91:categoryTitle(), 
        cancelText = "CoreScripts.InGameMenu.Cancel", 
        reportText = "CoreScripts.InGameMenu.Report.SendReport", 
        toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport", 
        toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription"
    })(function(v92) --[[ Line: 394 ]]
        -- upvalues: v24 (ref), v91 (copy), v15 (ref), v25 (ref), v40 (ref), v20 (ref), v23 (ref), v19 (ref), v2 (ref), v18 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref)
        if v24() and v91.props.currentPage == v15.Page.ScreenshotDialog then
            if v25() then
                return v40.createElement(v20, {
                    dismissAction = v91.onCancel, 
                    titleText = "Highlight What's Wrong", 
                    entryPoint = "experience", 
                    screenshot = v23:GetScreenshotContentId(), 
                    skipAnnotationAction = function() --[[ Line: 403 ]] --[[ Name: skipAnnotationAction ]]

                    end, 
                    restartAction = function() --[[ Line: 404 ]] --[[ Name: restartAction ]]

                    end, 
                    reportAction = function() --[[ Line: 405 ]] --[[ Name: reportAction ]]

                    end
                });
            else
                return v40.createElement(v19, {
                    screenshot = v23:GetScreenshotContentId(), 
                    titleText = "Highlight What's Wrong", 
                    backAction = if v91.props.canNavigateBack then v91.navigateBack else nil, 
                    dismissAction = v91.onCancel, 
                    reportAction = v91.onScreenshotAnnotated, 
                    initialAnnotationPoints = v91.props.screenshotAnnotationPoints
                });
            end;
        else
            return v2.createElement(v18, {
                visible = v91.props.isReportDialogOpen, 
                screenSize = v91.props.screenSize, 
                titleText = v92.titleText, 
                contents = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    Contents = v91:renderContents()
                }), 
                actionButtons = v2.createElement(l_ButtonStack_0, {
                    buttonHeight = 48, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v91.onCancel, 
                                text = v92.cancelText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isDisabled = not v91:canReport(), 
                                onActivated = function() --[[ Line: 447 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v91 (ref), v92 (copy)
                                    return v91.onReport(v92.toastDefaultTitle, v92.toastDefaultDescription);
                                end, 
                                text = v92.reportText
                            }
                        }
                    }
                }), 
                onDismiss = v91.onCancel, 
                onBackButtonActivated = if v91.props.canNavigateBack then v91.navigateBack else nil
            });
        end;
    end);
end;
v48.didUpdate = function(v93, v94) --[[ Line: 461 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    if v94.isReportDialogOpen and not v93.props.isReportDialogOpen then
        v93:setState({
            reasonText = v2.None, 
            descriptionText = ""
        });
    end;
end;
return v3.UNSTABLE_connect2(function(v95, _) --[[ Line: 471 ]]
    -- upvalues: v15 (copy)
    return {
        reportCategory = v95.report.reportCategory, 
        isReportDialogOpen = v95.report.currentPage == v15.Page.ReportForm, 
        currentPage = v95.report.currentPage, 
        reportType = v95.report.reportType, 
        targetPlayer = v95.report.targetPlayer, 
        canNavigateBack = #v95.report.history > 1, 
        placeName = v95.placeInfo.name, 
        screenSize = v95.displayOptions.screenSize, 
        screenshotAnnotationPoints = v95.report.screenshotAnnotationPoints
    };
end, function(v97) --[[ Line: 483 ]]
    -- upvalues: v13 (copy), v21 (copy), v15 (copy), v14 (copy), v22 (copy), v27 (copy), v26 (copy), v16 (copy)
    return {
        navigateBack = function(v98, v99) --[[ Line: 485 ]] --[[ Name: navigateBack ]]
            -- upvalues: v97 (copy), v13 (ref), v21 (ref), v15 (ref)
            v97(v13());
            v21(v15.Page.ReportForm, v15.Analytics.ReportFlowBack, {
                source = v15.Page.ReportForm, 
                reason = v98, 
                descriptionTextChanged = v99
            });
        end, 
        closeDialog = function(v100, v101) --[[ Line: 493 ]] --[[ Name: closeDialog ]]
            -- upvalues: v97 (copy), v14 (ref), v21 (ref), v15 (ref), v22 (ref)
            v97(v14());
            v21(v15.Page.ReportForm, v15.Analytics.ReportFlowAbandoned, {
                source = v15.Page.ReportForm, 
                reason = v100, 
                descriptionTextChanged = v101
            });
            v22.endAbuseReportSession();
        end, 
        screenshotAnnotated = function(v102, v103, v104) --[[ Line: 503 ]] --[[ Name: screenshotAnnotated ]]
            -- upvalues: v97 (copy), v27 (ref), v26 (ref)
            v97(v27(v104));
            v97(v26(v102, v103, v104));
        end, 
        sendReport = function(v105, v106, v107, v108, v109, v110, v111) --[[ Line: 507 ]] --[[ Name: sendReport ]]
            -- upvalues: v97 (copy), v16 (ref)
            v97(v16(v105, v106, v107, v108, v109, v110, v111));
        end
    };
end)(v48);