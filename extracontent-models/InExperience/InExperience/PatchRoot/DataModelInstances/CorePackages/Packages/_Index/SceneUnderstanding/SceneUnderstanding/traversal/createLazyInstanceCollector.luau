local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.options.DataModelTraversalOptions);
return function(v2, v3, v4) --[[ Line: 9 ]] --[[ Name: createLazyInstanceCollector ]]
    -- upvalues: v1 (copy)
    local v5 = v1.new(v4);
    local v6 = false;
    local v7 = {};
    local v8 = 0;
    local v9 = {};
    local v10 = nil;
    local v11 = {};
    local v12 = {};
    local function _() --[[ Line: 24 ]] --[[ Name: getBatchCount ]]
        -- upvalues: v11 (copy), v5 (copy)
        return (math.min(#v11, v5.instanceProcessingLimit));
    end;
    local function v16(v14) --[[ Line: 28 ]] --[[ Name: onAncestryChanged ]]
        -- upvalues: v7 (copy)
        if v14.Parent == nil then
            local v15 = table.find(v7, v14);
            if v15 then
                table.remove(v7, v15);
            end;
        end;
    end;
    local function v23() --[[ Line: 37 ]] --[[ Name: processStack ]]
        -- upvalues: v11 (copy), v5 (copy), v3 (copy), v7 (copy), v9 (copy), v16 (copy), v8 (ref), v12 (ref), v6 (ref)
        local v17 = math.min(#v11, v5.instanceProcessingLimit);
        for _ = 1, v17 do
            local v19 = table.remove(v11, #v11);
            if v19 then
                if not v3 or v3(v19) then
                    table.insert(v7, v19);
                    table.insert(v9, v19.AncestryChanged:Connect(v16));
                end;
                for _, v21 in v19:GetChildren() do
                    table.insert(v11, v21);
                end;
            end;
        end;
        v8 = v8 + v17;
        for v22 in v12 do
            task.spawn(function() --[[ Line: 58 ]]
                -- upvalues: v22 (copy), v7 (ref)
                v22(v7);
            end);
        end;
        if #v11 == 0 then
            v6 = false;
            return false;
        elseif v8 >= v5.instanceProcessingLimit then
            v8 = 0;
            return true;
        else
            return false;
        end;
    end;
    local function _() --[[ Line: 80 ]] --[[ Name: startProcessingLoop ]]
        -- upvalues: v6 (ref), v11 (copy), v5 (copy), v23 (copy), v10 (ref)
        if v6 or math.min(#v11, v5.instanceProcessingLimit) == 0 then
            return;
        else
            v6 = true;
            v23();
            v10 = task.spawn(function() --[[ Line: 89 ]]
                -- upvalues: v6 (ref), v23 (ref)
                task.wait();
                while v6 do
                    local v24 = v23();
                    if v6 and v24 then
                        task.wait();
                    end;
                end;
            end);
            return;
        end;
    end;
    local function v28(v26) --[[ Line: 102 ]] --[[ Name: onDescendantAdded ]]
        -- upvalues: v11 (copy), v6 (ref), v5 (copy), v23 (copy), v10 (ref)
        table.insert(v11, v26);
        if not v6 and not v6 then
            if math.min(#v11, v5.instanceProcessingLimit) == 0 then
                return;
            else
                v6 = true;
                v23();
                v10 = task.spawn(function() --[[ Line: 89 ]]
                    -- upvalues: v6 (ref), v23 (ref)
                    task.wait();
                    while v6 do
                        local v27 = v23();
                        if v6 and v27 then
                            task.wait();
                        end;
                    end;
                end);
            end;
        end;
    end;
    local function v34() --[[ Line: 110 ]] --[[ Name: listen ]]
        -- upvalues: v2 (copy), v9 (copy), v28 (copy), v11 (copy), v6 (ref), v5 (copy), v23 (copy), v10 (ref)
        for _, v30 in v2 do
            table.insert(v9, v30.DescendantAdded:Connect(v28));
            for _, v32 in v30:GetChildren() do
                table.insert(v11, v32);
            end;
        end;
        if not v6 then
            if math.min(#v11, v5.instanceProcessingLimit) == 0 then
                return;
            else
                v6 = true;
                v23();
                v10 = task.spawn(function() --[[ Line: 89 ]]
                    -- upvalues: v6 (ref), v23 (ref)
                    task.wait();
                    while v6 do
                        local v33 = v23();
                        if v6 and v33 then
                            task.wait();
                        end;
                    end;
                end);
            end;
        end;
    end;
    local function v36(v35) --[[ Line: 122 ]] --[[ Name: onStepped ]]
        -- upvalues: v12 (ref)
        v12[v35] = true;
        return function() --[[ Line: 124 ]]
            -- upvalues: v12 (ref), v35 (copy)
            v12[v35] = nil;
        end;
    end;
    local function v39() --[[ Line: 129 ]] --[[ Name: destroy ]]
        -- upvalues: v6 (ref), v9 (copy), v12 (ref), v10 (ref)
        v6 = false;
        for _, v38 in v9 do
            v38:Disconnect();
        end;
        v12 = {};
        if v10 then
            task.cancel(v10);
        end;
    end;
    return {
        setInstancesProcessedPerFrame = function(v40) --[[ Line: 143 ]] --[[ Name: setInstancesProcessedPerFrame ]]
            -- upvalues: v5 (copy), v6 (ref), v11 (copy), v23 (copy), v10 (ref)
            v5.instanceProcessingLimit = math.clamp(v40, 0, 1e999);
            if not v6 then
                if math.min(#v11, v5.instanceProcessingLimit) == 0 then
                    return;
                else
                    v6 = true;
                    v23();
                    v10 = task.spawn(function() --[[ Line: 89 ]]
                        -- upvalues: v6 (ref), v23 (ref)
                        task.wait();
                        while v6 do
                            local v41 = v23();
                            if v6 and v41 then
                                task.wait();
                            end;
                        end;
                    end);
                end;
            end;
        end, 
        listen = v34, 
        get = function() --[[ Line: 148 ]] --[[ Name: get ]]
            -- upvalues: v7 (copy)
            return v7;
        end, 
        destroy = v39, 
        onStepped = v36
    };
end;