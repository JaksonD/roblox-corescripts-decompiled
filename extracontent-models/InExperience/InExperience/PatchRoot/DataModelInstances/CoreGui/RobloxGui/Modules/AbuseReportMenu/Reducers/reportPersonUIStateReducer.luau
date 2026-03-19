local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_PlayerMenuActions_0 = v2.PlayerMenuActions;
local l_FFlagInGameMenuAddChatLineReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting;
return function(v6, v7) --[[ Line: 11 ]] --[[ Name: reportPersonUIStateReducer ]]
    -- upvalues: l_PlayerMenuActions_0 (copy), v2 (copy), l_FFlagInGameMenuAddChatLineReporting_0 (copy)
    local v8 = table.clone(v6);
    local l_type_0 = v7.type;
    if l_type_0 == l_PlayerMenuActions_0.UpdateAbuseReason then
        v8.abuseReason = v7.abuseReason;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdateComment then
        v8.comment = v7.comment;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdateMethodOfAbuse then
        v8.playerObjects = {};
        v8.abuseReason = nil;
        v8.methodOfAbuse = v7.methodOfAbuse;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdateAbuser then
        v8.allegedAbuserId = v7.abuseId;
        v8.allegedAbuser = v7.abuser;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.UpdatePlayerNameMap then
        v8.playerObjects = v7.playerObjects;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.SetVoiceEnabled then
        v8.isVoiceEnabled = v7.enabled;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.SetMenuOpenTimestamp then
        v8.menuOpenedUnixTimestampMilliseconds = v7.timestamp;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.ClearState then
        return (table.clone(v2.InitPersonUIState));
    elseif l_type_0 == l_PlayerMenuActions_0.SetShowModalSelector then
        v8.isModalSelectorShown = v7.isShown;
        v8.modalSelectorCellData = v7.cellData;
        return v8;
    elseif l_type_0 == l_PlayerMenuActions_0.SetPreselectedPlayer then
        v8.preselectedPlayer = v7.player;
        return v8;
    else
        if l_FFlagInGameMenuAddChatLineReporting_0 and l_type_0 == l_PlayerMenuActions_0.UpdatedSelectedChatAndOrderedMessages then
            v8.selectedMessage = v7.selectedMessage;
            v8.orderedMessages = v7.orderedMessages;
        end;
        return v8;
    end;
end;