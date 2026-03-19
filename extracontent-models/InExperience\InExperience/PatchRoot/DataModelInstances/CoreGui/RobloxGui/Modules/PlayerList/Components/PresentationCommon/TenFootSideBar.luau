local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v9 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v10 = require(l_CoreGui_0.RobloxGui.Modules.isNewInGameMenuEnabled);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = v5.PureComponent:extend("TenFootSideBar");
v12.init = function(v13) --[[ Line: 22 ]] --[[ Name: init ]]
    v13.sideBar = nil;
end;
v12.render = function(_) --[[ Line: 26 ]] --[[ Name: render ]]
    return nil;
end;
v12.openSidebar = function(v15, v16) --[[ Line: 30 ]] --[[ Name: openSidebar ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), l_GuiService_0 (copy), l_RobloxGui_0 (copy), v10 (copy)
    local v17 = not l_RunService_0:IsStudio() and v16 ~= l_Players_0.LocalPlayer;
    if not v17 then
        v15.props.closeSideBar();
        return;
    else
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        local v19 = l_RobloxGui_0.Modules:FindFirstChild("ScreenManager") or l_RobloxGui_0.Modules.Shell.ScreenManager;
        local v20 = require(v19);
        local v21 = l_RobloxGui_0.Modules:FindFirstChild("LocalizedStrings") or l_RobloxGui_0.Modules.Shell.LocalizedStrings;
        local v22 = require(v21);
        if not v15.sideBar then
            local v23 = l_RobloxGui_0.Modules:FindFirstChild("SideBar") or l_RobloxGui_0.Modules.Shell.SideBar;
            v15.sideBar = require(v23)();
        end;
        v15.sideBar:RemoveAllItems();
        if v17 then
            local v24 = v22:LocalizedString("ReportPlayer");
            v15.sideBar:AddItem(v24, function() --[[ Line: 58 ]]
                -- upvalues: v15 (copy), l_GuiService_0 (ref), v10 (ref), l_RobloxGui_0 (ref), v16 (copy)
                v15.props.closePlayerList();
                l_GuiService_0.SelectedCoreObject = nil;
                if v10() then
                    require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(v16, v15.__componentName);
                    return;
                else
                    require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(v16, v15.__componentName);
                    return;
                end;
            end);
        end;
        local v25 = nil;
        v25 = v15.sideBar.Closed:connect(function() --[[ Line: 75 ]]
            -- upvalues: v25 (ref), v15 (copy), l_SelectedCoreObject_0 (copy), l_GuiService_0 (ref)
            v25:disconnect();
            v15.props.closeSideBar();
            if v15.props.playerListVisible then
                if l_SelectedCoreObject_0 and l_SelectedCoreObject_0.Parent then
                    l_GuiService_0.SelectedCoreObject = l_SelectedCoreObject_0;
                    return;
                else
                    v15.props.closePlayerList();
                    v15.props.openPlayerList();
                end;
            end;
        end);
        v20:OpenScreen(v15.sideBar, false);
        return;
    end;
end;
v12.didMount = function(v26) --[[ Line: 92 ]] --[[ Name: didMount ]]
    if v26.props.sideBarVisible then
        v26:openSidebar(v26.props.selectedPlayer);
    end;
end;
v12.didUpdate = function(v27, v28) --[[ Line: 98 ]] --[[ Name: didUpdate ]]
    if v27.props.sideBarVisible and v27.props.sideBarVisible ~= v28.sideBarVisible then
        v27:openSidebar(v27.props.selectedPlayer);
    end;
end;
return v6.connect(function(v29) --[[ Line: 104 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedPlayer = v29.playerDropDown.selectedPlayer, 
        sideBarVisible = v29.displayOptions.isTenFootInterface and v29.playerDropDown.isVisible, 
        playerListVisible = v29.displayOptions.isVisible
    };
end, function(v30) --[[ Line: 112 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v9 (copy)
    return {
        closeSideBar = function() --[[ Line: 114 ]] --[[ Name: closeSideBar ]]
            -- upvalues: v30 (copy), v8 (ref)
            return v30(v8());
        end, 
        closePlayerList = function() --[[ Line: 118 ]] --[[ Name: closePlayerList ]]
            -- upvalues: v30 (copy), v9 (ref)
            return v30(v9(false));
        end, 
        openPlayerList = function() --[[ Line: 122 ]] --[[ Name: openPlayerList ]]
            -- upvalues: v30 (copy), v9 (ref)
            return v30(v9(true));
        end
    };
end)(v12);