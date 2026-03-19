local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v3.SduiActionType;
local l_SduiErrorType_0 = v3.SduiErrors.SduiErrorType;
return function(v6, _, v8) --[[ Line: 17 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v9 = v6 and v6.actionParams or nil;
    if v9 == nil then
        v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenSeeAll, 
            message = "Missing actionParams"
        }, v8.appPage);
        return;
    else
        assert(v9, "actionParams must exist");
        local v10 = tostring(v9.collectionId);
        if v10 == nil then
            v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenSeeAll, 
                message = ("Missing collectionId: %*"):format(v10), 
                propName = "collectionId"
            }, v8.appPage);
            return;
        else
            local l_collectionPosition_0 = v9.collectionPosition;
            local v12 = v8.appPage == "Home";
            v8.dependencies.gameAnalytics.reportSeeAllWithId(v10, v9.gameSetTargetId, l_collectionPosition_0);
            v8.dependencies.dispatch(l_NavigateDown_0({
                name = l_AppPage_0.GamesList, 
                detail = v10, 
                extraProps = {
                    sortPageId = tostring(v10), 
                    sortName = v10, 
                    pageContext = v8.appPage, 
                    isOmni = v12, 
                    sortIndex = if v12 then tonumber(l_collectionPosition_0) else nil
                }
            }));
            return;
        end;
    end;
end;