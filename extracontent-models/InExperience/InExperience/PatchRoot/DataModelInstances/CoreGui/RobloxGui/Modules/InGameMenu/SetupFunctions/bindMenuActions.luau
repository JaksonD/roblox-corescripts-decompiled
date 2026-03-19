local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v4 = require(l_CoreGui_0.RobloxGui.Modules.DevConsoleMaster);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Thunks.OpenSystemMenu);
local v7 = require(l_Parent_0.Thunks.CloseMenu);
local v8 = require(l_Parent_0.Actions.SetRespawning);
local v9 = require(l_Parent_0.Actions.SetCurrentPage);
local v10 = require(l_Parent_0.Actions.NavigateBack);
local v11 = require(l_Parent_0.Actions.SetCurrentZone);
local v12 = require(l_Parent_0.Components.Pages);
local v13 = require(l_Parent_0.Resources.Constants);
return function(v14) --[[ Line: 31 ]] --[[ Name: bindMenuActions ]]
    -- upvalues: v12 (copy), v9 (copy), v13 (copy), v6 (copy), v7 (copy), l_ContextActionService_0 (copy), v4 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), v8 (copy), v10 (copy), v11 (copy)
    l_ContextActionService_0:BindCoreAction("ToggleInGameMenu", function(_, v16, _) --[[ Line: 32 ]] --[[ Name: toggleMenuFunc ]]
        -- upvalues: v14 (copy), v12 (ref), v9 (ref), v13 (ref), v6 (ref), v7 (ref)
        if v16 ~= Enum.UserInputState.Begin then
            return;
        else
            local v18 = v14:getState();
            local l_isMenuOpen_0 = v18.isMenuOpen;
            local v20 = v12.pagesByKey[v18.menuPage];
            if v20 and v20.isModal then
                v14:dispatch(v9(v13.defaultPageKey));
                return;
            elseif l_isMenuOpen_0 then
                if v18.menuPage == v13.InitalPageKey then
                    v14:dispatch(v6(v13.AnalyticsMenuOpenTypes.Keyboard));
                    return;
                else
                    v14:dispatch(v7);
                    return;
                end;
            else
                v14:dispatch(v6(v13.AnalyticsMenuOpenTypes.Keyboard));
                return;
            end;
        end;
    end, false, Enum.KeyCode.Escape);
    l_ContextActionService_0:BindCoreAction("ToggleDeveloperConsole", function(v21, v22) --[[ Line: 59 ]]
        -- upvalues: v4 (ref)
        if v21 ~= "ToggleDeveloperConsole" then
            return;
        elseif v22 ~= Enum.UserInputState.Begin then
            return;
        else
            v4:ToggleVisibility();
            return;
        end;
    end, false, Enum.KeyCode.F9);
    l_ContextActionService_0:BindCoreAction("TogglePerformanceStats", function(v23, v24) --[[ Line: 71 ]]
        -- upvalues: l_UserInputService_0 (ref), l_UserGameSettings_0 (ref)
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) then
            return Enum.ContextActionResult.Pass;
        elseif v23 ~= "TogglePerformanceStats" then
            return;
        elseif v24 ~= Enum.UserInputState.Begin then
            return;
        else
            l_UserGameSettings_0.PerformanceStatsVisible = not l_UserGameSettings_0.PerformanceStatsVisible;
            return;
        end;
    end, false, Enum.KeyCode.F7);
    l_ContextActionService_0:BindCoreAction("LeaveGame", function(_, v26, _) --[[ Line: 90 ]] --[[ Name: leaveGameFunc ]]
        -- upvalues: v14 (copy), v12 (ref), v9 (ref), v13 (ref)
        local v28 = v14:getState();
        if v26 ~= Enum.UserInputState.Begin or not v28.isMenuOpen then
            return Enum.ContextActionResult.Pass;
        elseif v12.pagesByKey[v28.menuPage].isModal then
            return Enum.ContextActionResult.Pass;
        else
            v14:dispatch(v9(v13.LeaveGamePromptPageKey));
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.L, Enum.KeyCode.ButtonX);
    l_ContextActionService_0:BindCoreAction("ResetCharacter", function(_, v30, _) --[[ Line: 107 ]] --[[ Name: resetCharacterFunc ]]
        -- upvalues: v14 (copy), v12 (ref), v13 (ref), v8 (ref)
        local v32 = v14:getState();
        if v30 ~= Enum.UserInputState.Begin or not v32.isMenuOpen then
            return Enum.ContextActionResult.Pass;
        elseif not v32.respawn.enabled then
            return Enum.ContextActionResult.Pass;
        elseif v12.pagesByKey[v32.menuPage].isModal then
            return Enum.ContextActionResult.Pass;
        elseif v32.menuPage == v13.InitalPageKey then
            return Enum.ContextActionResult.Pass;
        else
            v14:dispatch(v8(true));
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("NavigateBack", function(_, v34, _) --[[ Line: 132 ]] --[[ Name: navigateBackFunc ]]
        -- upvalues: v14 (copy), v12 (ref), v4 (ref), v7 (ref), v10 (ref)
        local v36 = v14:getState();
        local l_parentPage_0 = v12.pagesByKey[v36.menuPage].parentPage;
        local l_v4_Visibility_0 = v4:GetVisibility();
        if v34 ~= Enum.UserInputState.End or not v36.isMenuOpen and not l_v4_Visibility_0 then
            return Enum.ContextActionResult.Pass;
        else
            if l_v4_Visibility_0 then
                v4:SetVisibility(false);
            elseif l_parentPage_0 == nil and not v36.respawn.dialogOpen then
                v14:dispatch(v7);
            else
                v14:dispatch(v10());
            end;
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.ButtonB);
    local function _() --[[ Line: 159 ]] --[[ Name: canBumperSwitch ]]
        -- upvalues: v14 (copy)
        local v39 = v14:getState();
        local v40 = false;
        if v39.menuPage ~= "Controls" then
            v40 = v39.isMenuOpen and not v39.respawn.dialogOpen and not v39.report.dialogOpen and not v39.report.reportSentOpen;
        end;
        return v40;
    end;
    l_ContextActionService_0:BindCoreAction("LeftBumperSwitchToZone0", function(_, v43, _) --[[ Line: 169 ]]
        -- upvalues: v14 (copy), v11 (ref)
        if v43 == Enum.UserInputState.Begin then
            local v45 = v14:getState();
            local v46 = false;
            if v45.menuPage ~= "Controls" then
                v46 = v45.isMenuOpen and not v45.respawn.dialogOpen and not v45.report.dialogOpen and not v45.report.reportSentOpen;
            end;
            if v46 then
                v14:dispatch(v11(0));
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end, false, Enum.KeyCode.ButtonL1);
    l_ContextActionService_0:BindCoreAction("RightBumperSwitchToZone1", function(_, v48, _) --[[ Line: 179 ]]
        -- upvalues: v14 (copy), v11 (ref)
        if v48 == Enum.UserInputState.Begin then
            local v50 = v14:getState();
            local v51 = false;
            if v50.menuPage ~= "Controls" then
                v51 = v50.isMenuOpen and not v50.respawn.dialogOpen and not v50.report.dialogOpen and not v50.report.reportSentOpen;
            end;
            if v51 then
                v14:dispatch(v11(1));
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end, false, Enum.KeyCode.ButtonR1);
end;