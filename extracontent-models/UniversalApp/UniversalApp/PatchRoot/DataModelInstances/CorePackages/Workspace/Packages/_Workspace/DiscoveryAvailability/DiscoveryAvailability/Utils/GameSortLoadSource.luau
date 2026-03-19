local v0 = {
    API = "API", 
    ClientFallbackCache = "ClientFallbackCache"
};
local v1 = {};
return {
    GameSortLoadSourceType = v0, 
    setSortLoadSource = function(v2, v3) --[[ Line: 10 ]] --[[ Name: setSortLoadSource ]]
        -- upvalues: v1 (copy)
        if v3 then
            v1[v2] = v3;
            return;
        else
            v1[v2] = nil;
            return;
        end;
    end, 
    getSortLoadSource = function(v4) --[[ Line: 18 ]] --[[ Name: getSortLoadSource ]]
        -- upvalues: v1 (copy)
        return v1[v4];
    end
};