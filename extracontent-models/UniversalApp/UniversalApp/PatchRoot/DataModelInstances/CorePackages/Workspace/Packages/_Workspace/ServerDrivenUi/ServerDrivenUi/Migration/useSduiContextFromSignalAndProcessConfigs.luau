local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.System.useSduiContext);
local v5 = require(l_script_FirstAncestor_0.DataStore.getSduiFeedStore);
local v6 = require(l_script_FirstAncestor_0.System.processCollectionConfig);
local v7 = require(l_script_FirstAncestor_0.DataStore.getItemCollectionKey);
local _ = require(l_Parent_0.SduiCoreSystem);
local l_FFlagSduiGetItemCollectionKeys_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiGetItemCollectionKeys;
return function(v10, v11, v12) --[[ Line: 19 ]] --[[ Name: useSduiContextFromSignalAndProcessConfigs ]]
    -- upvalues: v2 (copy), v5 (copy), l_FFlagSduiGetItemCollectionKeys_0 (copy), v3 (copy), v4 (copy), v7 (copy), v6 (copy)
    local v22 = v2.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v12 (copy), v5 (ref), v10 (copy), l_FFlagSduiGetItemCollectionKeys_0 (ref)
        return function(v13) --[[ Line: 25 ]]
            -- upvalues: v12 (ref), v5 (ref), v10 (ref), l_FFlagSduiGetItemCollectionKeys_0 (ref)
            if not v12 then
                return {};
            else
                local v14 = v5(v10);
                local v15 = v14.getTemplates(v13);
                local v16 = v14.getDataUpdatedTimestamp(v13);
                local v17 = if l_FFlagSduiGetItemCollectionKeys_0 and v14.getItemCollectionKeys then v14.getItemCollectionKeys(v13) else {};
                local v18 = {};
                for _, v20 in v17 do
                    local v21 = v14.getItemCollection(v20);
                    if v21 then
                        v18[v20] = v21(v13);
                    end;
                end;
                return {
                    templates = v15, 
                    dataUpdatedTimestamp = v16, 
                    unprocessedItemCollections = v18
                };
            end;
        end;
    end, {
        v10, 
        v12
    });
    local v23 = v3.useSignalState(v22);
    local v24 = v4({
        appPage = v11, 
        templates = v23.templates, 
        dataUpdatedTimestamp = v23.dataUpdatedTimestamp
    });
    v2.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v12 (copy), v5 (ref), v11 (copy), v23 (copy), v7 (ref), v6 (ref), v24 (copy)
        if not v12 then
            return;
        else
            local v25 = v5(v11);
            local v26 = {};
            if v23.unprocessedItemCollections then
                for _, v28 in v23.unprocessedItemCollections do
                    v26[v7(v28.topicId, v28.sortIndex)] = {
                        sduiConfig = v6(v28.componentConfig, v28.topicId, v24), 
                        dataUpdatedTimestamp = v23.dataUpdatedTimestamp
                    };
                end;
                v25.updateData({
                    templates = v23.templates, 
                    itemCollections = v26, 
                    dataUpdatedTimestamp = v23.dataUpdatedTimestamp
                });
            end;
            return;
        end;
    end, {
        v24, 
        v23.unprocessedItemCollections, 
        v23.templates, 
        v23.dataUpdatedTimestamp, 
        v11, 
        v12
    });
    return v24;
end;