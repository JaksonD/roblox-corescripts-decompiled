local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.AddSongDetail);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
return {
    key = "SongDetailKey", 
    reducer = function(v5, v6) --[[ Line: 12 ]]
        -- upvalues: v2 (copy), v3 (copy)
        v5 = v5 or {};
        assert(v5, "");
        if v6 and v6.type == v2.name then
            local v7 = {};
            for v8, _ in pairs(v6.songDetail) do
                if v5[v8] then
                    v7[v8] = v3.Dictionary.join(v5[v8], v6.songDetail[v8]);
                else
                    v7[v8] = v6.songDetail[v8];
                end;
            end;
            v5 = v3.Dictionary.join(v5, v7);
        end;
        return v5;
    end
};