local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagSoundTelemetryOsClock);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = {};
    setmetatable(v4, v2);
    v4.aggregatedData = v3;
    v4.sounds = {};
    return v4;
end;
v2.addSound = function(v5, v6, v7) --[[ Line: 17 ]] --[[ Name: addSound ]]
    -- upvalues: v1 (copy)
    local v8 = v5.sounds[v6];
    if v8 == nil then
        if v1() then
            v5.sounds[v6] = {
                count = 0, 
                starttime = os.clock(), 
                maxLoopCount = 1, 
                instances = {}
            };
        else
            v5.sounds[v6] = {
                count = 0, 
                starttime = os.time(), 
                maxLoopCount = 1, 
                instances = {}
            };
        end;
        v8 = v5.sounds[v6];
    end;
    if v8.instances[v7] == nil then
        v8.instances[v7] = 1;
        v8.count = v8.count + 1;
    end;
end;
v2.removeSound = function(v9, v10, v11) --[[ Line: 37 ]] --[[ Name: removeSound ]]
    -- upvalues: v1 (copy)
    local v12 = v9.sounds[v10];
    if v12 == nil then
        return;
    else
        if v12.instances[v11] then
            v12.instances[v11] = nil;
            v12.count = v12.count - 1;
        end;
        if v12.count == 0 then
            if v1() then
                v9.aggregatedData:addPlay(v10, math.round(os.clock() - v12.starttime), v12.maxLoopCount);
            else
                v9.aggregatedData:addPlay(v10, os.time() - v12.starttime, v12.maxLoopCount);
            end;
            v9.sounds[v10] = nil;
        end;
        return;
    end;
end;
v2.loopSound = function(v13, v14, v15) --[[ Line: 66 ]] --[[ Name: loopSound ]]
    local v16 = v13.sounds[v14];
    if v16 == nil or v16.instances[v15] == nil then
        return;
    else
        local l_instances_0 = v16.instances;
        l_instances_0[v15] = l_instances_0[v15] + 1;
        v16.maxLoopCount = math.max(v16.maxLoopCount, v16.instances[v15]);
        return;
    end;
end;
return v2;