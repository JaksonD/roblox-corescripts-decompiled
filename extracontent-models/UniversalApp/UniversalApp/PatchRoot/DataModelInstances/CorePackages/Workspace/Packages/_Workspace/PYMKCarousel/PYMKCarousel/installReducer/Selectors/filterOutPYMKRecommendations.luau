local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_llama_0 = v1.llama;
local v4 = require(l_Parent_0.Common.Constants);
local _ = require(l_Parent_0.Common.ModelTypes);
local l_RecommendationSourceEnum_0 = v1.SocialCommon.Enums.RecommendationSourceEnum;
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_getDeepValue_0 (copy), v4 (copy), l_RecommendationSourceEnum_0 (copy), l_llama_0 (copy)
    return function(v8) --[[ Line: 19 ]]
        -- upvalues: l_getDeepValue_0 (ref), v4 (ref), l_RecommendationSourceEnum_0 (ref), l_llama_0 (ref), v7 (copy)
        local v9 = l_getDeepValue_0(v8, string.format("%s.Friends.recommendations.bySource.%s", v4.RODUX_KEY, l_RecommendationSourceEnum_0.HomepagePYMKCarousel)) or {};
        return l_llama_0.List.filter(v7, function(v10) --[[ Line: 29 ]]
            -- upvalues: v9 (copy)
            return v9[v10.id];
        end);
    end;
end;