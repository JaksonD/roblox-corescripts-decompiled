local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
local v5 = require(script.Parent.CollectionLayoutStoreContext);
local v6 = require(script.Parent.createCollectionLayoutStore);
local v7 = require(script.Parent.getMainCollectionLayoutStore);
local l_FFlagSduiCarouselHoverFixes_0 = require(l_Parent_0.SharedFlags).FFlagSduiCarouselHoverFixes;
return function(v9) --[[ Line: 25 ]] --[[ Name: CollectionLayoutStoreProvider ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), l_FFlagSduiCarouselHoverFixes_0 (copy), v7 (copy), v5 (copy)
    local v10, v11 = v2.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: v3 (ref)
        return v3.createSignal(0);
    end, {});
    v2.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v9 (copy), v11 (copy)
        local l_container_0 = v9.container;
        if not l_container_0 then
            return;
        else
            v11(l_container_0.AbsoluteSize.X);
            local v13 = l_container_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 36 ]]
                -- upvalues: v11 (ref), l_container_0 (copy)
                v11(l_container_0.AbsoluteSize.X);
            end);
            return function() --[[ Line: 39 ]]
                -- upvalues: v13 (copy)
                v13:Disconnect();
            end;
        end;
    end, {
        v9.container
    });
    local v14 = v2.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v6 (ref), v10 (copy), l_FFlagSduiCarouselHoverFixes_0 (ref), v7 (ref)
        return v6(v10, if l_FFlagSduiCarouselHoverFixes_0 then v7(false) else nil);
    end, {
        v10
    });
    return v2.createElement(v5.Provider, {
        value = v14
    }, v9.children);
end;