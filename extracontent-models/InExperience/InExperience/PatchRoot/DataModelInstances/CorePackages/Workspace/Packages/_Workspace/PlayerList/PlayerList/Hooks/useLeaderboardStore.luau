local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Common.LeaderboardStoreContext);
return function() --[[ Line: 8 ]] --[[ Name: useLeaderboardStore ]]
    -- upvalues: v2 (copy), v3 (copy)
    return (v2.useContext(v3));
end;