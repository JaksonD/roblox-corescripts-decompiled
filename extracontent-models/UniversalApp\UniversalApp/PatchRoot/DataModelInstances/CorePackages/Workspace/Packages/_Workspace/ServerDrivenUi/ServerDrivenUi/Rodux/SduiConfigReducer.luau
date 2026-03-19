local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Rodux.AddSduiRootConfig);
local v5 = require(l_script_FirstAncestor_0.Rodux.RemoveSduiRootConfig);
local v6 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrors_0 = v6.SduiErrors;
local l_SduiLogger_0 = v6.SduiLogger;
local v9 = require(l_script_FirstAncestor_0.DataStore.getItemCollectionKey);
return {
    key = "SduiConfigKey", 
    reducer = function(v10, v11) --[[ Line: 26 ]]
        -- upvalues: v2 (copy), v4 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy), v9 (copy), v3 (copy), v5 (copy)
        v10 = v10 or {};
        assert(v10, "state must exist");
        v2.assert(typeof(v10) == "table", "state must be a table");
        if v11.type == v4.name then
            local v12 = v11.customFeedStoreKey or v11.page;
            local v13 = v10[v12];
            local v14 = v13 and v13.itemCollections or {};
            local v15 = {
                rootConfig = v11.rootConfig, 
                dataUpdatedTimestamp = v11.dataUpdatedTimestamp, 
                itemCollections = v14
            };
            local v16 = v11.rootConfig.feed or v11.rootConfig or nil;
            if typeof(v16) ~= "table" then
                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.InvalidFeedInResponse, {
                    message = ("Invalid sdui.feed in response of type %*"):format((typeof(v16)))
                }, v11.page);
                return v10;
            else
                local v17 = v16.props and v16.props.feedItems or nil;
                if v17 then
                    for _, v19 in v17 do
                        local l_feedItemKey_0 = v19.feedItemKey;
                        if l_feedItemKey_0 then
                            if v15.itemCollections[l_feedItemKey_0] ~= nil then
                                l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.DuplicateFeedItemKey, {
                                    message = ("Multiple item collections with same feedItemKey %*"):format(l_feedItemKey_0)
                                }, v11.page);
                            end;
                            if v11.expectedSduiFeedItems then
                                local v21 = nil;
                                local v22 = nil;
                                for _, v24 in v11.expectedSduiFeedItems do
                                    if v24.feedItemKey == l_feedItemKey_0 then
                                        v21 = v24.topicId;
                                        v22 = v24.sortIndex;
                                        break;
                                    end;
                                end;
                                if v21 == nil or v22 == nil then
                                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.FailedToFindCollectionId, {
                                        message = ("Missing topicId or sortIndex for %* in ConfigReducer. sortIndex = %* topicId = %*"):format(l_feedItemKey_0, v22, v21)
                                    }, v11.page);
                                end;
                                local v25 = v9(v21, v22);
                                v15.itemCollections[v25] = {
                                    sduiConfig = v19, 
                                    dataUpdatedTimestamp = v11.dataUpdatedTimestamp, 
                                    topicId = v21, 
                                    sortIndex = v22
                                };
                            else
                                v15.itemCollections[l_feedItemKey_0] = {
                                    sduiConfig = v19, 
                                    dataUpdatedTimestamp = v11.dataUpdatedTimestamp
                                };
                            end;
                        else
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NilFeedItemKey, {
                                message = "Missing feedItemKey for itemCollection in ConfigReducer"
                            }, v11.page);
                        end;
                    end;
                end;
                if v11.expectedSduiFeedItems then
                    for _, v27 in v11.expectedSduiFeedItems do
                        local v28 = v9(v27.topicId, v27.sortIndex);
                        if v15.itemCollections[v28] == nil then
                            l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NilItemCollection, {
                                message = ("Missing item collection data for an sdui feed item for topic: %* sortIndex: %*"):format(v27.topicId, v27.sortIndex), 
                                name = v27.topicId
                            }, v11.page);
                        end;
                    end;
                end;
                return (v3.Dictionary.union(v10, {
                    [v12] = v15
                }));
            end;
        else
            if v11.type == v5.name then
                local l_feedStoreKey_0 = v11.feedStoreKey;
                if v10[l_feedStoreKey_0] then
                    v10 = v3.Dictionary.omit(v10, l_feedStoreKey_0);
                end;
            end;
            return v10;
        end;
    end
};