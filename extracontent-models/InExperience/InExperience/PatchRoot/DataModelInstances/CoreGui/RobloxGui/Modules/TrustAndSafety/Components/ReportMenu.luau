local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Dependencies);
local v9 = require(v8.BarOnTopScrollingFrame);
local v10 = require(v8.Divider);
local v11 = require(v8.PlayerCell);
local v12 = require(v8.PlayerSearchPredicate);
local v13 = require(v8.SearchBar);
local _ = require(v8.ThemedTextLabel);
local v15 = require(v8.withLocalization);
local v16 = require(l_Parent_0.Actions.NavigateBack);
local v17 = require(l_Parent_0.Actions.EndReportFlow);
local v18 = require(l_Parent_0.Actions.SelectReportListing);
local _ = require(l_Parent_0.Resources.Assets);
local v20 = require(l_Parent_0.Resources.Constants);
local v21 = require(l_Parent_0.Components.ModalDialog);
local v22 = require(l_Parent_0.Components.GameCell);
local v23 = require(l_Parent_0.Utility.SendAnalytics);
local v24 = require(l_Parent_0.Utility.SessionUtility);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v27 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v28 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v29 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v30 = require(l_CorePackages_0.Packages.React);
local l_Colors_0 = v5.App.Style.Colors;
local l_HeaderBar_0 = v5.App.Bar.HeaderBar;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_Provider_0 = v5.Core.Style.Provider;
local l_Images_0 = v5.App.ImageSet.Images;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_isPlayerVerified_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.isPlayerVerified;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local v40 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }
};
local v41 = v3.PureComponent:extend("ReportMenu");
local function v43(v42) --[[ Line: 63 ]]
    -- upvalues: v30 (copy), v28 (copy), v27 (copy), v2 (copy)
    if not v30.useContext(v28.Context).voiceEnabled then
        return nil;
    else
        return v30.createElement(v27, v2.Dictionary.join(v42, {}));
    end;
end;
v41.validateProps = v6.strictInterface({
    isReportMenuOpen = v6.boolean, 
    screenSize = v6.Vector2, 
    closeDialog = v6.callback, 
    openReportDialog = v6.callback, 
    canNavigateBack = v6.boolean, 
    reportCategory = v6.optional(v6.string), 
    navigateBack = v6.optional(v6.callback)
});
v41.init = function(v44) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_default_0 (copy)
    v44.scrollingFrameRef = v3.createRef();
    v44.state = {
        isFilterMode = false, 
        filterText = nil
    };
    v44.onSearch = function() --[[ Line: 89 ]]
        -- upvalues: v44 (copy)
        v44:setState({
            isFilterMode = true, 
            filterText = ""
        });
    end;
    v44.onTextChanged = function(v45) --[[ Line: 96 ]]
        -- upvalues: v44 (copy)
        v44:setState({
            filterText = v45
        });
    end;
    v44.onCancel = function() --[[ Line: 102 ]]
        -- upvalues: v44 (copy), v3 (ref)
        v44:setState({
            isFilterMode = false, 
            filterText = v3.None
        });
    end;
    v44.scrollToTop = function() --[[ Line: 109 ]]
        -- upvalues: v44 (copy)
        local v46 = v44.scrollingFrameRef:getValue();
        if v46 then
            v46:scrollToTop();
        end;
    end;
    v44.navigateBack = function() --[[ Line: 116 ]]
        -- upvalues: v44 (copy)
        v44.props.navigateBack(v44.state.filterText ~= nil);
    end;
    v44.closeDialog = function() --[[ Line: 120 ]]
        -- upvalues: v44 (copy)
        v44.props.closeDialog(v44.state.filterText ~= nil);
    end;
    v44.layoutBindings = {};
    v44.getLayoutBinding = function(v47, v48) --[[ Line: 125 ]]
        -- upvalues: v44 (copy), v3 (ref)
        local v49 = v44.layoutBindings[v47];
        if not v49 then
            local v50, v51 = v3.createBinding(v48);
            v49 = {
                valueBinding = v50, 
                setValue = v51, 
                value = v48
            };
            v44.layoutBindings[v47] = v49;
        end;
        if v49.value ~= v48 then
            v49.value = v48;
            v49.setValue(v48);
        end;
        return v49.valueBinding;
    end;
    v44.playerIsVoiceActive = function(v52) --[[ Line: 145 ]]
        -- upvalues: l_default_0 (ref)
        return l_default_0.participants[tostring(v52)] ~= nil;
    end;
    v44.sortedUserIds = {};
end;
local function v55(v53, v54) --[[ Line: 152 ]] --[[ Name: sortPlayers ]]
    return v53.DisplayName:lower() < v54.DisplayName:lower();
end;
v41.getPlayerList = function(v56) --[[ Line: 156 ]] --[[ Name: getPlayerList ]]
    -- upvalues: v2 (copy), l_Players_0 (copy), v55 (copy), v12 (copy)
    local v57 = {};
    local v58 = v2.List.sort(l_Players_0:GetPlayers(), v55);
    for _, v60 in ipairs(v58) do
        if v60 ~= l_Players_0.LocalPlayer then
            if not v56.state.isFilterMode then
                table.insert(v57, v60);
            elseif v12(v56.state.filterText, v60.Name, v60.DisplayName) then
                table.insert(v57, v60);
            end;
        end;
    end;
    return (v2.List.sort(v57, function(v61, v62) --[[ Line: 172 ]]
        return v61.DisplayName:lower() < v62.DisplayName:lower();
    end));
end;
local v63 = {
    [v20.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat", 
    [v20.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat", 
    [v20.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other"
};
v41.categoryTitle = function(v64) --[[ Line: 184 ]] --[[ Name: categoryTitle ]]
    -- upvalues: v63 (copy)
    return v63[v64.props.reportCategory] or "CoreScripts.InGameMenu.Report.MenuTitle";
end;
v41.renderHeaderBar = function(v65) --[[ Line: 188 ]] --[[ Name: renderHeaderBar ]]
    -- upvalues: l_makeBackButton_0 (copy), v3 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v15 (copy), l_HeaderBar_0 (copy), v13 (copy)
    local v66 = nil;
    v66 = if v65.props.canNavigateBack then l_makeBackButton_0(v65.navigateBack) else function() --[[ Line: 193 ]]
        -- upvalues: v3 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v65 (copy)
        return v3.createElement(l_IconButton_0, {
            iconSize = l_IconSize_0.Medium, 
            icon = l_Images_0["icons/navigation/close"], 
            onActivated = v65.closeDialog
        });
    end;
    if not v65.state.isFilterMode then
        return v15({
            titleText = v65:categoryTitle()
        })(function(v67) --[[ Line: 205 ]]
            -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v66 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v65 (copy)
            return v3.createElement(l_HeaderBar_0, {
                backgroundTransparency = 1, 
                barHeight = 48, 
                renderLeft = v66, 
                renderRight = function() --[[ Line: 210 ]] --[[ Name: renderRight ]]
                    -- upvalues: v3 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v65 (ref)
                    return v3.createElement(l_IconButton_0, {
                        iconSize = l_IconSize_0.Medium, 
                        icon = l_Images_0["icons/common/search"], 
                        onActivated = v65.onSearch
                    });
                end, 
                onHeaderActivated = v65.scrollToTop, 
                title = v67.titleText
            });
        end);
    else
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(24, 6), 
            Size = UDim2.new(1, -48, 1, -12)
        }, {
            v3.createElement(v13, {
                size = UDim2.fromScale(1, 1), 
                text = v65.state.filterText, 
                autoCaptureFocus = true, 
                onTextChanged = v65.onTextChanged, 
                onCancelled = v65.onCancel
            })
        });
    end;
end;
v41.renderContents = function(v68) --[[ Line: 238 ]] --[[ Name: renderContents ]]
    -- upvalues: v20 (copy), v3 (copy), v22 (copy), l_default_0 (copy), v10 (copy), v11 (copy), l_isPlayerVerified_0 (copy), v43 (copy), v29 (copy), l_withStyle_0 (copy), v2 (copy), v40 (copy), l_Provider_0 (copy), v9 (copy)
    local l_props_0 = v68.props;
    local v70 = v68.props.reportCategory == v20.Category.Voice;
    local v71 = 0;
    local v72 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    if not v68.state.isFilterMode and v68.props.reportCategory == v20.Category.None then
        v72.GameCell = v3.createElement(v22, {
            gameId = game.GameId, 
            layoutOrder = v68.getLayoutBinding("GameCell", v71), 
            onActivated = function() --[[ Line: 255 ]] --[[ Name: onActivated ]]
                -- upvalues: l_props_0 (copy), v20 (ref)
                l_props_0.openReportDialog(v20.ReportType.Place, nil);
            end
        });
    end;
    v71 = v71 + 1;
    local v73 = 72;
    local v74 = v68:getPlayerList();
    local v75 = {};
    if v70 then
        v75 = l_default_0:getRecentUsersInteractionData();
    end;
    v68.sortedUserIds = {};
    for _, v77 in pairs(v74) do
        local v78 = tostring(v77.UserId);
        if not v70 or v75[tostring(v77.UserId)] then
            table.insert(v68.sortedUserIds, v77.UserId);
            local v79 = 0;
            if v70 then
                v79 = v79 + 1;
            end;
            if v68.props.isReportMenuOpen then
                v79 = v79 + 2;
            end;
            v72["Divider" .. v78] = v3.createElement(v10, {
                LayoutOrder = v68.getLayoutBinding("Divider" .. v78, v71), 
                Size = UDim2.new(1, 0, 0, 1)
            });
            v71 = v71 + 1;
            v72["PlayerCell" .. v78] = v3.createElement(v11, {
                userId = v77.UserId, 
                username = v77.Name, 
                displayName = v77.DisplayName, 
                hasVerifiedBadge = l_isPlayerVerified_0(v77), 
                isOnline = true, 
                isSelected = false, 
                LayoutOrder = v68.getLayoutBinding("PlayerCell" .. v78, v71), 
                onActivated = function() --[[ Line: 300 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_props_0 (copy), v20 (ref), v77 (copy)
                    l_props_0.openReportDialog(v20.ReportType.Player, v77);
                end, 
                memoKey = v79
            }, {
                VoiceIndicator = v70 and v68.props.isReportMenuOpen and v3.createElement(v43, {
                    userId = tostring(v77.UserId), 
                    hideOnError = true, 
                    iconStyle = "SpeakerLight", 
                    size = UDim2.fromOffset(36, 36), 
                    onClicked = function() --[[ Line: 312 ]] --[[ Name: onClicked ]]
                        -- upvalues: l_default_0 (ref), v77 (copy), v29 (ref)
                        l_default_0:ToggleMutePlayer(v77.UserId, v29.VOICE_CONTEXT_TYPE.REPORT_MENU);
                    end
                }) or nil
            });
            v71 = v71 + 1;
            v73 = v73 + 73;
        end;
    end;
    v72.DividerEnd = v3.createElement(v10, {
        LayoutOrder = v68.getLayoutBinding("DividerEnd", v71), 
        Size = UDim2.new(1, 0, 0, 1)
    });
    v71 = v71 + 1;
    return l_withStyle_0(function(v80) --[[ Line: 332 ]]
        -- upvalues: v2 (ref), v40 (ref), v3 (ref), l_Provider_0 (ref), v9 (ref), v73 (ref), v68 (copy), v72 (copy)
        local v81 = v2.Dictionary.join(v80.Theme, v40);
        local v82 = v2.Dictionary.join(v80, {
            Theme = v81
        });
        return v3.createElement(l_Provider_0, {
            style = v82
        }, {
            v3.createElement(v9, {
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.new(1, 0, 0, v73), 
                scrollingFrameRef = v68.scrollingFrameRef
            }, v72)
        });
    end);
end;
v41.render = function(v83) --[[ Line: 349 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v21 (copy)
    local v84 = v83.props.reportCategory ~= nil;
    return v3.createFragment({
        ModalDialog = v3.createElement(v21, {
            visible = v83.props.isReportMenuOpen, 
            screenSize = v83.props.screenSize, 
            headerBar = v83:renderHeaderBar(), 
            showCloseButton = not v84, 
            contents = v83:renderContents(), 
            onDismiss = v83.closeDialog
        })
    });
end;
v41.didUpdate = function(v85, v86) --[[ Line: 365 ]] --[[ Name: didUpdate ]]
    -- upvalues: v3 (copy)
    if v86.isReportMenuOpen and not v85.props.isReportMenuOpen then
        v85:setState({
            isFilterMode = false, 
            filterText = v3.None
        });
        local v87 = v85.scrollingFrameRef:getValue();
        if v87 and v87.CanvasPosition.Y > 0 then
            v87.CanvasPosition = Vector2.new(0, 0);
        end;
    end;
end;
return v4.UNSTABLE_connect2(function(v88, _) --[[ Line: 379 ]]
    -- upvalues: v20 (copy)
    return {
        isReportMenuOpen = v88.report.currentPage == v20.Page.Listing, 
        screenSize = v88.displayOptions.screenSize, 
        reportCategory = v88.report.reportCategory, 
        canNavigateBack = #v88.report.history > 1
    };
end, function(v90) --[[ Line: 387 ]]
    -- upvalues: v16 (copy), v23 (copy), v20 (copy), v17 (copy), v24 (copy), v18 (copy)
    return {
        navigateBack = function(v91) --[[ Line: 389 ]] --[[ Name: navigateBack ]]
            -- upvalues: v90 (copy), v16 (ref), v23 (ref), v20 (ref)
            v90(v16());
            v23(v20.Page.Listing, v20.Analytics.ReportFlowBack, {
                source = v20.Page.Listing, 
                filterTextChanged = v91
            });
        end, 
        closeDialog = function(v92) --[[ Line: 396 ]] --[[ Name: closeDialog ]]
            -- upvalues: v90 (copy), v17 (ref), v23 (ref), v20 (ref), v24 (ref)
            v90(v17());
            v23(v20.Page.Listing, v20.Analytics.ReportFlowAbandoned, {
                source = v20.Page.Listing, 
                filterTextChanged = v92
            });
            v24.endAbuseReportSession();
        end, 
        openReportDialog = function(v93, v94, v95) --[[ Line: 404 ]] --[[ Name: openReportDialog ]]
            -- upvalues: v90 (copy), v18 (ref), v23 (ref), v20 (ref)
            v90(v18(v93, v94, v95));
            v23(v20.Page.Listing, v20.Analytics.ReportFlowAdvance, {
                source = v20.Page.Listing, 
                reportType = v93
            });
        end
    };
end)(v41);