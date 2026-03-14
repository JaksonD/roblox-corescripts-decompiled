local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceSongsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v8 = require(l_script_FirstAncestor_0.Thunks.ApiFetchExperienceSongs);
local v9 = require(l_script_FirstAncestor_0.Reducers.ExperienceSongsReducer);
return function(v10) --[[ Line: 22 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), v9 (copy), v2 (copy), v8 (copy)
    local v11 = l_useDispatch_0();
    local v12 = l_useRoactService_0(l_RoactNetworking_0);
    local v14 = l_useSelector_0(function(v13) --[[ Line: 26 ]]
        -- upvalues: v9 (ref), v10 (copy)
        return v13.Personalization[v9.key] and v13.Personalization[v9.key][v10] or {};
    end);
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v11 (copy), v8 (ref), v12 (copy), v10 (copy)
        v11(v8.Fetch(v12, v10));
    end, {
        v11, 
        v12, 
        v10
    });
    return {
        songIds = v14
    };
end;