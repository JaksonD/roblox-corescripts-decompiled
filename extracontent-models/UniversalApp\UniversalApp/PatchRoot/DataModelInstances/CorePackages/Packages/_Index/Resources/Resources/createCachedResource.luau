local _ = require(script.Parent.types);
local function _(v1) --[[ Line: 5 ]] --[[ Name: once ]]
    local v2 = false;
    return function() --[[ Line: 7 ]] --[[ Name: notAgain ]]
        -- upvalues: v2 (ref), v1 (copy)
        if not v2 then
            v2 = true;
            v1();
        end;
    end;
end;
return function(v4) --[[ Line: 16 ]] --[[ Name: createCachedResource ]]
    local v5 = nil;
    local v6 = nil;
    local v7 = 0;
    local function v9() --[[ Line: 21 ]] --[[ Name: disposeResource ]]
        -- upvalues: v7 (ref), v5 (ref), v6 (ref)
        v7 = v7 - 1;
        if v7 == 0 then
            v5 = nil;
            if v6 ~= nil then
                local l_v6_0 = v6;
                v6 = nil;
                l_v6_0();
            end;
        end;
    end;
    local function v12() --[[ Line: 33 ]] --[[ Name: constructResource ]]
        -- upvalues: v6 (ref), v5 (ref), v4 (copy)
        local v10, v11 = v4();
        v6 = v10;
        v5 = v11;
    end;
    local function v15(v13, ...) --[[ Line: 37 ]] --[[ Name: handleError ]]
        -- upvalues: v7 (ref), v5 (ref), v6 (ref)
        if not v13 then
            v7 = v7 - 1;
            if v7 == 0 then
                v5 = nil;
                if v6 ~= nil then
                    local l_v6_1 = v6;
                    v6 = nil;
                    l_v6_1();
                end;
            end;
            error(...);
        end;
    end;
    return function() --[[ Line: 44 ]] --[[ Name: cachedResource ]]
        -- upvalues: v7 (ref), v15 (copy), v12 (copy), v9 (copy), v5 (ref)
        v7 = v7 + 1;
        if v7 == 1 then
            v15(pcall(v12));
        end;
        local l_v9_0 = v9;
        local v17 = false;
        local v18;
        do
            local l_v17_0 = v17;
            v18 = function() --[[ Line: 7 ]] --[[ Name: notAgain ]]
                -- upvalues: l_v17_0 (ref), l_v9_0 (copy)
                if not l_v17_0 then
                    l_v17_0 = true;
                    l_v9_0();
                end;
            end;
        end;
        return v18, v5;
    end;
end;