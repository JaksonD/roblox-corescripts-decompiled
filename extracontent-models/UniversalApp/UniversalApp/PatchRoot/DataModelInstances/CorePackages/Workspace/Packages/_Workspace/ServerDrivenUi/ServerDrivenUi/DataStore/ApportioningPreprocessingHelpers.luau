local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local function v6(v2, v3, v4, v5) --[[ Line: 7 ]]
    v2[v3] = {
        gridApportioningMetadata = {
            {
                sortIndex = v5, 
                capacity = v4
            }
        }
    };
end;
local function v12(v7, v8, v9) --[[ Line: 18 ]]
    -- upvalues: l_flaggedMutedError_0 (copy)
    for v10, v11 in v7.gridApportioningMetadata do
        if v11.sortIndex == v9 then
            l_flaggedMutedError_0("ApportioningSameSortIndex", (("Multiple collections at sort index %*"):format(v9)));
        elseif v9 < v11.sortIndex then
            table.insert(v7.gridApportioningMetadata, v10, {
                sortIndex = v9, 
                capacity = v8
            });
            return;
        end;
    end;
    table.insert(v7.gridApportioningMetadata, {
        sortIndex = v9, 
        capacity = v8
    });
end;
return {
    addToApportioningData = function(v13, v14, v15, v16) --[[ Line: 39 ]] --[[ Name: addToApportioningData ]]
        -- upvalues: v12 (copy), v6 (copy)
        local v17 = v13[v14];
        if v17 then
            v12(v17, v15, v16);
            return;
        else
            v6(v13, v14, v15, v16);
            return;
        end;
    end, 
    populateStartingItemIndices = function(v18) --[[ Line: 49 ]] --[[ Name: populateStartingItemIndices ]]
        for _, v20 in v18 do
            local v21 = 1;
            for _, v23 in v20.gridApportioningMetadata do
                v23.startingItemIndex = v21;
                v21 = v21 + v23.capacity;
            end;
        end;
    end
};