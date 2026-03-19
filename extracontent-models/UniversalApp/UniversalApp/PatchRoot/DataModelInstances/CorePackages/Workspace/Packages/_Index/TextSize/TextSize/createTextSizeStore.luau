local l_TextService_0 = game:GetService("TextService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = script:FindFirstAncestor("TextSize").Parent;
local v3 = require(l_Parent_0.Signals);
local function _(v4) --[[ Line: 9 ]]
    local function v7(v5, v6, ...) --[[ Line: 10 ]]
        if not v6 then
            return nil;
        elseif coroutine.status(v5) ~= "dead" then
            return nil;
        else
            return ...;
        end;
    end;
    local v8 = coroutine.create(v4);
    return v7(v8, coroutine.resume(v8));
end;
local function _() --[[ Line: 26 ]] --[[ Name: calculateTextSizeOffset ]]
    -- upvalues: l_TextService_0 (copy)
    local function v13() --[[ Line: 27 ]]
        -- upvalues: l_TextService_0 (ref)
        local v10 = Font.fromEnum(Enum.Font.BuilderSans);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_TextService_0 (ref), v10 (copy)
            return l_TextService_0:GetTextSizeOffsetAsync(0, v10);
        end);
        if not l_status_0 then
            warn(l_result_0);
            return 0;
        else
            return l_result_0 or 0;
        end;
    end;
    local function v16(v14, v15, ...) --[[ Line: 10 ]]
        if not v15 then
            return nil;
        elseif coroutine.status(v14) ~= "dead" then
            return nil;
        else
            return ...;
        end;
    end;
    local v17 = coroutine.create(v13);
    return v16(v17, coroutine.resume(v17)) or 0;
end;
return function() --[[ Line: 45 ]] --[[ Name: createTextSizeStore ]]
    -- upvalues: v3 (copy), l_TextService_0 (copy), l_UserGameSettings_0 (copy)
    local l_createSignal_0 = v3.createSignal;
    local function v23() --[[ Line: 27 ]]
        -- upvalues: l_TextService_0 (ref)
        local v20 = Font.fromEnum(Enum.Font.BuilderSans);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_TextService_0 (ref), v20 (copy)
            return l_TextService_0:GetTextSizeOffsetAsync(0, v20);
        end);
        if not l_status_1 then
            warn(l_result_1);
            return 0;
        else
            return l_result_1 or 0;
        end;
    end;
    local function v26(v24, v25, ...) --[[ Line: 10 ]]
        if not v25 then
            return nil;
        elseif coroutine.status(v24) ~= "dead" then
            return nil;
        else
            return ...;
        end;
    end;
    local v27 = coroutine.create(v23);
    local v28;
    l_createSignal_0, v28 = l_createSignal_0(v26(v27, coroutine.resume(v27)) or 0);
    local v38 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ Line: 48 ]]
        -- upvalues: v28 (copy), l_TextService_0 (ref)
        local l_v28_0 = v28;
        local function v33() --[[ Line: 27 ]]
            -- upvalues: l_TextService_0 (ref)
            local v30 = Font.fromEnum(Enum.Font.BuilderSans);
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 31 ]]
                -- upvalues: l_TextService_0 (ref), v30 (copy)
                return l_TextService_0:GetTextSizeOffsetAsync(0, v30);
            end);
            if not l_status_2 then
                warn(l_result_2);
                return 0;
            else
                return l_result_2 or 0;
            end;
        end;
        local function v36(v34, v35, ...) --[[ Line: 10 ]]
            if not v35 then
                return nil;
            elseif coroutine.status(v34) ~= "dead" then
                return nil;
            else
                return ...;
            end;
        end;
        local v37 = coroutine.create(v33);
        l_v28_0(v36(v37, coroutine.resume(v37)) or 0);
    end);
    return {
        getTextSizeOffset = l_createSignal_0, 
        cleanup = function() --[[ Line: 54 ]] --[[ Name: cleanup ]]
            -- upvalues: v38 (ref)
            if v38 then
                v38:Disconnect();
                v38 = nil;
            end;
        end
    };
end;