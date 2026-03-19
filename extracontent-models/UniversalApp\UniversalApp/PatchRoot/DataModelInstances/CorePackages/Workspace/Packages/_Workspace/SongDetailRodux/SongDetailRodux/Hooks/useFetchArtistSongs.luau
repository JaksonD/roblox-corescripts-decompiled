local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v8 = require(l_script_FirstAncestor_0.Thunks.ApiFetchArtistSongs);
local v9 = require(l_script_FirstAncestor_0.Reducers.ArtistSongReducer);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v11) --[[ Line: 25 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), v8 (copy), v9 (copy), v2 (copy)
    local v12 = l_useDispatch_0();
    local v13 = l_useRoactService_0(l_RoactNetworking_0);
    local v15 = l_useSelector_0(function(v14) --[[ Line: 29 ]]
        -- upvalues: v11 (copy), v8 (ref)
        return v11 and v8.GetFetchingStatus(v14, v11) or nil;
    end);
    local v17 = l_useSelector_0(function(v16) --[[ Line: 33 ]]
        -- upvalues: v11 (copy), v9 (ref)
        return v11 and v16.Personalization[v9.key][v11] or {};
    end);
    local v18 = v2.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v11 (copy), v12 (copy), v8 (ref), v13 (copy)
        if v11 then
            v12(v8.Fetch(v13, v11));
        end;
    end, {
        v12, 
        v13, 
        v11
    });
    v2.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v18 (copy)
        v18();
    end, {
        v18
    });
    return {
        artistSongIds = v17, 
        fetchStatus = v15, 
        refetchArtistSongs = v18
    };
end;