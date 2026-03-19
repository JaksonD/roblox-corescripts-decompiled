local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.Parent.Responsive);
local v3 = require(script.Parent.Parent.Context.ContainerRef);
local v4 = game:DefineFastFlag("LuaAppResponsiveFixHookDeps", false);
id = function(v5) --[[ Line: 9 ]] --[[ Name: id ]]
    return v5;
end;
useResponsiveImpl = function(v6, v7, v8) --[[ Line: 17 ]] --[[ Name: useResponsiveImpl ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v4 (copy)
    local v9 = if typeof(v6) == "function" then v6 else id;
    local v10 = v1.useContext(v3);
    local v11, v12 = v1.useState(v9(v2.DefaultKey));
    local v13 = v1.useRef("");
    local v14 = v1.useRef({
        Key = v2.DefaultKey
    });
    local v15 = nil;
    if typeof(v6) == "table" then
        v15 = {};
        for _, v17 in v6 do
            v15[v17] = true;
        end;
    end;
    v1.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v10 (copy), v2 (ref), v7 (copy), v8 (copy), v15 (ref), v13 (copy), v14 (copy), v12 (copy), v9 (copy)
        if v10 and v10.current then
            local v18 = v2.bindContainer(v10.current, v7);
            local v20 = v18:connect(function() --[[ Line: 37 ]]
                -- upvalues: v18 (copy), v8 (ref), v15 (ref), v13 (ref), v14 (ref), v12 (ref), v9 (ref)
                local v19 = v18:currentKey(v8);
                if v15 then
                    if v15[v19] or v13.current and v15[v13.current] then
                        v14.current = v18:currentRule(v8);
                        v12(v19);
                    end;
                else
                    v14.current = v18:currentRule(v8);
                    v12(v9(v19));
                end;
                v13.current = v19;
            end);
            v14.current = v18:currentRule(v8);
            local v21 = v18:currentKey(v8);
            v12(v9(v21));
            v13.current = v21;
            return function() --[[ Line: 56 ]]
                -- upvalues: v20 (copy), v18 (copy)
                v20:disconnect();
                v18:destroy();
            end;
        else
            return function() --[[ Line: 61 ]]

            end;
        end;
    end, {
        v10, 
        v10 and v10.current or false, 
        if v4 then v7 else nil, 
        if v4 then v8 else nil
    });
    return v11, v14.current;
end;
return useResponsiveImpl;