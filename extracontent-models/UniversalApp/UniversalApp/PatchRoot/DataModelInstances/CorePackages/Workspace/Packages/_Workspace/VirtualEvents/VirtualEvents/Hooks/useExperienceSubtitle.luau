local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.RoactUtils);
local v2 = require(l_script_FirstAncestor_0.Parent.LuaSocialLibrariesDeps);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_getDeepValue_0 = v2.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useSelector_0 = v1.Hooks.RoactRodux.useSelector;
return function(v6) --[[ Line: 9 ]] --[[ Name: useExperienceSubtitle ]]
    -- upvalues: l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useLocalization_0 (copy)
    local v10 = l_useSelector_0(function(v7) --[[ Line: 10 ]]
        -- upvalues: l_getDeepValue_0 (ref), v6 (copy)
        local v8 = l_getDeepValue_0(v7, "GameVotes." .. v6 .. ".upVotes");
        local v9 = l_getDeepValue_0(v7, "GameVotes." .. v6 .. ".downVotes");
        if not v8 or not v9 then
            return nil;
        else
            return (math.round(100 * v8 / (v8 + v9)));
        end;
    end);
    if v10 ~= v10 or not v10 then
        local v12 = l_useSelector_0(function(v11) --[[ Line: 24 ]]
            -- upvalues: v6 (copy)
            return v11.AgeRecommendations and v11.AgeRecommendations[v6];
        end);
        local v13 = v12 and v12.summary and v12.summary.ageRecommendation;
        return v13 and v13.displayNameWithHeaderShort;
    else
        return l_useLocalization_0({
            ratingPercentage = {
                "Feature.VirtualEvents.Label.Rating"; 
                rating = tostring(v10)
            }
        }).ratingPercentage;
    end;
end;