local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local v6 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v10 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v11 = require(l_script_FirstAncestor_0.Components.Experiences.Experiences);
local l_FetchGameVotes_0 = require(l_Parent_0.GameVotesRodux).GameVotes.FetchGameVotes;
local v13 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworkingImpl);
local v14 = {};
return function(v15) --[[ Line: 34 ]] --[[ Name: ExperiencesContainer ]]
    -- upvalues: v1 (copy), v5 (copy), v14 (copy), v3 (copy), v4 (copy), l_useDispatch_0 (copy), v10 (copy), l_FetchGameVotes_0 (copy), v13 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v11 (copy)
    local v16 = v1(v5.Components.Experiences).experiences or v14;
    local v19 = v3.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v4 (ref), v16 (copy)
        return v4.List.map(v16, function(v17, _) --[[ Line: 40 ]]
            return (tostring(v17.universeId));
        end);
    end, {
        v16
    });
    local v20 = l_useDispatch_0();
    v3.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v4 (ref), v19 (copy), v20 (copy), v10 (ref), l_FetchGameVotes_0 (ref), v13 (ref)
        if not v4.isEmpty(v19) then
            v20(v10.GetExperiencesDetails.API(v19)):catch(function(_) --[[ Line: 49 ]]

            end);
            for _, v23 in v19 do
                v20(l_FetchGameVotes_0.Fetch(v13, v23)):catch(function(_) --[[ Line: 53 ]]

                end);
            end;
        end;
    end, {
        v19
    });
    local v26 = l_useSelector_0(function(v25) --[[ Line: 59 ]]
        -- upvalues: l_getDeepValue_0 (ref), v14 (ref)
        return l_getDeepValue_0(v25, "ProfilePlatform.Games.byGameId") or v14;
    end);
    local v30 = v3.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v19 (copy), v26 (copy)
        local v27 = {};
        for _, v29 in v19 do
            if v26[v29] then
                table.insert(v27, v26[v29]);
            end;
        end;
        return v27;
    end, {
        v19, 
        v26
    });
    if #v30 == 0 then
        return nil;
    else
        return v3.createElement(v11, {
            layoutOrder = v15.layoutOrder, 
            experienceDetails = v30
        });
    end;
end;