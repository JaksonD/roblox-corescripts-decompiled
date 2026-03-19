local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local _ = require(script.Parent.Parent.types);
local v4 = require(script.Parent.Parent.Parent.Utils.now);
local v5 = require(l_script_FirstAncestor_0.Utils.sendTTIStat);
local v6 = require(l_script_FirstAncestor_0.Utils.mergeTTIEventMetadata);
local v7 = require(l_script_FirstAncestor_0.Utils.Util);
return function(v8) --[[ Line: 20 ]]
    -- upvalues: v4 (copy), v6 (copy), l_FFlagAXTTIEnableMilestones_0 (copy), v7 (copy), v5 (copy)
    return function(v9, v10) --[[ Line: 21 ]]
        -- upvalues: v8 (copy), v4 (ref), v6 (ref), l_FFlagAXTTIEnableMilestones_0 (ref), v7 (ref), v5 (ref)
        local v11 = nil;
        local v12 = nil;
        local v13 = false;
        local v14 = not v10 or not (v10.cleanupAfterSend ~= nil) or v10.cleanupAfterSend;
        local v15 = if v10 then v10.samplingRateOverride else nil;
        v8(function(v16) --[[ Line: 30 ]]
            -- upvalues: v9 (copy), v4 (ref), v11 (ref), v13 (ref), v12 (ref), v6 (ref), v14 (copy), l_FFlagAXTTIEnableMilestones_0 (ref), v7 (ref)
            local v17 = v16[v9];
            if v17 == nil then
                warn((("TimeToInteractiveTracker.trackEnd called before trackStart for eventName=%*"):format(v9)));
                return v16;
            elseif v17.startTime == nil then
                warn((("TimeToInteractiveTracker.trackEnd called before trackStart for eventName=%*"):format(v9)));
                return v16;
            else
                local v18 = v4();
                v11 = (v18 - v17.startTime) * 1000;
                v13 = v17.sent ~= true;
                if v13 then
                    local l_startTime_0 = v17.startTime;
                    local l_v11_0 = v11;
                    v12 = v6(v17.metadata, {
                        startTime = l_startTime_0, 
                        endTime = v18, 
                        deltaMs = l_v11_0
                    });
                end;
                local v21 = table.clone(v16);
                if v13 and v14 then
                    v21[v9] = nil;
                    return v21;
                else
                    v21[v9] = {
                        startTime = v17.startTime, 
                        endTime = v18, 
                        deltaMs = v11, 
                        sent = true, 
                        metadata = table.clone(v17.metadata), 
                        milestones = if l_FFlagAXTTIEnableMilestones_0 and v17.milestones then v7.deepCloneMilestones(v17.milestones) else nil
                    };
                    return v21;
                end;
            end;
        end);
        if v13 and v11 ~= nil and v12 ~= nil then
            v5({
                statName = v9, 
                deltaMs = v11, 
                metaData = v12, 
                samplingRateOverride = v15
            });
        end;
    end;
end;