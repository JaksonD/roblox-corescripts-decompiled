local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.getFirstFocusableDescendant);
local function _(v3) --[[ Line: 6 ]] --[[ Name: safeDisconnect ]]
    if v3 then
        v3:Disconnect();
    end;
end;
return function(v5) --[[ Line: 23 ]] --[[ Name: useFirstFocusableDescendantRef ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v2 (ref), v6 (copy), v5 (copy)
        local v7 = nil;
        local v8 = nil;
        local v9 = nil;
        local function v10(v11) --[[ Line: 31 ]] --[[ Name: updateFirstFocusable ]]
            -- upvalues: v7 (ref), v9 (ref), v2 (ref), v10 (copy), v6 (ref)
            local l_v7_0 = v7;
            if l_v7_0 then
                l_v7_0:Disconnect();
            end;
            l_v7_0 = v9;
            if l_v7_0 then
                l_v7_0:Disconnect();
            end;
            l_v7_0 = v2(v11);
            if l_v7_0 then
                v7 = l_v7_0:GetPropertyChangedSignal("Selectable"):Connect(function() --[[ Line: 38 ]]
                    -- upvalues: v10 (ref), v11 (copy)
                    v10(v11);
                end);
                v9 = l_v7_0.AncestryChanged:Connect(function() --[[ Line: 42 ]]
                    -- upvalues: v10 (ref), v11 (copy)
                    v10(v11);
                end);
            end;
            v6.current = l_v7_0;
        end;
        if v5 then
            v10(v5);
            v8 = v5.DescendantAdded:Connect(function() --[[ Line: 51 ]]
                -- upvalues: v10 (copy), v5 (ref)
                v10(v5);
            end);
        else
            v6.current = nil;
        end;
        return function() --[[ Line: 58 ]]
            -- upvalues: v7 (ref), v8 (ref), v9 (ref)
            local l_v7_1 = v7;
            if l_v7_1 then
                l_v7_1:Disconnect();
            end;
            l_v7_1 = v8;
            if l_v7_1 then
                l_v7_1:Disconnect();
            end;
            l_v7_1 = v9;
            if l_v7_1 then
                l_v7_1:Disconnect();
            end;
        end;
    end, {
        v5
    });
    return v6;
end;