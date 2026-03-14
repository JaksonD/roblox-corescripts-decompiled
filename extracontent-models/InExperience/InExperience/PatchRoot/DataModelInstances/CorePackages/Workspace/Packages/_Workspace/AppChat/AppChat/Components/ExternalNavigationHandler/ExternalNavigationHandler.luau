local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_memo_0 = v1.memo;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_usePrevious_0 = v2.Hooks.usePrevious;
ExternalNavigationHandler = function(v8) --[[ Line: 25 ]] --[[ Name: ExternalNavigationHandler ]]
    -- upvalues: l_useRef_0 (copy), l_useEffect_0 (copy), l_dependencyArray_0 (copy), l_usePrevious_0 (copy)
    local function _() --[[ Line: 26 ]]
        -- upvalues: v8 (copy)
        local v9 = false;
        if v8.requestId ~= v8.completedRequestId then
            v9 = v8.screen;
        end;
        return v9;
    end;
    local v11 = l_useRef_0({});
    local function v15() --[[ Line: 32 ]]
        -- upvalues: v8 (copy), v11 (copy)
        local l_screen_0 = v8.screen;
        local v13 = v8.navigationByScreen[l_screen_0];
        if v13 then
            v13(v8.params);
        else
            assert(v11.current, "Queue for ExternalNavigationHandler can't be nil");
            local v14 = v11.current[l_screen_0] or {};
            table.insert(v14, v8.params);
            v11.current[l_screen_0] = v14;
        end;
        v8.completeExternalNavigation(v8.requestId);
    end;
    l_useEffect_0(function() --[[ Line: 50 ]]
        -- upvalues: v8 (copy), v15 (copy)
        local v16 = false;
        if v8.requestId ~= v8.completedRequestId then
            v16 = v8.screen;
        end;
        if v16 then
            v15();
        end;
    end, l_dependencyArray_0(v8.requestId, v8.completedRequestId, v8.screen));
    local v17 = l_usePrevious_0(v8.navigationByScreen);
    l_useEffect_0(function() --[[ Line: 58 ]]
        -- upvalues: v11 (copy), v17 (copy), v8 (copy)
        assert(v11.current, "Queue for ExternalNavigationHandler can't be nil");
        if v17 == nil then
            return;
        else
            for v18, v19 in pairs(v11.current) do
                assert(v17, "");
                local v20 = v17[v18];
                local v21 = v8.navigationByScreen[v18];
                if v20 ~= v21 and v21 then
                    for _, v23 in ipairs(v19) do
                        v21(v23);
                    end;
                    v11.current[v18] = nil;
                end;
            end;
            return;
        end;
    end, l_dependencyArray_0(v8.navigationByScreen));
    return nil;
end;
return l_memo_0(ExternalNavigationHandler);