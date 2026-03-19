local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.Logger);
local v3 = require(l_Parent_0.Cryo);
local l_RunService_0 = game:GetService("RunService");
local v5 = {
    minDistancePx = 50, 
    stableFramesRequired = 5
};
return function(v6, v7, v8, v9, v10) --[[ Line: 49 ]] --[[ Name: createScrollIntervalTracker ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy), l_RunService_0 (copy)
    local v11 = v3.Dictionary.join(v5, v10 or {});
    local v12 = false;
    local v13 = nil;
    local v14 = 0;
    local v15 = 0;
    local v16 = nil;
    local function _() --[[ Line: 68 ]] --[[ Name: resetStopDetection ]]
        -- upvalues: v15 (ref), v16 (ref)
        v15 = 0;
        v16 = nil;
    end;
    local function _() --[[ Line: 73 ]] --[[ Name: resetStartDetection ]]
        -- upvalues: v13 (ref), v14 (ref)
        v13 = nil;
        v14 = 0;
    end;
    local function _(v19) --[[ Line: 78 ]] --[[ Name: stopInterval ]]
        -- upvalues: v2 (ref), v11 (copy), v7 (copy), v9 (copy), v12 (ref), v15 (ref), v16 (ref), v13 (ref), v14 (ref)
        v2:debug("Scroll {} stopping (reason={})", v11.debugName, v19);
        v7(v9);
        v12 = false;
        v15 = 0;
        v16 = nil;
        v13 = nil;
        v14 = 0;
    end;
    local function _(v21) --[[ Line: 86 ]] --[[ Name: recordCanvasPositionChanged ]]
        -- upvalues: v15 (ref), v16 (ref)
        v15 = 0;
        v16 = v21;
    end;
    local function _(v23) --[[ Line: 92 ]] --[[ Name: isPastMinScrollDistance ]]
        -- upvalues: v13 (ref), v14 (ref), v11 (copy)
        if v13 ~= nil then
            v14 = v14 + math.abs(v23 - v13);
        end;
        v13 = v23;
        return v14 >= v11.minDistancePx;
    end;
    local function _(v25) --[[ Line: 100 ]] --[[ Name: tryStartInterval ]]
        -- upvalues: v2 (ref), v11 (copy), v6 (copy), v9 (copy), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v16 (ref)
        v2:debug("Scroll {} starting", v11.debugName);
        if not v6(v9) then
            return;
        else
            v12 = true;
            v13 = nil;
            v14 = 0;
            v15 = 0;
            v16 = v25;
            return;
        end;
    end;
    local v28 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 116 ]]
        -- upvalues: v12 (ref), v8 (copy), v16 (ref), v15 (ref), v11 (copy), v2 (ref), v7 (copy), v9 (copy), v13 (ref), v14 (ref)
        if not v12 then
            return;
        else
            local l_Y_0 = v8.CanvasPosition.Y;
            if v16 == nil then
                v16 = l_Y_0;
                v15 = 0;
                return;
            else
                if math.abs(l_Y_0 - v16) <= 0.5 then
                    v15 = v15 + 1;
                else
                    v15 = 0;
                end;
                v16 = l_Y_0;
                if v15 >= v11.stableFramesRequired then
                    v2:debug("Scroll {} stopping (reason={})", v11.debugName, "stableFrames");
                    v7(v9);
                    v12 = false;
                    v15 = 0;
                    v16 = nil;
                    v13 = nil;
                    v14 = 0;
                end;
                return;
            end;
        end;
    end);
    local function v30() --[[ Line: 141 ]] --[[ Name: onScrollTick ]]
        -- upvalues: v8 (copy), v12 (ref), v13 (ref), v14 (ref), v11 (copy), v2 (ref), v6 (copy), v9 (copy), v15 (ref), v16 (ref)
        local l_Y_1 = v8.CanvasPosition.Y;
        if not v12 then
            if v13 ~= nil then
                v14 = v14 + math.abs(l_Y_1 - v13);
            end;
            v13 = l_Y_1;
            if not (v14 >= v11.minDistancePx) then
                return;
            else
                v2:debug("Scroll {} starting", v11.debugName);
                if not v6(v9) then
                    return;
                else
                    v12 = true;
                    v13 = nil;
                    v14 = 0;
                    v15 = 0;
                    v16 = l_Y_1;
                    return;
                end;
            end;
        else
            v15 = 0;
            v16 = l_Y_1;
            return;
        end;
    end;
    local function v31() --[[ Line: 156 ]] --[[ Name: cleanup ]]
        -- upvalues: v28 (copy), v12 (ref), v2 (ref), v11 (copy), v7 (copy), v9 (copy), v15 (ref), v16 (ref), v13 (ref), v14 (ref)
        if v28 then
            v28:Disconnect();
        end;
        if v12 then
            v2:debug("Scroll {} cleanup/unmount", v11.debugName);
            v2:debug("Scroll {} stopping (reason={})", v11.debugName, "cleanup");
            v7(v9);
            v12 = false;
            v15 = 0;
            v16 = nil;
            v13 = nil;
            v14 = 0;
        end;
    end;
    return {
        onScrollTick = v30, 
        cleanup = v31
    };
end;