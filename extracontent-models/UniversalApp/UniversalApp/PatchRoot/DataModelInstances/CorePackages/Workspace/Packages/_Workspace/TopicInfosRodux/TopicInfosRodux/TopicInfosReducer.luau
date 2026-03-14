local l_script_FirstAncestor_0 = script:FindFirstAncestor("TopicInfosRodux");
local v1 = require(l_script_FirstAncestor_0.AddTopicInfos);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
return {
    key = "TopicInfosKey", 
    reducer = function(v5, v6) --[[ Line: 14 ]]
        -- upvalues: v1 (copy), v3 (copy)
        v5 = v5 or {};
        assert(v5, "");
        if v6.type == v1.name then
            local v7 = {};
            for _, v9 in v6.topicInfos do
                v7[v9.uniqueKey] = v9;
            end;
            v5 = v3.Dictionary.join(v5, v7);
        end;
        return v5;
    end
};