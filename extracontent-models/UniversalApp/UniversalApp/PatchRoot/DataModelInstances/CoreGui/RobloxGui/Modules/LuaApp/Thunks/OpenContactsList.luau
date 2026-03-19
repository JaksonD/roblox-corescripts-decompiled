local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v1 = require(l_script_FirstAncestor_0.LuaApp.Actions.SetCentralOverlay);
local v2 = require(l_script_FirstAncestor_0.LuaApp.Enum.OverlayType);
return function(v3) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 15 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (copy)
        v4:dispatch(v1(v2.ContactsList, v3));
    end;
end;