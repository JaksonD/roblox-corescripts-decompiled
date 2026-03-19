local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Types.ErrorKind);
local v3 = require(l_Parent_0.LuauPolyfill);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        kind = v5, 
        data = v6
    }, v4));
end;
v4.match = function(v7) --[[ Line: 32 ]] --[[ Name: match ]]
    -- upvalues: v3 (copy), v4 (copy)
    return v3.instanceof(v7, v4);
end;
v4.matchAbandoned = function(v8) --[[ Line: 36 ]] --[[ Name: matchAbandoned ]]
    -- upvalues: v4 (copy), v2 (copy)
    return v4.match(v8) and v8.kind == v2.Abandoned;
end;
return v4;