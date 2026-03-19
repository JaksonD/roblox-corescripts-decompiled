local l_Parent_0 = script:FindFirstAncestor("GameInfosRodux").Parent;
local v1 = require(script.Parent.AddGames);
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local function v9(v4, v5) --[[ Line: 12 ]] --[[ Name: getMergedState ]]
    -- upvalues: v2 (copy)
    local v6 = {};
    for v7, _ in pairs(v5) do
        if v4[v7] then
            v6[v7] = v2.Dictionary.join(v4[v7], v5[v7]);
        else
            v6[v7] = v5[v7];
        end;
    end;
    return (v2.Dictionary.join(v4, v6));
end;
return {
    key = "GameInfosKey", 
    reducer = function(v10, v11) --[[ Line: 26 ]]
        -- upvalues: v1 (copy), v9 (copy)
        v10 = v10 or {};
        assert(v10, "");
        if v11.type == v1.name then
            v10 = v9(v10, v11.games);
        end;
        return v10;
    end
};