local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(script.Parent.DefaultSquadContract);
local _ = require(script.Parent.SquadContractType);
local v3 = require(l_Parent_0.Cryo);
return function(v4) --[[ Line: 30 ]]
    -- upvalues: v3 (copy), v1 (copy)
    return v3.Dictionary.union(v1, v4);
end;