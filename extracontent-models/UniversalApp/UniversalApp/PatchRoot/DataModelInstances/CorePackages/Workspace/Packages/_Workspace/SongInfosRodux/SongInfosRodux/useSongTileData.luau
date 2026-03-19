local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongInfosRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v3 = require(l_script_FirstAncestor_0.SongInfosReducer);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useSongAlbumArt_0 = require(l_Parent_0.Songbird).useSongAlbumArt;
local v6 = require(l_Parent_0.tutils);
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_useSongAlbumArt_0 (copy), l_useSelector_0 (copy), v3 (copy), v6 (copy)
    local v8 = l_useSongAlbumArt_0(v7);
    return {
        song = l_useSelector_0(function(v9) --[[ Line: 21 ]]
            -- upvalues: v3 (ref), v7 (copy)
            return v9.Personalization[v3.key][v7];
        end, v6.shallowEqual), 
        thumbnail = v8.value
    };
end;