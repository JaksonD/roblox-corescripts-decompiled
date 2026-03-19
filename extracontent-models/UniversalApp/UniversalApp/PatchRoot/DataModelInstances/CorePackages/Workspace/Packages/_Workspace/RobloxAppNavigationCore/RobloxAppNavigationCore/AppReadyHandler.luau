local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppGuiService_0 = require(l_Parent_0.RoactServiceTags).AppGuiService;
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local function v6(v7) --[[ Line: 13 ]] --[[ Name: AppReadyHandler ]]
    -- upvalues: v1 (copy), l_NotificationType_0 (copy), v6 (copy)
    v1.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v7 (copy), l_NotificationType_0 (ref)
        if v7.state.routeName ~= nil then
            v7.guiService:BroadcastNotification(v7.state.routeName, l_NotificationType_0.APP_READY);
        end;
    end, {
        v7.state.routeName
    });
    if v7.state.routes ~= nil then
        return v1.createElement(v6, {
            state = v7.state.routes[v7.state.index], 
            guiService = v7.guiService
        });
    else
        return nil;
    end;
end;
return function(_) --[[ Line: 31 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppGuiService_0 (copy), v1 (copy), v6 (copy)
    local v9 = l_useNavigation_0();
    local v10 = l_useRoactService_0(l_AppGuiService_0);
    return v1.createElement(v6, {
        state = v9.state, 
        guiService = v10
    });
end;