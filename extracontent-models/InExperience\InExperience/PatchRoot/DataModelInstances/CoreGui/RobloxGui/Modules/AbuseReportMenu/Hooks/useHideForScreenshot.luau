local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = game:DefineFastFlag("AbuseReportMenuScreenshotReduceMotionFix", false);
local v4 = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20);
local v5 = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10);
local v6 = nil;
if v3 then
    v6 = UserSettings():GetService("UserGameSettings");
end;
local function _() --[[ Line: 19 ]]
    -- upvalues: v6 (ref), v4 (copy), v5 (copy)
    if v6.ReducedMotion then
        return v4;
    else
        return v5;
    end;
end;
local function _() --[[ Line: 26 ]]
    -- upvalues: v6 (ref), v4 (copy), v5 (copy)
    if v6.ReducedMotion then
        return v4 / 60;
    else
        return v5 / 60;
    end;
end;
return function(v9, v10, v11, v12, v13, v14) --[[ Line: 33 ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy), v3 (copy), v6 (ref), v4 (copy), v5 (copy)
    local v15, v16 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v10 (copy), v15 (copy), v16 (copy), v9 (copy), v11 (copy), l_RunService_0 (ref), v13 (copy), v3 (ref), v6 (ref), v4 (ref), v5 (ref), v12 (copy), v14 (copy)
        if v10 then
            if v15 then
                v16(false);
                return;
            elseif v9 then
                v16(true);
                v11();
                local v17 = nil;
                local v18 = 0;
                local v19 = 0;
                local v20 = nil;
                local v21 = os.clock();
                v17 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 57 ]]
                    -- upvalues: v18 (ref), v13 (ref), v17 (ref)
                    if v18 == 1 then
                        v13();
                        v17:Disconnect();
                        return;
                    else
                        v18 = v18 + 1;
                        return;
                    end;
                end);
                v20 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 68 ]]
                    -- upvalues: v3 (ref), v21 (copy), v6 (ref), v4 (ref), v5 (ref), v19 (ref), v20 (ref), v12 (ref)
                    if v3 then
                        if os.clock() - v21 >= (if v6.ReducedMotion then v4 / 60 else v5 / 60) and v19 >= if v6.ReducedMotion then v4 else v5 then
                            v20:Disconnect();
                            v12();
                            return;
                        end;
                    elseif os.clock() - v21 >= 0.16666666666666666 and v19 >= 10 then
                        v20:Disconnect();
                        v12();
                        return;
                    end;
                    v19 = v19 + 1;
                end);
                return;
            end;
        elseif not v15 then
            v14();
        end;
    end, {
        v10
    });
end;