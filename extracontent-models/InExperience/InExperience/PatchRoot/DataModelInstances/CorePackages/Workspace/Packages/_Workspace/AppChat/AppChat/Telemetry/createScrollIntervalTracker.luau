local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local _ = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfEvent);
local v4 = require(l_script_FirstAncestor_0.Logger):new("ScrollIntervalTracker");
local v5 = require(l_Parent_0.Cryo);
local l_RunService_0 = game:GetService("RunService");
local v7 = game:DefineFastInt("AppChatScrollPerfMinDistancePx", 50);
local v8 = game:DefineFastInt("AppChatScrollPerfMinStableFrames", 5);
local v9 = {
    minDistancePx = v7, 
    stableFramesRequired = v8
};
return function(v10, v11, v12, v13) --[[ Line: 54 ]] --[[ Name: createScrollIntervalTracker ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy), v2 (copy), l_RunService_0 (copy)
    local v14 = v5.Dictionary.join(v9, v13 or {});
    local v15 = false;
    local v16 = nil;
    local v17 = 0;
    local v18 = 0;
    local v19 = nil;
    local function _() --[[ Line: 72 ]] --[[ Name: resetStopDetection ]]
        -- upvalues: v18 (ref), v19 (ref)
        v18 = 0;
        v19 = nil;
    end;
    local function _() --[[ Line: 77 ]] --[[ Name: resetStartDetection ]]
        -- upvalues: v16 (ref), v17 (ref)
        v16 = nil;
        v17 = 0;
    end;
    local function _(v22) --[[ Line: 82 ]] --[[ Name: stopInterval ]]
        -- upvalues: v4 (ref), v10 (copy), v2 (ref), v12 (copy), v15 (ref), v18 (ref), v19 (ref), v16 (ref), v17 (ref)
        v4:debug("Scroll: {} stopping (reason={})", v10, v22);
        v2.finish(v10, v12);
        v15 = false;
        v18 = 0;
        v19 = nil;
        v16 = nil;
        v17 = 0;
    end;
    local function _(v24) --[[ Line: 90 ]] --[[ Name: recordCanvasPositionChanged ]]
        -- upvalues: v18 (ref), v19 (ref)
        v18 = 0;
        v19 = v24;
    end;
    local function _(v26) --[[ Line: 96 ]] --[[ Name: isPastMinScrollDistance ]]
        -- upvalues: v16 (ref), v17 (ref), v14 (copy)
        if v16 ~= nil then
            v17 = v17 + math.abs(v26 - v16);
        end;
        v16 = v26;
        return v17 >= v14.minDistancePx;
    end;
    local function _(v28) --[[ Line: 104 ]] --[[ Name: tryStartInterval ]]
        -- upvalues: v4 (ref), v10 (copy), v2 (ref), v12 (copy), v15 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref)
        v4:debug("Scroll: {} starting", v10);
        if not v2.start(v10, v12) then
            return;
        else
            v15 = true;
            v16 = nil;
            v17 = 0;
            v18 = 0;
            v19 = v28;
            return;
        end;
    end;
    local v31 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 120 ]]
        -- upvalues: v15 (ref), v11 (copy), v19 (ref), v18 (ref), v14 (copy), v4 (ref), v10 (copy), v2 (ref), v12 (copy), v16 (ref), v17 (ref)
        if not v15 then
            return;
        else
            local l_Y_0 = v11.CanvasPosition.Y;
            if v19 == nil then
                v19 = l_Y_0;
                v18 = 0;
                return;
            else
                if math.abs(l_Y_0 - v19) <= 0.5 then
                    v18 = v18 + 1;
                else
                    v18 = 0;
                end;
                v19 = l_Y_0;
                if v18 >= v14.stableFramesRequired then
                    v4:debug("Scroll: {} stopping (reason={})", v10, "stableFrames");
                    v2.finish(v10, v12);
                    v15 = false;
                    v18 = 0;
                    v19 = nil;
                    v16 = nil;
                    v17 = 0;
                end;
                return;
            end;
        end;
    end);
    local function v33() --[[ Line: 145 ]] --[[ Name: onScrollTick ]]
        -- upvalues: v11 (copy), v15 (ref), v16 (ref), v17 (ref), v14 (copy), v4 (ref), v10 (copy), v2 (ref), v12 (copy), v18 (ref), v19 (ref)
        local l_Y_1 = v11.CanvasPosition.Y;
        if not v15 then
            if v16 ~= nil then
                v17 = v17 + math.abs(l_Y_1 - v16);
            end;
            v16 = l_Y_1;
            if not (v17 >= v14.minDistancePx) then
                return;
            else
                v4:debug("Scroll: {} starting", v10);
                if not v2.start(v10, v12) then
                    return;
                else
                    v15 = true;
                    v16 = nil;
                    v17 = 0;
                    v18 = 0;
                    v19 = l_Y_1;
                    return;
                end;
            end;
        else
            v18 = 0;
            v19 = l_Y_1;
            return;
        end;
    end;
    local function v34() --[[ Line: 160 ]] --[[ Name: cleanup ]]
        -- upvalues: v31 (copy), v15 (ref), v4 (ref), v10 (copy), v2 (ref), v12 (copy), v18 (ref), v19 (ref), v16 (ref), v17 (ref)
        if v31 then
            v31:Disconnect();
        end;
        if v15 then
            v4:debug("Scroll: {} cleanup/unmount", v10);
            v4:debug("Scroll: {} stopping (reason={})", v10, "cleanup");
            v2.finish(v10, v12);
            v15 = false;
            v18 = 0;
            v19 = nil;
            v16 = nil;
            v17 = 0;
        end;
    end;
    return {
        onScrollTick = v33, 
        cleanup = v34
    };
end;