local v0 = {
    new = function() --[[ Line: 8 ]] --[[ Name: new ]]
        return {
            isSubscribed = false, 
            isRenewing = false
        };
    end
};
v0.mock = function(v1, v2) --[[ Line: 17 ]] --[[ Name: mock ]]
    -- upvalues: v0 (copy)
    local v3 = v0.new();
    v3.isSubscribed = v1;
    v3.isRenewing = v2;
    return v3;
end;
v0.fromJsonData = function(v4) --[[ Line: 25 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v0 (copy)
    local v5 = v0.new();
    v5.isSubscribed = v4.isSubscribed;
    v5.isRenewing = v4.isRenewing;
    return v5;
end;
return v0;