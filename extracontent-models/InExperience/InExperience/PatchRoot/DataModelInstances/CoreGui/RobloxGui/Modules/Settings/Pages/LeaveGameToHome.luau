local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v7 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v10 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v12 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v13 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v15 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local l_FFlag_0 = settings():GetFFlag("CollectAnalyticsForSystemMenu");
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local v18 = nil;
if l_FFlag_0 then
    v18 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
end;
local v19 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
v12 = (function() --[[ Line: 51 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), v15 (copy), v7 (copy), l_GuiService_0 (copy), l_FFlag_0 (copy), v18 (ref), l_LinkingProtocol_0 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy), v19 (copy), l_Create_0 (copy), v10 (copy), v13 (copy), v8 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.playsessionid = "";
    if l_game_EngineFeature_0 then
        l_NewPage_0.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_NewPage_0.LeaveFunc = function() --[[ Line: 60 ]]
        -- upvalues: v15 (ref), v7 (ref), l_GuiService_0 (ref), l_FFlag_0 (ref), l_RbxAnalyticsService_0 (ref), v18 (ref), l_NewPage_0 (copy), l_LinkingProtocol_0 (ref), l_RunService_0 (ref), l_GetDefaultQualityLevel_0 (ref)
        if v15() then
            v7.leavingGame();
        end;
        l_GuiService_0.SelectedCoreObject = nil;
        if l_FFlag_0 then
            l_RbxAnalyticsService_0:SetRBXEventStream(v18.AnalyticsTargetName, v18.AnalyticsInGameMenuName, v18.AnalyticsLeaveGameName, {
                confirmed = v18.AnalyticsConfirmedName, 
                universeid = tostring(game.GameId), 
                source = v18.AnalyticsLeaveToHomeSource, 
                playsessionid = l_NewPage_0.playsessionid
            });
        end;
        l_LinkingProtocol_0.default:detectURL("roblox://navigation/home");
        l_RunService_0.RenderStepped:wait();
        l_RunService_0.RenderStepped:wait();
        game:Shutdown();
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end;
    l_NewPage_0.DontLeaveFunc = function(v21) --[[ Line: 92 ]]
        -- upvalues: l_NewPage_0 (copy), l_FFlag_0 (ref), l_RbxAnalyticsService_0 (ref), v18 (ref)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v21, true);
        end;
        if l_FFlag_0 then
            l_RbxAnalyticsService_0:SetRBXEventStream(v18.AnalyticsTargetName, v18.AnalyticsInGameMenuName, v18.AnalyticsLeaveGameName, {
                confirmed = v18.AnalyticsCancelledName, 
                universeid = tostring(game.GameId), 
                source = v18.AnalyticsLeaveToHomeSource, 
                playsessionid = l_NewPage_0.playsessionid
            });
        end;
    end;
    l_NewPage_0.DontLeaveFromHotkey = function(_, v23, v24) --[[ Line: 111 ]]
        -- upvalues: l_NewPage_0 (copy)
        if v23 == Enum.UserInputState.Begin then
            local v25 = true;
            if v24.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v25 = true;
                if v24.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v25 = true;
                    if v24.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v25 = v24.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            l_NewPage_0.DontLeaveFunc(v25);
        end;
    end;
    l_NewPage_0.DontLeaveFromButton = function(v26) --[[ Line: 119 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.DontLeaveFunc(v26);
    end;
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGameToHomePage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    local v27 = v19:FormatByKey(if l_FFlag_0 then v18.ConfirmLeaveGameLocalizedKey else "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame");
    local v28 = l_Create_0("TextLabel")({
        Name = "LeaveGameText", 
        Text = v27, 
        Font = v10.font(Enum.Font.SourceSansBold, "Confirmation"), 
        FontSize = v10.fontSize(Enum.FontSize.Size36, "Confirmation"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 200), 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = l_NewPage_0.Page, 
        Position = v13 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
    });
    local v29 = l_Create_0("Frame")({
        Name = "LeaveButtonContainer", 
        Parent = v28, 
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 1, 0)
    });
    local _ = l_Create_0("UIGridLayout")({
        Name = "LeavetButtonsLayout", 
        CellSize = v13 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50), 
        CellPadding = UDim2.new(0, 20, 0, 20), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Parent = v29
    });
    if v8:IsSmallTouchScreen() then
        v28.FontSize = Enum.FontSize.Size24;
        v28.Size = UDim2.new(1, 0, 0, 100);
    elseif v13 then
        v28.FontSize = Enum.FontSize.Size48;
    end;
    l_NewPage_0.LeaveGameButton = v8:MakeStyledButton("LeaveGame", "Leave", nil, l_NewPage_0.LeaveFunc);
    l_NewPage_0.LeaveGameButton.NextSelectionRight = nil;
    l_NewPage_0.LeaveGameButton.Parent = v29;
    local v31 = v8:MakeStyledButton("DontLeaveGame", v19:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, l_NewPage_0.DontLeaveFromButton);
    v31.NextSelectionLeft = nil;
    v31.Parent = v29;
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v31.AbsolutePosition.Y + v31.AbsoluteSize.Y);
    return l_NewPage_0;
end)();
v12.Displayed.Event:connect(function() --[[ Line: 204 ]]
    -- upvalues: l_GuiService_0 (copy), v12 (ref), l_ContextActionService_0 (copy)
    l_GuiService_0.SelectedCoreObject = v12.LeaveGameButton;
    l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", v12.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB);
end);
v12.Hidden.Event:connect(function() --[[ Line: 209 ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
end);
return v12;