local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v7 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v8 = require(l_RobloxGui_0.Modules.Settings.leaveGame);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.ReactRoblox);
local v12 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v12.useFocusGuiObject;
local v14 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_Input_0 = v14.Input;
local l_useLastInput_0 = v14.useLastInput;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v20 = require(l_CorePackages_0.Packages.Foundation);
local v21 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v22 = if v21 then require(l_RobloxGui_0.Modules.Chrome.Service) else nil;
local v23 = if v21 then require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants) else nil;
local v24 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v25 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v27 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v27.FFlagEnableConsoleExpControls;
local l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 = v27.FFlagChromeShortcutRemoveRespawnOnLeavePage;
local v30 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons);
local v31 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons);
local v32 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsFixConfirmationScrolling);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v34 = v12.FocusNavigationService.new(v12.EngineInterface.CoreGui);
local v35 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_FoundationProvider_0 = v20.FoundationProvider;
local l_Button_0 = v20.Button;
local l_ButtonVariant_0 = v20.Enums.ButtonVariant;
local l_InputSize_0 = v20.Enums.InputSize;
local l_Text_0 = v20.Text;
local l_View_0 = v20.View;
local v42 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function v50(v43) --[[ Line: 81 ]] --[[ Name: LeaveButtonsContainer ]]
    -- upvalues: v10 (copy), l_useLastInput_0 (copy), l_useFocusGuiObject_0 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_Input_0 (copy), v8 (copy), v7 (copy), l_View_0 (copy), v25 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), v31 (copy), l_ButtonVariant_0 (copy)
    local v44 = v10.useRef(nil);
    local v45 = l_useLastInput_0();
    local v46 = l_useFocusGuiObject_0();
    local v47 = l_useLocalization_0({
        ConfirmLeaveGame = l_Constants_0.ConfirmLeaveGameLocalizedKey, 
        LeaveGame = l_Constants_0.LeaveGameLocalizedKey, 
        DontLeaveGame = l_Constants_0.DontLeaveGameLocalizedKey
    });
    v10.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v45 (copy), l_Input_0 (ref), v46 (copy), v44 (copy)
        if v45 ~= l_Input_0.Touch then
            v46(v44.current);
            return;
        else
            v46(nil);
            return;
        end;
    end, {
        v45, 
        v46
    });
    local v48 = v10.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v8 (ref)
        v8(true);
    end, {
        v8
    });
    local v49 = v10.useCallback(function() --[[ Line: 105 ]]
        -- upvalues: v43 (copy), v7 (ref)
        v43.dontLeaveFromButton(v7:IsUsingGamepad());
    end, {
        v7, 
        v43.dontLeaveFromButton
    });
    return v10.createElement(l_View_0, {
        Position = UDim2.new(0, 0, 0, v25 and 100 or 0), 
        tag = "size-full-0 auto-y col"
    }, {
        LeaveGameText = v10.createElement(l_Text_0, {
            Text = v47.ConfirmLeaveGame, 
            Size = UDim2.new(1, 0, 0, v7:IsSmallTouchScreen() and 100 or 200), 
            LayoutOrder = 1, 
            tag = {
                ["text-wrap"] = true, 
                ["text-heading-medium"] = not v7:IsSmallTouchScreen() and not v25, 
                ["text-heading-small"] = v7:IsSmallTouchScreen(), 
                ["text-heading-large"] = v25
            }
        }), 
        LeaveButtonsContainer = v10.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
        }, {
            LeaveGameButton = v10.createElement(l_Button_0, {
                text = v47.LeaveGame, 
                size = l_InputSize_0.Large, 
                variant = if v31 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.SoftEmphasis, 
                width = UDim.new(0, v25 and 300 or 200), 
                LayoutOrder = 1, 
                ref = v44, 
                onActivated = v48
            }), 
            DontLeaveGameButton = v10.createElement(l_Button_0, {
                text = v47.DontLeaveGame, 
                size = l_InputSize_0.Large, 
                variant = l_ButtonVariant_0.Subtle, 
                width = UDim.new(0, v25 and 300 or 200), 
                LayoutOrder = 2, 
                onActivated = v49
            })
        })
    });
end;
local function v53(v51) --[[ Line: 149 ]] --[[ Name: LeaveGameContainer ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v10 (copy), l_LocalizationProvider_0 (copy), l_FoundationProvider_0 (copy), v20 (copy), v12 (copy), v34 (copy), v50 (copy)
    local v52 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v10.createElement(l_LocalizationProvider_0, {
        localization = v52
    }, {
        FoundationProvider = v10.createElement(l_FoundationProvider_0, {
            theme = v20.Enums.Theme.Dark
        }, {
            FocusNavigationProvider = v10.createElement(v12.FocusNavigationContext.Provider, {
                value = v34
            }, {
                LeaveButtonsContainer = v10.createElement(v50, v51)
            })
        })
    });
end;
v24 = (function() --[[ Line: 167 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), v30 (copy), v11 (copy), v10 (copy), v53 (copy), v32 (copy), v42 (copy), l_Create_0 (copy), v35 (copy), v25 (copy), v7 (copy), v8 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.playsessionid = "";
    if l_game_EngineFeature_0 then
        l_NewPage_0.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_NewPage_0.DontLeaveFunc = function(v55) --[[ Line: 176 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v55, true);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsLeaveGameName, {
            confirmed = l_Constants_0.AnalyticsCancelledName, 
            universeid = tostring(game.GameId), 
            source = l_Constants_0.AnalyticsLeaveGameSource, 
            playsessionid = l_NewPage_0.playsessionid
        });
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v57, v58) --[[ Line: 193 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v57 == Enum.UserInputState.Begin then
            local v59 = true;
            if v58.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v59 = true;
                if v58.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v59 = true;
                    if v58.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v59 = v58.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v59);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v60) --[[ Line: 201 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontLeaveFunc(v60);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGamePage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    if v30 then
        l_NewPage_0.RenderPage = function() --[[ Line: 214 ]]
            -- upvalues: l_NewPage_0 (copy), v11 (ref), v10 (ref), v53 (ref)
            l_NewPage_0.PageRoot = v11.createRoot(l_NewPage_0.Page);
            l_NewPage_0.PageRoot:render(v10.createElement(v53, {
                dontLeaveFromButton = l_NewPage_0.DontLeaveFromButton
            }));
        end;
        l_NewPage_0.UnmountPage = function() --[[ Line: 221 ]]
            -- upvalues: l_NewPage_0 (copy)
            if l_NewPage_0.PageRoot then
                l_NewPage_0.PageRoot:unmount();
            end;
        end;
        if v32 then
            l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
            return l_NewPage_0;
        end;
    else
        local v61 = v42:FormatByKey(l_Constants_0.ConfirmLeaveGameLocalizedKey);
        local v62 = l_Create_0("TextLabel")({
            Name = "LeaveGameText", 
            Text = v61, 
            Font = v35.font(Enum.Font.SourceSansBold, "Confirmation"), 
            FontSize = v35.fontSize(Enum.FontSize.Size36, "Confirmation"), 
            TextColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 200), 
            TextWrapped = true, 
            ZIndex = 2, 
            Parent = l_NewPage_0.Page, 
            Position = v25 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
        });
        local v63 = l_Create_0("Frame")({
            Name = "LeaveButtonContainer", 
            Parent = v62, 
            Size = UDim2.new(1, 0, 0, 400), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0)
        });
        local _ = l_Create_0("UIGridLayout")({
            Name = "LeavetButtonsLayout", 
            CellSize = v25 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
            CellPadding = UDim2.new(0, 20, 0, 20), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Parent = v63
        });
        if v7:IsSmallTouchScreen() then
            v62.FontSize = Enum.FontSize.Size24;
            v62.Size = UDim2.new(1, 0, 0, 100);
        elseif v25 then
            v62.FontSize = Enum.FontSize.Size48;
        end;
        l_NewPage_0.LeaveGameButton = v7:MakeStyledButton("LeaveGame", "Leave", nil, function() --[[ Line: 276 ]]
            -- upvalues: v8 (ref)
            v8(true);
        end);
        l_NewPage_0.LeaveGameButton.NextSelectionRight = nil;
        l_NewPage_0.LeaveGameButton.Parent = v63;
        local v65 = v7:MakeStyledButton("DontLeaveGame", v42:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, l_NewPage_0.DontLeaveFromButton);
        v65.NextSelectionLeft = nil;
        v65.Parent = v63;
        l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v65.AbsolutePosition.Y + v65.AbsoluteSize.Y);
    end;
    return l_NewPage_0;
end)();
v24.Displayed.Event:connect(function() --[[ Line: 301 ]]
    -- upvalues: v30 (copy), v24 (ref), l_GuiService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v21 (copy), l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 (copy), v22 (copy), v23 (copy), l_ContextActionService_0 (copy)
    if v30 then
        v24.RenderPage();
    end;
    if not v30 then
        l_GuiService_0.SelectedCoreObject = v24.LeaveGameButton;
    end;
    if l_FFlagEnableConsoleExpControls_0 then
        if v21 then
            if l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 then
                v22:setShortcutBar(v23.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID);
                return;
            else
                v22:setShortcutBar(v23.TILTMENU_DIALOG_SHORTCUTBAR_ID);
                return;
            end;
        end;
    else
        l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", v24.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
    end;
end);
v24.Hidden.Event:connect(function() --[[ Line: 321 ]]
    -- upvalues: v30 (copy), v24 (ref), l_ContextActionService_0 (copy)
    if v30 then
        v24.UnmountPage();
    end;
    l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
end);
return v24;