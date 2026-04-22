local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v1.SduiActionType;
local l_SduiErrorType_0 = v1.SduiErrors.SduiErrorType;
local v4 = require(l_Parent_0.GameInvite);
local l_GameInviteModalManager_0 = v4.GameInviteModalManager;
local l_GameInviteAnalyticsManager_0 = v4.GameInviteAnalyticsManager;
return function(v7, _, v9) --[[ Line: 16 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_GameInviteAnalyticsManager_0 (copy), l_GameInviteModalManager_0 (copy)
    local v10 = v7 and v7.actionParams or nil;
    if v10 == nil then
        v9.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenGameInvite, 
            message = "Missing actionParams"
        }, v9.appPage);
        return;
    else
        assert(v10, "actionParams must exist");
        local l_universeId_0 = v10.universeId;
        local l_rootPlaceId_0 = v10.rootPlaceId;
        local l_trigger_0 = v10.trigger;
        local l_buttonName_0 = v10.buttonName;
        if typeof(l_rootPlaceId_0) ~= "string" or l_rootPlaceId_0 == "" then
            v9.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenGameInvite, 
                message = ("Invalid or missing rootPlaceId: %*"):format(l_rootPlaceId_0), 
                propName = "rootPlaceId"
            }, v9.appPage);
            return;
        elseif typeof(l_trigger_0) ~= "string" or l_trigger_0 == "" then
            v9.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenGameInvite, 
                message = ("Invalid or missing trigger: %*"):format(l_trigger_0), 
                propName = "trigger"
            }, v9.appPage);
            return;
        else
            if typeof(l_buttonName_0) == "string" and l_buttonName_0 ~= "" then
                l_GameInviteAnalyticsManager_0:withButtonName(l_buttonName_0);
                l_GameInviteAnalyticsManager_0:inputShareGameEntryPoint(l_rootPlaceId_0, l_universeId_0);
            end;
            l_GameInviteModalManager_0:openModal({
                trigger = l_trigger_0, 
                rootPlaceId = l_rootPlaceId_0, 
                universeId = l_universeId_0
            });
            return;
        end;
    end;
end;