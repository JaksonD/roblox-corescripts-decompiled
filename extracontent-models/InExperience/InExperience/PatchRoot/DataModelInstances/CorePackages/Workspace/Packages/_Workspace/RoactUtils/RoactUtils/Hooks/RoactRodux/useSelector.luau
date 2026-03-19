local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.useStore);
local function v7(v5, v6) --[[ Line: 52 ]]
    return v5 == v6;
end;
useSelectorWithStore = function(v8, v9, v10) --[[ Line: 56 ]] --[[ Name: useSelectorWithStore ]]
    -- upvalues: v2 (copy)
    local _, v13 = v2.useReducer(function(v11) --[[ Line: 61 ]]
        return v11 + 1;
    end, 0);
    local v14 = v2.useRef(nil);
    local v15 = v2.useRef(nil);
    local v16 = v2.useRef(nil);
    local v17 = v2.useRef(nil);
    local v18 = v10:getState();
    local v19 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 73 ]]
        -- upvalues: v8 (copy), v15 (copy), v18 (copy), v16 (copy), v14 (copy), v17 (copy), v9 (copy), v19 (ref)
        if v8 ~= v15.current or v18 ~= v16.current or v14.current then
            local v20 = v8(v18);
            if v17.current == nil or not v9(v20, v17.current) then
                v19 = v20;
                return;
            else
                v19 = v17.current;
                return;
            end;
        else
            v19 = v17.current;
            return;
        end;
    end);
    if not l_status_0 then
        if v14.current then
            l_result_0 = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(l_result_0), (tostring(v14.current)));
        end;
        error(l_result_0);
    end;
    v2.useLayoutEffect(function() --[[ Line: 103 ]]
        -- upvalues: v15 (copy), v8 (copy), v16 (copy), v18 (copy), v17 (copy), v19 (ref), v14 (copy)
        v15.current = v8;
        v16.current = v18;
        v17.current = v19;
        v14.current = nil;
    end);
    v2.useLayoutEffect(function() --[[ Line: 110 ]]
        -- upvalues: v16 (copy), v15 (copy), v9 (copy), v17 (copy), v14 (copy), v13 (copy), v10 (copy)
        local function v27(v23) --[[ Line: 111 ]] --[[ Name: checkForUpdates ]]
            -- upvalues: v16 (ref), v15 (ref), v9 (ref), v17 (ref), v14 (ref), v13 (ref)
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 112 ]]
                -- upvalues: v23 (copy), v16 (ref), v15 (ref), v9 (ref), v17 (ref)
                if v23 == v16.current then
                    return false;
                else
                    assert(v15.current, "latestSelector");
                    local v24 = v15.current(v23);
                    if v9(v24, v17.current) then
                        return false;
                    else
                        v17.current = v24;
                        v16.current = v23;
                        return true;
                    end;
                end;
            end);
            if not l_status_1 then
                l_result_1 = l_result_1 or "Error";
                v14.current = l_result_1;
            end;
            if l_result_1 then
                v13(nil);
            end;
        end;
        local v28 = v10.changed:connect(v27);
        local v29 = v10:getState();
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 112 ]]
            -- upvalues: v29 (copy), v16 (ref), v15 (ref), v9 (ref), v17 (ref)
            if v29 == v16.current then
                return false;
            else
                assert(v15.current, "latestSelector");
                local v30 = v15.current(v29);
                if v9(v30, v17.current) then
                    return false;
                else
                    v17.current = v30;
                    v16.current = v29;
                    return true;
                end;
            end;
        end);
        if not l_status_2 then
            l_result_2 = l_result_2 or "Error";
            v14.current = l_result_2;
        end;
        if l_result_2 then
            v13(nil);
        end;
        return function() --[[ Line: 146 ]]
            -- upvalues: v28 (copy)
            v28:disconnect();
        end;
    end, {
        v10
    });
    return v19;
end;
useSelector = function(v33, v34) --[[ Line: 154 ]] --[[ Name: useSelector ]]
    -- upvalues: v1 (copy), v3 (copy), v7 (copy), v4 (copy)
    v1.isNotNil(v33, "selector");
    v1.assert(v3.isCallable(v33), "useSelector expects 'selector' to be callable");
    v1.isTypeOrNil(v34, "function", "equalityFn");
    local v35 = v34 or v7;
    local v36 = v4();
    return (useSelectorWithStore(v33, v35, v36));
end;
return useSelector;