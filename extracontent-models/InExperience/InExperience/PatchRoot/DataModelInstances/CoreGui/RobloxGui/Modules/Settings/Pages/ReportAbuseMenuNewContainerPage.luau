local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v5 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_uiblox_0 = v5.Migration.uiblox;
local l_AbuseReportMenu_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).AbuseReportMenu;
local l_ReportAbuseAnalytics_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).ReportAbuseAnalytics;
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v10 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v11 = if v10 then require(l_Chrome_0.Service) else nil;
local l_FFlagInExperienceReportClosingBugfix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInExperienceReportClosingBugfix;
local v13 = require(l_RobloxGui_0.Modules.AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown);
local v14 = nil;
v14 = (function() --[[ Line: 28 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), v4 (copy), l_uiblox_0 (copy), v5 (copy), v3 (copy), l_AbuseReportMenu_0 (copy), l_FFlagInExperienceReportClosingBugfix_0 (copy), v10 (copy), v11 (copy), v13 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0._onHiddenCallback = function() --[[ Line: 32 ]]

    end;
    l_NewPage_0._onDisplayedCallback = function() --[[ Line: 33 ]]

    end;
    l_NewPage_0._onSettingsHiddenCallback = function() --[[ Line: 34 ]]

    end;
    l_NewPage_0._setNextPlayerToReportCallback = function() --[[ Line: 35 ]]

    end;
    l_NewPage_0._onMenuWidthChange = function() --[[ Line: 36 ]]

    end;
    l_NewPage_0.SetHub = function(_, v17) --[[ Line: 38 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef = v17;
        l_NewPage_0.HubRef.SettingsShowSignal:connect(function(v18) --[[ Line: 42 ]]
            -- upvalues: l_NewPage_0 (ref)
            if not v18 then
                l_NewPage_0:onSettingsHidden();
            end;
        end);
        return l_NewPage_0;
    end;
    l_NewPage_0.showAlert = function(_, v20, v21, v22) --[[ Line: 51 ]] --[[ Name: showAlert ]]
        -- upvalues: v4 (ref), l_NewPage_0 (copy)
        v4:ShowAlert(v20, v21, l_NewPage_0.HubRef, v22);
    end;
    l_NewPage_0.showReportSentPage = function(_, v24) --[[ Line: 55 ]] --[[ Name: showReportSentPage ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef.ReportSentPageV2:ShowReportedPlayer(v24, true);
    end;
    l_NewPage_0.HideMenu = function(_) --[[ Line: 59 ]] --[[ Name: HideMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(false, true);
    end;
    l_NewPage_0.ShowMenu = function(_) --[[ Line: 63 ]] --[[ Name: ShowMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(true, true, l_NewPage_0, nil, "ScreenshotUnhide");
    end;
    l_NewPage_0.onHidden = function(_) --[[ Line: 67 ]] --[[ Name: onHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onHiddenCallback();
    end;
    l_NewPage_0.onSettingsHidden = function(_) --[[ Line: 71 ]] --[[ Name: onSettingsHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onSettingsHiddenCallback();
    end;
    l_NewPage_0.onDisplayed = function(_) --[[ Line: 75 ]] --[[ Name: onDisplayed ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onDisplayedCallback();
    end;
    l_NewPage_0.setNextPlayerToReport = function(_, v31) --[[ Line: 79 ]] --[[ Name: setNextPlayerToReport ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._setNextPlayerToReportCallback(v31);
    end;
    l_NewPage_0.TabHeader.Name = "ReportAbuseTab";
    local v32 = l_uiblox_0["icons/actions/feedback"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v32.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v5.Font[v32.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Report";
    l_NewPage_0.Page.Name = "ReportAbuseMenuNewContainerPage";
    l_NewPage_0.ShouldShowBottomBar = true;
    l_NewPage_0.ShouldShowHubBar = true;
    local v41 = v3.createElement(l_AbuseReportMenu_0, {
        hideReportTab = function() --[[ Line: 96 ]] --[[ Name: hideReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:HideMenu();
        end, 
        showReportTab = function() --[[ Line: 99 ]] --[[ Name: showReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:ShowMenu();
        end, 
        registerOnReportTabHidden = function(v33) --[[ Line: 102 ]] --[[ Name: registerOnReportTabHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onHiddenCallback = v33;
        end, 
        registerOnReportTabDisplayed = function(v34) --[[ Line: 105 ]] --[[ Name: registerOnReportTabDisplayed ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onDisplayedCallback = v34;
        end, 
        registerOnMenuWidthChange = function(v35) --[[ Line: 108 ]] --[[ Name: registerOnMenuWidthChange ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onMenuWidthChange = v35;
        end, 
        registerSetNextPlayerToReport = function(v36) --[[ Line: 111 ]] --[[ Name: registerSetNextPlayerToReport ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._setNextPlayerToReportCallback = v36;
        end, 
        registerOnSettingsHidden = function(v37) --[[ Line: 114 ]] --[[ Name: registerOnSettingsHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onSettingsHiddenCallback = v37;
        end, 
        showReportSentPage = function(v38) --[[ Line: 117 ]] --[[ Name: showReportSentPage ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:showReportSentPage(v38);
        end, 
        onReportComplete = function(v39) --[[ Line: 120 ]] --[[ Name: onReportComplete ]]
            -- upvalues: l_FFlagInExperienceReportClosingBugfix_0 (ref), v10 (ref), v11 (ref), l_NewPage_0 (copy)
            if l_FFlagInExperienceReportClosingBugfix_0 and v10 then
                v11:setShortcutBar(nil);
            end;
            l_NewPage_0:showAlert(v39, "Ok", function() --[[ Line: 124 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0:HideMenu();
            end);
        end, 
        onDropdownMenuOpenChange = v13 and v10 and function(v40) --[[ Line: 129 ]]
            -- upvalues: v11 (ref)
            v11:setHideShortcutBar("InExperienceReportDropdown", v40);
        end or nil
    });
    v3.mount(v41, l_NewPage_0.Page, "AbuseReportMenu");
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_NewPage_0.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 142 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onMenuWidthChange(l_NewPage_0.Page.AbsoluteSize.X);
    end);
    return l_NewPage_0;
end)();
v14.Displayed.Event:connect(function() --[[ Line: 152 ]]
    -- upvalues: v14 (ref)
    v14:onDisplayed();
end);
v14.Hidden.Event:connect(function() --[[ Line: 156 ]]
    -- upvalues: v14 (ref)
    v14:onHidden();
end);
v14.ReportPlayer = function(_, v43, v44) --[[ Line: 160 ]] --[[ Name: ReportPlayer ]]
    -- upvalues: l_ReportAbuseAnalytics_0 (copy), v14 (ref)
    if v43 then
        l_ReportAbuseAnalytics_0:startAbuseReportSession(v44);
        v14:setNextPlayerToReport(v43);
        if not v14.HubRef:GetVisibility() then
            v14.HubRef:SetVisibility(true, false, v14);
            return;
        else
            v14.HubRef:SwitchToPage(v14, false, nil, nil, nil, {
                entrypoint = l_ReportAbuseAnalytics_0:getAbuseReportSessionEntryPoint()
            });
        end;
    end;
end;
return v14;