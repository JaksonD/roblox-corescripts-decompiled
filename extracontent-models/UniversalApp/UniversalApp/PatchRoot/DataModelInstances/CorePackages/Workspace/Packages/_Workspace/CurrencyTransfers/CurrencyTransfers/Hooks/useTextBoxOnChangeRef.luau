local l_Parent_0 = script:FindFirstAncestor("CurrencyTransfers").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 17 ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useRef(nil);
    return v1.useCallback(function(v5) --[[ Line: 23 ]]
        -- upvalues: v4 (copy), v2 (copy), v3 (copy)
        if v4.current then
            for _, v7 in ipairs(v4.current) do
                v7:Disconnect();
            end;
            v4.current = nil;
        end;
        if v5 then
            local v8 = {};
            table.insert(v8, v5:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 35 ]]
                -- upvalues: v5 (copy), v2 (ref)
                local l_Text_0 = v5.Text;
                local v10 = l_Text_0:gsub("%D", "");
                if v10 ~= l_Text_0 then
                    v5.Text = v10;
                end;
                v2((tonumber(v10)));
            end));
            if v3 then
                table.insert(v8, v5.Focused:Connect(function() --[[ Line: 49 ]]
                    -- upvalues: v3 (ref)
                    v3(true, false);
                end));
                table.insert(v8, v5.FocusLost:Connect(function(v11) --[[ Line: 56 ]]
                    -- upvalues: v3 (ref)
                    v3(false, v11);
                end));
            end;
            v4.current = v8;
        end;
    end, {
        v2, 
        v3
    });
end;