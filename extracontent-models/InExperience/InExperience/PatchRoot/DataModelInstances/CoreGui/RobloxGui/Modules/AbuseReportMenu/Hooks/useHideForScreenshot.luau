local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = game:DefineFastFlag("AbuseReportMenuScreenshotReduceMotionFix", false);
local v5 = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20);
local v6 = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10);
local l_FFlagIEMTabFocusNav_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav;
local v8 = nil;
if v4 then
    v8 = UserSettings():GetService("UserGameSettings");
end;
local function _() --[[ Line: 22 ]]
    -- upvalues: v8 (ref), v5 (copy), v6 (copy)
    if v8.ReducedMotion then
        return v5;
    else
        return v6;
    end;
end;
local function _() --[[ Line: 29 ]]
    -- upvalues: v8 (ref), v5 (copy), v6 (copy)
    if v8.ReducedMotion then
        return v5 / 60;
    else
        return v6 / 60;
    end;
end;
return function(v11, v12, v13, v14, v15, v16) --[[ Line: 36 ]]
    -- upvalues: v3 (copy), l_FFlagIEMTabFocusNav_0 (copy), l_GuiService_0 (copy), l_RunService_0 (copy), v4 (copy), v8 (ref), v5 (copy), v6 (copy)
    local v17, v18 = v3.useState(false);
    local v19 = if l_FFlagIEMTabFocusNav_0 then v3.useRef(nil) else nil;
    v3.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v12 (copy), v17 (copy), l_FFlagIEMTabFocusNav_0 (ref), v19 (copy), l_GuiService_0 (ref), v18 (copy), v11 (copy), v13 (copy), l_RunService_0 (ref), v15 (copy), v4 (ref), v8 (ref), v5 (ref), v6 (ref), v14 (copy), v16 (copy)
        if v12 then
            if v17 then
                if l_FFlagIEMTabFocusNav_0 and v19.current and v19.current:IsDescendantOf(game) then
                    l_GuiService_0.SelectedCoreObject = v19.current;
                    v19.current = nil;
                end;
                v18(false);
                return;
            elseif v11 then
                if l_FFlagIEMTabFocusNav_0 then
                    v19.current = l_GuiService_0.SelectedCoreObject;
                end;
                v18(true);
                v13();
                local v20 = nil;
                local v21 = 0;
                local v22 = 0;
                local v23 = nil;
                local v24 = os.clock();
                v20 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 68 ]]
                    -- upvalues: v21 (ref), v15 (ref), v20 (ref)
                    if v21 == 1 then
                        v15();
                        v20:Disconnect();
                        return;
                    else
                        v21 = v21 + 1;
                        return;
                    end;
                end);
                v23 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 79 ]]
                    -- upvalues: v4 (ref), v24 (copy), v8 (ref), v5 (ref), v6 (ref), v22 (ref), v23 (ref), v14 (ref)
                    if v4 then
                        if os.clock() - v24 >= (if v8.ReducedMotion then v5 / 60 else v6 / 60) and v22 >= if v8.ReducedMotion then v5 else v6 then
                            v23:Disconnect();
                            v14();
                            return;
                        end;
                    elseif os.clock() - v24 >= 0.16666666666666666 and v22 >= 10 then
                        v23:Disconnect();
                        v14();
                        return;
                    end;
                    v22 = v22 + 1;
                end);
                return;
            end;
        elseif not v17 then
            v16();
        end;
    end, {
        v12
    });
end;