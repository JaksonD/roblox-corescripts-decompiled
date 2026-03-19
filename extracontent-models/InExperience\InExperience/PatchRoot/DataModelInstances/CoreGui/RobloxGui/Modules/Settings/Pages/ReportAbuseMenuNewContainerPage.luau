local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v5 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_uiblox_0 = v5.Migration.uiblox;
local l_AbuseReportMenu_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).AbuseReportMenu;
local l_AbuseReportMenuV2_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).AbuseReportMenuV2;
local l_ReportAbuseAnalytics_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).ReportAbuseAnalytics;
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v11 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v12 = if v11 then require(l_Chrome_0.Service) else nil;
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagInExperienceReportClosingBugfix_0 = v13.FFlagInExperienceReportClosingBugfix;
local v15 = require(l_RobloxGui_0.Modules.AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown);
local l_FFlagAbuseReportMenuV2_0 = v13.FFlagAbuseReportMenuV2;
local v17 = nil;
v17 = (function() --[[ Line: 30 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), v4 (copy), l_uiblox_0 (copy), v5 (copy), v3 (copy), l_FFlagAbuseReportMenuV2_0 (copy), l_AbuseReportMenuV2_0 (copy), l_AbuseReportMenu_0 (copy), l_FFlagInExperienceReportClosingBugfix_0 (copy), v11 (copy), v12 (copy), v15 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0._onHiddenCallback = function() --[[ Line: 34 ]]

    end;
    l_NewPage_0._onDisplayedCallback = function() --[[ Line: 35 ]]

    end;
    l_NewPage_0._onSettingsHiddenCallback = function() --[[ Line: 36 ]]

    end;
    l_NewPage_0._setNextPlayerToReportCallback = function() --[[ Line: 37 ]]

    end;
    l_NewPage_0._onMenuWidthChange = function() --[[ Line: 38 ]]

    end;
    l_NewPage_0.SetHub = function(_, v20) --[[ Line: 40 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef = v20;
        l_NewPage_0.HubRef.SettingsShowSignal:connect(function(v21) --[[ Line: 44 ]]
            -- upvalues: l_NewPage_0 (ref)
            if not v21 then
                l_NewPage_0:onSettingsHidden();
            end;
        end);
        return l_NewPage_0;
    end;
    l_NewPage_0.showAlert = function(_, v23, v24, v25) --[[ Line: 53 ]] --[[ Name: showAlert ]]
        -- upvalues: v4 (ref), l_NewPage_0 (copy)
        v4:ShowAlert(v23, v24, l_NewPage_0.HubRef, v25);
    end;
    l_NewPage_0.showReportSentPage = function(_, v27) --[[ Line: 57 ]] --[[ Name: showReportSentPage ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef.ReportSentPageV2:ShowReportedPlayer(v27, true);
    end;
    l_NewPage_0.HideMenu = function(_) --[[ Line: 61 ]] --[[ Name: HideMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(false, true);
    end;
    l_NewPage_0.ShowMenu = function(_) --[[ Line: 65 ]] --[[ Name: ShowMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(true, true, l_NewPage_0, nil, "ScreenshotUnhide");
    end;
    l_NewPage_0.onHidden = function(_) --[[ Line: 69 ]] --[[ Name: onHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onHiddenCallback();
    end;
    l_NewPage_0.onSettingsHidden = function(_) --[[ Line: 73 ]] --[[ Name: onSettingsHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onSettingsHiddenCallback();
    end;
    l_NewPage_0.onDisplayed = function(_) --[[ Line: 77 ]] --[[ Name: onDisplayed ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onDisplayedCallback();
    end;
    l_NewPage_0.setNextPlayerToReport = function(_, v34) --[[ Line: 81 ]] --[[ Name: setNextPlayerToReport ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._setNextPlayerToReportCallback(v34);
    end;
    l_NewPage_0.TabHeader.Name = "ReportAbuseTab";
    local v35 = l_uiblox_0["icons/actions/feedback"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v35.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v5.Font[v35.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Report";
    l_NewPage_0.Page.Name = "ReportAbuseMenuNewContainerPage";
    l_NewPage_0.ShouldShowBottomBar = true;
    l_NewPage_0.ShouldShowHubBar = true;
    local v44 = v3.createElement(if l_FFlagAbuseReportMenuV2_0 then l_AbuseReportMenuV2_0 else l_AbuseReportMenu_0, {
        hideReportTab = function() --[[ Line: 98 ]] --[[ Name: hideReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:HideMenu();
        end, 
        showReportTab = function() --[[ Line: 101 ]] --[[ Name: showReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:ShowMenu();
        end, 
        registerOnReportTabHidden = function(v36) --[[ Line: 104 ]] --[[ Name: registerOnReportTabHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onHiddenCallback = v36;
        end, 
        registerOnReportTabDisplayed = function(v37) --[[ Line: 107 ]] --[[ Name: registerOnReportTabDisplayed ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onDisplayedCallback = v37;
        end, 
        registerOnMenuWidthChange = function(v38) --[[ Line: 110 ]] --[[ Name: registerOnMenuWidthChange ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onMenuWidthChange = v38;
        end, 
        registerSetNextPlayerToReport = function(v39) --[[ Line: 113 ]] --[[ Name: registerSetNextPlayerToReport ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._setNextPlayerToReportCallback = v39;
        end, 
        registerOnSettingsHidden = function(v40) --[[ Line: 116 ]] --[[ Name: registerOnSettingsHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onSettingsHiddenCallback = v40;
        end, 
        showReportSentPage = function(v41) --[[ Line: 119 ]] --[[ Name: showReportSentPage ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:showReportSentPage(v41);
        end, 
        onReportComplete = function(v42) --[[ Line: 122 ]] --[[ Name: onReportComplete ]]
            -- upvalues: l_FFlagInExperienceReportClosingBugfix_0 (ref), v11 (ref), v12 (ref), l_NewPage_0 (copy)
            if l_FFlagInExperienceReportClosingBugfix_0 and v11 then
                v12:setShortcutBar(nil);
            end;
            l_NewPage_0:showAlert(v42, "Ok", function() --[[ Line: 126 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0:HideMenu();
            end);
        end, 
        onDropdownMenuOpenChange = v15 and v11 and function(v43) --[[ Line: 131 ]]
            -- upvalues: v12 (ref)
            v12:setHideShortcutBar("InExperienceReportDropdown", v43);
        end or nil
    });
    v3.mount(v44, l_NewPage_0.Page, "AbuseReportMenu");
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_NewPage_0.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 144 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onMenuWidthChange(l_NewPage_0.Page.AbsoluteSize.X);
    end);
    return l_NewPage_0;
end)();
v17.Displayed.Event:connect(function() --[[ Line: 154 ]]
    -- upvalues: v17 (ref)
    v17:onDisplayed();
end);
v17.Hidden.Event:connect(function() --[[ Line: 158 ]]
    -- upvalues: v17 (ref)
    v17:onHidden();
end);
v17.ReportPlayer = function(_, v46, v47) --[[ Line: 162 ]] --[[ Name: ReportPlayer ]]
    -- upvalues: l_ReportAbuseAnalytics_0 (copy), v17 (ref)
    if v46 then
        l_ReportAbuseAnalytics_0:startAbuseReportSession(v47);
        v17:setNextPlayerToReport(v46);
        if not v17.HubRef:GetVisibility() then
            v17.HubRef:SetVisibility(true, false, v17);
            return;
        else
            v17.HubRef:SwitchToPage(v17, false, nil, nil, nil, {
                entrypoint = l_ReportAbuseAnalytics_0:getAbuseReportSessionEntryPoint()
            });
        end;
    end;
end;
return v17;