local v0 = game:DefineFastInt("ScrollingPerfTrackerEventStream", 0);
local v1 = game:DefineFastInt("ScrollingPerfTrackerKibana", 0);
local v2 = game:DefineFastInt("ScrollingPerfTrackerSampleCountThreshold", 50);
local v3 = game:DefineFastInt("ScrollingPerfTrackerTargetFPS", 60);
applicationId = function() --[[ Line: 38 ]] --[[ Name: applicationId ]]
    local l_AppStorageService_0 = game:GetService("AppStorageService");
    if not l_AppStorageService_0 then
        return nil;
    else
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("AppInstallationId");
        local v6 = typeof(l_l_AppStorageService_0_Item_0);
        if v6 == "number" then
            return tonumber(l_l_AppStorageService_0_Item_0) or nil;
        elseif v6 == "string" then
            if string.len(l_l_AppStorageService_0_Item_0) <= 0 then
                return nil;
            else
                return (tonumber((string.sub(l_l_AppStorageService_0_Item_0, -string.len((tostring(1000)))))));
            end;
        else
            return nil;
        end;
    end;
end;
local l_v0_0 = v0;
local l_v1_0 = v1;
local v9 = true;
if l_v0_0 <= 0 then
    v9 = l_v1_0 > 0;
end;
if not v9 then
    return nil;
else
    local v10 = math.random(0, 1000);
    local v11 = applicationId();
    if v11 ~= nil then
        v10 = (v11 + 647) % 1000;
    else
        local l_Players_0 = game:GetService("Players");
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        if l_LocalPlayer_0 and l_LocalPlayer_0.UserId > 0 then
            v10 = (l_LocalPlayer_0.UserId + 647) % 1000;
        end;
    end;
    if v10 >= l_v0_0 then
        l_v0_0 = 0;
    end;
    if v10 >= l_v1_0 then
        l_v1_0 = 0;
    end;
    local v14 = true;
    if l_v0_0 <= 0 then
        v14 = l_v1_0 > 0;
    end;
    if not v14 then
        return nil;
    else
        v14 = game:GetService("RunService");
        local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
        local v16 = require(script.Parent.RobloxTelemetryConfigs.ScrollingPerformance);
        local v17 = nil;
        v17 = if v3 > 0 then 1 / v3 else 0.016666666666666666;
        local v18 = {};
        v18.__index = v18;
        v18.new = function(v19, v20) --[[ Line: 116 ]] --[[ Name: new ]]
            -- upvalues: v18 (copy)
            local v21 = {
                id = v19, 
                lastScrollPosition = 0, 
                histogram = {}, 
                sampleCount = 0, 
                renderStepConn = nil, 
                canvasPositionConn = nil, 
                scrollingFrame = nil, 
                totalScrollDistance = 0
            };
            if v20 then
                if v20.analyticsService then
                    v21.analyticsService = v20.analyticsService.EventStream;
                end;
                v21.loggingProtocol = v20.loggingProtocol;
            end;
            return (setmetatable(v21, v18));
        end;
        v18.eventData = function(v22) --[[ Line: 135 ]] --[[ Name: eventData ]]
            -- upvalues: l_RbxAnalyticsService_0 (copy)
            if v22.sampleCount == 0 then
                return {};
            else
                local v23 = (v22.histogram[1] or 0) / v22.sampleCount;
                local v24 = 0;
                local v25 = 0;
                if v22.scrollingFrame then
                    local l_AbsoluteSize_0 = v22.scrollingFrame.AbsoluteSize;
                    v24 = l_AbsoluteSize_0.X;
                    v25 = l_AbsoluteSize_0.Y;
                end;
                return {
                    component_id = v22.id, 
                    sessionid = if l_RbxAnalyticsService_0 then l_RbxAnalyticsService_0:GetSessionId() else "", 
                    smooth_ratio = v23, 
                    drop_count_0 = v22.histogram[1] or 0, 
                    drop_count_1 = v22.histogram[2] or 0, 
                    drop_count_2 = v22.histogram[3] or 0, 
                    drop_count_3 = v22.histogram[4] or 0, 
                    distance_pixels = math.ceil(v22.totalScrollDistance), 
                    frame_width = v24, 
                    frame_height = v25
                };
            end;
        end;
        v18.sendEvent = function(v27) --[[ Line: 165 ]] --[[ Name: sendEvent ]]
            -- upvalues: v2 (copy), l_v0_0 (ref), l_v1_0 (ref), v16 (copy)
            if v27.sampleCount < v2 or v27.sampleCount == 0 then
                return;
            else
                local v28 = v27:eventData();
                v27:resetCounts();
                if l_v0_0 > 0 and v27.analyticsService then
                    v27.analyticsService:sendEventDeferred(v27.id, "scrolling_performance", v28);
                end;
                if l_v1_0 > 0 and v27.loggingProtocol then
                    v27.loggingProtocol:logRobloxTelemetryEvent(v16, {}, v28);
                end;
                return;
            end;
        end;
        v18.resetCounts = function(v29) --[[ Line: 182 ]] --[[ Name: resetCounts ]]
            v29.histogram = {};
            v29.sampleCount = 0;
            v29.totalScrollDistance = 0;
        end;
        v18.canvasPositionChanged = function(v30) --[[ Line: 188 ]] --[[ Name: canvasPositionChanged ]]
            -- upvalues: v14 (copy)
            if not v30.renderStepConn then
                v30.renderStepConn = v14.Heartbeat:Connect(function(v31) --[[ Line: 190 ]]
                    -- upvalues: v30 (copy)
                    v30:captureFrameUpdate(v31);
                end);
            end;
        end;
        v18.captureFrameUpdate = function(v32, v33) --[[ Line: 196 ]] --[[ Name: captureFrameUpdate ]]
            -- upvalues: v17 (ref)
            local v34 = v32.scrollingFrame and v32.scrollingFrame.CanvasPosition.Y or 0;
            if v34 == v32.lastScrollPosition then
                local l_renderStepConn_0 = v32.renderStepConn;
                if l_renderStepConn_0 then
                    l_renderStepConn_0:Disconnect();
                end;
                v32.renderStepConn = nil;
                v32:sendEvent();
                return;
            else
                v32.totalScrollDistance = v32.totalScrollDistance + math.abs(v34 - v32.lastScrollPosition);
                local v36 = math.min(4, math.floor(math.max(0, v33 - 0.002) / v17) + 1);
                v32.histogram[v36] = (v32.histogram[v36] or 0) + 1;
                v32.lastScrollPosition = v34;
                v32.sampleCount = v32.sampleCount + 1;
                return;
            end;
        end;
        v18.setScrollingFrame = function(v37, v38) --[[ Line: 219 ]] --[[ Name: setScrollingFrame ]]
            if v37.scrollingFrame ~= v38 then
                v37.scrollingFrame = v38;
                local l_canvasPositionConn_0 = v37.canvasPositionConn;
                if v38 then
                    v37.lastScrollPosition = v38.CanvasPosition.Y;
                    v37.canvasPositionConn = v38:GetPropertyChangedSignal("CanvasPosition"):Connect(function(_, _, _) --[[ Line: 227 ]]
                        -- upvalues: v37 (copy)
                        v37:canvasPositionChanged();
                    end);
                else
                    v37.canvasPositionConn = nil;
                end;
                if l_canvasPositionConn_0 then
                    l_canvasPositionConn_0:Disconnect();
                end;
            end;
        end;
        v18.clean = function(v43) --[[ Line: 239 ]] --[[ Name: clean ]]
            v43:setScrollingFrame(nil);
            local l_renderStepConn_1 = v43.renderStepConn;
            if l_renderStepConn_1 then
                l_renderStepConn_1:Disconnect();
            end;
            v43.renderStepConn = nil;
            v43:resetCounts();
        end;
        return v18;
    end;
end;