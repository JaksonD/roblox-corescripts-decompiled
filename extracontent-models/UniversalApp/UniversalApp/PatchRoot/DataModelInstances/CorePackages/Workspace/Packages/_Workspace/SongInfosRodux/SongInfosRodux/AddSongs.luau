local l_Parent_0 = script:FindFirstAncestor("SongInfosRodux").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
return l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 11 ]]
    -- upvalues: l_FFlagEnableTopSongsSort_0 (copy)
    assert(l_FFlagEnableTopSongsSort_0, "FFlagEnableTopSongsSort must be enabled to use AddSongs action");
    assert(type(v4) == "table", string.format("AddSongs action expects songs to be a table, was %s", (type(v4))));
    return {
        songs = v4
    };
end);