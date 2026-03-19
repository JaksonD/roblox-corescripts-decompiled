local l_script_FirstAncestor_0 = script:FindFirstAncestor("TopicContentsRodux");
local v1 = require(l_script_FirstAncestor_0.TopicContentsEntryModel);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = {
    new = function() --[[ Line: 11 ]] --[[ Name: new ]]
        return {
            entries = {}, 
            rowsRequested = 0, 
            hasMoreRows = false, 
            nextPageExclusiveStartId = 0, 
            updatedTimestamp = nil, 
            nextPageToken = ""
        };
    end
};
v4.mock = function() --[[ Line: 25 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v5 = v4.new();
    v5.entries = {
        v1.mock()
    };
    v5.rowsRequested = 1;
    v5.hasMoreRows = false;
    v5.nextPageExclusiveStartId = 0;
    v5.updatedTimestamp = nil;
    v5.nextPageToken = "";
    return v5;
end;
v4.fromData = function(v6) --[[ Line: 39 ]] --[[ Name: fromData ]]
    return {
        entries = v6.entries, 
        rowsRequested = v6.rowsRequested, 
        hasMoreRows = v6.hasMoreRows, 
        nextPageExclusiveStartId = v6.nextPageExclusiveStartId, 
        updatedTimestamp = v6.updatedTimestamp, 
        nextPageToken = if v6.nextPageToken then v6.nextPageToken else ""
    };
end;
v4.fromContentList = function(v7, v8, v9, v10) --[[ Line: 53 ]] --[[ Name: fromContentList ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v11 = v4.new();
    v11.updatedTimestamp = v10;
    v11.entries = {};
    v11.hasMoreRows = false;
    if v7 then
        for _, v13 in ipairs(v7) do
            if v11.hasMoreRows then
                return v11;
            else
                v1.fromOmniRecommendations(v13):match(function(v14) --[[ Line: 72 ]]
                    -- upvalues: v13 (copy), v8 (copy), v9 (copy), v11 (copy)
                    local l_contentType_0 = v13.contentType;
                    local v16 = v8(l_contentType_0);
                    if v16 ~= nil then
                        local v17 = v9(v14, v16);
                        if v17 ~= nil then
                            table.insert(v11.entries, v17);
                            return;
                        else
                            v11.hasMoreRows = true;
                        end;
                    end;
                end):matchError(function(v18) --[[ Line: 84 ]]
                    warn(v18);
                end);
            end;
        end;
    end;
    return v11;
end;
return v4;