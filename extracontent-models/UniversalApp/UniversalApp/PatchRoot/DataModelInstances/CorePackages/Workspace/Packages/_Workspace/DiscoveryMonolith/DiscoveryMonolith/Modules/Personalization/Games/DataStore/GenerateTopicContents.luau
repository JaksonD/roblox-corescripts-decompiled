local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = require(l_Parent_0.TopicContentsRodux);
local l_TopicContentsModel_0 = v4.TopicContentsModel;
local l_AddTopicContents_0 = v4.AddTopicContents;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v8 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local function _(v9) --[[ Line: 12 ]] --[[ Name: getContentStoreFunc ]]
    -- upvalues: v8 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v9 (copy), v8 (ref)
        local v11 = v9:getState();
        return v8.storeForContentType(v11, v10);
    end;
end;
local function _() --[[ Line: 19 ]] --[[ Name: generateFullContentEntryFunc ]]
    -- upvalues: v2 (copy)
    return function(v13, v14) --[[ Line: 20 ]]
        -- upvalues: v2 (ref)
        local v15 = v14[v13.contentId];
        if v15 ~= nil then
            return (v2.Dictionary.join(v15, v13));
        else
            return nil;
        end;
    end;
end;
local function _(v17, v18, v19, v20) --[[ Line: 32 ]] --[[ Name: createTopicContentsModel ]]
    -- upvalues: l_TopicContentsModel_0 (copy)
    if v17 then
        return l_TopicContentsModel_0.fromContentList(v17, v18, v19, v20);
    else
        return nil;
    end;
end;
return function(v22, v23, v24) --[[ Line: 50 ]]
    -- upvalues: v8 (copy), v2 (copy), l_TopicContentsModel_0 (copy), l_AddTopicContents_0 (copy)
    return function(v25) --[[ Line: 51 ]]
        -- upvalues: v8 (ref), v2 (ref), v22 (copy), v23 (copy), v24 (copy), l_TopicContentsModel_0 (ref), l_AddTopicContents_0 (ref)
        local v26 = v25:getState();
        local function v29(v27) --[[ Line: 13 ]]
            -- upvalues: v25 (copy), v8 (ref)
            local v28 = v25:getState();
            return v8.storeForContentType(v28, v27);
        end;
        local function v33(v30, v31) --[[ Line: 20 ]]
            -- upvalues: v2 (ref)
            local v32 = v31[v30.contentId];
            if v32 ~= nil then
                return (v2.Dictionary.join(v32, v30));
            else
                return nil;
            end;
        end;
        local v34 = v26.OmniRecommendations[v22];
        local v35 = {};
        for _, v37 in ipairs(v34.sorts) do
            if v37.topicId then
                local v38 = tostring(v37.topicId);
                if v23 == nil or v23 == v37.topicId then
                    local l_recommendations_0 = v37.recommendations;
                    local l_v24_0 = v24;
                    local v41 = if l_recommendations_0 then l_TopicContentsModel_0.fromContentList(l_recommendations_0, v29, v33, l_v24_0) else nil;
                    if v41 then
                        if v35[v38] then
                            v25:dispatch(l_AddTopicContents_0(v38, v41, true));
                        else
                            v25:dispatch(l_AddTopicContents_0(v38, v41));
                            v35[v38] = true;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;