local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.InputTypeConstants);
local v2 = require(script.Parent.InputTypeMap);
local l_getFFlagDebugLuaAppAlwaysUseGamepad_0 = require(l_Parent_0.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad;
return function(v4) --[[ Line: 11 ]] --[[ Name: getInputGroup ]]
    -- upvalues: l_getFFlagDebugLuaAppAlwaysUseGamepad_0 (copy), v1 (copy), v2 (copy)
    if l_getFFlagDebugLuaAppAlwaysUseGamepad_0() then
        return v1.Gamepad;
    else
        return v2[v4] or v1.None;
    end;
end;