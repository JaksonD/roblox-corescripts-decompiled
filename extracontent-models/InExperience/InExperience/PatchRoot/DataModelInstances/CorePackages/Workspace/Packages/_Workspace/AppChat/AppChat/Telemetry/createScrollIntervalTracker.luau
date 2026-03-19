local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local _ = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfEvent);
local v4 = require(l_script_FirstAncestor_0.Logger):new("ScrollIntervalTracker");
local v5 = require(l_Parent_0.Cryo);
local l_Performance_0 = require(l_script_FirstAncestor_0.Parent.SocialLuaAnalytics).Performance;
local l_RunService_0 = game:GetService("RunService");
local v8 = game:DefineFastInt("AppChatScrollPerfMinDistancePx", 50);
local v9 = game:DefineFastInt("AppChatScrollPerfMinStableFrames", 5);
local v10 = game:DefineFastFlag("AppChatMigrateScrollIntervalTracker", false);
local v11 = {
    minDistancePx = v8, 
    stableFramesRequired = v9
};
if v10 then
    return function(v12, v13, v14, v15) --[[ Line: 52 ]] --[[ Name: createScrollIntervalTracker ]]
        -- upvalues: v2 (copy), v5 (copy), v11 (copy), l_Performance_0 (copy)
        local function v17(v16) --[[ Line: 58 ]] --[[ Name: tryStart ]]
            -- upvalues: v2 (ref), v12 (copy)
            return v2.start(v12, v16);
        end;
        local function v19(v18) --[[ Line: 61 ]] --[[ Name: finish ]]
            -- upvalues: v2 (ref), v12 (copy)
            v2.finish(v12, v18);
        end;
        local v20 = v5.Dictionary.join(v11, {
            debugName = v12
        }, v15 or {});
        return l_Performance_0.createScrollIntervalTracker(v17, v19, v13, v14, v20);
    end;
else
    return function(v21, v22, v23, v24) --[[ Line: 73 ]] --[[ Name: createScrollIntervalTracker ]]
        -- upvalues: v5 (copy), v11 (copy), v4 (copy), v2 (copy), l_RunService_0 (copy)
        local v25 = v5.Dictionary.join(v11, v24 or {});
        local v26 = false;
        local v27 = nil;
        local v28 = 0;
        local v29 = 0;
        local v30 = nil;
        local function _() --[[ Line: 91 ]] --[[ Name: resetStopDetection ]]
            -- upvalues: v29 (ref), v30 (ref)
            v29 = 0;
            v30 = nil;
        end;
        local function _() --[[ Line: 96 ]] --[[ Name: resetStartDetection ]]
            -- upvalues: v27 (ref), v28 (ref)
            v27 = nil;
            v28 = 0;
        end;
        local function _(v33) --[[ Line: 101 ]] --[[ Name: stopInterval ]]
            -- upvalues: v4 (ref), v21 (copy), v2 (ref), v23 (copy), v26 (ref), v29 (ref), v30 (ref), v27 (ref), v28 (ref)
            v4:debug("Scroll: {} stopping (reason={})", v21, v33);
            v2.finish(v21, v23);
            v26 = false;
            v29 = 0;
            v30 = nil;
            v27 = nil;
            v28 = 0;
        end;
        local function _(v35) --[[ Line: 109 ]] --[[ Name: recordCanvasPositionChanged ]]
            -- upvalues: v29 (ref), v30 (ref)
            v29 = 0;
            v30 = v35;
        end;
        local function _(v37) --[[ Line: 115 ]] --[[ Name: isPastMinScrollDistance ]]
            -- upvalues: v27 (ref), v28 (ref), v25 (copy)
            if v27 ~= nil then
                v28 = v28 + math.abs(v37 - v27);
            end;
            v27 = v37;
            return v28 >= v25.minDistancePx;
        end;
        local function _(v39) --[[ Line: 123 ]] --[[ Name: tryStartInterval ]]
            -- upvalues: v4 (ref), v21 (copy), v2 (ref), v23 (copy), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref)
            v4:debug("Scroll: {} starting", v21);
            if not v2.start(v21, v23) then
                return;
            else
                v26 = true;
                v27 = nil;
                v28 = 0;
                v29 = 0;
                v30 = v39;
                return;
            end;
        end;
        local v42 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 139 ]]
            -- upvalues: v26 (ref), v22 (copy), v30 (ref), v29 (ref), v25 (copy), v4 (ref), v21 (copy), v2 (ref), v23 (copy), v27 (ref), v28 (ref)
            if not v26 then
                return;
            else
                local l_Y_0 = v22.CanvasPosition.Y;
                if v30 == nil then
                    v30 = l_Y_0;
                    v29 = 0;
                    return;
                else
                    if math.abs(l_Y_0 - v30) <= 0.5 then
                        v29 = v29 + 1;
                    else
                        v29 = 0;
                    end;
                    v30 = l_Y_0;
                    if v29 >= v25.stableFramesRequired then
                        v4:debug("Scroll: {} stopping (reason={})", v21, "stableFrames");
                        v2.finish(v21, v23);
                        v26 = false;
                        v29 = 0;
                        v30 = nil;
                        v27 = nil;
                        v28 = 0;
                    end;
                    return;
                end;
            end;
        end);
        local function v44() --[[ Line: 164 ]] --[[ Name: onScrollTick ]]
            -- upvalues: v22 (copy), v26 (ref), v27 (ref), v28 (ref), v25 (copy), v4 (ref), v21 (copy), v2 (ref), v23 (copy), v29 (ref), v30 (ref)
            local l_Y_1 = v22.CanvasPosition.Y;
            if not v26 then
                if v27 ~= nil then
                    v28 = v28 + math.abs(l_Y_1 - v27);
                end;
                v27 = l_Y_1;
                if not (v28 >= v25.minDistancePx) then
                    return;
                else
                    v4:debug("Scroll: {} starting", v21);
                    if not v2.start(v21, v23) then
                        return;
                    else
                        v26 = true;
                        v27 = nil;
                        v28 = 0;
                        v29 = 0;
                        v30 = l_Y_1;
                        return;
                    end;
                end;
            else
                v29 = 0;
                v30 = l_Y_1;
                return;
            end;
        end;
        local function v45() --[[ Line: 179 ]] --[[ Name: cleanup ]]
            -- upvalues: v42 (copy), v26 (ref), v4 (ref), v21 (copy), v2 (ref), v23 (copy), v29 (ref), v30 (ref), v27 (ref), v28 (ref)
            if v42 then
                v42:Disconnect();
            end;
            if v26 then
                v4:debug("Scroll: {} cleanup/unmount", v21);
                v4:debug("Scroll: {} stopping (reason={})", v21, "cleanup");
                v2.finish(v21, v23);
                v26 = false;
                v29 = 0;
                v30 = nil;
                v27 = nil;
                v28 = 0;
            end;
        end;
        return {
            onScrollTick = v44, 
            cleanup = v45
        };
    end;
end;