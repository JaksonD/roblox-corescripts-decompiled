local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v3 = require(l_Parent_0.React);
return function(v4, v5) --[[ Line: 15 ]] --[[ Name: useCountdownBinding ]]
    -- upvalues: v3 (copy), l_LocalizationService_0 (copy), l_RunService_0 (copy)
    local v6, v7 = v3.useBinding(v5 or "");
    local v11 = v3.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy), l_LocalizationService_0 (ref), v7 (copy), v5 (copy)
        if v4 ~= nil then
            local v8 = nil;
            local v9 = DateTime.now();
            local v10 = math.max(v4 - v9.UnixTimestamp, 0);
            v8 = if v10 >= 3600 then DateTime.fromUnixTimestamp(v10):FormatUniversalTime("h:mm:ss", l_LocalizationService_0.RobloxLocaleId) else DateTime.fromUnixTimestamp(v10):FormatUniversalTime("m:ss", l_LocalizationService_0.RobloxLocaleId);
            v7(v8);
            return v10;
        else
            v7(v5 or "");
            return 0;
        end;
    end, {
        v5, 
        v4
    });
    v3.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v11 (copy)
        v11();
    end, {
        v11
    });
    v3.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v4 (copy), l_RunService_0 (ref), v11 (copy)
        local v12 = nil;
        if v4 ~= nil then
            local v13 = DateTime.now();
            local v14 = v4 - v13.UnixTimestamp;
            do
                local l_v14_0 = v14;
                if l_v14_0 > 0 then
                    local v16 = 0;
                    do
                        local l_v16_0 = v16;
                        v12 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 52 ]]
                            -- upvalues: l_v16_0 (ref), l_v14_0 (ref), v11 (ref), v12 (ref)
                            local v18 = os.clock();
                            if v18 - l_v16_0 < 1 then
                                return;
                            else
                                l_v16_0 = v18;
                                l_v14_0 = v11();
                                if l_v14_0 <= 0 and v12 then
                                    v12:Disconnect();
                                    v12 = nil;
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
            end;
        end;
        return function() --[[ Line: 66 ]]
            -- upvalues: v12 (ref)
            if v12 ~= nil then
                v12:Disconnect();
                v12 = nil;
            end;
        end;
    end, {
        v4, 
        v11
    });
    return v6;
end;