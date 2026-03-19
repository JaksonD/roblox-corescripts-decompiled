local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v10 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v12 = require(l_CorePackages_0.Packages.Cryo);
local v13 = require(l_CorePackages_0.Packages.React);
local v14 = require(l_CorePackages_0.Packages.ReactRoblox);
local v15 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v15.useFocusGuiObject;
local v17 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_Input_0 = v17.Input;
local l_useLastInput_0 = v17.useLastInput;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v23 = require(l_CorePackages_0.Packages.Foundation);
local v24 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v25 = if v24 then require(l_RobloxGui_0.Modules.Chrome.Service) else nil;
local v26 = if v24 then require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants) else nil;
local v27 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v28 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v29 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v29.FFlagEnableConsoleExpControls;
local l_FFlagChromeShortcutRemoveLeaveOnRespawnPage_0 = v29.FFlagChromeShortcutRemoveLeaveOnRespawnPage;
local v32 = require(l_RobloxGui_0.Modules.Chrome.Flags.FFlagRespawnActionChromeShortcutTelemetry);
local v33 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons);
local v34 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons);
local v35 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsFixConfirmationScrolling);
local l_FFlagRenameRespawnConfirmationPage_0 = v29.FFlagRenameRespawnConfirmationPage;
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarEditorServiceBustCacheEnabled");
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v39 = v15.FocusNavigationService.new(v15.EngineInterface.CoreGui);
local l_FoundationProvider_0 = v23.FoundationProvider;
local l_Button_0 = v23.Button;
local l_ButtonVariant_0 = v23.Enums.ButtonVariant;
local l_InputSize_0 = v23.Enums.InputSize;
local l_Text_0 = v23.Text;
local l_View_0 = v23.View;
local function v52(v46) --[[ Line: 86 ]] --[[ Name: ResetCharacterButtonsContainer ]]
    -- upvalues: v13 (copy), l_useLastInput_0 (copy), l_useFocusGuiObject_0 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_FFlagRenameRespawnConfirmationPage_0 (copy), l_Input_0 (copy), v9 (copy), l_View_0 (copy), v28 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), v34 (copy), l_ButtonVariant_0 (copy)
    local v47 = v13.useRef(nil);
    local v48 = l_useLastInput_0();
    local v49 = l_useFocusGuiObject_0();
    local v50 = l_useLocalization_0({
        ConfirmResetCharacter = l_Constants_0.ConfirmResetCharacterLocalizedKey, 
        ResetCharacter = if l_FFlagRenameRespawnConfirmationPage_0 then l_Constants_0.RespawnLocalizedKey else l_Constants_0.ResetCharacterLocalizedKey, 
        DontResetCharacter = l_Constants_0.DontResetCharacterLocalizedKey
    });
    v13.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v48 (copy), l_Input_0 (ref), v49 (copy), v47 (copy)
        if v48 ~= l_Input_0.Touch then
            v49(v47.current);
            return;
        else
            v49(nil);
            return;
        end;
    end, {
        v48, 
        v49
    });
    local v51 = v13.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: v46 (copy), v9 (ref)
        v46.dontResetCharFromButton(v9:IsUsingGamepad());
    end, {
        v9, 
        v46.dontResetCharFromButton
    });
    return v13.createElement(l_View_0, {
        Position = UDim2.new(0, 0, 0, v28 and 100 or 0), 
        tag = "size-full-0 auto-y col"
    }, {
        ResetCharacterText = v13.createElement(l_Text_0, {
            Text = v50.ConfirmResetCharacter, 
            Size = UDim2.new(1, 0, 0, v9:IsSmallTouchScreen() and 100 or 200), 
            LayoutOrder = 1, 
            tag = {
                ["text-wrap"] = true, 
                ["text-heading-medium"] = not v9:IsSmallTouchScreen() and not v28, 
                ["text-heading-small"] = v9:IsSmallTouchScreen(), 
                ["text-heading-large"] = v28
            }
        }), 
        ButtonsContainer = v13.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
        }, {
            ResetCharacterButton = v13.createElement(l_Button_0, {
                text = v50.ResetCharacter, 
                size = l_InputSize_0.Large, 
                variant = if v34 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.SoftEmphasis, 
                width = UDim.new(0, v28 and 300 or 200), 
                LayoutOrder = 1, 
                ref = v47, 
                onActivated = v46.onResetFunction
            }), 
            DontResetCharacterButton = v13.createElement(l_Button_0, {
                text = v50.DontResetCharacter, 
                size = l_InputSize_0.Large, 
                variant = l_ButtonVariant_0.Subtle, 
                width = UDim.new(0, v28 and 300 or 200), 
                LayoutOrder = 2, 
                onActivated = v51
            })
        })
    });
end;
local function v55(v53) --[[ Line: 150 ]] --[[ Name: ResetCharacterContainer ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v13 (copy), l_LocalizationProvider_0 (copy), l_FoundationProvider_0 (copy), v23 (copy), v15 (copy), v39 (copy), v52 (copy)
    local v54 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v13.createElement(l_LocalizationProvider_0, {
        localization = v54
    }, {
        FoundationProvider = v13.createElement(l_FoundationProvider_0, {
            theme = v23.Enums.Theme.Dark
        }, {
            FocusNavigationProvider = v13.createElement(v15.FocusNavigationContext.Provider, {
                value = v39
            }, {
                ResetCharacterButtonsContainer = v13.createElement(v52, v53)
            })
        })
    });
end;
v27 = (function() --[[ Line: 168 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_RbxAnalyticsService_0 (copy), l_Constants_0 (copy), v33 (copy), l_Create_0 (copy), l_FFlagRenameRespawnConfirmationPage_0 (copy), v10 (copy), v28 (copy), v9 (copy), l_Players_0 (copy), v32 (copy), v12 (copy), l_game_EngineFeature_0 (copy), l_AvatarEditorService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v14 (copy), v13 (copy), v55 (copy), v35 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.DontResetCharFunc = function(v57) --[[ Line: 172 ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (copy)
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsRespawnCharacterName, {
            confirmed = l_Constants_0.AnalyticsCancelledName, 
            universeid = tostring(game.GameId)
        });
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v57, true);
        end;
    end;
    l_NewPage_0.DontResetCharFromHotkey = function(_, v59, v60) --[[ Line: 180 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v59 == Enum.UserInputState.Begin then
            local v61 = true;
            if v60.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v61 = true;
                if v60.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v61 = true;
                    if v60.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v61 = v60.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontResetCharFunc(v61);
        end;
    end;
    l_NewPage_0.DontResetCharFromButton = function(v62) --[[ Line: 188 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontResetCharFunc(v62);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "ResetCharacter";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v63 = nil;
    if not v33 then
        local v64 = l_Create_0("TextLabel")({
            Name = "ResetCharacterText", 
            Text = l_FFlagRenameRespawnConfirmationPage_0 and "Are you sure you want to respawn your character?" or "Are you sure you want to reset your character?", 
            Font = v10.font(Enum.Font.SourceSansBold, "Confirmation"), 
            FontSize = v10.fontSize(Enum.FontSize.Size36, "Confirmation"), 
            TextColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 200), 
            TextWrapped = true, 
            ZIndex = 2, 
            Parent = l_NewPage_0.Page, 
            Position = v28 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
        });
        v63 = l_Create_0("Frame")({
            Name = "ResetButtonContainer", 
            Parent = v64, 
            Size = UDim2.new(1, 0, 0, 400), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0)
        });
        local _ = l_Create_0("UIGridLayout")({
            Name = "ResetButtonsLayout", 
            CellSize = v28 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
            CellPadding = UDim2.new(0, 20, 0, 20), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Parent = v63
        });
        if v9:IsSmallTouchScreen() then
            v64.FontSize = Enum.FontSize.Size24;
            v64.Size = UDim2.new(1, 0, 0, 100);
        elseif v28 then
            v64.FontSize = Enum.FontSize.Size48;
        end;
    end;
    local function v71(v66) --[[ Line: 247 ]]
        -- upvalues: l_Players_0 (ref), l_Constants_0 (ref), v32 (ref), v12 (ref), l_RbxAnalyticsService_0 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 then
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if l_Humanoid_0 then
                    l_Humanoid_0.Health = 0;
                end;
            end;
        end;
        local v70 = {
            confirmed = l_Constants_0.AnalyticsConfirmedName, 
            universeid = tostring(game.GameId)
        };
        if v32 and v66 and type(v66) == "table" and v66.resetTelemetryFields then
            v70 = v12.Dictionary.join(v70, v66.resetTelemetryFields);
        end;
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsRespawnCharacterName, v70);
        l_RbxAnalyticsService_0:ReportCounter("InGameMenu-ResetCharacter");
    end;
    l_NewPage_0.ResetBindable = true;
    local function v73(v72) --[[ Line: 270 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), l_AvatarEditorService_0 (ref), l_NewPage_0 (copy), v71 (copy)
        if l_game_EngineFeature_0 then
            l_AvatarEditorService_0:BustAvatarFetchCache();
        end;
        if l_NewPage_0.ResetBindable == true then
            v71(v72);
        elseif l_NewPage_0.ResetBindable then
            l_NewPage_0.ResetBindable:Fire();
        end;
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:SetVisibility(false, true);
        end;
    end;
    if l_FFlagEnableConsoleExpControls_0 then
        l_NewPage_0.ResetFunction = v73;
    end;
    if not v33 then
        l_NewPage_0.ResetCharacterButton = v9:MakeStyledButton("ResetCharacter", l_FFlagRenameRespawnConfirmationPage_0 and "Respawn" or "Reset", nil, v73);
        l_NewPage_0.ResetCharacterButton.NextSelectionRight = nil;
        l_NewPage_0.ResetCharacterButton.Parent = v63;
        local v74 = v9:MakeStyledButton("DontResetCharacter", l_FFlagRenameRespawnConfirmationPage_0 and "Don't Respawn" or "Don't Reset", nil, l_NewPage_0.DontResetCharFromButton);
        v74.NextSelectionLeft = nil;
        v74.Parent = v63;
        l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v74.AbsolutePosition.Y + v74.AbsoluteSize.Y);
    end;
    if v33 then
        l_NewPage_0.RenderPage = function() --[[ Line: 303 ]]
            -- upvalues: l_NewPage_0 (copy), v14 (ref), v13 (ref), v55 (ref), v73 (copy)
            l_NewPage_0.PageRoot = v14.createRoot(l_NewPage_0.Page);
            l_NewPage_0.PageRoot:render(v13.createElement(v55, {
                onResetFunction = v73, 
                dontResetCharFromButton = l_NewPage_0.DontResetCharFromButton
            }));
        end;
        l_NewPage_0.UnmountPage = function() --[[ Line: 311 ]]
            -- upvalues: l_NewPage_0 (copy)
            if l_NewPage_0.PageRoot then
                l_NewPage_0.PageRoot:unmount();
            end;
        end;
        if v35 then
            l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
        end;
    end;
    return l_NewPage_0;
end)();
local v75 = false;
v27.Displayed.Event:connect(function() --[[ Line: 330 ]]
    -- upvalues: v75 (ref), v33 (copy), v27 (ref), l_GuiService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v24 (copy), l_FFlagChromeShortcutRemoveLeaveOnRespawnPage_0 (copy), v25 (copy), v26 (copy), l_ContextActionService_0 (copy)
    v75 = true;
    if v33 then
        v27.RenderPage();
    end;
    if not v33 then
        l_GuiService_0.SelectedCoreObject = v27.ResetCharacterButton;
    end;
    if l_FFlagEnableConsoleExpControls_0 then
        if v24 then
            if l_FFlagChromeShortcutRemoveLeaveOnRespawnPage_0 then
                v25:setShortcutBar(v26.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID);
                return;
            else
                v25:setShortcutBar(v26.TILTMENU_DIALOG_SHORTCUTBAR_ID);
                return;
            end;
        end;
    else
        l_ContextActionService_0:BindCoreAction("ResetCharacterAction", v27.DontResetCharFromHotkey, false, Enum.KeyCode.ButtonB);
    end;
end);
v27.Hidden.Event:connect(function() --[[ Line: 351 ]]
    -- upvalues: v75 (ref), v33 (copy), v27 (ref), l_ContextActionService_0 (copy)
    v75 = false;
    if v33 then
        v27.UnmountPage();
    end;
    l_ContextActionService_0:UnbindCoreAction("ResetCharacterAction");
end);
v27.SetResetCallback = function(_, v77) --[[ Line: 359 ]] --[[ Name: SetResetCallback ]]
    -- upvalues: v75 (ref), v27 (ref)
    if v77 == false and v75 then
        v27.HubRef:PopMenu(nil, true);
    end;
    v27.ResetBindable = v77;
end;
return v27;