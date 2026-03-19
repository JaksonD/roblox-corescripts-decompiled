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
local v12 = require(l_script_FirstAncestor_0.Components.Experiences.ExperiencesSkeleton);
local l_FetchGameVotes_0 = require(l_Parent_0.GameVotesRodux).GameVotes.FetchGameVotes;
local v14 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworkingImpl);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityProfileLoadingSkeletons);
local v16 = {};
return function(v17) --[[ Line: 38 ]] --[[ Name: ExperiencesContainer ]]
    -- upvalues: v1 (copy), v5 (copy), v3 (copy), v15 (copy), v16 (copy), v4 (copy), l_useDispatch_0 (copy), v10 (copy), l_FetchGameVotes_0 (copy), v14 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v12 (copy), v11 (copy)
    local v18 = v1(v5.Components.Experiences);
    local v19, v20 = v3.useState(v15 and true or false);
    local v21 = v18.experiences or v16;
    local v24 = v3.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v4 (ref), v21 (copy)
        return v4.List.map(v21, function(v22, _) --[[ Line: 45 ]]
            return (tostring(v22.universeId));
        end);
    end, {
        v21
    });
    local v25 = l_useDispatch_0();
    v3.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v4 (ref), v24 (copy), v25 (copy), v10 (ref), v15 (ref), v20 (copy), l_FetchGameVotes_0 (ref), v14 (ref)
        if not v4.isEmpty(v24) then
            v25(v10.GetExperiencesDetails.API(v24)):catch(function(_) --[[ Line: 55 ]]

            end):finally(function() --[[ Line: 58 ]]
                -- upvalues: v15 (ref), v20 (ref)
                if v15 then
                    v20(false);
                end;
            end);
            for _, v28 in v24 do
                v25(l_FetchGameVotes_0.Fetch(v14, v28)):catch(function(_) --[[ Line: 64 ]]

                end);
            end;
            return;
        else
            if v15 then
                v20(false);
            end;
            return;
        end;
    end, {
        v24
    });
    local v31 = l_useSelector_0(function(v30) --[[ Line: 74 ]]
        -- upvalues: l_getDeepValue_0 (ref), v16 (ref)
        return l_getDeepValue_0(v30, "ProfilePlatform.Games.byGameId") or v16;
    end);
    local v35 = v3.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v24 (copy), v31 (copy)
        local v32 = {};
        for _, v34 in v24 do
            if v31[v34] then
                table.insert(v32, v31[v34]);
            end;
        end;
        return v32;
    end, {
        v24, 
        v31
    });
    if v15 and v19 then
        return v3.createElement(v12, {
            layoutOrder = v17.layoutOrder, 
            numSkeletons = #v21
        });
    elseif #v35 == 0 then
        return nil;
    else
        return v3.createElement(v11, {
            layoutOrder = v17.layoutOrder, 
            experienceDetails = v35
        });
    end;
end;