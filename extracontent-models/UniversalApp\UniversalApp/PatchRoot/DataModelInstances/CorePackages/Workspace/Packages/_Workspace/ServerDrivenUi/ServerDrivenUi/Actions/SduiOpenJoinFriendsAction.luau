local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v3.SduiActionType;
local l_SduiErrorType_0 = v3.SduiErrors.SduiErrorType;
return function(v6, _, v8, v9) --[[ Line: 15 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    local v10 = v6 and v6.actionParams or nil;
    if v10 == nil then
        v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenJoinFriends, 
            message = "Missing actionParams"
        }, v8.appPage);
        return;
    else
        assert(v10, "actionParams must exist");
        local l_placeId_0 = v10.placeId;
        if l_placeId_0 == nil then
            v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenJoinFriends, 
                message = ("Missing placeId: %*"):format(l_placeId_0), 
                propName = "placeId"
            }, v8.appPage);
            return;
        else
            local l_universeId_0 = v10.universeId;
            if l_universeId_0 == nil then
                v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.OpenJoinFriends, 
                    message = ("Missing universeId: %*"):format(l_universeId_0), 
                    propName = "universeId"
                }, v8.appPage);
                return;
            elseif v9 then
                local l_AbsoluteSize_0 = v9.AbsoluteSize;
                local l_AbsolutePosition_0 = v9.AbsolutePosition;
                local v15 = {
                    placeId = tostring(l_placeId_0), 
                    universeId = tostring(l_universeId_0)
                };
                v8.dependencies.dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.PlacesList, {
                    game = v15, 
                    anchorSpaceSize = l_AbsoluteSize_0, 
                    anchorSpacePosition = l_AbsolutePosition_0
                }));
                return;
            else
                v8.dependencies.logger.reportError(l_SduiErrorType_0.FailedToExecuteAction, {
                    name = l_SduiActionType_0.OpenJoinFriends, 
                    message = "Failed to execute -- missing guiObject anchor"
                }, v8.appPage);
                return;
            end;
        end;
    end;
end;