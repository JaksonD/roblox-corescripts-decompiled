local v0 = {
    new = function() --[[ Line: 4 ]] --[[ Name: new ]]
        return {};
    end
};
v0.fromJSON = function(v1) --[[ Line: 10 ]] --[[ Name: fromJSON ]]
    -- upvalues: v0 (copy)
    local v2 = v0.new();
    v2.name = v1.name;
    v2.code = v1.code;
    v2.prefix = v1.prefix;
    v2.localizedName = v1.localizedName;
    v2.isDefault = v1.isDefault;
    return v2;
end;
return v0;