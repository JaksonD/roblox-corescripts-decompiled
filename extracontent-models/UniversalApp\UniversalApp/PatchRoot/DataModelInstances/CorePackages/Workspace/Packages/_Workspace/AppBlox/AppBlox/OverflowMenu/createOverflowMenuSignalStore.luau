local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 14 ]] --[[ Name: createOverflowMenuSignalStore ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal(nil);
    return {
        getActiveMenuKey = v2, 
        getIsMenuOpen = function(v4) --[[ Line: 17 ]]
            -- upvalues: v2 (copy)
            return v2(false) == v4;
        end, 
        openMenu = function(v5) --[[ Line: 22 ]]
            -- upvalues: v3 (copy)
            v3(v5);
        end, 
        closeMenu = function(v6) --[[ Line: 26 ]]
            -- upvalues: v2 (copy), v3 (copy)
            if v2(false) == v6 then
                v3(nil);
            end;
        end, 
        toggleMenu = function(v7) --[[ Line: 32 ]]
            -- upvalues: v2 (copy), v3 (copy)
            if v2(false) == v7 then
                if v2(false) == v7 then
                    v3(nil);
                    return;
                end;
            else
                v3(v7);
            end;
        end
    };
end;