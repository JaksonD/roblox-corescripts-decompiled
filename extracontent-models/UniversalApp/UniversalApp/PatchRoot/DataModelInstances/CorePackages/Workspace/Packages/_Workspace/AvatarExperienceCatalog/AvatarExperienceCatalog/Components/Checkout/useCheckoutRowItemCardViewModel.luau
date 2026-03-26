local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Stores.createAXShoppingCartStore);
return function(v4) --[[ Line: 12 ]] --[[ Name: useCheckoutRowItemCardViewModel ]]
    -- upvalues: v2 (copy)
    local v7, v8 = v2.useState(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        if v4.timedOptions then
            for _, v6 in v4.timedOptions do
                if v6.selected then
                    return v6.price;
                end;
            end;
        end;
        return nil;
    end);
    v2.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: v4 (copy), v8 (copy)
        if v4.selectedTimedOptionIndexInReducer ~= nil then
            local v9 = v4.timedOptions and v4.timedOptions[v4.selectedTimedOptionIndexInReducer];
            if v9 then
                v8(v9.price);
            end;
        end;
    end, {
        v4.selectedTimedOptionIndexInReducer
    });
    return {
        selectedTimedOptionPrice = v7, 
        setSelectedTimedOptionPrice = v8
    };
end;