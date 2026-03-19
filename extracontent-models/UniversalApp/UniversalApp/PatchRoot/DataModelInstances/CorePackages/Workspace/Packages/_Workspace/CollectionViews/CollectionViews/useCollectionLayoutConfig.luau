local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v4 = require(l_script_FirstAncestor_0.useCollectionLayoutParamsComputed);
return function(v5, v6) --[[ Line: 15 ]] --[[ Name: useCollectionLayoutConfig ]]
    -- upvalues: v4 (copy), v2 (copy), l_CollectionItemSize_0 (copy)
    local v7 = v4(v5, v6);
    return (v2.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: l_CollectionItemSize_0 (ref), v7 (copy)
        local v8 = {};
        for _, v10 in l_CollectionItemSize_0 do
            v8[v10] = v7(v10);
        end;
        return v8;
    end, {
        v7
    }));
end;