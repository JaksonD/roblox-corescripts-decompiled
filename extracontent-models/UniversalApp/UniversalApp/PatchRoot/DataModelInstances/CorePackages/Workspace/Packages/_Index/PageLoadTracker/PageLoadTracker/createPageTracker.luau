local v0 = require(script.Parent.recordMilestone);
local v1 = require(script.Parent.PageLoadConfig);
local _ = require(script.Parent.PageLoadTypes);
local l_Signal_0 = require(script.Parent.Parent.AppCommonLib).Signal;
local v4 = require(script.Parent.Parent.SharedFlags);
local v5 = require(script.Parent.isElementContentful);
local l_IDLE_TIMEOUT_SECONDS_0 = v1.IDLE_TIMEOUT_SECONDS;
local function _(v7) --[[ Line: 30 ]] --[[ Name: getGuiObjectArea ]]
    return v7.AbsoluteSize.X * v7.AbsoluteSize.Y;
end;
return function() --[[ Line: 34 ]] --[[ Name: createPageTracker ]]
    -- upvalues: l_Signal_0 (copy), v4 (copy), l_IDLE_TIMEOUT_SECONDS_0 (copy), v0 (copy), v5 (copy)
    return {
        pageName = "", 
        startTime = 0, 
        lastActivityTime = 0, 
        timeoutThread = nil, 
        isActive = false, 
        numLoads = 0, 
        onCompleteSignal = l_Signal_0.new(), 
        sentMilestones = {}, 
        start = function(v9, v10) --[[ Line: 46 ]] --[[ Name: start ]]
            -- upvalues: v4 (ref), l_IDLE_TIMEOUT_SECONDS_0 (ref)
            if v9.isActive then
                return;
            else
                v9.pageName = v10 or "UnknownPage";
                v9.startTime = os.clock();
                v9.lastActivityTime = v9.startTime;
                v9.isActive = true;
                v9.numLoads = v9.numLoads + 1;
                v9.sentMilestones = {};
                if v4.FFlagLuaAppEnableContentfulPaintTracking then
                    if v4.FFlagLuaAppLCPTimingFix then
                        v9.LCPCandidate = {
                            guiArea = 0, 
                            timestamp = v9.startTime
                        };
                    else
                        v9.LCPCandidate = {
                            guiArea = 0, 
                            timestamp = 0
                        };
                    end;
                end;
                v9.timeoutThread = task.delay(l_IDLE_TIMEOUT_SECONDS_0, function() --[[ Line: 71 ]]
                    -- upvalues: v9 (copy)
                    v9:complete();
                end);
                return;
            end;
        end, 
        logMilestone = function(v11) --[[ Line: 76 ]] --[[ Name: logMilestone ]]
            -- upvalues: l_IDLE_TIMEOUT_SECONDS_0 (ref)
            if not v11.isActive then
                return;
            else
                v11.lastActivityTime = os.clock();
                if v11.timeoutThread then
                    task.cancel(v11.timeoutThread);
                end;
                v11.timeoutThread = task.delay(l_IDLE_TIMEOUT_SECONDS_0, function() --[[ Line: 89 ]]
                    -- upvalues: v11 (copy)
                    v11:complete();
                end);
                return;
            end;
        end, 
        sendMilestone = function(v12, v13, v14) --[[ Line: 94 ]] --[[ Name: sendMilestone ]]
            -- upvalues: v4 (ref), v0 (ref)
            local v15 = if v4.FFlagLuaAppEnableContentfulPaintTracking then ((v14 or os.clock()) - v12.startTime) * 1000 else (os.clock() - v12.startTime) * 1000;
            if v4.FFlagLuaAppEnableMilestoneDeduplication then
                if v12.sentMilestones[v13] then
                    return;
                else
                    v12.sentMilestones[v13] = true;
                end;
            end;
            local v16 = {
                app_page_name = v12.pageName, 
                milestone_name = v13, 
                time_from_start = v15, 
                first_load = v12.numLoads == 1
            };
            v0(v16);
        end, 
        onComponentAdded = function(v17, v18) --[[ Line: 116 ]] --[[ Name: onComponentAdded ]]
            -- upvalues: v4 (ref), v5 (ref)
            if not v17.isActive then
                return;
            else
                if v4.FFlagLuaAppEnableContentfulPaintTracking and v5(v18) then
                    local v19 = v18.AbsoluteSize.X * v18.AbsoluteSize.Y;
                    if v17.LCPCandidate.guiArea < v19 then
                        v17:sendMilestone("first_contentful_paint");
                        v17.LCPCandidate = {
                            guiArea = v19, 
                            timestamp = os.clock()
                        };
                    end;
                end;
                v17:logMilestone();
                return;
            end;
        end, 
        stop = function(v20) --[[ Line: 135 ]] --[[ Name: stop ]]
            -- upvalues: v4 (ref)
            if not v20.isActive then
                return;
            else
                if v20.timeoutThread then
                    task.cancel(v20.timeoutThread);
                    v20.timeoutThread = nil;
                end;
                v20.isActive = false;
                if v4.FFlagPageLoadAllowImprovedDisconnectTiming then
                    v20.onCompleteSignal:fire();
                end;
                return;
            end;
        end, 
        complete = function(v21) --[[ Line: 151 ]] --[[ Name: complete ]]
            -- upvalues: v4 (ref), v0 (ref)
            if not v21.isActive then
                return;
            else
                if not v4.FFlagLuaAppEnableContentfulPaintTracking then
                    v21.isActive = false;
                end;
                v21.timeoutThread = nil;
                if v4.FFlagLuaAppEnableContentfulPaintTracking then
                    v21:sendMilestone("initial_viewport_loaded", v21.lastActivityTime);
                    if v4.FFlagLuaAppLCPTimingFix then
                        if v21.LCPCandidate.guiArea > 0 then
                            v21:sendMilestone("largest_contentful_paint", v21.LCPCandidate.timestamp);
                        end;
                    else
                        v21:sendMilestone("largest_contentful_paint", v21.LCPCandidate.timestamp);
                    end;
                else
                    local v22 = (v21.lastActivityTime - v21.startTime) * 1000;
                    local v23 = {
                        app_page_name = v21.pageName, 
                        milestone_name = "initial_viewport_loaded", 
                        time_from_start = v22, 
                        first_load = v21.numLoads == 1
                    };
                    v0(v23);
                end;
                if v4.FFlagPageLoadAllowImprovedDisconnectTiming then
                    v21.onCompleteSignal:fire();
                end;
                return;
            end;
        end
    };
end;