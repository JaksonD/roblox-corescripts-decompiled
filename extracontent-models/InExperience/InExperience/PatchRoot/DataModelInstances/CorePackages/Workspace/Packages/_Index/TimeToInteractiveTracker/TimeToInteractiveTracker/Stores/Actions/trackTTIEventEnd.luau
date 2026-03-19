local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local _ = require(script.Parent.Parent.types);
local v4 = require(script.Parent.Parent.Parent.Utils.now);
local v5 = require(l_script_FirstAncestor_0.Utils.sendTTIStat);
local v6 = require(l_script_FirstAncestor_0.Utils.mergeTTIEventMetadata);
local v7 = require(l_script_FirstAncestor_0.Utils.Util);
return function(v8) --[[ Line: 21 ]]
    -- upvalues: v4 (copy), v6 (copy), l_FFlagAXTTIEnableMilestones_0 (copy), v7 (copy), v5 (copy)
    return function(v9, v10) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), v4 (ref), v6 (ref), l_FFlagAXTTIEnableMilestones_0 (ref), v7 (ref), v5 (ref)
        local v11 = nil;
        local v12 = nil;
        local v13 = nil;
        local v14 = false;
        local v15 = not v10 or not (v10.cleanupAfterSend ~= nil) or v10.cleanupAfterSend;
        local v16 = if v10 then v10.samplingRateOverride else nil;
        v8(function(v17) --[[ Line: 32 ]]
            -- upvalues: v9 (copy), v4 (ref), v11 (ref), v14 (ref), v12 (ref), v6 (ref), l_FFlagAXTTIEnableMilestones_0 (ref), v13 (ref), v15 (copy), v7 (ref)
            local v18 = v17[v9];
            if v18 == nil then
                warn((("TimeToInteractiveTracker.trackEnd called before trackStart for eventName=%*"):format(v9)));
                return v17;
            elseif v18.startTime == nil then
                warn((("TimeToInteractiveTracker.trackEnd called before trackStart for eventName=%*"):format(v9)));
                return v17;
            else
                local v19 = v4();
                v11 = (v19 - v18.startTime) * 1000;
                v14 = v18.sent ~= true;
                if v14 then
                    local l_startTime_0 = v18.startTime;
                    local l_v11_0 = v11;
                    v12 = v6(v18.metadata, {
                        startTime = l_startTime_0, 
                        endTime = v19, 
                        deltaMs = l_v11_0
                    });
                    if l_FFlagAXTTIEnableMilestones_0 and v18.milestones then
                        v13 = v18.milestones;
                    end;
                end;
                local v22 = table.clone(v17);
                if v14 and v15 then
                    v22[v9] = nil;
                    return v22;
                else
                    v22[v9] = {
                        startTime = v18.startTime, 
                        endTime = v19, 
                        deltaMs = v11, 
                        sent = true, 
                        metadata = table.clone(v18.metadata), 
                        milestones = if l_FFlagAXTTIEnableMilestones_0 and v18.milestones then v7.deepCloneMilestones(v18.milestones) else nil
                    };
                    return v22;
                end;
            end;
        end);
        if v14 and v11 ~= nil and v12 ~= nil then
            v5({
                statName = v9, 
                deltaMs = v11, 
                metaData = v12, 
                samplingRateOverride = v16, 
                milestones = if l_FFlagAXTTIEnableMilestones_0 then v13 else nil
            });
        end;
    end;
end;