local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_Parent_0.React);
local l_useEffect_0 = v3.useEffect;
local l_useMemo_0 = v3.useMemo;
local l_useState_0 = v3.useState;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local function v11(v8) --[[ Line: 39 ]] --[[ Name: formatCountdown ]]
    -- upvalues: l_LocalizationService_0 (copy)
    if v8 <= 0 then
        return nil;
    else
        local v9 = math.ceil(v8 / 60) * 60;
        if v9 >= 86400 then
            local v10 = math.ceil(v9 / 86400);
            return (("%* %* left"):format(v10, v10 == 1 and "day" or "days"));
        else
            return DateTime.fromUnixTimestamp(v9):FormatUniversalTime("HH:mm", l_LocalizationService_0.RobloxLocaleId) .. " " .. "left";
        end;
    end;
end;
return function(v12) --[[ Line: 70 ]] --[[ Name: useRestrictionEndDateInfo ]]
    -- upvalues: l_useMemo_0 (copy), l_LocalizationService_0 (copy), l_dependencyArray_0 (copy), l_useState_0 (copy), v11 (copy), l_useEffect_0 (copy), l_RunService_0 (copy)
    local v13 = if v12 and v12 ~= "" then DateTime.fromIsoDate(v12) else nil;
    local v14 = l_useMemo_0(function() --[[ Line: 73 ]]
        -- upvalues: v13 (copy), l_LocalizationService_0 (ref)
        if v13 then
            return (v13:FormatLocalTime("LLL", l_LocalizationService_0.RobloxLocaleId));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v13));
    local v16, v17 = l_useState_0(function() --[[ Line: 77 ]]
        -- upvalues: v13 (copy), v11 (ref)
        if v13 == nil then
            return nil;
        else
            local v15 = math.max(v13.UnixTimestamp - DateTime.now().UnixTimestamp, 0);
            return (v11(v15));
        end;
    end);
    l_useEffect_0(function() --[[ Line: 86 ]]
        -- upvalues: v13 (copy), v17 (copy), v11 (ref), l_RunService_0 (ref)
        if v13 == nil then
            v17(nil);
            return;
        else
            local v18 = DateTime.now();
            local v19 = v13.UnixTimestamp - v18.UnixTimestamp;
            if v19 <= 0 then
                v17(nil);
                return;
            else
                v17((v11(v19)));
                local v20 = 0;
                local v21 = nil;
                v21 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 107 ]]
                    -- upvalues: v20 (ref), v13 (ref), v17 (ref), v11 (ref), v21 (ref)
                    local v22 = os.clock();
                    if v22 - v20 < 1 then
                        return;
                    else
                        v20 = v22;
                        local v23 = math.max(v13.UnixTimestamp - DateTime.now().UnixTimestamp, 0);
                        v17((v11(v23)));
                        if v23 <= 0 and v21 then
                            v21:Disconnect();
                            v21 = nil;
                        end;
                        return;
                    end;
                end);
                return function() --[[ Line: 125 ]]
                    -- upvalues: v21 (ref)
                    if v21 then
                        v21:Disconnect();
                        v21 = nil;
                    end;
                end;
            end;
        end;
    end, l_dependencyArray_0(v13, v17));
    return {
        formattedEndDate = v14, 
        countdownText = v16
    };
end;