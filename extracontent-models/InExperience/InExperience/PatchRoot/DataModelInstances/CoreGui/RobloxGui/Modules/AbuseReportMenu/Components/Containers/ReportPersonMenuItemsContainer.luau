local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.MenuConfigs.getMenuItemsFromConfigs);
local v7 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Components.Constants);
local v10 = require(l_script_FirstAncestor_0.MenuConfigs.Players.ReportPlayerMenuItemConfigList);
local v11 = require(l_script_FirstAncestor_0.Reducers.reportPersonUIStateReducer);
local v12 = require(l_script_FirstAncestor_0.Utility.handlePreselectedPlayer);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local _ = require(l_RobloxGui_0.Modules.VoiceChat.VoiceUsersByProximity);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore).Constants;
local l_PlayerMenuActions_0 = v9.PlayerMenuActions;
local v17 = game:DefineFastFlag("PreselectedPlayerReportBugfix", false);
local function v20(v18, v19) --[[ Line: 31 ]] --[[ Name: alphabeticalSort ]]
    return v18.Name:lower() < v19.Name:lower();
end;
return function(v21) --[[ Line: 35 ]] --[[ Name: ReportPersonMenuItemsContainer ]]
    -- upvalues: v7 (copy), v4 (copy), v11 (copy), v9 (copy), v17 (copy), l_default_0 (copy), l_Constants_0 (copy), v12 (copy), l_PlayerMenuActions_0 (copy), v20 (copy), l_Players_0 (copy), v5 (copy), v6 (copy), v10 (copy)
    local v22 = v7();
    local v23, v24 = v4.useReducer(v11, v9.InitPersonUIState);
    v4.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v21 (copy), v9 (ref), v17 (ref), l_default_0 (ref), l_Constants_0 (ref), v12 (ref), v24 (copy), l_PlayerMenuActions_0 (ref)
        if v21.utilityProps.isReportTabVisible ~= true then
            return;
        else
            v21.utilityProps.analyticsDispatch({
                type = v9.AnalyticsActions.SwitchToPersonInitialSelections
            });
            if v17 and not (l_default_0:UserVoiceEnabled() and l_default_0:GetVoiceJoinProgress() ~= l_Constants_0.VOICE_JOIN_PROGRESS.Suspended) then
                if v21.utilityProps.preselectedPlayer then
                    v12(v21.utilityProps.preselectedPlayer, false, v24, v21.utilityProps.analyticsDispatch);
                end;
                v24({
                    type = l_PlayerMenuActions_0.SetVoiceEnabled, 
                    enabled = false
                });
                return;
            else
                l_default_0:asyncInit():andThen(function() --[[ Line: 67 ]]
                    -- upvalues: v21 (ref), v12 (ref), v24 (ref), l_PlayerMenuActions_0 (ref)
                    if v21.utilityProps.preselectedPlayer then
                        v12(v21.utilityProps.preselectedPlayer, true, v24, v21.utilityProps.analyticsDispatch);
                    end;
                    v24({
                        type = l_PlayerMenuActions_0.SetVoiceEnabled, 
                        enabled = true
                    });
                end):catch(function() --[[ Line: 81 ]]
                    -- upvalues: v21 (ref), v12 (ref), v24 (ref)
                    if v21.utilityProps.preselectedPlayer then
                        v12(v21.utilityProps.preselectedPlayer, false, v24, v21.utilityProps.analyticsDispatch);
                    end;
                end);
                return;
            end;
        end;
    end, {
        v21.utilityProps.isReportTabVisible
    });
    v4.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v23 (copy), v9 (ref), l_default_0 (ref), v20 (ref), l_Players_0 (ref), v5 (ref), v24 (copy), l_PlayerMenuActions_0 (ref)
        local v25 = {};
        if v23.methodOfAbuse == v9.AbuseMethods.VoiceChat then
            local v26 = l_default_0:getRecentUsersInteractionData();
            for _, v28 in pairs(v26) do
                table.insert(v25, v28.player);
            end;
            table.sort(v25, v20);
        elseif v23.methodOfAbuse == v9.AbuseMethods.TextChat or v23.methodOfAbuse == v9.AbuseMethods.Other or v23.methodOfAbuse == v9.AbuseMethods.Avatar or v23.methodOfAbuse == nil then
            v25 = l_Players_0:GetPlayers();
            table.sort(v25, v20);
        end;
        local v29 = false;
        local v30 = false;
        v25 = v5.List.filter(v25, function(v31) --[[ Line: 175 ]]
            -- upvalues: v23 (ref), v29 (ref), v30 (ref), l_Players_0 (ref)
            if v23.preselectedPlayer and v31.UserId == v23.preselectedPlayer.UserId then
                v29 = true;
            end;
            if v23.allegedAbuser and v31.UserId == v23.allegedAbuserId then
                v30 = true;
            end;
            local v32 = false;
            if v31 ~= l_Players_0.LocalPlayer then
                v32 = v31.UserId > 0;
            end;
            return v32;
        end);
        v24({
            type = l_PlayerMenuActions_0.UpdatePlayerNameMap, 
            playerObjects = v25
        });
        if v23.preselectedPlayer and v29 then
            v24({
                type = v9.PlayerMenuActions.UpdateAbuser, 
                abuseId = v23.preselectedPlayer.UserId, 
                abuser = v23.preselectedPlayer
            });
            v24({
                type = v9.PlayerMenuActions.SetPreselectedPlayer, 
                player = nil
            });
        elseif not v30 then
            v24({
                type = v9.PlayerMenuActions.UpdateAbuser, 
                abuseId = nil, 
                abuser = nil
            });
        end;
    end, {
        v23.methodOfAbuse, 
        v23.isVoiceEnabled, 
        v21.utilityProps.isReportTabVisible, 
        v23.preselectedPlayer
    });
    local v33 = v6(v23, v24, v21.utilityProps, v10, v21.isSmallPortraitViewport);
    local v34 = v5.Dictionary.join({
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v22.ItemPadding)
        })
    }, v33);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        MenuItems = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v34)
    });
end;