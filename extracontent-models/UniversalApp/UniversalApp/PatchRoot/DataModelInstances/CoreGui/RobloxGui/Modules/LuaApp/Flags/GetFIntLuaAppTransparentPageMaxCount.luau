game:DefineFastInt("LuaAppTransparentPageMaxCount", 2);
return function() --[[ Line: 3 ]]
    return (math.max(game:GetFastInt("LuaAppTransparentPageMaxCount"), 1));
end;