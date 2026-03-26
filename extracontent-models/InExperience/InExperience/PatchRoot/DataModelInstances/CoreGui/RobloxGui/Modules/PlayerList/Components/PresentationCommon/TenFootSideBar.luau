local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_FFlagAppShellMigrateLocales_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v10 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v11 = require(l_CoreGui_0.RobloxGui.Modules.isNewInGameMenuEnabled);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = v5.PureComponent:extend("TenFootSideBar");
v13.init = function(v14) --[[ Line: 23 ]] --[[ Name: init ]]
    v14.sideBar = nil;
end;
v13.render = function(_) --[[ Line: 27 ]] --[[ Name: render ]]
    return nil;
end;
v13.openSidebar = function(v16, v17) --[[ Line: 31 ]] --[[ Name: openSidebar ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), l_GuiService_0 (copy), l_RobloxGui_0 (copy), l_FFlagAppShellMigrateLocales_0 (copy), v11 (copy)
    local v18 = not l_RunService_0:IsStudio() and v17 ~= l_Players_0.LocalPlayer;
    if not v18 then
        v16.props.closeSideBar();
        return;
    else
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        local v20 = l_RobloxGui_0.Modules:FindFirstChild("ScreenManager") or l_RobloxGui_0.Modules.Shell.ScreenManager;
        local v21 = require(v20);
        local v22 = l_RobloxGui_0.Modules:FindFirstChild("LocalizedStrings") or l_RobloxGui_0.Modules.Shell.LocalizedStrings;
        local v23 = require(v22);
        if not v16.sideBar then
            local v24 = l_RobloxGui_0.Modules:FindFirstChild("SideBar") or l_RobloxGui_0.Modules.Shell.SideBar;
            v16.sideBar = require(v24)();
        end;
        v16.sideBar:RemoveAllItems();
        if v18 then
            local v25 = if l_FFlagAppShellMigrateLocales_0 then v23:LocStringUA("Xbox.Old.ReportPlayer") else v23:LocalizedString("ReportPlayer");
            v16.sideBar:AddItem(v25, function() --[[ Line: 61 ]]
                -- upvalues: v16 (copy), l_GuiService_0 (ref), v11 (ref), l_RobloxGui_0 (ref), v17 (copy)
                v16.props.closePlayerList();
                l_GuiService_0.SelectedCoreObject = nil;
                if v11() then
                    require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(v17, v16.__componentName);
                    return;
                else
                    require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(v17, v16.__componentName);
                    return;
                end;
            end);
        end;
        local v26 = nil;
        v26 = v16.sideBar.Closed:connect(function() --[[ Line: 78 ]]
            -- upvalues: v26 (ref), v16 (copy), l_SelectedCoreObject_0 (copy), l_GuiService_0 (ref)
            v26:disconnect();
            v16.props.closeSideBar();
            if v16.props.playerListVisible then
                if l_SelectedCoreObject_0 and l_SelectedCoreObject_0.Parent then
                    l_GuiService_0.SelectedCoreObject = l_SelectedCoreObject_0;
                    return;
                else
                    v16.props.closePlayerList();
                    v16.props.openPlayerList();
                end;
            end;
        end);
        v21:OpenScreen(v16.sideBar, false);
        return;
    end;
end;
v13.didMount = function(v27) --[[ Line: 95 ]] --[[ Name: didMount ]]
    if v27.props.sideBarVisible then
        v27:openSidebar(v27.props.selectedPlayer);
    end;
end;
v13.didUpdate = function(v28, v29) --[[ Line: 101 ]] --[[ Name: didUpdate ]]
    if v28.props.sideBarVisible and v28.props.sideBarVisible ~= v29.sideBarVisible then
        v28:openSidebar(v28.props.selectedPlayer);
    end;
end;
return v6.connect(function(v30) --[[ Line: 107 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v30.playerDropDown.selectedPlayer, 
        sideBarVisible = v30.displayOptions.isTenFootInterface and v30.playerDropDown.isVisible, 
        playerListVisible = v30.displayOptions.isVisible
    };
end, function(v31) --[[ Line: 115 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        closeSideBar = function() --[[ Line: 117 ]] --[[ Name: closeSideBar ]]
            -- upvalues: v31 (copy), v9 (ref)
            return v31(v9());
        end, 
        closePlayerList = function() --[[ Line: 121 ]] --[[ Name: closePlayerList ]]
            -- upvalues: v31 (copy), v10 (ref)
            return v31(v10(false));
        end, 
        openPlayerList = function() --[[ Line: 125 ]] --[[ Name: openPlayerList ]]
            -- upvalues: v31 (copy), v10 (ref)
            return v31(v10(true));
        end
    };
end)(v13);