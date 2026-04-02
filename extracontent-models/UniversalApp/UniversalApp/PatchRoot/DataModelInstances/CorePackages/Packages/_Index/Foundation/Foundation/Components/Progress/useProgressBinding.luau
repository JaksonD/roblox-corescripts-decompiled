local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v5) --[[ Line: 10 ]] --[[ Name: useProgressBinding ]]
    -- upvalues: v3 (copy)
    if v3.isBinding(v5) then
        return v5:map(function(v6) --[[ Line: 15 ]]
            return (math.clamp(v6 / 100, 0, 1));
        end), v5 == nil;
    else
        return if v5 ~= nil then math.clamp(v5 / 100, 0, 1) else nil, v5 == nil;
    end;
end;