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
local v17 = require(l_RobloxGui_0.Modules.AbuseReportMenu.Flags.FFlagReportFocusNavIEMButtons);
local v18 = nil;
v18 = (function() --[[ Line: 31 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), v4 (copy), l_uiblox_0 (copy), v5 (copy), l_FFlagAbuseReportMenuV2_0 (copy), v3 (copy), l_AbuseReportMenuV2_0 (copy), l_AbuseReportMenu_0 (copy), l_FFlagInExperienceReportClosingBugfix_0 (copy), v11 (copy), v12 (copy), v15 (copy), v17 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0._onHiddenCallback = function() --[[ Line: 35 ]]

    end;
    l_NewPage_0._onDisplayedCallback = function() --[[ Line: 36 ]]

    end;
    l_NewPage_0._onSettingsHiddenCallback = function() --[[ Line: 37 ]]

    end;
    l_NewPage_0._setNextPlayerToReportCallback = function() --[[ Line: 38 ]]

    end;
    l_NewPage_0._onMenuWidthChange = function() --[[ Line: 39 ]]

    end;
    l_NewPage_0.SetHub = function(_, v21) --[[ Line: 41 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef = v21;
        l_NewPage_0.HubRef.SettingsShowSignal:connect(function(v22) --[[ Line: 45 ]]
            -- upvalues: l_NewPage_0 (ref)
            if not v22 then
                l_NewPage_0:onSettingsHidden();
            end;
        end);
        return l_NewPage_0;
    end;
    l_NewPage_0.showAlert = function(_, v24, v25, v26) --[[ Line: 54 ]] --[[ Name: showAlert ]]
        -- upvalues: v4 (ref), l_NewPage_0 (copy)
        v4:ShowAlert(v24, v25, l_NewPage_0.HubRef, v26);
    end;
    l_NewPage_0.showReportSentPage = function(_, v28) --[[ Line: 58 ]] --[[ Name: showReportSentPage ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef.ReportSentPageV2:ShowReportedPlayer(v28, true);
    end;
    l_NewPage_0.HideMenu = function(_) --[[ Line: 62 ]] --[[ Name: HideMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(false, true);
    end;
    l_NewPage_0.ShowMenu = function(_) --[[ Line: 66 ]] --[[ Name: ShowMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(true, true, l_NewPage_0, nil, "ScreenshotUnhide");
    end;
    l_NewPage_0.onHidden = function(_) --[[ Line: 70 ]] --[[ Name: onHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onHiddenCallback();
    end;
    l_NewPage_0.onSettingsHidden = function(_) --[[ Line: 74 ]] --[[ Name: onSettingsHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onSettingsHiddenCallback();
    end;
    l_NewPage_0.onDisplayed = function(_) --[[ Line: 78 ]] --[[ Name: onDisplayed ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onDisplayedCallback();
    end;
    l_NewPage_0.setNextPlayerToReport = function(_, v35) --[[ Line: 82 ]] --[[ Name: setNextPlayerToReport ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._setNextPlayerToReportCallback(v35);
    end;
    l_NewPage_0.TabHeader.Name = "ReportAbuseTab";
    local v36 = l_uiblox_0["icons/actions/feedback"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v36.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v5.Font[v36.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Report";
    l_NewPage_0.Page.Name = "ReportAbuseMenuNewContainerPage";
    l_NewPage_0.ShouldShowBottomBar = true;
    l_NewPage_0.ShouldShowHubBar = true;
    l_NewPage_0.ShouldDisableDefaultScroll = l_FFlagAbuseReportMenuV2_0;
    local v45 = v3.createElement(if l_FFlagAbuseReportMenuV2_0 then l_AbuseReportMenuV2_0 else l_AbuseReportMenu_0, {
        hideReportTab = function() --[[ Line: 101 ]] --[[ Name: hideReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:HideMenu();
        end, 
        showReportTab = function() --[[ Line: 104 ]] --[[ Name: showReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:ShowMenu();
        end, 
        registerOnReportTabHidden = function(v37) --[[ Line: 107 ]] --[[ Name: registerOnReportTabHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onHiddenCallback = v37;
        end, 
        registerOnReportTabDisplayed = function(v38) --[[ Line: 110 ]] --[[ Name: registerOnReportTabDisplayed ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onDisplayedCallback = v38;
        end, 
        registerOnMenuWidthChange = function(v39) --[[ Line: 113 ]] --[[ Name: registerOnMenuWidthChange ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onMenuWidthChange = v39;
        end, 
        registerSetNextPlayerToReport = function(v40) --[[ Line: 116 ]] --[[ Name: registerSetNextPlayerToReport ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._setNextPlayerToReportCallback = v40;
        end, 
        registerOnSettingsHidden = function(v41) --[[ Line: 119 ]] --[[ Name: registerOnSettingsHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onSettingsHiddenCallback = v41;
        end, 
        showReportSentPage = function(v42) --[[ Line: 122 ]] --[[ Name: showReportSentPage ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:showReportSentPage(v42);
        end, 
        onReportComplete = function(v43) --[[ Line: 125 ]] --[[ Name: onReportComplete ]]
            -- upvalues: l_FFlagInExperienceReportClosingBugfix_0 (ref), v11 (ref), v12 (ref), l_NewPage_0 (copy)
            if l_FFlagInExperienceReportClosingBugfix_0 and v11 then
                v12:setShortcutBar(nil);
            end;
            l_NewPage_0:showAlert(v43, "Ok", function() --[[ Line: 129 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0:HideMenu();
            end);
        end, 
        onDropdownMenuOpenChange = v15 and v11 and function(v44) --[[ Line: 134 ]]
            -- upvalues: v12 (ref)
            v12:setHideShortcutBar("InExperienceReportDropdown", v44);
        end or nil, 
        getSettingsHubRef = v17 and function() --[[ Line: 137 ]]
            -- upvalues: l_NewPage_0 (copy)
            return l_NewPage_0.HubRef;
        end or nil
    });
    v3.mount(v45, l_NewPage_0.Page, "AbuseReportMenu");
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_NewPage_0.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 150 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onMenuWidthChange(l_NewPage_0.Page.AbsoluteSize.X);
    end);
    return l_NewPage_0;
end)();
v18.Displayed.Event:connect(function() --[[ Line: 160 ]]
    -- upvalues: v18 (ref)
    v18:onDisplayed();
end);
v18.Hidden.Event:connect(function() --[[ Line: 164 ]]
    -- upvalues: v18 (ref)
    v18:onHidden();
end);
v18.ReportPlayer = function(_, v47, v48) --[[ Line: 168 ]] --[[ Name: ReportPlayer ]]
    -- upvalues: l_ReportAbuseAnalytics_0 (copy), v18 (ref)
    if v47 then
        l_ReportAbuseAnalytics_0:startAbuseReportSession(v48);
        v18:setNextPlayerToReport(v47);
        if not v18.HubRef:GetVisibility() then
            v18.HubRef:SetVisibility(true, false, v18);
            return;
        else
            v18.HubRef:SwitchToPage(v18, false, nil, nil, nil, {
                entrypoint = l_ReportAbuseAnalytics_0:getAbuseReportSessionEntryPoint()
            });
        end;
    end;
end;
return v18;