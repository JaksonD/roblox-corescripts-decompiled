local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrorType_0 = v3.SduiErrors.SduiErrorType;
local l_SduiActionType_0 = v3.SduiActionType;
return function(v6, _, v8, _) --[[ Line: 15 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v10 = v6 and v6.actionParams or nil;
    if v10 == nil then
        v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenProfile, 
            message = "Missing actionParams"
        }, v8.appPage);
        return;
    else
        assert(v10, "actionParams must exist");
        local l_profileId_0 = v10.profileId;
        if l_profileId_0 == nil then
            v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenProfile, 
                message = "Missing actionParam: profileId", 
                propName = "profileId"
            }, v8.appPage);
            return;
        else
            local l_profileType_0 = v10.profileType;
            if l_profileType_0 == nil then
                v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.OpenProfile, 
                    message = "Missing actionParam: profileType", 
                    propName = "profileType"
                }, v8.appPage);
                return;
            else
                local v13 = l_profileType_0 == "Group" and "Community" or l_profileType_0;
                v8.dependencies.dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.ProfilePlatform, 
                    detail = l_profileId_0, 
                    extraProps = {
                        profileType = v13, 
                        source = v10.source
                    }
                }));
                return;
            end;
        end;
    end;
end;