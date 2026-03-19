local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {
        _enableNewFont = v1
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.getDefault = function(v3) --[[ Line: 12 ]] --[[ Name: getDefault ]]
    if v3._enableNewFont then
        return Enum.Font.BuilderSans;
    else
        return Enum.Font.Gotham;
    end;
end;
v0.getMedium = function(v4) --[[ Line: 21 ]] --[[ Name: getMedium ]]
    if v4._enableNewFont then
        return Enum.Font.BuilderSansMedium;
    else
        return Enum.Font.GothamMedium;
    end;
end;
v0.getBlack = function(v5) --[[ Line: 30 ]] --[[ Name: getBlack ]]
    if v5._enableNewFont then
        return Enum.Font.BuilderSansExtraBold;
    else
        return Enum.Font.GothamBlack;
    end;
end;
v0.getBold = function(v6) --[[ Line: 39 ]] --[[ Name: getBold ]]
    if v6._enableNewFont then
        return Enum.Font.BuilderSansBold;
    else
        return Enum.Font.GothamBold;
    end;
end;
v0.getSemibold = function(v7) --[[ Line: 48 ]] --[[ Name: getSemibold ]]
    if v7._enableNewFont then
        return Enum.Font.BuilderSansMedium;
    else
        return Enum.Font.GothamMedium;
    end;
end;
v0.default = v0.new(true);
return v0;