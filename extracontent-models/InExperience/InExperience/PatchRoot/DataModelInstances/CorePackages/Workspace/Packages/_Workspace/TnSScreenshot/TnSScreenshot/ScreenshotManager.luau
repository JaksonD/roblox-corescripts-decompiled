local l_Parent_0 = script:FindFirstAncestor("TnSScreenshot").Parent;
local l_GetFFlagEnableInAppBugReporting_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableInAppBugReporting;
local function _() --[[ Line: 6 ]]
    return game:GetEngineFeature("ReportAnythingScreenshot") and game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal");
end;
local v3 = {};
v3.__index = v3;
local v4 = {};
local v5 = {};
local v6 = false;
local v7 = {
    RAABTestReason = "RAABTest"
};
local function v15(v8) --[[ Line: 27 ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (ref)
    v8.ScreenshotUploaded:Connect(function(v9, v10) --[[ Line: 28 ]]
        -- upvalues: v4 (ref)
        local v11 = v4[v9];
        if not v11 then
            return;
        else
            v11(v10);
            table.remove(v4, v9);
            return;
        end;
    end);
    v8.ScreenshotContentReady:Connect(function(v12, v13) --[[ Line: 37 ]]
        -- upvalues: v5 (ref)
        local v14 = v5[v12];
        if not v14 then
            return;
        else
            v14(v13);
            table.remove(v5, v12);
            return;
        end;
    end);
    v6 = true;
end;
v3.TakeScreenshotWithCallback = function(_, v17, v18, v19) --[[ Line: 59 ]] --[[ Name: TakeScreenshotWithCallback ]]
    -- upvalues: l_GetFFlagEnableInAppBugReporting_0 (copy), v7 (copy), v4 (copy), v5 (copy), v6 (ref), v15 (copy)
    if not (game:GetEngineFeature("ReportAnythingScreenshot") and game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal")) then
        return false;
    else
        local l_SafetyService_0 = game:GetService("SafetyService");
        local v21 = l_SafetyService_0:TakeScreenshot({
            registerContent = v18 ~= nil and 1 or 0, 
            reason = if l_GetFFlagEnableInAppBugReporting_0() then v19 or v7.RAABTestReason else v7.RAABTestReason
        });
        v4[v21] = v17;
        v5[v21] = v18;
        if not v6 then
            v15(l_SafetyService_0);
        end;
        return true;
    end;
end;
return v3;