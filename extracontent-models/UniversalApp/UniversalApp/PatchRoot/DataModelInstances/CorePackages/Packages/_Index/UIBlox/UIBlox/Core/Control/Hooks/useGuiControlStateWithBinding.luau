local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_1.Core.Control.Enum.ControlState);
local v5 = require(l_Parent_0.Control.Hooks.useGuiControlState);
return function(v6, v7, v8) --[[ Line: 14 ]] --[[ Name: useGuiControlStateWithBinding ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    local v9, v10 = v3.useBinding(v4.Initialize);
    local v13 = v3.useCallback(function(v11, v12) --[[ Line: 20 ]]
        -- upvalues: v10 (copy), v7 (copy)
        v10((tostring(v12)));
        if v7 then
            v7(v11, v12);
        end;
    end, {});
    local v14, _ = v5(v6, v13, v8);
    return v14, v9;
end;