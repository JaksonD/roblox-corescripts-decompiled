local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled");
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_UIBlox_0 = v5.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v13 = require(l_CoreGui_0.RobloxGui.Modules.DevConsoleMaster);
local l_Parent_0 = script.Parent.Parent.Parent;
local v15 = require(l_Parent_0.Components.Divider);
local v16 = require(l_Parent_0.Utility.ExternalEventConnection);
local v17 = require(script.Parent.Parent.Page);
local v18 = require(script.Parent.CategoryHeader);
local v19 = require(script.Parent.ToggleEntry);
local v20 = require(script.Parent.VersionReporter);
local v21 = require(l_Parent_0.Thunks.CloseMenu);
local v22 = require(script.Parent.Parent.Connection.FocusHandler);
local v23 = require(l_Parent_0.Localization.withLocalization);
local v24 = require(l_Parent_0.Utility.SendAnalytics);
local v25 = require(l_Parent_0.Resources.Constants);
local l_Flags_0 = l_Parent_0.Flags;
local v27 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v28 = l_Roact_0.PureComponent:extend("AdvancedPage");
v28.validateProps = l_t_0.strictInterface({
    canCaptureFocus = l_t_0.boolean, 
    closeMenu = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    currentPage = v27() and l_t_0.string or nil, 
    currentZone = v27() and l_t_0.optional(l_t_0.number) or nil
});
v28.init = function(v29) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_Roact_0 (copy)
    v29:setState({
        microProfilerEnabled = l_UserGameSettings_0.OnScreenProfilerEnabled, 
        performanceStatsEnabled = l_UserGameSettings_0.PerformanceStatsVisible
    });
    v29.backButtonRef = l_Roact_0.createRef();
    v29.performanceToggleRef = l_Roact_0.createRef();
end;
if not v27() then
    v28.didUpdate = function(v30, v31) --[[ Line: 64 ]] --[[ Name: didUpdate ]]
        -- upvalues: l_GuiService_0 (copy)
        if v30.props.canCaptureFocus and not v31.canCaptureFocus then
            l_GuiService_0.SelectedCoreObject = v30.performanceToggleRef:getValue();
        end;
    end;
end;
v28.renderWithSelectionCursor = function(v32, v33) --[[ Line: 71 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v17 (copy), v27 (copy), v22 (copy), v25 (copy), l_GuiService_0 (copy), v18 (copy), v19 (copy), l_UserGameSettings_0 (copy), v24 (copy), v23 (copy), l_CursorKind_0 (copy), v13 (copy), v15 (copy), v20 (copy), v16 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy)
    return l_withStyle_0(function(v34) --[[ Line: 72 ]]
        -- upvalues: l_Roact_0 (ref), v17 (ref), v32 (copy), v27 (ref), v22 (ref), v25 (ref), l_GuiService_0 (ref), v18 (ref), v19 (ref), l_UserGameSettings_0 (ref), v24 (ref), v23 (ref), v33 (copy), l_CursorKind_0 (ref), v13 (ref), v15 (ref), v20 (ref), v16 (ref), l_l_UserGameSettings_0_PropertyChangedSignal_0 (ref)
        local v35 = false;
        local l_createElement_0 = l_Roact_0.createElement;
        local l_v17_0 = v17;
        local v38 = {
            pageTitle = v32.props.pageTitle, 
            zIndex = 2, 
            position = v32.props.position, 
            buttonRef = v32.backButtonRef, 
            NextSelectionDown = v32.performanceToggleRef
        };
        local v39 = {};
        local v40;
        if v27() then
            v40 = l_Roact_0.createElement;
            local l_v22_0 = v22;
            local v42 = {
                isFocused = v32.props.canCaptureFocus
            };
            local v43 = true;
            if v32.props.currentPage == v25.advancedSettingsPageKey then
                v43 = v32.props.currentZone == 0;
            end;
            v42.shouldForgetPreviousSelection = v43;
            v42.didFocus = function(v44) --[[ Line: 85 ]] --[[ Name: didFocus ]]
                -- upvalues: l_GuiService_0 (ref), v32 (ref)
                l_GuiService_0.SelectedCoreObject = v44 or v32.performanceToggleRef:getValue();
            end;
            v40 = v40(l_v22_0, v42);
            v35 = v40;
        end;
        if not v35 then
            v40 = nil;
        end;
        v35 = false;
        v39.FocusHandler = v40;
        v39.Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        });
        v39.AdvancedHeader = l_Roact_0.createElement(v18, {
            LayoutOrder = 1, 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.AdvancedSettingsTitle"
        });
        v39.PerformanceStats = l_Roact_0.createElement(v19, {
            LayoutOrder = 2, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats", 
            checked = v32.state.performanceStatsEnabled, 
            onToggled = function() --[[ Line: 103 ]] --[[ Name: onToggled ]]
                -- upvalues: l_UserGameSettings_0 (ref), v24 (ref), v25 (ref)
                l_UserGameSettings_0.PerformanceStatsVisible = not l_UserGameSettings_0.PerformanceStatsVisible;
                v24(v25.AnalyticsSettingsChangeName, nil, {}, true);
            end, 
            buttonRef = v32.performanceToggleRef, 
            NextSelectionUp = v32.backButtonRef
        });
        v39.MicroProfiler = l_Roact_0.createElement(v19, {
            LayoutOrder = 3, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ShowMicroProfiler", 
            checked = v32.state.microProfilerEnabled, 
            onToggled = function() --[[ Line: 114 ]] --[[ Name: onToggled ]]
                -- upvalues: l_UserGameSettings_0 (ref), v24 (ref), v25 (ref)
                l_UserGameSettings_0.OnScreenProfilerEnabled = not l_UserGameSettings_0.OnScreenProfilerEnabled;
                v24(v25.AnalyticsSettingsChangeName, nil, {}, true);
            end
        });
        v39.DeveloperConsole = v23({
            text = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole"
        })(function(v45) --[[ Line: 121 ]]
            -- upvalues: l_Roact_0 (ref), v34 (copy), v33 (ref), l_CursorKind_0 (ref), v13 (ref), v32 (ref)
            return l_Roact_0.createElement("TextButton", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 54), 
                Text = v45.text, 
                TextColor3 = v34.Theme.TextEmphasis.Color, 
                Font = v34.Font.Header2.Font, 
                TextSize = v34.Font.Header2.RelativeSize * v34.Font.BaseSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 4, 
                SelectionImageObject = v33(l_CursorKind_0.Square), 
                [l_Roact_0.Event.Activated] = function() --[[ Line: 132 ]]
                    -- upvalues: v13 (ref), v32 (ref)
                    v13:SetVisibility(true);
                    v32.props.closeMenu();
                end
            }, {
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24)
                })
            });
        end);
        v39.Divider = l_Roact_0.createElement(v15, {
            Size = UDim2.new(1, -24, 0, 1), 
            LayoutOrder = 5
        });
        v39.VersionReporter = l_Roact_0.createElement(v20, {
            LayoutOrder = 6
        });
        v39.MicroProfilerVisibilityListener = l_Roact_0.createElement(v16, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 152 ]] --[[ Name: callback ]]
                -- upvalues: v32 (ref), l_UserGameSettings_0 (ref)
                v32:setState({
                    microProfilerEnabled = l_UserGameSettings_0.OnScreenProfilerEnabled
                });
            end
        });
        v39.PerformanceStatsVisibilityListener = l_Roact_0.createElement(v16, {
            event = l_UserGameSettings_0.PerformanceStatsVisibleChanged, 
            callback = function() --[[ Line: 160 ]] --[[ Name: callback ]]
                -- upvalues: v32 (ref), l_UserGameSettings_0 (ref)
                v32:setState({
                    performanceStatsEnabled = l_UserGameSettings_0.PerformanceStatsVisible
                });
            end
        });
        return l_createElement_0(l_v17_0, v38, v39);
    end);
end;
v28.render = function(v46) --[[ Line: 170 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v47) --[[ Line: 171 ]]
        -- upvalues: v46 (copy)
        return v46:renderWithSelectionCursor(v47);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v48) --[[ Line: 176 ]]
    -- upvalues: v25 (copy), v27 (copy)
    local v49 = false;
    if v48.menuPage == "AdvancedGameSettings" then
        v49 = false;
        if v48.displayOptions.inputType == v25.InputType.Gamepad then
            v49 = not v48.respawn.dialogOpen and v48.currentZone == 1;
        end;
    end;
    local v50 = nil;
    if v27() then
        v50 = v48.currentZone;
    end;
    return {
        canCaptureFocus = v49, 
        currentPage = v27() and v48.menuPage or nil, 
        currentZone = v50
    };
end, function(v51) --[[ Line: 192 ]]
    -- upvalues: v21 (copy)
    return {
        closeMenu = function() --[[ Line: 194 ]] --[[ Name: closeMenu ]]
            -- upvalues: v51 (copy), v21 (ref)
            v51(v21);
        end
    };
end)(v28);