local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_Milestone_0 = l_TimeToInteractiveTracker_0.Milestone;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local v4 = require(script.Parent.TTIMetricNames);
local function _(v5, v6) --[[ Line: 21 ]] --[[ Name: resolveTTIName ]]
    local v7 = "AvatarExperience_" .. v5;
    if v6 then
        v7 = v7 .. "_Percieved";
    end;
    return v7;
end;
local function _(v9, v10) --[[ Line: 30 ]] --[[ Name: applyMetadata ]]
    -- upvalues: l_TimeToInteractiveTracker_0 (copy)
    if v10 then
        l_TimeToInteractiveTracker_0.updateMetadata(v9, v10);
    end;
end;
local function _(v12) --[[ Line: 36 ]] --[[ Name: eventExists ]]
    -- upvalues: l_TimeToInteractiveTracker_0 (copy)
    local v13 = l_TimeToInteractiveTracker_0.getEvents();
    local v14 = false;
    if v13 ~= nil then
        v14 = v13[v12] ~= nil;
    end;
    return v14;
end;
return {
    Surface = {
        Marketplace = {
            Root = (function(v16) --[[ Line: 48 ]] --[[ Name: createSurface ]]
                -- upvalues: l_TimeToInteractiveTracker_0 (copy), l_FFlagAXTTIEnableMilestones_0 (copy)
                local function v23(v17, v18) --[[ Line: 49 ]] --[[ Name: batchStart ]]
                    -- upvalues: v16 (copy), l_TimeToInteractiveTracker_0 (ref)
                    for _, v20 in v16 do
                        local v21 = "AvatarExperience_" .. v20;
                        if v17 then
                            v21 = v21 .. "_Percieved";
                        end;
                        local l_v21_0 = v21;
                        l_TimeToInteractiveTracker_0.trackStart(l_v21_0);
                        if v18 then
                            l_TimeToInteractiveTracker_0.updateMetadata(l_v21_0, v18);
                        end;
                    end;
                end;
                local function _(v24, v25, v26) --[[ Line: 57 ]] --[[ Name: endSingle ]]
                    -- upvalues: l_TimeToInteractiveTracker_0 (ref)
                    local v27 = "AvatarExperience_" .. v24;
                    if v25 then
                        v27 = v27 .. "_Percieved";
                    end;
                    local l_v27_0 = v27;
                    if v25 then
                        local v29 = l_TimeToInteractiveTracker_0.getEvents();
                        v27 = false;
                        if v29 ~= nil then
                            v27 = v29[l_v27_0] ~= nil;
                        end;
                        if not v27 then
                            return;
                        end;
                    end;
                    if v26 then
                        l_TimeToInteractiveTracker_0.updateMetadata(l_v27_0, v26);
                    end;
                    l_TimeToInteractiveTracker_0.trackEnd(l_v27_0, if v25 then {
                        cleanupAfterSend = false
                    } else nil);
                end;
                return {
                    eventNames = v16, 
                    startTracking = function(v31) --[[ Line: 69 ]] --[[ Name: startTracking ]]
                        -- upvalues: v23 (copy)
                        v23(false, v31);
                    end, 
                    startPerceivedTracking = function(v32) --[[ Line: 73 ]] --[[ Name: startPerceivedTracking ]]
                        -- upvalues: v23 (copy)
                        v23(true, v32);
                    end, 
                    endTracking = function(v33, v34) --[[ Line: 77 ]] --[[ Name: endTracking ]]
                        -- upvalues: l_TimeToInteractiveTracker_0 (ref)
                        local v35 = "AvatarExperience_" .. v33;
                        if v34 then
                            l_TimeToInteractiveTracker_0.updateMetadata(v35, v34);
                        end;
                        l_TimeToInteractiveTracker_0.trackEnd(v35, nil);
                    end, 
                    endPerceivedTracking = function(v36, v37) --[[ Line: 81 ]] --[[ Name: endPerceivedTracking ]]
                        -- upvalues: l_TimeToInteractiveTracker_0 (ref)
                        local v38 = ("AvatarExperience_" .. v36) .. "_Percieved";
                        local v39 = l_TimeToInteractiveTracker_0.getEvents();
                        local v40 = false;
                        if v39 ~= nil then
                            v40 = v39[v38] ~= nil;
                        end;
                        if not v40 then
                            return;
                        else
                            if v37 then
                                l_TimeToInteractiveTracker_0.updateMetadata(v38, v37);
                            end;
                            l_TimeToInteractiveTracker_0.trackEnd(v38, {
                                cleanupAfterSend = false
                            });
                            return;
                        end;
                    end, 
                    updateMetadata = function(v41, v42) --[[ Line: 85 ]] --[[ Name: updateMetadata ]]
                        -- upvalues: l_TimeToInteractiveTracker_0 (ref)
                        local v43 = "AvatarExperience_" .. v41;
                        if v42 then
                            l_TimeToInteractiveTracker_0.updateMetadata(v43, v42);
                        end;
                    end, 
                    trackMilestone = l_FFlagAXTTIEnableMilestones_0 and l_TimeToInteractiveTracker_0.trackMilestone and function(v44, v45, v46) --[[ Line: 90 ]]
                        -- upvalues: l_TimeToInteractiveTracker_0 (ref)
                        l_TimeToInteractiveTracker_0.trackMilestone("AvatarExperience_" .. v44, v45, v46);
                    end or nil, 
                    trackSubphase = l_FFlagAXTTIEnableMilestones_0 and l_TimeToInteractiveTracker_0.trackSubphase and function(v47, v48, v49) --[[ Line: 96 ]]
                        -- upvalues: l_TimeToInteractiveTracker_0 (ref)
                        l_TimeToInteractiveTracker_0.trackSubphase("AvatarExperience_" .. v47, v48, v49);
                    end or nil, 
                    trackRequest = l_FFlagAXTTIEnableMilestones_0 and l_TimeToInteractiveTracker_0.trackRequest and function(v50, v51, v52) --[[ Line: 102 ]]
                        -- upvalues: l_TimeToInteractiveTracker_0 (ref)
                        l_TimeToInteractiveTracker_0.trackRequest("AvatarExperience_" .. v50, v51, v52);
                    end or nil
                };
            end)({
                v4.Marketplace.OrganicTiles, 
                v4.Marketplace.OrganicThumbnails, 
                v4.Marketplace.WidgetTiles, 
                v4.Marketplace.WidgetThumbnails
            })
        }
    }, 
    Milestone = l_Milestone_0, 
    TTIMetricNames = v4
};