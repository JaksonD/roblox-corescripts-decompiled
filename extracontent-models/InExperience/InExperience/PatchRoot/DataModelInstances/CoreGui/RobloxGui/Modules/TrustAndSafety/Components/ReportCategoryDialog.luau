local _ = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Packages.Signals);
local v9 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Dependencies);
local _ = require(v11.FocusHandler);
local v13 = require(v11.playerInterface);
local v14 = require(v11.ThemedTextLabel);
local v15 = require(v11.withLocalization);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_withVoiceState_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext).withVoiceState;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v20 = require(v11.GameIcon);
local _ = require(l_Parent_0.Components.BlockPlayerItem);
local v22 = require(l_Parent_0.Actions.EndReportFlow);
local _ = require(l_Parent_0.Actions.OpenBlockPlayerDialog);
local v24 = require(l_Parent_0.Actions.SelectReportCategory);
local v25 = require(l_Parent_0.Utility.SendAnalytics);
local v26 = require(l_Parent_0.Utility.SessionUtility);
local v27 = require(l_Parent_0.Resources.Constants);
local v28 = require(l_Parent_0.Components.ModalDialog);
local v29 = require(l_Parent_0.Resources.Assets);
local _ = require(l_Parent_0.Components.GameCell);
local v31 = require(v11.BarOnTopScrollingFrame);
local l_Cell_0 = v5.App.Table.Cell;
local l_Provider_0 = v5.Core.Style.Provider;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_Colors_0 = v5.App.Style.Colors;
local l_FFlagTopBarSignalizeScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize;
local v37 = require(l_RobloxGui_0.Modules.Flags.GetFFlagReportMenuCellToUseAutomaticSize);
local v38 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnHover = {
        Color = l_Colors_0.Graphite, 
        Transparency = 0.666
    }, 
    BackgroundOnPress = {
        Color = l_Colors_0.Graphite, 
        Transparency = 0
    }
};
local function v40(v39) --[[ Line: 70 ]] --[[ Name: Divider ]]
    -- upvalues: v3 (copy), v7 (copy), l_Colors_0 (copy)
    return v3.createElement("Frame", v7.Dictionary.join({
        Size = UDim2.new(1, 0, 0, 1)
    }, v39, {
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Colors_0.Graphite, 
        BackgroundTransparency = 0.5, 
        theme = v7.None
    }));
end;
local function v42(v41) --[[ Line: 88 ]] --[[ Name: CategoryCellContent ]]
    -- upvalues: v3 (copy), v37 (copy), l_ImageSetLabel_0 (copy), v14 (copy)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        AutomaticSize = if v37() then Enum.AutomaticSize.XY else nil
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        IconFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 68, 1, 0), 
            LayoutOrder = 1
        }, {
            Layout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CustomIcon = v41.iconComponent or nil, 
            Icon = v41.icon and v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v41.icon.Image, 
                Size = v41.icon.Size
            })
        }), 
        TextFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -68, 1, 0), 
            LayoutOrder = 2
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 2)
            }), 
            Text = v3.createElement(v14, {
                AnchorPoint = Vector2.new(0, 0.5), 
                themeKey = "TextEmphasis", 
                fontKey = "Header2", 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v41.text, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            SubText = v3.createElement(v14, {
                AnchorPoint = Vector2.new(0, 0.5), 
                fontKey = "CaptionBody", 
                themeKey = "TextMuted", 
                Size = UDim2.new(1, 0, 0, 14), 
                Text = v41.subtext, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
local function v44(v43) --[[ Line: 147 ]] --[[ Name: CategoryCell ]]
    -- upvalues: v3 (copy), l_Cell_0 (copy), v42 (copy)
    return v3.createElement(l_Cell_0, {
        userInteractionEnabled = true, 
        onActivated = v43.onActivated, 
        layoutOrder = v43.layoutOrder, 
        size = UDim2.new(1, 0, 0, 72), 
        head = v42(v43), 
        tail = v3.createElement("Frame")
    });
end;
local v45 = v3.PureComponent:extend("ReportCategoryDialog");
v45.validateProps = v6.strictInterface({
    isReportCategoryMenuOpen = v6.boolean, 
    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v6.Vector2, 
    inputType = v6.optional(v6.string), 
    reportType = v6.optional(v6.valueOf(v27.ReportType)), 
    targetPlayer = v6.optional(v13), 
    closeDialog = v6.callback, 
    selectReportCategory = v6.optional(v6.callback), 
    playerFocusedFlow = v6.boolean
});
v45.init = function(v46) --[[ Line: 171 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v9 (copy), v8 (copy)
    v46.buttonRef = v3.createRef();
    v46.onCancel = function() --[[ Line: 174 ]]
        -- upvalues: v46 (copy)
        v46.props.closeDialog();
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v9.GetDisplayStore(false).getViewportSize;
        v46.disposeScreenSize = v8.createEffect(function(v48) --[[ Line: 181 ]]
            -- upvalues: v46 (copy), l_getViewportSize_0 (copy)
            v46:setState({
                screenSize = l_getViewportSize_0(v48)
            });
        end);
    end;
end;
v45.willUnmount = function(v49) --[[ Line: 189 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v49.disposeScreenSize();
    end;
end;
v45.renderContents = function(v50, v51, v52) --[[ Line: 195 ]] --[[ Name: renderContents ]]
    -- upvalues: v3 (copy), l_default_0 (copy), v7 (copy), v44 (copy), v29 (copy), v27 (copy), v40 (copy), v20 (copy), l_withStyle_0 (copy), v38 (copy), l_Provider_0 (copy), v31 (copy)
    local _ = v50.props;
    local v54 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_v51_0 = v51;
    if v51 then
        local v56 = l_default_0:getRecentUsersInteractionData();
        if v56 and not v7.isEmpty(v56) then
            if v50.props.playerFocusedFlow then
                l_v51_0 = v50.props.targetPlayer and v56[tostring(v50.props.targetPlayer.UserId)] ~= nil;
            end;
        else
            l_v51_0 = false;
        end;
    end;
    if l_v51_0 then
        table.insert(v54, v3.createElement(v44, {
            text = v52.voiceHeader, 
            subtext = v52.voiceDescription, 
            icon = v29.Images.VoiceChatIcon, 
            layoutOrder = #v54 + 1, 
            onActivated = function() --[[ Line: 229 ]] --[[ Name: onActivated ]]
                -- upvalues: v50 (copy), v27 (ref)
                v50.props.selectReportCategory(v27.Category.Voice);
            end
        }));
        table.insert(v54, v3.createElement(v40, {
            LayoutOrder = #v54 + 1
        }));
    end;
    table.insert(v54, v3.createElement(v44, {
        text = v52.textHeader, 
        subtext = v52.textDescription, 
        icon = v29.Images.TextChatIcon, 
        layoutOrder = #v54 + 1, 
        onActivated = function() --[[ Line: 249 ]] --[[ Name: onActivated ]]
            -- upvalues: v50 (copy), v27 (ref)
            v50.props.selectReportCategory(v27.Category.Text);
        end
    }));
    table.insert(v54, v3.createElement(v40, {
        LayoutOrder = #v54 + 1
    }));
    if not v50.props.playerFocusedFlow then
        table.insert(v54, v3.createElement(v44, {
            iconComponent = v3.createElement(v20, {
                gameId = game.GameId, 
                iconSize = 33, 
                cornerRadius = UDim.new(0, 8)
            }), 
            text = v52.experienceHeader, 
            subtext = v52.experienceDescription, 
            layoutOrder = #v54 + 1, 
            onActivated = function() --[[ Line: 273 ]] --[[ Name: onActivated ]]
                -- upvalues: v50 (copy), v27 (ref)
                v50.props.selectReportCategory(v27.Category.Experience);
            end
        }));
        table.insert(v54, v3.createElement(v40, {
            LayoutOrder = #v54 + 1
        }));
    end;
    table.insert(v54, v3.createElement(v44, {
        text = v52.otherHeader, 
        subtext = v52.otherDescription, 
        icon = v29.Images.OtherIcon, 
        layoutOrder = #v54 + 1, 
        onActivated = function() --[[ Line: 294 ]] --[[ Name: onActivated ]]
            -- upvalues: v50 (copy), v27 (ref)
            v50.props.selectReportCategory(v27.Category.Other);
        end
    }));
    table.insert(v54, v3.createElement(v40, {
        LayoutOrder = #v54 + 1
    }));
    return l_withStyle_0(function(v57) --[[ Line: 307 ]]
        -- upvalues: v7 (ref), v38 (ref), v3 (ref), l_Provider_0 (ref), v31 (ref), v50 (copy), v54 (copy)
        local v58 = v7.Dictionary.join(v57.Theme, v38);
        local v59 = v7.Dictionary.join(v57, {
            Theme = v58
        });
        return v3.createElement(l_Provider_0, {
            style = v59
        }, {
            v3.createElement(v31, {
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.new(1, 0, 0, 72), 
                scrollingFrameRef = v50.scrollingFrameRef
            }, v54)
        });
    end);
end;
v45.render = function(v60) --[[ Line: 324 ]] --[[ Name: render ]]
    -- upvalues: l_withVoiceState_0 (copy), v15 (copy), v3 (copy), v28 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy)
    return l_withVoiceState_0(function(v61) --[[ Line: 325 ]]
        -- upvalues: v15 (ref), v3 (ref), v28 (ref), v60 (copy), l_FFlagTopBarSignalizeScreenSize_0 (ref)
        return v15({
            titleText = "CoreScripts.InGameMenu.Report.MenuTitle", 
            dismissText = "CoreScripts.InGameMenu.Report.Done", 
            voiceHeader = "CoreScripts.InGameMenu.Report.Category.Header.Voice", 
            voiceDescription = "CoreScripts.InGameMenu.Report.Category.Description.Voice", 
            textHeader = "CoreScripts.InGameMenu.Report.Category.Header.Text", 
            textDescription = "CoreScripts.InGameMenu.Report.Category.Description.Text", 
            experienceHeader = "CoreScripts.InGameMenu.Report.Category.Header.Experience", 
            experienceDescription = "CoreScripts.InGameMenu.Report.Category.Description.Experience", 
            otherHeader = "CoreScripts.InGameMenu.Report.Category.Header.Other", 
            otherDescription = "CoreScripts.InGameMenu.Report.Category.Description.Other"
        })(function(v62) --[[ Line: 337 ]]
            -- upvalues: v3 (ref), v28 (ref), v60 (ref), l_FFlagTopBarSignalizeScreenSize_0 (ref), v61 (copy)
            return v3.createFragment({
                ModalDialog = v3.createElement(v28, {
                    visible = v60.props.isReportCategoryMenuOpen, 
                    screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then v60.state.screenSize else v60.props.screenSize, 
                    titleText = v62.titleText, 
                    contents = v60:renderContents(v61.voiceEnabled, v62), 
                    showCloseButton = true, 
                    onDismiss = v60.onCancel
                })
            });
        end);
    end);
end;
return v4.UNSTABLE_connect2(function(v63, _) --[[ Line: 352 ]]
    -- upvalues: v27 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy)
    return {
        isReportCategoryMenuOpen = v63.report.currentPage == v27.Page.Category, 
        reportType = v63.report.reportType, 
        targetPlayer = v63.report.targetPlayer, 
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v63.displayOptions.screenSize, 
        playerFocusedFlow = v63.report.beginningReportType == v27.ReportType.Player
    };
end, function(v65) --[[ Line: 361 ]]
    -- upvalues: v24 (copy), v22 (copy), v25 (copy), v27 (copy), v26 (copy)
    return {
        selectReportCategory = function(v66) --[[ Line: 363 ]] --[[ Name: selectReportCategory ]]
            -- upvalues: v65 (copy), v24 (ref)
            v65(v24(v66));
        end, 
        closeDialog = function() --[[ Line: 366 ]] --[[ Name: closeDialog ]]
            -- upvalues: v65 (copy), v22 (ref), v25 (ref), v27 (ref), v26 (ref)
            v65(v22());
            v25(v27.Analytics.ReportType, v27.Analytics.ReportFlowAbandoned, {
                source = v27.Analytics.ReportType
            });
            v26.endAbuseReportSession();
        end
    };
end)(v45);