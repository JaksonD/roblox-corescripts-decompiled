game:DefineFastString("UGCValidationMaxAnimationDeltas", "1.5");
local v0 = {
    asString = function() --[[ Line: 9 ]] --[[ Name: asString ]]
        return game:GetFastString("UGCValidationMaxAnimationDeltas");
    end
};
v0.asNumber = function() --[[ Line: 13 ]] --[[ Name: asNumber ]]
    -- upvalues: v0 (copy)
    return (tonumber(v0.asString()));
end;
return v0;