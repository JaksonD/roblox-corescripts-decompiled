local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local v1 = require(l_script_FirstAncestor_0.Http.PostReactivateAccount);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local l_SetModerationStatus_0 = require(l_Parent_0.NotApprovedPageState).SetModerationStatus;
local l_GuiService_0 = game:GetService("GuiService");
return function(v7, v8) --[[ Line: 12 ]] --[[ Name: ReactivateAccount ]]
    -- upvalues: v1 (copy), l_SetModerationStatus_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), v3 (copy)
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v7 (copy), v8 (copy), l_SetModerationStatus_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref), v3 (ref)
        return v1(v7, v8):andThen(function(_) --[[ Line: 14 ]]
            -- upvalues: v9 (copy), l_SetModerationStatus_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref), v3 (ref)
            v9:dispatch(l_SetModerationStatus_0(false));
            l_GuiService_0:BroadcastNotification("", l_NotificationType_0.RESTART_LUA_APP);
            return v3.resolve();
        end, function(v11) --[[ Line: 18 ]]
            -- upvalues: v3 (ref)
            return v3.reject({
                error = v11
            });
        end);
    end;
end;