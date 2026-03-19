local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.calculateCountdownTime);
local function _(v5) --[[ Line: 19 ]] --[[ Name: validateTimeValues ]]
    if v5.days < 0 then
        return false;
    elseif v5.hours < 0 or v5.hours > 23 then
        return false;
    elseif v5.minutes < 0 or v5.minutes > 59 then
        return false;
    else
        return true;
    end;
end;
local function _(v7) --[[ Line: 35 ]] --[[ Name: getUpdateFrequency ]]
    if v7 < 15 then
        return 1;
    else
        return 15;
    end;
end;
return function(v9, v10, v11) --[[ Line: 46 ]] --[[ Name: useCountdownSubtitleTextBinding ]]
    -- upvalues: v3 (copy), v4 (copy), l_RunService_0 (copy)
    local v12, v13 = v3.useState("");
    local v18 = v3.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v11 (copy), v9 (copy), v10 (copy), v4 (ref), v13 (copy)
        if v11 ~= nil and v11 ~= "" and v9 ~= nil and v10 ~= nil and v10 ~= "" then
            local l_v11_0 = v11;
            local v15 = DateTime.now();
            local v16 = v9 - v15.UnixTimestamp;
            local v17 = v4(v16);
            if v17.days >= 0 and v17.hours >= 0 and not (v17.hours > 23) and v17.minutes >= 0 and v17.minutes <= 59 then
                l_v11_0 = if v17.days > 0 then v11 else v10:gsub("{hours}", (tostring(v17.hours))):gsub("{minutes}", (tostring(v17.minutes)));
            end;
            v13(l_v11_0);
            return v16;
        else
            return 0;
        end;
    end, {
        v11, 
        v9, 
        v10
    });
    v3.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v18 (copy)
        v18();
    end, {
        v18
    });
    v3.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v11 (copy), v9 (copy), v10 (copy), l_RunService_0 (ref), v18 (copy)
        local v19 = nil;
        if v11 ~= nil and v11 ~= "" and v9 ~= nil and v10 ~= nil and v10 ~= "" then
            local v20 = DateTime.now();
            local v21 = v9 - v20.UnixTimestamp;
            do
                local l_v21_0 = v21;
                if l_v21_0 > 0 then
                    local v23 = 0;
                    local v24 = l_v21_0 < 15 and 1 or 15;
                    do
                        local l_v23_0, l_v24_0 = v23, v24;
                        v19 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 99 ]]
                            -- upvalues: l_v23_0 (ref), l_v24_0 (ref), l_v21_0 (ref), v18 (ref), v19 (ref)
                            local v27 = os.clock();
                            if v27 - l_v23_0 < l_v24_0 then
                                return;
                            else
                                l_v23_0 = v27;
                                l_v21_0 = v18();
                                l_v24_0 = l_v21_0 < 15 and 1 or 15;
                                if l_v21_0 <= 0 and v19 then
                                    v19:Disconnect();
                                    v19 = nil;
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
            end;
        end;
        return function() --[[ Line: 114 ]]
            -- upvalues: v19 (ref)
            if v19 ~= nil then
                v19:Disconnect();
                v19 = nil;
            end;
        end;
    end, {
        v9, 
        v18
    });
    return v12;
end;