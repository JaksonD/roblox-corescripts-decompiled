local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_UIBlox_0 = v3.UIBlox;
local l_t_0 = v3.t;
local l_Cryo_0 = v3.Cryo;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Flags_0 = l_Parent_0.Flags;
local v14 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v15 = require(script.Parent.Parent.Connection.FocusHandler);
local v16 = require(l_Parent_0.Resources.Assets);
local v17 = require(l_Parent_0.Actions.CloseReportDialog);
local v18 = require(l_Parent_0.Localization.withLocalization);
local v19 = require(l_Parent_0.Components.ThemedTextLabel);
local v20 = require(script.Parent.TextEntryField);
local v21 = require(l_Parent_0.Components.DropDownSelection);
local v22 = require(l_Parent_0.Resources.Constants);
local v23 = require(l_Parent_0.Utility.SendAnalytics);
local v24 = require(l_Parent_0.Thunks.SendReport);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v26 = l_Roact_0.PureComponent:extend("ReportDialog");
local v27 = {
    "Swearing", 
    "Inappropriate Username", 
    "Bullying", 
    "Scamming", 
    "Dating", 
    "Cheating/Exploiting", 
    "Personal Question", 
    "Offsite Links"
};
local v28 = {
    "CoreScripts.InGameMenu.Report.AbuseSwearing", 
    "CoreScripts.InGameMenu.Report.AbuseUsername", 
    "CoreScripts.InGameMenu.Report.AbuseBullying", 
    "CoreScripts.InGameMenu.Report.AbuseScamming", 
    "CoreScripts.InGameMenu.Report.AbuseDating", 
    "CoreScripts.InGameMenu.Report.AbuseExploiting", 
    "CoreScripts.InGameMenu.Report.AbusePersonalQuestion", 
    "CoreScripts.InGameMenu.Report.AbuseOffsiteLink"
};
v26.validateProps = l_t_0.strictInterface({
    isOpen = l_t_0.boolean, 
    userId = l_t_0.optional(l_t_0.integer), 
    userName = l_t_0.optional(l_t_0.string), 
    placeName = l_t_0.string, 
    dispatchCloseReportDialog = l_t_0.callback, 
    dispatchSendReport = l_t_0.callback, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isGamepadLastInput = l_t_0.optional(l_t_0.boolean)
});
v26.init = function(v29) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v29.state = {
        abuseDescription = "", 
        typeOfAbuseIndex = 0
    };
    v29.selectionGroupRef = l_Roact_0.createRef();
    v29.reportTextEntryRef = l_Roact_0.createRef();
    v29.reportDropDownRef = l_Roact_0.createRef();
end;
v26.renderReportTitle = function(_, v31, v32, v33) --[[ Line: 92 ]] --[[ Name: renderReportTitle ]]
    -- upvalues: l_Roact_0 (copy), v19 (copy)
    v32.Title = l_Roact_0.createElement(v19, {
        fontKey = "Header1", 
        themeKey = "TextEmphasis", 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 48), 
        Text = v33
    });
    v32.Divider = l_Roact_0.createElement("Frame", {
        BackgroundColor3 = v31.Theme.Divider.Color, 
        BackgroundTransparency = v31.Theme.Divider.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = 2, 
        Size = UDim2.new(0.8, 0, 0, 1)
    });
end;
v26.renderTextEntryField = function(v34, v35, v36, v37) --[[ Line: 111 ]] --[[ Name: renderTextEntryField ]]
    -- upvalues: l_Roact_0 (copy), v20 (copy)
    v36.ReportDescription = l_Roact_0.createElement(v20, {
        enabled = v34.props.isOpen, 
        text = v34.state.abuseDescription, 
        textChanged = function(v38) --[[ Line: 115 ]] --[[ Name: textChanged ]]
            -- upvalues: v34 (copy)
            v34:setState({
                abuseDescription = v38
            });
        end, 
        maxTextLength = 160, 
        autoFocusOnEnabled = not v34.props.isGamepadLastInput, 
        PlaceholderText = v35.textboxPlaceHolder, 
        LayoutOrder = 5, 
        Size = v37, 
        [l_Roact_0.Ref] = v34.reportTextEntryRef
    });
end;
v26.renderButtons = function(v39, _, v41, v42) --[[ Line: 130 ]] --[[ Name: renderButtons ]]
    -- upvalues: v27 (copy), l_Roact_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v43 = utf8.len(utf8.nfcnormalize(v39.state.abuseDescription));
    local v44 = false;
    if v43 >= 0 then
        v44 = v43 <= 160;
    end;
    local v45 = true;
    if v39.state.typeOfAbuseIndex <= 0 then
        v45 = v39.props.userId == nil;
    end;
    local function v47() --[[ Line: 135 ]]
        -- upvalues: v39 (copy), v27 (ref)
        local v46 = "Inappropriate Content";
        if v39.props.userId ~= nil then
            v46 = v27[v39.state.typeOfAbuseIndex];
        end;
        v39.props.dispatchSendReport(v46, v39.state.abuseDescription, v39.props.userId);
        v39.props.dispatchCloseReportDialog();
    end;
    v42.ButtonContainer = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 6, 
        Size = UDim2.new(1, 0, 0, 60)
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        CancelButton = l_Roact_0.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            layoutOrder = 1, 
            size = UDim2.fromOffset(144, 36), 
            text = v41.cancel, 
            onActivated = v39.props.dispatchCloseReportDialog
        }), 
        ConfirmButton = l_Roact_0.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            layoutOrder = 2, 
            size = UDim2.fromOffset(144, 36), 
            isDisabled = not (v44 and v45), 
            text = v41.report, 
            onActivated = v47
        })
    });
end;
v26.renderReportPlayer = function(v48, v49, v50, v51) --[[ Line: 174 ]] --[[ Name: renderReportPlayer ]]
    -- upvalues: l_Roact_0 (copy), l_ImageSetLabel_0 (copy), l_Cryo_0 (copy), v16 (copy), v19 (copy), v21 (copy), v28 (copy)
    v48:renderReportTitle(v49, v51, v50.reportPlayerTitle);
    local v52 = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0.5, -140, 0.5, 0), 
        Size = UDim2.new(0, 44, 0, 44)
    };
    local l_userId_0 = v48.props.userId;
    v51.ReportPlayerTextContainer = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 3, 
        Size = UDim2.new(1, 0, 0, 68)
    }, {
        PlayerCutout = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v52, {
            BackgroundTransparency = 1, 
            Image = v16.Images.CircleCutout, 
            ImageColor3 = v49.Theme.BackgroundUIDefault.Color, 
            ZIndex = 2
        })), 
        PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v52, {
            BackgroundTransparency = 1, 
            Image = l_userId_0 > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_userId_0 .. "&w=48&h=48" or ""
        })), 
        PlayerBackground = l_Roact_0.createElement("Frame", l_Cryo_0.Dictionary.join(v52, {
            BackgroundColor3 = v49.Theme.UIDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            ZIndex = 0
        })), 
        PlayerName = l_Roact_0.createElement(v19, {
            fontKey = "Body", 
            themeKey = "TextEmphasis", 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0.5, -76, 0.5, 0), 
            Size = UDim2.new(0.5, 76, 0, 44), 
            Text = v48.props.userName, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
    v51.AbuseTypeDropDown = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Size = UDim2.new(1, 0, 0, 68)
    }, {
        DropDown = l_Roact_0.createElement(v21, {
            Size = UDim2.new(1, 0, 0, 44), 
            placeHolderText = v50.selectTypeOfAbuse, 
            selections = v28, 
            localize = true, 
            selectedIndex = v48.state.typeOfAbuseIndex, 
            enabled = true, 
            selectionParentName = "abuseTypeDropDown", 
            canOpen = v48.props.canCaptureFocus, 
            canCaptureFocus = v48.props.isGamepadLastInput, 
            selectionChanged = function(v54) --[[ Line: 244 ]] --[[ Name: selectionChanged ]]
                -- upvalues: v48 (copy)
                v48:setState({
                    typeOfAbuseIndex = v54
                });
            end, 
            ButtonRef = v48.reportDropDownRef
        })
    });
    v48:renderTextEntryField(v50, v51, UDim2.new(1, 0, 0, 180));
    v48:renderButtons(v49, v50, v51);
end;
v26.renderReportGame = function(v55, v56, v57, v58) --[[ Line: 257 ]] --[[ Name: renderReportGame ]]
    -- upvalues: v16 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v19 (copy)
    v55:renderReportTitle(v56, v58, "Report " .. v55.props.placeName);
    local l_PlaceholderGameIcon_0 = v16.Images.PlaceholderGameIcon;
    if game.GameId > 0 then
        l_PlaceholderGameIcon_0 = "rbxthumb://type=GameIcon&id=" .. game.GameId .. "&w=150&h=150";
    end;
    v58.ReportGameTextContainer = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 3, 
        Size = UDim2.new(1, 0, 0, 126)
    }, {
        GameIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 17, 0.5, 0), 
            Size = UDim2.new(0, 64, 0, 64), 
            BackgroundTransparency = 1, 
            Image = l_PlaceholderGameIcon_0
        }), 
        GameName = l_Roact_0.createElement(v19, {
            fontKey = "Body", 
            themeKey = "TextEmphasis", 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 104, 0.5, 0), 
            Size = UDim2.new(1, -104, 0, 44), 
            Text = v57.flagingGame, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })
    });
    v55:renderTextEntryField(v57, v58, UDim2.new(1, 0, 0, 191));
    v55:renderButtons(v56, v57, v58);
end;
v26.render = function(v60) --[[ Line: 295 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v18 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v14 (copy), v15 (copy), l_GuiService_0 (copy)
    return l_withStyle_0(function(v61) --[[ Line: 296 ]]
        -- upvalues: v18 (ref), v60 (copy), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v14 (ref), v15 (ref), l_GuiService_0 (ref)
        return v18({
            flagingGame = {
                "CoreScripts.InGameMenu.Report.FlagingGame"; 
                RBX_NAME = v60.props.placeName
            }, 
            reportGameTitle = {
                "CoreScripts.InGameMenu.Report.ReportGameTitle"; 
                RBX_NAME = v60.props.placeName
            }, 
            reportPlayerTitle = "CoreScripts.InGameMenu.Report.ReportPlayerTitle", 
            selectTypeOfAbuse = "CoreScripts.InGameMenu.Report.SelectAbuseType", 
            cancel = "CoreScripts.InGameMenu.Cancel", 
            report = "CoreScripts.InGameMenu.Report.SendReport", 
            textboxPlaceHolder = "CoreScripts.InGameMenu.Report.AdditionalDetails"
        })(function(v62) --[[ Line: 308 ]]
            -- upvalues: l_Roact_0 (ref), v60 (ref), v61 (copy), l_ImageSetLabel_0 (ref), v16 (ref), v14 (ref), v15 (ref), l_GuiService_0 (ref)
            local v63 = {
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            if v60.props.userId == nil then
                v60:renderReportGame(v61, v62, v63);
            else
                v60:renderReportPlayer(v61, v62, v63);
            end;
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 8, 
                Visible = v60.props.isOpen, 
                [l_Roact_0.Ref] = v60.selectionGroupRef
            }, {
                Overlay = l_Roact_0.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v61.Theme.Overlay.Color, 
                    BackgroundTransparency = v61.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = "", 
                    Selectable = false
                }), 
                DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v16.Images.RoundedRect.Image, 
                    ImageColor3 = v61.Theme.BackgroundUIDefault.Color, 
                    ImageTransparency = v61.Theme.BackgroundUIDefault.Transparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ScaleType = v16.Images.RoundedRect.ScaleType, 
                    Size = UDim2.new(0, 600, 0, 450), 
                    SliceCenter = v16.Images.RoundedRect.SliceCenter
                }, v63), 
                FocusHandler = v14() and l_Roact_0.createElement(v15, {
                    isFocused = v60.props.canCaptureFocus and v60.props.isGamepadLastInput, 
                    shouldForgetPreviousSelection = not v60.props.isOpen, 
                    didFocus = function(v64) --[[ Line: 358 ]] --[[ Name: didFocus ]]
                        -- upvalues: v60 (ref), l_GuiService_0 (ref)
                        local v65 = nil;
                        v65 = if v60.props.userId then v60.reportDropDownRef:getValue() else v60.reportTextEntryRef:getValue();
                        l_GuiService_0.SelectedCoreObject = v64 or v65;
                    end
                }) or nil
            });
        end);
    end);
end;
v26.bindActions = function(v66) --[[ Line: 373 ]] --[[ Name: bindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("InGameMenuReportModalClose", function(_, v68, _) --[[ Line: 374 ]] --[[ Name: closeReportFunc ]]
        -- upvalues: v66 (copy)
        if v68 == Enum.UserInputState.Begin then
            v66.props.dispatchCloseReportDialog();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v26.unbindActions = function(_) --[[ Line: 383 ]] --[[ Name: unbindActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuReportModalClose");
end;
v26.didMount = function(v71) --[[ Line: 387 ]] --[[ Name: didMount ]]
    -- upvalues: l_GuiService_0 (copy)
    l_GuiService_0:RemoveSelectionGroup("ReportDialogGroup");
    l_GuiService_0:AddSelectionParent("ReportDialogGroup", v71.selectionGroupRef:getValue());
    if v71.props.isOpen then
        v71:bindActions();
    end;
end;
v26.didUpdate = function(v72, v73) --[[ Line: 396 ]] --[[ Name: didUpdate ]]
    -- upvalues: v14 (copy), l_GuiService_0 (copy)
    if v73.isOpen and not v72.props.isOpen then
        v72:setState({
            typeOfAbuseIndex = 0, 
            abuseDescription = ""
        });
    end;
    if not v14() and (not v73.canCaptureFocus or not v73.isGamepadLastInput) and v72.props.canCaptureFocus and v72.props.isGamepadLastInput then
        local _ = nil;
        l_GuiService_0.SelectedCoreObject = if v72.props.userId then v72.reportDropDownRef:getValue() else v72.reportTextEntryRef:getValue();
    end;
    if v72.props.isOpen then
        v72:bindActions();
        return;
    else
        v72:unbindActions();
        return;
    end;
end;
v26.willUnmount = function(v75) --[[ Line: 428 ]] --[[ Name: willUnmount ]]
    v75:unbindActions();
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v76, _) --[[ Line: 432 ]]
    -- upvalues: v22 (copy)
    return {
        isOpen = v76.report.dialogOpen, 
        userId = v76.report.userId, 
        userName = v76.report.userName, 
        placeName = v76.gameInfo.name, 
        canCaptureFocus = v76.report.dialogOpen and not v76.respawn.dialogOpen, 
        isGamepadLastInput = v76.displayOptions.inputType == v22.InputType.Gamepad
    };
end, function(v78) --[[ Line: 441 ]]
    -- upvalues: v17 (copy), v24 (copy), v23 (copy), v22 (copy)
    return {
        dispatchCloseReportDialog = function() --[[ Line: 443 ]] --[[ Name: dispatchCloseReportDialog ]]
            -- upvalues: v78 (copy), v17 (ref)
            v78(v17());
        end, 
        dispatchSendReport = function(v79, v80, v81) --[[ Line: 446 ]] --[[ Name: dispatchSendReport ]]
            -- upvalues: v78 (copy), v24 (ref), v23 (ref), v22 (ref)
            v78(v24(v79, v80, v81));
            local v82 = {};
            if v79 == "Inappropriate Content" then
                table.insert(v82, "report_type=game");
                table.insert(v82, "reported_entity_id=" .. tostring(game.GameId));
            else
                table.insert(v82, "report_type=user");
                table.insert(v82, "reported_entity_id=" .. tostring(v81));
            end;
            table.insert(v82, "report_source=ingame");
            local v83 = table.concat(v82, "&");
            v23(v22.AnalyticsReportSubmittedName, v83, {});
        end
    };
end)(v26);