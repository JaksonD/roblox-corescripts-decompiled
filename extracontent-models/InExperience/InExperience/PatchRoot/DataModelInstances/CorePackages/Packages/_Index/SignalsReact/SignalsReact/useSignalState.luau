local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_createEffect_0 = require(l_Parent_0.Signals).createEffect;
local _, v4 = xpcall(function() --[[ Line: 8 ]]
    return game:DefineFastFlag("SignalsReactUseMutableSource", false);
end, function() --[[ Line: 10 ]]
    return true;
end);
local function v9(v5) --[[ Line: 14 ]] --[[ Name: getSignalVersion ]]
    local function v6() --[[ Line: 15 ]] --[[ Name: dummyObserver ]]
        -- upvalues: v5 (copy)
        return v5;
    end;
    local v7 = nil;
    v5(function(v8) --[[ Line: 25 ]] --[[ Name: scope ]]
        -- upvalues: v7 (ref), v6 (copy)
        v7 = v8;
        return v6;
    end);
    v7(v6, true);
    return v7();
end;
local function v11(v10) --[[ Line: 37 ]] --[[ Name: getSignalSnapshot ]]
    return v10(false);
end;
local function v15(v12, v13) --[[ Line: 41 ]] --[[ Name: subscribeToSignal ]]
    -- upvalues: l_createEffect_0 (copy)
    return l_createEffect_0(function(v14) --[[ Line: 42 ]]
        -- upvalues: v13 (copy), v12 (copy)
        v13(v12(v14));
    end);
end;
local function v18(v16) --[[ Line: 47 ]] --[[ Name: useSignalState ]]
    -- upvalues: v1 (copy), v9 (copy), v11 (copy), v15 (copy)
    local v17 = v1.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: v1 (ref), v16 (copy), v9 (ref)
        return v1.createMutableSource(v16, v9);
    end, {
        v16
    });
    return v1.useMutableSource(v17, v11, v15);
end;
local function v23(v19) --[[ Line: 55 ]] --[[ Name: useSignalState_old ]]
    -- upvalues: v1 (copy), l_createEffect_0 (copy)
    local v20, v21 = v1.useState(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy)
        return v19(false);
    end);
    v1.useLayoutEffect(function() --[[ Line: 60 ]]
        -- upvalues: v21 (copy), v19 (copy), l_createEffect_0 (ref)
        v21(v19(false));
        return l_createEffect_0(function(v22) --[[ Line: 62 ]]
            -- upvalues: v21 (ref), v19 (ref)
            v21(v19(v22));
        end);
    end, {
        v19
    });
    return v20;
end;
if v4 then
    return v18;
else
    return v23;
end;