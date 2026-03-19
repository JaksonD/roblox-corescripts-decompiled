local l_script_FirstAncestor_0 = script:FindFirstAncestor("QueryRefetch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_GetFFlagLuaAppPostAppInteractiveLoader_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPostAppInteractiveLoader;
local v4 = require(l_script_FirstAncestor_0.Hooks.usePlatformNameQueryRefetch);
local l_NotificationService_0 = game:GetService("NotificationService");
local l_RobloxEventReceiver_0 = require(l_Parent_0.RobloxEventReceiver).RobloxEventReceiver;
return function(v7) --[[ Line: 16 ]] --[[ Name: QueryRefetchManager ]]
    -- upvalues: l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v2 (copy), l_RobloxEventReceiver_0 (copy), l_NotificationService_0 (copy), v4 (copy)
    local v8 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then v2.useMemo(function() --[[ Line: 18 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), l_NotificationService_0 (ref)
        return l_RobloxEventReceiver_0.new(l_NotificationService_0);
    end, {}) else v7.robloxEventReceiver;
    v4(v8);
    return nil;
end;