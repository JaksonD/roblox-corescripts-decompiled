local l_Parent_0 = script:FindFirstAncestor("SessionizationUtil").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v5 = {
        sid = v3, 
        tag = v4, 
        metadata = {}, 
        children = {}, 
        timestamp = tick(), 
        parent = nil
    };
    setmetatable(v5, {
        __index = v2
    });
    return v5;
end;
v2.addChild = function(v6, v7, v8) --[[ Line: 27 ]] --[[ Name: addChild ]]
    -- upvalues: v2 (copy)
    local v9 = v2.new(v7, v8);
    v9.parent = v6;
    v6.children[v7] = v9;
end;
v2.dump = function(v10, v11, v12) --[[ Line: 34 ]] --[[ Name: dump ]]
    v12 = v12 .. ("%* sid: %*, tag: %*\n"):format(v11, v10.sid, v10.tag);
    v11 = v11 .. "----";
    for _, v14 in v10.children do
        v12 = v14:dump(v11, v12);
    end;
    return v12;
end;
findSid = function(v15, v16) --[[ Line: 44 ]] --[[ Name: findSid ]]
    if v15.sid == v16 then
        return v15;
    else
        for _, v18 in v15.children do
            local v19 = findSid(v18, v16);
            if v19 ~= nil then
                return v19;
            end;
        end;
        return nil;
    end;
end;
local v20 = {
    MOCK_ROOT_SID = "MOCK_ROOT_SID"
};
v20.__index = v20;
v20.new = function() --[[ Line: 65 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v20 (copy), l_Signal_0 (copy)
    local v21 = {
        mockRootNode = v2.new(v20.MOCK_ROOT_SID, v20.MOCK_ROOT_SID), 
        SessionChangedSignal = l_Signal_0.new()
    };
    setmetatable(v21, {
        __index = v20
    });
    return v21;
end;
v20._resetMockData = function(v22) --[[ Line: 78 ]] --[[ Name: _resetMockData ]]
    -- upvalues: v2 (copy), v20 (copy)
    v22.mockRootNode = v2.new(v20.MOCK_ROOT_SID, v20.MOCK_ROOT_SID);
end;
v20._findSid = function(v23, v24) --[[ Line: 82 ]] --[[ Name: _findSid ]]
    return findSid(v23.mockRootNode, v24);
end;
v20._dumpSessionTree = function(v25) --[[ Line: 86 ]] --[[ Name: _dumpSessionTree ]]
    if v25.mockRootNode ~= nil then
        return v25.mockRootNode:dump("", "");
    else
        return "Root node is nil!";
    end;
end;
v20.GetRootSID = function(v26) --[[ Line: 94 ]] --[[ Name: GetRootSID ]]
    return v26.MOCK_ROOT_SID;
end;
v20.SetSession = function(v27, v28, v29, v30) --[[ Line: 98 ]] --[[ Name: SetSession ]]
    (findSid(v27.mockRootNode, v28) or v27.mockRootNode):addChild(v29, v30);
end;
v20.ReplaceSession = function(v31, v32, v33) --[[ Line: 104 ]] --[[ Name: ReplaceSession ]]
    local v34 = findSid(v31.mockRootNode, v32);
    if v34 ~= nil and v34.parent ~= nil then
        v34.parent.children[v32] = nil;
        v34.parent:addChild(v32, v33);
    end;
end;
v20.RemoveSession = function(v35, v36) --[[ Line: 114 ]] --[[ Name: RemoveSession ]]
    local v37 = findSid(v35.mockRootNode, v36);
    if v37 ~= nil then
        local l_parent_0 = v37.parent;
        if l_parent_0 ~= nil then
            l_parent_0.children[v36] = nil;
        end;
    end;
end;
v20.GetMetadata = function(v39, v40, v41) --[[ Line: 124 ]] --[[ Name: GetMetadata ]]
    local v42 = findSid(v39.mockRootNode, v40);
    if v42 ~= nil then
        return v42.metadata[v41];
    else
        return nil;
    end;
end;
v20.SetMetadata = function(v43, v44, v45, v46) --[[ Line: 133 ]] --[[ Name: SetMetadata ]]
    local v47 = findSid(v43.mockRootNode, v44);
    if v47 ~= nil then
        v47.metadata[v45] = v46;
    end;
end;
v20.SessionExists = function(v48, v49) --[[ Line: 140 ]] --[[ Name: SessionExists ]]
    return findSid(v48.mockRootNode, v49) ~= nil;
end;
v20.RemoveSessionsWithMetadataKey = function(v50, v51) --[[ Line: 145 ]] --[[ Name: RemoveSessionsWithMetadataKey ]]
    if v51 == nil then
        return;
    else
        local function v52(v53, v54) --[[ Line: 150 ]] --[[ Name: findNodeWithMetadataKey ]]
            -- upvalues: v52 (copy)
            if v54 ~= nil then
                if v54.metadata[v53] ~= nil then
                    return v54;
                else
                    for _, v56 in v54.children do
                        local v57 = v52(v53, v56);
                        if v57 ~= nil then
                            return v57;
                        end;
                    end;
                end;
            end;
            return nil;
        end;
        local v58 = v52(v51, v50.mockRootNode);
        while v58 ~= nil do
            v50:RemoveSession(v58.sid);
            v58 = v52(v51, v50.mockRootNode);
        end;
        return;
    end;
end;
v20.generateSessionInfoString = function(_, _, _, _, _) --[[ Line: 174 ]] --[[ Name: generateSessionInfoString ]]
    return "";
end;
v20.GetSessionTag = function(v64, v65) --[[ Line: 183 ]] --[[ Name: GetSessionTag ]]
    local v66 = findSid(v64.mockRootNode, v65);
    if v66 ~= nil then
        return v66.tag;
    else
        return "";
    end;
end;
return v20;