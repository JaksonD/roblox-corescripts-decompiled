local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        listeners = {}
    }, v2));
end;
v2.addListener = function(v3, v4, v5) --[[ Line: 25 ]] --[[ Name: addListener ]]
    if not v3.listeners[v4] then
        v3.listeners[v4] = {};
    end;
    table.insert(v3.listeners[v4], v5);
end;
v2.removeAllListeners = function(v6) --[[ Line: 32 ]] --[[ Name: removeAllListeners ]]
    table.clear(v6.listeners);
end;
v2.emit = function(v7, v8, ...) --[[ Line: 36 ]] --[[ Name: emit ]]
    local v9 = v7.listeners[v8];
    if not v9 then
        return;
    else
        for _, v11 in (table.clone(v9)) do
            pcall(function(...) --[[ Line: 44 ]]
                -- upvalues: v11 (copy)
                v11(...);
                return nil;
            end, ...);
        end;
        return;
    end;
end;
return {
    jsonDecode = function(v12) --[[ Line: 51 ]] --[[ Name: jsonDecode ]]
        -- upvalues: l_HttpService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v12 (copy)
            return l_HttpService_0:JSONDecode(v12);
        end);
        if l_status_0 and l_result_0 then
            return l_result_0;
        else
            return {};
        end;
    end, 
    EventEmitter = v2, 
    shorten = function(v15) --[[ Line: 62 ]] --[[ Name: shorten ]]
        return "..." .. string.sub(tostring(v15), -4);
    end, 
    avoidEmitting = function(v16) --[[ Line: 66 ]] --[[ Name: avoidEmitting ]]
        v16.DescendantAdded:Connect(function(v17) --[[ Line: 67 ]] --[[ Name: prune ]]
            if v17:HasTag("RbxDefaultVoiceEmitter") then
                task.defer(function() --[[ Line: 70 ]]
                    -- upvalues: v17 (copy)
                    v17:Destroy();
                end);
            end;
        end);
        for _, v19 in v16:GetDescendants() do
            if v19:HasTag("RbxDefaultVoiceEmitter") then
                task.defer(function() --[[ Line: 70 ]]
                    -- upvalues: v19 (copy)
                    v19:Destroy();
                end);
            end;
        end;
    end, 
    destroyDefaultEmitter = function(v20) --[[ Line: 81 ]] --[[ Name: destroyDefaultEmitter ]]
        -- upvalues: l_Players_0 (copy)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return;
        else
            local l_Character_0 = l_LocalPlayer_0.Character;
            if not l_Character_0 then
                return;
            else
                if v20:IsDescendantOf(l_Character_0) then
                    task.defer(function() --[[ Line: 92 ]]
                        -- upvalues: v20 (copy)
                        v20:Destroy();
                    end);
                end;
                return;
            end;
        end;
    end, 
    bind = function(v23, v24) --[[ Line: 98 ]] --[[ Name: bind ]]
        return function(...) --[[ Line: 99 ]]
            -- upvalues: v23 (copy), v24 (copy)
            return v23[v24](v23, ...);
        end;
    end
};