local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v7 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v9 = require(l_CorePackages_0.Packages.Roact);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local v11 = require(l_Modules_0.Settings.SettingsPageFactory);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_ReportAbuseAnalytics_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).ReportAbuseAnalytics;
local v14 = require(l_script_FirstAncestor_0.Analytics.BlockingAnalytics);
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v16 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v16.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFFlagReportAbuseThankYouPageSizeFix);
local v20 = require(l_script_FirstAncestor_0.Components.ReportConfirmation.ReportConfirmationScreen);
local v21 = require(l_script_FirstAncestor_0.Components.ReportConfirmation.ReportConfirmationContainer);
local v22 = game:DefineFastFlag("ReportAbuseThankYouPageGamepadEnable", false);
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v24 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v25 = if v24 then require(l_Chrome_0.Service) else nil;
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local v27 = nil;
local function _() --[[ Line: 38 ]]
    -- upvalues: v27 (ref), v9 (copy)
    if v27 ~= nil then
        v9.unmount(v27);
        v27 = nil;
    end;
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v30 = l_ReportAbuseAnalytics_0.new(l_EventIngest_0.new(l_EventIngestService_0), v7.Diag, l_ReportAbuseAnalytics_0.MenuContexts.LegacySentPage);
local v31 = v14.new(l_LocalPlayer_0.UserId, {
    EventStream = l_RbxAnalyticsService_0
});
local v33 = (function() --[[ Line: 59 ]] --[[ Name: Initialize ]]
    -- upvalues: v11 (copy), l_Create_0 (copy)
    local l_v11_NewPage_0 = v11:CreateNewPage();
    l_v11_NewPage_0.TabHeader = nil;
    l_v11_NewPage_0.PageListLayout.Parent = nil;
    l_v11_NewPage_0.ShouldShowBottomBar = false;
    l_v11_NewPage_0.ShouldShowHubBar = false;
    l_v11_NewPage_0.IsPageClipped = false;
    l_v11_NewPage_0.Page.Name = "ReportSentPageV2";
    l_v11_NewPage_0.Page.Size = UDim2.fromScale(1, 0);
    l_v11_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_v11_NewPage_0.Root = l_Create_0("Frame")({
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        Name = "ReportSentContents", 
        Parent = l_v11_NewPage_0.Page
    });
    return l_v11_NewPage_0;
end)();
v33.UpdateMenu = function(v34) --[[ Line: 83 ]] --[[ Name: UpdateMenu ]]
    -- upvalues: v27 (ref), v9 (copy), v19 (copy), v30 (copy), v31 (copy), v20 (copy), v22 (copy), l_CoreScriptsRootProvider_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v21 (copy), v24 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v25 (copy)
    local l_ReportedPlayer_0 = v34.ReportedPlayer;
    if v27 ~= nil then
        v9.unmount(v27);
        v27 = nil;
    end;
    if v34.settingsShowChangedSignal then
        v34.settingsShowChangedSignal:disconnect();
        v34.settingsShowChangedSignal = nil;
    end;
    v34.settingsShowChangedSignal = v34.HubRef.SettingsShowSignal:connect(function(v36) --[[ Line: 92 ]]
        -- upvalues: v34 (copy)
        if not v36 then
            v34:HandleDone();
        end;
    end);
    local v37 = nil;
    if v19() then
        v37 = Instance.new("BindableEvent");
        v34.SizeChangedSignal = v34.Root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 102 ]]
            -- upvalues: v37 (ref), v34 (copy)
            v37:Fire(v34.Root.AbsoluteSize);
        end);
    end;
    local v38 = {
        player = {
            UserId = l_ReportedPlayer_0.UserId, 
            Name = l_ReportedPlayer_0.Name, 
            DisplayName = l_ReportedPlayer_0.DisplayName
        }, 
        closeMenu = function() --[[ Line: 113 ]] --[[ Name: closeMenu ]]
            -- upvalues: v34 (copy)
            v34:HandleDone();
        end, 
        isVoiceReport = v34.isVoiceReport, 
        ZIndex = v34.HubRef.Shield.ZIndex + 1, 
        reportAbuseAnalytics = v30, 
        blockingAnalytics = v31, 
        onSizeChanged = if v19() then v37.Event else nil
    };
    local v39 = v9.createElement(v20, v38);
    if v22 then
        v39 = v9.createElement(l_CoreScriptsRootProvider_0, {}, {
            FocusRoot = v9.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                isIsolated = true, 
                isAutoFocusRoot = true
            }, {
                ThankYouScreenRoot = v9.createElement(v21, v38)
            })
        });
        if v24 and l_FFlagEnableConsoleExpControls_0 then
            v25:setHideShortcutBar("ReportSentPageV2", true);
        end;
    end;
    v27 = v9.mount(v39, v34.Root, "ReportSentPageV2");
end;
v33.ShowReportedPlayer = function(v40, v41, v42) --[[ Line: 147 ]] --[[ Name: ShowReportedPlayer ]]
    -- upvalues: v33 (copy)
    v40.ReportedPlayer = v41;
    v40.isVoiceReport = v42;
    v40:UpdateMenu();
    v40.HubRef:SwitchToPage(v33, true);
end;
v33.HandleDone = function(v43) --[[ Line: 155 ]] --[[ Name: HandleDone ]]
    -- upvalues: v22 (copy), v24 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v25 (copy), v27 (ref), v9 (copy)
    if v22 and v24 and l_FFlagEnableConsoleExpControls_0 then
        v25:setHideShortcutBar("ReportSentPageV2", false);
    end;
    if v27 ~= nil then
        v9.unmount(v27);
        v27 = nil;
    end;
    if v43.settingsShowChangedSignal then
        v43.settingsShowChangedSignal:disconnect();
        v43.settingsShowChangedSignal = nil;
    end;
    if v43.SizeChangedSignal then
        v43.SizeChangedSignal:disconnect();
        v43.SizeChangedSignal = nil;
    end;
    v43.HubRef:SetVisibility(false, true);
end;
return v33;