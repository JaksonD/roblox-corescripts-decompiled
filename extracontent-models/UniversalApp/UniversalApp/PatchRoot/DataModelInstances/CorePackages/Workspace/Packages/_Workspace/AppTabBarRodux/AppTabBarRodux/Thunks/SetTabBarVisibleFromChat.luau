local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppTabBarRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_script_FirstAncestor_0.Actions.SetTabBarVisible);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.isType(v4, "boolean", "SetTabBarVisibleFromChat.isVisible");
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v3 (ref)
        local v6 = v5:getState();
        if not v6.ChatAppReducer.ToggleChatPaused and v6.TabBarVisible ~= v4 then
            v5:dispatch(v3(v4));
        end;
    end;
end;