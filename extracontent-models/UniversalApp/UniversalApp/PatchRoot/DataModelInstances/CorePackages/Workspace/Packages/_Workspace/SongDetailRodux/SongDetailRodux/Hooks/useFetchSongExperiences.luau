local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Thunks.ApiFetchSongExperiences);
local v7 = require(l_script_FirstAncestor_0.Reducers.SongExperiencesReducer);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local _ = require(l_Parent_0.DiscoveryTypes);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v13) --[[ Line: 31 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), v6 (copy), v7 (copy), l_GameInfosReducer_0 (copy), v2 (copy)
    local v14 = l_useDispatch_0();
    local v15 = l_useRoactService_0(l_RoactNetworking_0);
    local v17 = l_useSelector_0(function(v16) --[[ Line: 35 ]]
        -- upvalues: v13 (copy), v6 (ref)
        return v13 and v6.GetFetchingStatus(v16, v13) or nil;
    end);
    local v24 = l_useSelector_0(function(v18) --[[ Line: 39 ]]
        -- upvalues: v13 (copy), v7 (ref), l_GameInfosReducer_0 (ref)
        if not v13 then
            return {};
        else
            local v19 = v18.Personalization[v7.key][v13];
            if not v19 then
                return {};
            else
                local v20 = {};
                for _, v22 in v19 do
                    local v23 = v18.Personalization[l_GameInfosReducer_0.key][v22];
                    if v23 then
                        table.insert(v20, v23);
                    end;
                end;
                return v20;
            end;
        end;
    end);
    local v25 = v2.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v13 (copy), v14 (copy), v6 (ref), v15 (copy)
        if v13 then
            v14(v6.Fetch(v15, v13));
        end;
    end, {
        v14, 
        v15, 
        v13
    });
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v25 (copy)
        v25();
    end, {
        v25
    });
    return {
        fetchStatus = v17, 
        refetchSongExperiences = v25, 
        songExperiences = v24
    };
end;