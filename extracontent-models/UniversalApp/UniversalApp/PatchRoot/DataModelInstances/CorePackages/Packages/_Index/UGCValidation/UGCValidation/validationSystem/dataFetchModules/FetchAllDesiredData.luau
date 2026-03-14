local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.validationSystem.ValidationEnums);
local v2 = require(l_Parent_0.validationSystem.dataFetchModules.FetchEditables);
local _ = require(l_Parent_0.util.Types);
local l_SharedDataMember_0 = v1.SharedDataMember;
local v5 = {
    InExpClient = true, 
    InExpServer = true
};
local v6 = {
    l_SharedDataMember_0.renderMeshesData, 
    l_SharedDataMember_0.innerCagesData, 
    l_SharedDataMember_0.outerCagesData, 
    l_SharedDataMember_0.meshTextures
};
local v7 = {
    DATA_FETCH_FAILURE = {}
};
v7.storeDesiredData = function(v8, v9) --[[ Line: 26 ]] --[[ Name: storeDesiredData ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), v7 (copy)
    local l_rootInstance_0 = v8.rootInstance;
    local l_source_0 = v8.consumerConfig.source;
    local v12 = v8.consumerConfig.preloadedEditableMeshes or {};
    local v13 = v8.consumerConfig.preloadedEditableImages or {};
    local v14 = v5[l_source_0];
    for _, v16 in v6 do
        if v9[v16] then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
                -- upvalues: v2 (ref), l_rootInstance_0 (copy), v16 (copy), v14 (copy), v12 (copy), v13 (copy)
                return (v2.getDatas(l_rootInstance_0, v16, v14, v12, v13));
            end);
            if l_status_0 and l_result_0 then
                v8[v16] = l_result_0;
            else
                v8[v16] = v7.DATA_FETCH_FAILURE;
            end;
        end;
    end;
end;
return v7;