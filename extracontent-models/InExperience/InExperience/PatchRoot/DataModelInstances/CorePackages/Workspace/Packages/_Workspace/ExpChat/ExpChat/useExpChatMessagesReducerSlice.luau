local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactUtils);
local v3 = require(l_Parent_0.tutils);
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
local _ = require(l_script_FirstAncestor_0.installReducer.Messages);
return function() --[[ Line: 14 ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy)
    return (l_useSelector_0(function(v6) --[[ Line: 15 ]]
        return v6.Messages;
    end, v3.shallowEqual));
end;