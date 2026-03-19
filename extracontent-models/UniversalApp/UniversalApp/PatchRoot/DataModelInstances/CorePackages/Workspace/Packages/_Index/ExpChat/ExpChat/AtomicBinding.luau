local l_Flags_0 = script:FindFirstAncestor("ExpChat").Flags;
local v1 = require(l_Flags_0.getFFlagCheckRootInstToManifest);
local function v5(v2) --[[ Line: 8 ]] --[[ Name: parsePath ]]
    local v3 = string.split(v2, "/");
    for v4 = #v3, 1, -1 do
        if v3[v4] == "" then
            table.remove(v3, v4);
        end;
    end;
    return v3;
end;
local _ = function(v6, v7) --[[ Line: 18 ]] --[[ Name: isManifestResolved ]]
    local v8 = 0;
    for _ in pairs(v6) do
        v8 = v8 + 1;
    end;
    assert(v8 <= v7, v8);
    return v8 == v7;
end;
local function v11(v12, v13) --[[ Line: 28 ]] --[[ Name: unbindNodeDescend ]]
    -- upvalues: v11 (copy)
    if v12.instance == nil then
        return;
    else
        v12.instance = nil;
        local l_connections_0 = v12.connections;
        if l_connections_0 then
            for _, v16 in ipairs(l_connections_0) do
                v16:Disconnect();
            end;
            table.clear(l_connections_0);
        end;
        if v13 and v12.alias then
            v13[v12.alias] = nil;
        end;
        local l_children_0 = v12.children;
        if l_children_0 then
            for _, v19 in pairs(l_children_0) do
                v11(v19, v13);
            end;
        end;
        return;
    end;
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22) --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v20 (copy)
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local v28 = 1;
    for v29, v30 in pairs(v21) do
        v27[v29] = v5(v30);
        v28 = v28 + 1;
    end;
    return (setmetatable({
        _boundFn = v22, 
        _parsedManifest = v27, 
        _manifestSizeTarget = v28, 
        _dtorMap = v23, 
        _connections = v24, 
        _rootInstToRootNode = v25, 
        _rootInstToManifest = v26
    }, v20));
end;
v20._startBoundFn = function(v31, v32, v33) --[[ Line: 84 ]] --[[ Name: _startBoundFn ]]
    local l__boundFn_0 = v31._boundFn;
    local l__dtorMap_0 = v31._dtorMap;
    local v36 = l__dtorMap_0[v32];
    if v36 then
        v36();
        l__dtorMap_0[v32] = nil;
    end;
    local v37 = l__boundFn_0(v33);
    if v37 then
        l__dtorMap_0[v32] = v37;
    end;
end;
v20._stopBoundFn = function(v38, v39) --[[ Line: 100 ]] --[[ Name: _stopBoundFn ]]
    local l__dtorMap_1 = v38._dtorMap;
    local v41 = l__dtorMap_1[v39];
    if v41 then
        v41();
        l__dtorMap_1[v39] = nil;
    end;
end;
v20.bindRoot = function(v42, v43) --[[ Line: 110 ]] --[[ Name: bindRoot ]]
    -- upvalues: v1 (copy), v11 (copy)
    debug.profilebegin("AtomicBinding:BindRoot");
    local l__parsedManifest_0 = v42._parsedManifest;
    local l__rootInstToRootNode_0 = v42._rootInstToRootNode;
    local l__rootInstToManifest_0 = v42._rootInstToManifest;
    local l__manifestSizeTarget_0 = v42._manifestSizeTarget;
    if v1() then
        if l__rootInstToManifest_0[v43] ~= nil then
            return;
        end;
    else
        assert(l__rootInstToManifest_0[v43] == nil, "rootInstToManifest is not nil");
    end;
    local v48 = {};
    l__rootInstToManifest_0[v43] = v48;
    debug.profilebegin("BuildTree");
    local v49 = {
        alias = "root", 
        instance = v43
    };
    if next(l__parsedManifest_0) then
        v49.children = {};
        v49.connections = {};
    end;
    l__rootInstToRootNode_0[v43] = v49;
    for v50, v51 in pairs(l__parsedManifest_0) do
        local l_v49_0 = v49;
        for v53, v54 in ipairs(v51) do
            local v55 = v53 == #v51;
            local v56 = l_v49_0.children[v54] or {};
            if v55 then
                if v56.alias ~= nil then
                    error("Multiple aliases assigned to one instance");
                end;
                v56.alias = v50;
            else
                v56.children = v56.children or {};
                v56.connections = v56.connections or {};
            end;
            l_v49_0.children[v54] = v56;
            l_v49_0 = v56;
        end;
    end;
    debug.profileend();
    local function v57(v58) --[[ Line: 170 ]] --[[ Name: processNode ]]
        -- upvalues: v48 (copy), v57 (copy), v42 (copy), v43 (copy), v11 (ref), l__manifestSizeTarget_0 (copy)
        local v59 = assert(v58.instance, "instance does not exist");
        local l_children_1 = v58.children;
        local l_alias_0 = v58.alias;
        local v62 = not l_children_1;
        if l_alias_0 then
            v48[l_alias_0] = v59;
        end;
        if not v62 then
            local function v65(v63) --[[ Line: 182 ]] --[[ Name: processAddChild ]]
                -- upvalues: l_children_1 (copy), v57 (ref)
                local v64 = l_children_1[v63.Name];
                if not v64 or v64.instance ~= nil then
                    return;
                else
                    v64.instance = v63;
                    v57(v64);
                    return;
                end;
            end;
            local function v71(v66) --[[ Line: 193 ]] --[[ Name: processDeleteChild ]]
                -- upvalues: l_children_1 (copy), v42 (ref), v43 (ref), v11 (ref), v48 (ref), v59 (copy), v57 (ref)
                local l_Name_0 = v66.Name;
                local v68 = l_children_1[l_Name_0];
                if not v68 then
                    return;
                elseif v68.instance ~= v66 then
                    return;
                else
                    v42:_stopBoundFn(v43);
                    v11(v68, v48);
                    assert(v68.instance == nil, "unbindNodeDescend failed");
                    local l_v59_FirstChild_0 = v59:FindFirstChild(l_Name_0);
                    if l_v59_FirstChild_0 then
                        local v70 = l_children_1[l_v59_FirstChild_0.Name];
                        if v70 then
                            if v70.instance ~= nil then
                                return;
                            else
                                v70.instance = l_v59_FirstChild_0;
                                v57(v70);
                            end;
                        end;
                    end;
                    return;
                end;
            end;
            for _, v73 in ipairs(v59:GetChildren()) do
                local v74 = l_children_1[v73.Name];
                if v74 and v74.instance == nil then
                    v74.instance = v73;
                    v57(v74);
                end;
            end;
            table.insert(v58.connections, v59.ChildAdded:Connect(v65));
            table.insert(v58.connections, v59.ChildRemoved:Connect(v71));
        end;
        if v62 then
            local l_v48_0 = v48;
            local l_l__manifestSizeTarget_0_0 = l__manifestSizeTarget_0;
            local v77 = 0;
            for _ in pairs(l_v48_0) do
                v77 = v77 + 1;
            end;
            assert(v77 <= l_l__manifestSizeTarget_0_0, v77);
            if v77 == l_l__manifestSizeTarget_0_0 then
                v42:_startBoundFn(v43, v48);
            end;
        end;
    end;
    debug.profilebegin("ResolveTree");
    v57(v49);
    debug.profileend();
    debug.profileend();
end;
v20.unbindRoot = function(v79, v80) --[[ Line: 246 ]] --[[ Name: unbindRoot ]]
    -- upvalues: v11 (copy)
    local l__rootInstToRootNode_1 = v79._rootInstToRootNode;
    local l__rootInstToManifest_1 = v79._rootInstToManifest;
    v79:_stopBoundFn(v80);
    local v83 = l__rootInstToRootNode_1[v80];
    if v83 then
        local v84 = assert(l__rootInstToManifest_1[v80], "rootInstToManifest is nil");
        v11(v83, v84);
        l__rootInstToRootNode_1[v80] = nil;
    end;
    l__rootInstToManifest_1[v80] = nil;
end;
v20.destroy = function(v85) --[[ Line: 262 ]] --[[ Name: destroy ]]
    -- upvalues: v11 (copy)
    debug.profilebegin("AtomicBinding:destroy");
    for _, v87 in pairs(v85._dtorMap) do
        v87:destroy();
    end;
    table.clear(v85._dtorMap);
    for _, v89 in ipairs(v85._connections) do
        v89:Disconnect();
    end;
    table.clear(v85._connections);
    local l__rootInstToManifest_2 = v85._rootInstToManifest;
    for v91, v92 in pairs(v85._rootInstToRootNode) do
        local v93 = assert(l__rootInstToManifest_2[v91], "rootInstToManifest is nil");
        v11(v92, v93);
    end;
    table.clear(v85._rootInstToManifest);
    table.clear(v85._rootInstToRootNode);
    debug.profileend();
end;
return v20;