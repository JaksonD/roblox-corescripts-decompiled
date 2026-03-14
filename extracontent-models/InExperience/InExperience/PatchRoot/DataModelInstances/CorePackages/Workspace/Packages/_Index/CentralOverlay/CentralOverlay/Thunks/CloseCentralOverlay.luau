local l_script_FirstAncestor_0 = script:FindFirstAncestor("CentralOverlay");
local v1 = require(l_script_FirstAncestor_0.Actions.SetCentralOverlay);
return function() --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v2) --[[ Line: 5 ]]
        -- upvalues: v1 (ref)
        if v2:getState().CentralOverlay.Configs.DisableBackButtonClose then
            return;
        else
            v2:dispatch(v1());
            return;
        end;
    end;
end;