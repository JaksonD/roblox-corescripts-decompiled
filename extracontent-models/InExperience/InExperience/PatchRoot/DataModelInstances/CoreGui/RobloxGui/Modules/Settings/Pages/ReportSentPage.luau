local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules");
local v5 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v6 = require(l_Modules_0.Settings.SettingsPageFactory);
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v8 = require(script:FindFirstAncestor("Settings").onBlockButtonActivated);
local v9 = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics);
local v10 = require(l_Modules_0.Settings.Utility);
local v11 = require(l_Modules_0.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v14 = v9.new(l_LocalPlayer_0.UserId, {
    EventStream = l_RbxAnalyticsService_0
});
local v15 = v11.textSize(36);
local v16 = v11.textSize(24);
local v17 = v11.textSize(16);
local v39 = (function() --[[ Line: 36 ]] --[[ Name: Initialize ]]
    -- upvalues: v6 (copy), l_Create_0 (copy), v11 (copy), v10 (copy), v7 (copy), v15 (copy), v16 (copy), v17 (copy)
    local l_v6_NewPage_0 = v6:CreateNewPage();
    l_v6_NewPage_0.TabHeader = nil;
    l_v6_NewPage_0.PageListLayout.Parent = nil;
    l_v6_NewPage_0.ShouldShowBottomBar = false;
    l_v6_NewPage_0.ShouldShowHubBar = false;
    l_v6_NewPage_0.IsPageClipped = false;
    l_v6_NewPage_0.Page.Name = "ReportSentPage";
    l_v6_NewPage_0.Page.Size = UDim2.fromScale(1, 0);
    l_v6_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_v6_NewPage_0.Root = l_Create_0("Frame")({
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Name = "ReportSentContents", 
        Parent = l_v6_NewPage_0.Page
    });
    l_v6_NewPage_0.RootLayout = l_Create_0("UIListLayout")({
        Name = "RootLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = l_v6_NewPage_0.Root
    });
    local function v23(v19, v20, v21, v22) --[[ Line: 64 ]] --[[ Name: createTextLabel ]]
        -- upvalues: l_Create_0 (ref), v11 (ref), l_v6_NewPage_0 (copy)
        return l_Create_0("TextLabel")({
            Name = v19, 
            LayoutOrder = v22, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v20, 
            TextSize = v21, 
            Font = v11.font(Enum.Font.SourceSansBold, "Bold"), 
            TextWrap = true, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Parent = l_v6_NewPage_0.Root
        });
    end;
    local function _(v24, v25, v26, v27) --[[ Line: 81 ]] --[[ Name: createButton ]]
        -- upvalues: v10 (ref), l_v6_NewPage_0 (copy)
        local v28, v29 = v10:MakeStyledButton(v24, v25, UDim2.new(1, 0, 0, 50), v27);
        v28.LayoutOrder = v26;
        v28.Parent = l_v6_NewPage_0.Root;
        return v28, v29;
    end;
    local function v33(v31, v32) --[[ Line: 89 ]] --[[ Name: createSpacer ]]
        -- upvalues: l_Create_0 (ref), l_v6_NewPage_0 (copy)
        return l_Create_0("Frame")({
            LayoutOrder = v32, 
            Name = "Spacer" .. tostring(v32), 
            Size = UDim2.fromOffset(0, v31), 
            Parent = l_v6_NewPage_0.Root
        });
    end;
    l_v6_NewPage_0.TitleLabel = v23("TitleLabel", v7:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), v15, 0);
    l_v6_NewPage_0.BodyLabel = v23("BodyLabel", v7:FormatByKey("Feature.SettingsHub.Label.Report.ReceivedReportBody"), v16, 1);
    l_v6_NewPage_0.TopSpacer = v33(10, 2);
    l_v6_NewPage_0.ActionHeader = v23("ActionHeader", v7:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), v17, 3);
    l_v6_NewPage_0.ActionHeader.TextXAlignment = Enum.TextXAlignment.Left;
    local v34 = v7:FormatByKey("Feature.SettingsHub.Action.Block");
    local v35, v36 = v10:MakeStyledButton("BlockButton", v34, UDim2.new(1, 0, 0, 50), function() --[[ Line: 111 ]]
        -- upvalues: l_v6_NewPage_0 (copy)
        l_v6_NewPage_0:HandleBlock();
    end);
    v35.LayoutOrder = 4;
    v35.Parent = l_v6_NewPage_0.Root;
    local l_v35_0 = v35;
    local l_v36_0 = v36;
    l_v6_NewPage_0.BlockButton = l_v35_0;
    l_v6_NewPage_0.BlockLabel = l_v36_0;
    l_v6_NewPage_0.MiddleSpacer = v33(20, 6);
    l_v35_0 = v7:FormatByKey("Feature.SettingsHub.Action.Report.Done");
    v35, v36 = v10:MakeStyledButton("DoneButton", l_v35_0, UDim2.new(1, 0, 0, 50), function() --[[ Line: 118 ]]
        -- upvalues: l_v6_NewPage_0 (copy)
        l_v6_NewPage_0:HandleDone();
    end);
    v35.LayoutOrder = 7;
    v35.Parent = l_v6_NewPage_0.Root;
    l_v6_NewPage_0.DoneButton = v35;
    return l_v6_NewPage_0;
end)();
v39.UpdateActions = function(v40) --[[ Line: 127 ]] --[[ Name: UpdateActions ]]
    -- upvalues: v5 (copy), v7 (copy)
    if v40.ReportedPlayer then
        v40.TopSpacer.Visible = true;
        v40.ActionHeader.Visible = true;
        local v41 = v5:IsPlayerBlockedByUserId(v40.ReportedPlayer.UserId);
        v40.BlockButton.Visible = not v41;
        local l_DisplayName_0 = v40.ReportedPlayer.DisplayName;
        local l_Name_0 = v40.ReportedPlayer.Name;
        local v44 = v7:FormatByKey("Feature.SettingsHub.Label.Report.BlockDisplayName", {
            DISPLAY_NAME = l_DisplayName_0, 
            RBX_NAME = l_Name_0
        });
        v40.BlockLabel.Text = v44;
        return;
    else
        v40.TopSpacer.Visible = false;
        v40.ActionHeader.Visible = false;
        v40.BlockButton.Visible = false;
        return;
    end;
end;
v39.ShowReportedPlayer = function(v45, v46) --[[ Line: 149 ]] --[[ Name: ShowReportedPlayer ]]
    -- upvalues: v39 (copy)
    v45.ReportedPlayer = v46;
    v45:UpdateActions();
    v45.HubRef:SwitchToPage(v39, true);
end;
v39.HandleBlock = function(v47) --[[ Line: 156 ]] --[[ Name: HandleBlock ]]
    -- upvalues: v8 (copy), v14 (copy)
    if v47.ReportedPlayer then
        v8(v47.ReportedPlayer, v14);
    end;
    v47:HandleDone();
end;
v39.HandleDone = function(v48) --[[ Line: 163 ]] --[[ Name: HandleDone ]]
    v48.HubRef:SetVisibility(false, true);
end;
return v39;