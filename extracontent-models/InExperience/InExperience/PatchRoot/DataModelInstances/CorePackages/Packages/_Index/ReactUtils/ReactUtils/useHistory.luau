local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_LUAU_ANALYZE_ERROR_0 = l_script_FirstAncestor_0.LUAU_ANALYZE_ERROR;
return function(v5, v6, v7) --[[ Line: 11 ]] --[[ Name: useHistory ]]
    -- upvalues: v3 (copy), l_ChangeHistoryService_0 (copy), l_LUAU_ANALYZE_ERROR_0 (copy)
    local v8 = v3.useRef(v5);
    local v9 = v3.useRef({});
    local v10 = v3.useRef({});
    v3.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v9 (copy), v10 (copy), l_LUAU_ANALYZE_ERROR_0 (ref), v8 (copy), v6 (copy)
        local v16 = l_ChangeHistoryService_0.OnUndo:Connect(function(v11) --[[ Line: 17 ]]
            -- upvalues: v9 (ref), v10 (ref), l_LUAU_ANALYZE_ERROR_0 (ref), v8 (ref), v6 (ref)
            local l_current_0 = v9.current;
            local l_current_1 = v10.current;
            assert(l_current_0 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            assert(l_current_1 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            if not l_current_0[v11] or #l_current_0[v11] == 0 then
                return;
            else
                if not l_current_1[v11] then
                    l_current_1[v11] = {};
                end;
                local v14 = #l_current_0[v11];
                local v15 = l_current_0[v11][v14];
                table.insert(l_current_1[v11], v8.current);
                table.remove(l_current_0[v11], v14);
                v8.current = v15;
                v6(v15);
                v9.current = l_current_0;
                v10.current = l_current_1;
                return;
            end;
        end);
        local v22 = l_ChangeHistoryService_0.OnRedo:Connect(function(v17) --[[ Line: 48 ]]
            -- upvalues: v9 (ref), v10 (ref), l_LUAU_ANALYZE_ERROR_0 (ref), v8 (ref), v6 (ref)
            local l_current_2 = v9.current;
            local l_current_3 = v10.current;
            assert(l_current_2 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            assert(l_current_3 ~= nil, l_LUAU_ANALYZE_ERROR_0);
            if not l_current_3[v17] or #l_current_3[v17] == 0 then
                return;
            else
                local v20 = #l_current_3[v17];
                local v21 = l_current_3[v17][v20];
                table.insert(l_current_2[v17], v8.current);
                table.remove(l_current_3[v17], v20);
                assert(v21 ~= nil, l_LUAU_ANALYZE_ERROR_0);
                v8.current = v21;
                v6(v21);
                v9.current = l_current_2;
                v10.current = l_current_3;
                return;
            end;
        end);
        return function() --[[ Line: 76 ]]
            -- upvalues: v16 (copy), v22 (copy)
            v16:Disconnect();
            v22:Disconnect();
        end;
    end, v7);
    v3.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v9 (copy), v10 (copy)
        v9.current = {};
        v10.current = {};
    end, v7);
    return (v3.useCallback(function(v23, v24) --[[ Line: 87 ]]
        -- upvalues: v9 (copy), l_LUAU_ANALYZE_ERROR_0 (ref), v10 (copy), l_ChangeHistoryService_0 (ref), v8 (copy)
        local l_current_4 = v9.current;
        assert(l_current_4 ~= nil, l_LUAU_ANALYZE_ERROR_0);
        if not l_current_4[v23] then
            l_current_4[v23] = {};
        end;
        v10.current = {};
        l_ChangeHistoryService_0:SetWaypoint(v23);
        if typeof(v8.current) == "table" then
            table.insert(l_current_4[v23], table.clone(v8.current));
        else
            table.insert(l_current_4[v23], v8.current);
        end;
        v8.current = v24;
        v9.current = l_current_4;
    end, v7));
end;