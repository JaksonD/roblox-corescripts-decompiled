return function(v0) --[[ Line: 7 ]] --[[ Name: createInspectAndBuyKeyMapper ]]
    return function(v1, ...) --[[ Line: 9 ]]
        -- upvalues: v0 (copy)
        local v2 = "inspectAndBuy." .. v1 .. "." .. v0;
        for v3 = 1, select("#", ...) do
            v2 = v2 .. "." .. tostring(select(v3, ...));
        end;
        return v2;
    end;
end;