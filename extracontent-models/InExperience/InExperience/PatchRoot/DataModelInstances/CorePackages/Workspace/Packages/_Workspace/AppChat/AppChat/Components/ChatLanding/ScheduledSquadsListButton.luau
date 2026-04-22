local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Squads);
local v5 = require(l_Parent_0.SquadsCore);
local v6 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local l_ScheduledSquadActionEnum_0 = v4.Enums.ScheduledSquadActionEnum;
local l_EventNames_0 = v5.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v5.SquadExternalContractProvider.SquadExternalContractContext;
local l_useCurrentSquadId_0 = v5.Hooks.useCurrentSquadId;
local l_IconButton_0 = v2.IconButton;
local l_ScheduledSquadsListSheet_0 = require(l_Parent_0.Squads).ScheduledSquadsListSheet;
return function(v14) --[[ Line: 33 ]]
    -- upvalues: l_useCurrentSquadId_0 (copy), v3 (copy), l_SquadExternalContractContext_0 (copy), l_EventNames_0 (copy), l_ScheduledSquadActionEnum_0 (copy), l_IconButton_0 (copy), v2 (copy), v7 (copy), v6 (copy), l_ScheduledSquadsListSheet_0 (copy)
    local v15 = l_useCurrentSquadId_0();
    local v16 = v3.useContext(l_SquadExternalContractContext_0);
    local v17, v18 = v3.useState(false);
    local v19 = v3.useCallback(function() --[[ Line: 39 ]]
        -- upvalues: v16 (copy), l_EventNames_0 (ref), l_ScheduledSquadActionEnum_0 (ref), v14 (copy), v15 (copy), v18 (copy)
        v16.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = l_ScheduledSquadActionEnum_0.ViewSubscribedScheduledSquadsList, 
            source = v14.source, 
            squadId = v15, 
            squadLocation = v16.squadLocation
        });
        v18(true);
    end, {
        v15, 
        v18, 
        v16.fireSquadAnalytics, 
        v16.squadLocation
    });
    local v20 = v3.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v18 (copy)
        v18(false);
    end, {
        v18
    });
    return v3.createElement(v3.Fragment, nil, {
        ScheduledSquadsListButton = v3.createElement(l_IconButton_0, {
            icon = v2.Enums.IconName.Calendar, 
            LayoutOrder = v14.layoutOrder, 
            onActivated = v19, 
            testId = if v7 then v6.chatLandingTopBarIconButton("scheduledSquads") else nil
        }), 
        ScheduledSquadsListSheet = v3.createElement(l_ScheduledSquadsListSheet_0, {
            isOpen = v17, 
            onClose = v20
        })
    });
end;