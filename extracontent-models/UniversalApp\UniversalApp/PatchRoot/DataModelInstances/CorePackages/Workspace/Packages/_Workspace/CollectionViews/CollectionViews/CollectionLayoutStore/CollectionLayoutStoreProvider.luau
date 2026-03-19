local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
local v5 = require(script.Parent.CollectionLayoutStoreContext);
local v6 = require(script.Parent.createCollectionLayoutStore);
return function(v7) --[[ Line: 20 ]] --[[ Name: CollectionLayoutStoreProvider ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v5 (copy)
    local v8, v9 = v2.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v3 (ref)
        return v3.createSignal(0);
    end, {});
    v2.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v9 (copy)
        local l_container_0 = v7.container;
        if not l_container_0 then
            return;
        else
            v9(l_container_0.AbsoluteSize.X);
            local v11 = l_container_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 31 ]]
                -- upvalues: v9 (ref), l_container_0 (copy)
                v9(l_container_0.AbsoluteSize.X);
            end);
            return function() --[[ Line: 34 ]]
                -- upvalues: v11 (copy)
                v11:Disconnect();
            end;
        end;
    end, {
        v7.container
    });
    local v12 = v2.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v6 (ref), v8 (copy)
        return v6(v8);
    end, {
        v8
    });
    return v2.createElement(v5.Provider, {
        value = v12
    }, v7.children);
end;