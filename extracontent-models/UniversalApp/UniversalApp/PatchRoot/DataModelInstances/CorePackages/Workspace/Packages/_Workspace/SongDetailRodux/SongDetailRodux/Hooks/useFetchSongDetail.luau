local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local _ = require(l_Parent_0.DiscoveryTypes);
local v7 = require(l_script_FirstAncestor_0.Thunks.ApiFetchSongDetail);
local v8 = require(l_script_FirstAncestor_0.Reducers.SongDetailReducer);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local _ = require(l_script_FirstAncestor_0.Types);
return function(v12) --[[ Line: 29 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), v7 (copy), v8 (copy), v2 (copy)
    local v13 = l_useDispatch_0();
    local v14 = l_useRoactService_0(l_RoactNetworking_0);
    local v16 = l_useSelector_0(function(v15) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v7 (ref)
        return v12 and v7.GetFetchingStatus(v15, v12) or nil;
    end);
    local v18 = l_useSelector_0(function(v17) --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v8 (ref)
        return v12 and v17.Personalization[v8.key][v12] or nil;
    end);
    local v19 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy), v13 (copy), v7 (ref), v14 (copy)
        if v12 then
            v13(v7.Fetch(v14, {
                v12
            }));
        end;
    end, {
        v13, 
        v14, 
        v12
    });
    v2.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v19 (copy)
        v19();
    end, {
        v19
    });
    return {
        fetchStatus = v16, 
        refetchSongDetail = v19, 
        songDetail = v18, 
        songId = v12
    };
end;