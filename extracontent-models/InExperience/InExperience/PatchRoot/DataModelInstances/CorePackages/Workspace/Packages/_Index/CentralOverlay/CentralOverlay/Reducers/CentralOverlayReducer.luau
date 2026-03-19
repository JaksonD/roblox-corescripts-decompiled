local l_script_FirstAncestor_0 = script:FindFirstAncestor("CentralOverlay");
local v1 = require(l_script_FirstAncestor_0.Actions.SetCentralOverlay);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or {
        OverlayType = nil, 
        Arguments = {}, 
        Configs = {}
    };
    if v3.type == v1.name then
        v2 = {
            OverlayType = v3.overlayType, 
            Arguments = v3.arguments and v3.arguments or {}, 
            Configs = v3.configs and v3.configs or {}
        };
    end;
    return v2;
end;