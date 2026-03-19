local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Signal);
local function v10() --[[ Line: 34 ]] --[[ Name: createSignal ]]
    -- upvalues: v4 (copy)
    local v5, v6 = v4.createSignal();
    return {
        signal = {
            Connect = function(_, v8) --[[ Line: 39 ]] --[[ Name: Connect ]]
                -- upvalues: v5 (copy)
                local v9 = v5:subscribe(v8);
                return {
                    Disconnect = function() --[[ Line: 43 ]] --[[ Name: Disconnect ]]
                        -- upvalues: v9 (copy)
                        v9:unsubscribe();
                    end
                };
            end
        }, 
        fire = v6
    };
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13) --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v10 (copy)
    local v14 = setmetatable({
        AbsolutePosition = v12, 
        AbsoluteSize = v13, 
        _signals = {}
    }, v11);
    v14._signals.AbsolutePosition = v10();
    v14._signals.AbsoluteSize = v10();
    return v14;
end;
v11.GetPropertyChangedSignal = function(v15, v16) --[[ Line: 70 ]] --[[ Name: GetPropertyChangedSignal ]]
    if v15._signals[v16] then
        return v15._signals[v16].signal;
    else
        error((("%* is not a valid property name."):format(v16)));
        return;
    end;
end;
v11.SetPosition = function(v17, v18) --[[ Line: 77 ]] --[[ Name: SetPosition ]]
    if v17.AbsolutePosition ~= v18 then
        v17.AbsolutePosition = v18;
        v17._signals.AbsolutePosition.fire(v18);
    end;
end;
v11.SetSize = function(v19, v20) --[[ Line: 84 ]] --[[ Name: SetSize ]]
    if v19.AbsoluteSize ~= v20 then
        v19.AbsoluteSize = v20;
        v19._signals.AbsoluteSize.fire(v20);
    end;
end;
useMeasurableRef = function(v21, v22) --[[ Line: 91 ]] --[[ Name: useMeasurableRef ]]
    -- upvalues: v3 (copy), v11 (copy)
    local v23 = v3.useRef(nil);
    if v23.current == nil then
        v23.current = v11.new(v21, v22 or Vector2.one);
    end;
    v3.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v23 (copy), v21 (copy)
        v23.current:SetPosition(v21);
    end, {
        v21
    });
    v3.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v23 (copy), v22 (copy)
        v23.current:SetSize(v22 or Vector2.one);
    end, {
        v22
    });
    return v23;
end;
return useMeasurableRef;