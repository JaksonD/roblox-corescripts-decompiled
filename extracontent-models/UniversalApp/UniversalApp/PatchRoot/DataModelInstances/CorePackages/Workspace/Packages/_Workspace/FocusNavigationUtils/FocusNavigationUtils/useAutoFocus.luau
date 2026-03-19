local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v2 = require(l_Parent_0.React);
local l_FocusNavigationContext_0 = require(l_Parent_0.ReactFocusNavigation).FocusNavigationContext;
local function v35(v4, v5, v6) --[[ Line: 16 ]]
    -- upvalues: l_CoreGui_0 (copy)
    local v7 = #v5 == 0;
    local v8 = {};
    local v9 = {};
    local _ = function() --[[ Line: 21 ]] --[[ Name: disconnect ]]
        -- upvalues: v7 (ref), v8 (copy)
        if not v7 then
            v7 = true;
            for _, v11 in v8 do
                v11:Disconnect();
            end;
        end;
    end;
    local function v18(_, _, v15) --[[ Line: 30 ]] --[[ Name: onFocusChange ]]
        -- upvalues: v7 (ref), v8 (copy)
        if v15 and not v7 then
            v7 = true;
            for _, v17 in v8 do
                v17:Disconnect();
            end;
        end;
    end;
    local function v19(v20) --[[ Line: 36 ]] --[[ Name: focus ]]
        -- upvalues: v4 (copy), v7 (ref), v5 (copy), l_CoreGui_0 (ref), v6 (copy), v19 (copy), v9 (copy)
        local v23 = task.delay(v4, function() --[[ Line: 37 ]]
            -- upvalues: v7 (ref), v5 (ref), v20 (copy), l_CoreGui_0 (ref), v6 (ref), v19 (ref)
            if not v7 then
                local v21 = v5[v20];
                if v21 and v21:IsDescendantOf(l_CoreGui_0) then
                    v6:focusGuiObject(v21, false);
                end;
                local v22 = v20 > #v5 and 1 or v20 % #v5 + 1;
                v19(v22);
            end;
        end);
        table.insert(v9, v23);
    end;
    for _, v25 in v5 do
        table.insert(v8, v25.SelectionChanged:Connect(v18));
    end;
    local l_delay_0 = task.delay;
    local l_v4_0 = v4;
    local v28 = 1;
    table.insert(v9, (l_delay_0(l_v4_0, function() --[[ Line: 37 ]]
        -- upvalues: v7 (ref), v5 (copy), v28 (copy), l_CoreGui_0 (ref), v6 (copy), v19 (copy)
        if not v7 then
            local v29 = v5[v28];
            if v29 and v29:IsDescendantOf(l_CoreGui_0) then
                v6:focusGuiObject(v29, false);
            end;
            local v30 = v28 > #v5 and 1 or v28 % #v5 + 1;
            v19(v30);
        end;
    end)));
    return {
        cancel = function() --[[ Line: 57 ]] --[[ Name: cancel ]]
            -- upvalues: v9 (copy), v7 (ref), v8 (copy)
            for _, v32 in v9 do
                task.cancel(v32);
            end;
            table.clear(v9);
            if not v7 then
                v7 = true;
                for _, v34 in v8 do
                    v34:Disconnect();
                end;
            end;
        end
    };
end;
return function(v36, v37) --[[ Line: 85 ]]
    -- upvalues: v2 (copy), l_FocusNavigationContext_0 (copy), v35 (copy)
    local v38 = v2.useContext(l_FocusNavigationContext_0);
    return v2.useCallback(function() --[[ Line: 88 ]]
        -- upvalues: v38 (copy), v35 (ref), v37 (copy), v36 (copy)
        if v38 then
            return (v35(v37, v36, v38));
        else
            return nil;
        end;
    end, {
        v38, 
        v36, 
        v37
    });
end;