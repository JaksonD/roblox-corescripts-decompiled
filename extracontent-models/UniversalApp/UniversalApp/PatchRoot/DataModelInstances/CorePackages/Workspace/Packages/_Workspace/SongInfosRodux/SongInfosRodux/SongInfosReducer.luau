local l_Parent_0 = script:FindFirstAncestor("SongInfosRodux").Parent;
local v1 = require(script.Parent.AddSongs);
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
return {
    key = "SongInfosKey", 
    reducer = function(v4, v5) --[[ Line: 12 ]]
        -- upvalues: v1 (copy), v2 (copy)
        v4 = v4 or {};
        assert(v4, "");
        if v5 and v5.type == v1.name then
            local v6 = {};
            for v7, _ in pairs(v5.songs) do
                if v4[v7] then
                    v6[v7] = v2.Dictionary.join(v4[v7], v5.songs[v7]);
                else
                    v6[v7] = v5.songs[v7];
                end;
            end;
            v4 = v2.Dictionary.join(v4, v6);
        end;
        return v4;
    end
};