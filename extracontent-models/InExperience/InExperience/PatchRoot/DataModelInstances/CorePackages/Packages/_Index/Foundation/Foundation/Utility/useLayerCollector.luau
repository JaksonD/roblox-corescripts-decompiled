local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_Signal_0 = v3.Signal;
local l_Connection_0 = v3.Connection;
local function v7(v6) --[[ Line: 10 ]] --[[ Name: findLayerCollector ]]
    if not v6 then
        return nil;
    else
        return v6:FindFirstAncestorWhichIsA("LayerCollector");
    end;
end;
return function(v8) --[[ Line: 18 ]] --[[ Name: useLayerCollector ]]
    -- upvalues: v2 (copy), v7 (copy), l_Signal_0 (copy), l_Connection_0 (copy)
    local v9, v10 = v2.useState(nil);
    local v11 = v2.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v7 (ref), v8 (copy)
        v10(v7(v8));
    end, {
        v8
    });
    v2.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v8 (copy), v11 (copy), l_Signal_0 (ref), l_Connection_0 (ref)
        if v8 then
            v11();
            local v12 = l_Signal_0.Connect(v8.AncestryChanged, v11);
            return function() --[[ Line: 31 ]]
                -- upvalues: l_Connection_0 (ref), v12 (copy)
                l_Connection_0.Disconnect(v12);
            end;
        else
            return nil;
        end;
    end, {
        v8
    });
    return v9;
end;