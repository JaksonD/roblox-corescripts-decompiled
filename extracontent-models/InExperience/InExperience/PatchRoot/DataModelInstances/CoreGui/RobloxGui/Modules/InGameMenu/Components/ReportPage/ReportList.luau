local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Cryo_0 = v3.Cryo;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Constants);
local v10 = require(l_Parent_0.Components.PlayerLabel);
local v11 = require(l_Parent_0.Components.Divider);
local v12 = require(l_Parent_0.Components.BarOnTopScrollingFrame);
local v13 = require(script.Parent.GameLabel);
local v14 = require(script.Parent.ReportButton);
local v15 = require(script.Parent.Parent.Connection.FocusHandler);
local v16 = require(l_Parent_0.Components.ThemedTextLabel);
local v17 = require(l_Parent_0.Localization.withLocalization);
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local v19 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v20 = l_Roact_0.PureComponent:extend("ReportList");
local v21 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
v20.validateProps = l_t_0.strictInterface({
    placeName = l_t_0.string, 
    players = l_t_0.array(l_t_0.union(l_t_0.instanceIsA("Player"), l_t_0.strictInterface({
        UserId = l_t_0.integer, 
        Name = l_t_0.string
    }))), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    currentPage = v21() and l_t_0.optional(l_t_0.string) or nil, 
    currentZone = v21() and l_t_0.optional(l_t_0.number) or nil
});
local function v24(v22, v23) --[[ Line: 57 ]] --[[ Name: sortPlayers ]]
    return v22.Name:lower() < v23.Name:lower();
end;
v20.init = function(v25) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v25.reportGameRef = l_Roact_0.createRef();
end;
v20.renderListEntries = function(v26) --[[ Line: 65 ]] --[[ Name: renderListEntries ]]
    -- upvalues: l_Cryo_0 (copy), v24 (copy), l_Roact_0 (copy), v21 (copy), v15 (copy), v9 (copy), l_GuiService_0 (copy), v13 (copy), v19 (copy), v14 (copy), v11 (copy), v10 (copy)
    local v27 = l_Cryo_0.List.sort(v26.props.players, v24);
    local v28 = #v27;
    local v29 = 3;
    local v30 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    if v21() then
        local l_createElement_0 = l_Roact_0.createElement;
        local l_v15_0 = v15;
        local v33 = {
            isFocused = v26.props.canCaptureFocus
        };
        local v34 = true;
        if v26.props.currentPage ~= v9.MainPagePageKey then
            v34 = v26.props.currentZone == 0;
        end;
        v33.shouldForgetPreviousSelection = v34;
        v33.didFocus = function(v35) --[[ Line: 83 ]] --[[ Name: didFocus ]]
            -- upvalues: l_GuiService_0 (ref), v26 (copy)
            l_GuiService_0.SelectedCoreObject = v35 or v26.reportGameRef:getValue();
        end;
        v30.FocusHandler = l_createElement_0(l_v15_0, v33);
    end;
    v30.GameReport = l_Roact_0.createElement(v13, {
        gameId = game.GameId, 
        gameName = v26.props.placeName, 
        LayoutOrder = 1, 
        [l_Roact_0.Ref] = v26.reportGameRef, 
        onActivated = function() --[[ Line: 94 ]] --[[ Name: onActivated ]]
            -- upvalues: v19 (ref), v9 (ref)
            v19.openReportDialogForPlace(v9.AnalyticsInGameMenuName);
        end
    }, {
        ReportButton = l_Roact_0.createElement(v14, {
            LayoutOrder = 1
        })
    });
    if #v27 > 0 then
        v30["divider_" .. v29] = l_Roact_0.createElement(v11, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, -80, 0, 1)
        });
    end;
    for v36, v37 in pairs(v27) do
        v30["player_" .. v36] = l_Roact_0.createElement(v10, {
            username = v37.Name, 
            userId = v37.UserId, 
            isOnline = true, 
            isSelected = false, 
            LayoutOrder = v29, 
            onActivated = function() --[[ Line: 118 ]] --[[ Name: onActivated ]]
                -- upvalues: v19 (ref), v37 (copy), v9 (ref)
                v19.openReportDialogForPlayer(v37, v9.AnalyticsInGameMenuName);
            end
        }, {
            ReportButton = l_Roact_0.createElement(v14, {
                userId = v37.UserId, 
                userName = v37.Name, 
                LayoutOrder = 1
            })
        });
        v29 = v29 + 1;
        if v36 < v28 then
            v30["divider_" .. v29] = l_Roact_0.createElement(v11, {
                LayoutOrder = v29, 
                Size = UDim2.new(1, -80, 0, 1)
            });
            v29 = v29 + 1;
        end;
    end;
    return v30;
end;
v20.didUpdate = function(v38, v39, _) --[[ Line: 144 ]] --[[ Name: didUpdate ]]
    -- upvalues: v21 (copy), l_GuiService_0 (copy)
    if not v21() and v38.props.canCaptureFocus and not v39.canCaptureFocus then
        l_GuiService_0.SelectedCoreObject = v38.reportGameRef:getValue();
    end;
end;
v20.render = function(v41) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: l_isShowEUDSAIllegalContentReportingLink_0 (copy), v17 (copy), l_Roact_0 (copy), v12 (copy), v16 (copy)
    local v42 = #v41.props.players * 71 + 70;
    if l_isShowEUDSAIllegalContentReportingLink_0() then
        return v17({
            DSAFooterText = "CoreScripts.InGameMenu.Report.DSAFooter"
        })(function(v43) --[[ Line: 159 ]]
            -- upvalues: l_Roact_0 (ref), v12 (ref), v42 (copy), v41 (copy), v16 (ref)
            return l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, -50), 
                BackgroundTransparency = 1
            }, {
                ScrollingFrame = l_Roact_0.createElement(v12, {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, -50), 
                    CanvasSize = UDim2.new(1, 0, 0, v42)
                }, v41:renderListEntries()), 
                EUWarning = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 50), 
                    Position = UDim2.new(0, 0, 1, -50), 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 30), 
                        PaddingRight = UDim.new(0, 30), 
                        PaddingTop = UDim.new(0, 20)
                    }), 
                    TextLabel = l_Roact_0.createElement(v16, {
                        fontKey = "Footer", 
                        themeKey = "TextEmphasis", 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextWrapped = true, 
                        Text = v43.DSAFooterText, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                })
            });
        end);
    else
        return l_Roact_0.createElement(v12, {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, v42)
        }, v41:renderListEntries());
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v44, _) --[[ Line: 204 ]]
    -- upvalues: v9 (copy), v21 (copy)
    local l_name_0 = v44.gameInfo.name;
    local v47 = false;
    if v44.menuPage == "Report" then
        v47 = false;
        if v44.displayOptions.inputType == v9.InputType.Gamepad then
            v47 = not (v44.report.dialogOpen or v44.report.reportSentOpen or v44.respawn.dialogOpen) and v44.currentZone == 1;
        end;
    end;
    return {
        placeName = l_name_0, 
        canCaptureFocus = v47, 
        currentPage = if not v21() then nil else v44.menuPage, 
        currentZone = if not v21() then nil else v44.currentZone
    };
end)(v20);