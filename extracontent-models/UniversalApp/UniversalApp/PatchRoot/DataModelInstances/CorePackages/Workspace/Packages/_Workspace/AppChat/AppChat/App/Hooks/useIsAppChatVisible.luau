local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.App.AppChatVisible);
local l_useExternalEvent_0 = require(l_Parent_0.RoactUtils).Hooks.useExternalEvent;
local l_useState_0 = v2.useState;
local l_useCallback_0 = v2.useCallback;
return function(v7) --[[ Line: 14 ]] --[[ Name: useIsAppChatVisible ]]
    -- upvalues: l_useState_0 (copy), l_useExternalEvent_0 (copy), v3 (copy), l_useCallback_0 (copy)
    local v8, v9 = l_useState_0(v7 or false);
    l_useExternalEvent_0(v3.BindableEvent.Event, function(v10) --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v9 (copy)
        if v10 ~= v8 then
            v9(v10);
        end;
    end, {
        v8
    });
    return v8, (l_useCallback_0(function() --[[ Line: 23 ]]
        -- upvalues: v9 (copy)
        v9(false);
    end, {
        v9
    }));
end;