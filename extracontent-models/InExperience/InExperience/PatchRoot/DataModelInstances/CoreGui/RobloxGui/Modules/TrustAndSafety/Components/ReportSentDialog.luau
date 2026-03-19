local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v6.Core.Style.withStyle;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Dependencies);
local v12 = require(v11.FocusHandler);
local v13 = require(v11.playerInterface);
local v14 = require(v11.Divider);
local v15 = require(v11.ThemedTextLabel);
local v16 = require(v11.withLocalization);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v19 = require(l_Parent_0.Thunks.BlockPlayer);
local v20 = require(l_Parent_0.Components.BlockPlayerItem);
local v21 = require(l_Parent_0.Actions.EndReportFlow);
local _ = require(l_Parent_0.Actions.OpenBlockPlayerDialog);
local v23 = require(l_Parent_0.Actions.ShowToast);
local v24 = require(l_Parent_0.Resources.Constants);
local v25 = require(l_Parent_0.Resources.Assets);
local v26 = require(l_Parent_0.Components.ModalDialog);
local v27 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v28 = v4.PureComponent:extend("ReportSentDialog");
v28.validateProps = v7.strictInterface({
    isReportSentOpen = v7.boolean, 
    screenSize = v7.Vector2, 
    inputType = v7.optional(v7.string), 
    reportType = v7.optional(v7.valueOf(v24.ReportType)), 
    targetPlayer = v7.optional(v13), 
    blockPlayer = v7.callback, 
    showToast = v7.callback, 
    closeDialog = v7.callback, 
    reportCategory = v7.optional(v7.string)
});
isPlayerUserIdMuted = function(v29) --[[ Line: 55 ]] --[[ Name: isPlayerUserIdMuted ]]
    -- upvalues: l_default_0 (copy)
    local v30 = false;
    if l_default_0.participants then
        local v31 = l_default_0.participants[tostring(v29)];
        if v31 then
            v30 = v31.isMutedLocally;
        end;
    end;
    return v30;
end;
v28.init = function(v32) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_default_0 (copy), v27 (copy)
    v32:clearState();
    v32.buttonRef = v4.createRef();
    v32.onBlockCheckBoxActivated = function(v33) --[[ Line: 70 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            isBlockCheckBoxSelected = v33, 
            isMuteCheckBoxSelected = v33 and v32:isVoiceReport() and true or v32.state.isMuteCheckBoxSelected
        });
    end;
    v32.onMuteCheckBoxActivated = function(v34) --[[ Line: 79 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            isMuteCheckBoxSelected = v34
        });
    end;
    v32.hasMuteChanged = function() --[[ Line: 85 ]]
        -- upvalues: v32 (copy)
        return v32.state.isMuteCheckBoxSelected ~= v32.state.wasPlayerMutedWhenDialogOpened;
    end;
    v32.getToastMessage = function(v35) --[[ Line: 89 ]]
        -- upvalues: v32 (copy)
        local v36 = {
            title = v35.toastDefaultTitle, 
            description = v35.toastDefaultDescription
        };
        if v32.state.isMuteCheckBoxSelected and v32.state.isBlockCheckBoxSelected then
            v36.title = v35.toastMutedAndBlockedTitle;
            v36.description = v35.toastMutedAndBlockedDescription;
            return v36;
        elseif v32.state.isMuteCheckBoxSelected then
            v36.title = v35.toastMutedTitle;
            v36.description = v35.toastMutedDescription;
            return v36;
        else
            if v32.state.isBlockCheckBoxSelected then
                v36.title = v35.toastBlockedTitle;
                v36.description = v35.toastBlockedDescription;
            end;
            return v36;
        end;
    end;
    v32.onConfirm = function(v37) --[[ Line: 110 ]]
        -- upvalues: v32 (copy), l_default_0 (ref), v27 (ref)
        if v32:isReportingPlayer() then
            local v38 = v32.getToastMessage(v37);
            if v32:hasMuteChanged() then
                l_default_0:ToggleMutePlayer(v32.props.targetPlayer.UserId, v27.VOICE_CONTEXT_TYPE.REPORT_MENU);
            end;
            if v32.state.isBlockCheckBoxSelected then
                v32.props.blockPlayer(v32.props.targetPlayer, v38.title, v38.description);
            else
                v32.props.showToast(v38.title, v38.description);
            end;
        end;
        v32.props.closeDialog();
        v32:clearState();
    end;
    v32.onCancel = function() --[[ Line: 131 ]]
        -- upvalues: v32 (copy)
        v32.props.closeDialog();
        v32:clearState();
    end;
end;
v28.clearState = function(v39) --[[ Line: 137 ]] --[[ Name: clearState ]]
    v39:setState({
        wasPlayerMutedWhenDialogOpened = false, 
        isMuteCheckBoxSelected = false, 
        isBlockCheckBoxSelected = false
    });
end;
v28.isVoiceReport = function(v40) --[[ Line: 145 ]] --[[ Name: isVoiceReport ]]
    -- upvalues: v24 (copy)
    return v40:isReportingPlayer() and v40.props.reportCategory == v24.Category.Voice;
end;
v28.doesRequireConfirmation = function(v41) --[[ Line: 149 ]] --[[ Name: doesRequireConfirmation ]]
    return v41.state.isBlockCheckBoxSelected or v41:hasMuteChanged();
end;
v28.isReportingPlayer = function(v42) --[[ Line: 154 ]] --[[ Name: isReportingPlayer ]]
    -- upvalues: v24 (copy)
    local v43 = false;
    if v42.props.reportType == v24.ReportType.Player then
        v43 = v42.props.targetPlayer ~= nil;
    end;
    return v43;
end;
v28.renderFocusHandler = function(v44) --[[ Line: 158 ]] --[[ Name: renderFocusHandler ]]
    -- upvalues: v4 (copy), v12 (copy), v24 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy)
    local l_createElement_0 = v4.createElement;
    local l_v12_0 = v12;
    local v47 = {};
    local v48 = false;
    if v44.props.inputType == v24.InputType.Gamepad then
        v48 = v44.props.isReportSentOpen;
    end;
    v47.isFocused = v48;
    v47.didFocus = function() --[[ Line: 161 ]] --[[ Name: didFocus ]]
        -- upvalues: l_GuiService_0 (ref), v44 (copy), l_ContextActionService_0 (ref)
        l_GuiService_0:RemoveSelectionGroup("ReportSentDialogGroup");
        l_GuiService_0:AddSelectionParent("ReportSentDialogGroup", v44.buttonRef:getValue());
        l_GuiService_0.SelectedCoreObject = v44.buttonRef:getValue();
        l_ContextActionService_0:BindCoreAction("ReporSentDialogSinkAction", function(_, _) --[[ Line: 166 ]]
            return Enum.ContextActionResult.Sink;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX);
    end;
    v47.didBlur = function() --[[ Line: 170 ]] --[[ Name: didBlur ]]
        -- upvalues: l_ContextActionService_0 (ref), l_GuiService_0 (ref)
        l_ContextActionService_0:UnbindCoreAction("ReporSentDialogSinkAction");
        l_GuiService_0:RemoveSelectionGroup("ReportSentDialogGroup");
    end;
    return l_createElement_0(l_v12_0, v47);
end;
v28.renderBlockFrame = function(v51) --[[ Line: 177 ]] --[[ Name: renderBlockFrame ]]
    -- upvalues: v16 (copy), v4 (copy), v14 (copy), v20 (copy), v25 (copy)
    if not v51:isReportingPlayer() then
        return nil;
    else
        return v16({
            mutePlayerText = "CoreScripts.InGameMenu.Report.Mute", 
            mutePlayerDescription = "CoreScripts.InGameMenu.Report.MuteDescription", 
            blockPlayerText = "CoreScripts.InGameMenu.Report.Block", 
            blockPlayerDescription = "CoreScripts.InGameMenu.Report.BlockDescription"
        })(function(v52) --[[ Line: 186 ]]
            -- upvalues: v4 (ref), v14 (ref), v51 (copy), v20 (ref), v25 (ref)
            return v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Divider = v4.createElement(v14, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 1)
                }), 
                MutePlayerItem = if v51:isVoiceReport() then v4.createElement(v20, {
                    layoutOrder = 2, 
                    size = UDim2.new(1, 0, 0, 72), 
                    text = v52.mutePlayerText, 
                    description = v52.mutePlayerDescription, 
                    icon = v25.Images.MuteIcon.Image, 
                    iconSize = v25.Images.MuteIcon.Size, 
                    isDisabled = v51.state.isBlockCheckBoxSelected, 
                    isCheckBoxSelected = v51.state.isMuteCheckBoxSelected, 
                    onCheckBoxActivated = v51.onMuteCheckBoxActivated
                }) else nil, 
                BlockPlayerItem = v4.createElement(v20, {
                    layoutOrder = 3, 
                    size = UDim2.new(1, 0, 0, 72), 
                    text = v52.blockPlayerText, 
                    description = v52.blockPlayerDescription, 
                    icon = v25.Images.BlockIcon.Image, 
                    iconSize = v25.Images.BlockIcon.Size, 
                    isCheckBoxSelected = v51.state.isBlockCheckBoxSelected, 
                    onCheckBoxActivated = v51.onBlockCheckBoxActivated
                })
            });
        end);
    end;
end;
v28.renderContents = function(v53) --[[ Line: 228 ]] --[[ Name: renderContents ]]
    -- upvalues: l_withStyle_0 (copy), v16 (copy), v4 (copy), v15 (copy)
    return l_withStyle_0(function(_) --[[ Line: 229 ]]
        -- upvalues: v16 (ref), v53 (copy), v4 (ref), v15 (ref)
        return v16({
            bodyText = "CoreScripts.InGameMenu.Report.ThanksForReportDescription", 
            otherStepsText = {
                "CoreScripts.InGameMenu.Report.OtherStepsTitle"; 
                RBX_NAME = v53.props.targetPlayer.Name
            }
        })(function(v55) --[[ Line: 236 ]]
            -- upvalues: v4 (ref), v15 (ref), v53 (ref)
            return v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                BodyFrame = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 1
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12)
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12), 
                        PaddingBottom = UDim.new(0, 12), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    BodyText = v4.createElement(v15, {
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        themeKey = "TextEmphasis", 
                        Text = v55.bodyText, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    OtherStepsText = v4.createElement(v15, {
                        LayoutOrder = 2, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Position = UDim2.new(0, 0, 0, 12), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fontKey = "Footer", 
                        themeKey = "TextDefault", 
                        Text = v55.otherStepsText, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                BlockFrame = v53:renderBlockFrame()
            });
        end);
    end);
end;
v28.render = function(v56) --[[ Line: 291 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v4 (copy), v26 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    if not v56:isReportingPlayer() then
        return nil;
    else
        return v16({
            titleText = "CoreScripts.InGameMenu.Report.ThanksForReport", 
            dismissText = v56:doesRequireConfirmation() and "CoreScripts.InGameMenu.Report.Confirm" or "CoreScripts.InGameMenu.Report.Done", 
            toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport", 
            toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription", 
            toastMutedTitle = "CoreScripts.InGameMenu.Report.Confirmation.Muted", 
            toastMutedDescription = {
                "CoreScripts.InGameMenu.Report.Confirmation.MutedDescriptionWithUser"; 
                RBX_NAME = v56.props.targetPlayer.Name
            }, 
            toastMutedAndBlockedTitle = "CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlocked", 
            toastMutedAndBlockedDescription = {
                "CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser"; 
                RBX_NAME = v56.props.targetPlayer.Name
            }, 
            toastBlockedTitle = "CoreScripts.InGameMenu.Report.Confirmation.Blocked", 
            toastBlockedDescription = {
                "CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser"; 
                RBX_NAME = v56.props.targetPlayer.Name
            }
        })(function(v57) --[[ Line: 317 ]]
            -- upvalues: v4 (ref), v26 (ref), v56 (copy), l_Button_0 (ref), l_ButtonType_0 (ref)
            return v4.createFragment({
                ModalDialog = v4.createElement(v26, {
                    visible = v56.props.isReportSentOpen, 
                    screenSize = v56.props.screenSize, 
                    titleText = v57.titleText, 
                    contents = v56:renderContents(), 
                    actionButtons = v4.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(1, 0, 1, 0), 
                        onActivated = function() --[[ Line: 327 ]] --[[ Name: onActivated ]]
                            -- upvalues: v56 (ref), v57 (copy)
                            return v56.onConfirm(v57);
                        end, 
                        text = v57.dismissText, 
                        [v4.Ref] = v56.buttonRef
                    }), 
                    onDismiss = v56.onCancel
                }), 
                FocusHandler = v56:renderFocusHandler()
            });
        end);
    end;
end;
v28.didUpdate = function(v58, v59, _) --[[ Line: 340 ]] --[[ Name: didUpdate ]]
    if not v59.isReportSentOpen and v58.props.isReportSentOpen and v58:isVoiceReport() then
        local v61 = isPlayerUserIdMuted(v58.props.targetPlayer.UserId);
        v58:setState({
            wasPlayerMutedWhenDialogOpened = v61, 
            isMuteCheckBoxSelected = v61
        });
    end;
end;
return v5.UNSTABLE_connect2(function(v62, _) --[[ Line: 350 ]]
    -- upvalues: v24 (copy)
    return {
        isReportSentOpen = v62.report.currentPage == v24.Page.ReportSent, 
        reportType = v62.report.reportType, 
        targetPlayer = v62.report.targetPlayer, 
        screenSize = v62.displayOptions.screenSize, 
        reportCategory = v62.report.reportCategory
    };
end, function(v64) --[[ Line: 359 ]]
    -- upvalues: v21 (copy), v19 (copy), v23 (copy)
    return {
        closeDialog = function() --[[ Line: 361 ]] --[[ Name: closeDialog ]]
            -- upvalues: v64 (copy), v21 (ref)
            v64(v21());
        end, 
        blockPlayer = function(v65, v66, v67) --[[ Line: 364 ]] --[[ Name: blockPlayer ]]
            -- upvalues: v64 (copy), v19 (ref)
            v64(v19(v65, v66, v67));
        end, 
        showToast = function(v68, v69) --[[ Line: 367 ]] --[[ Name: showToast ]]
            -- upvalues: v64 (copy), v23 (ref)
            v64(v23(v68, v69));
        end
    };
end)(v28);