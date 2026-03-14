local l_script_FirstAncestor_0 = script:FindFirstAncestor("TopicContentsRodux");
local v1 = require(l_script_FirstAncestor_0.TopicContentsModel);
local v2 = require(l_script_FirstAncestor_0.AddTopicContents);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local l_AddTopicInfos_0 = require(l_Parent_0.TopicInfosRodux).AddTopicInfos;
local _ = require(l_Parent_0.DiscoveryTypes);
return {
    key = "TopicContentsKey", 
    reducer = function(v7, v8) --[[ Line: 12 ]]
        -- upvalues: l_AddTopicInfos_0 (copy), v1 (copy), v4 (copy), v2 (copy)
        local v9 = v7 or {};
        if v8.type == l_AddTopicInfos_0.name then
            local v10 = {};
            for _, v12 in pairs(v8.topicInfos) do
                v10[v12.uniqueKey] = v9[v12.uniqueKey] or v1.new();
            end;
            return (v4.Dictionary.join(v9, v10));
        else
            if v8.type == v2.name then
                local l_topicContents_0 = v8.topicContents;
                local v14 = v9[v8.topicKey];
                if v14 ~= nil then
                    if v8.isAppend then
                        l_topicContents_0.entries = v4.List.join(v14.entries, l_topicContents_0.entries);
                    end;
                    if l_topicContents_0.updatedTimestamp == nil then
                        l_topicContents_0.updatedTimestamp = v14.updatedTimestamp;
                    end;
                end;
                if l_topicContents_0.updatedTimestamp == nil then
                    l_topicContents_0.updatedTimestamp = tick();
                end;
                v9 = v4.Dictionary.join(v9, {
                    [v8.topicKey] = l_topicContents_0
                });
            end;
            return v9;
        end;
    end
};