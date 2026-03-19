local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _privateValues = table.clone(v1)
    }, v0));
end;
v0.GetItem = function(v2, v3) --[[ Line: 12 ]] --[[ Name: GetItem ]]
    return v2._privateValues[v3];
end;
v0.SetItem = function(v4, v5, v6) --[[ Line: 16 ]] --[[ Name: SetItem ]]
    v4._privateValues[v5] = v6;
end;
v0.Flush = function(_) --[[ Line: 20 ]] --[[ Name: Flush ]]

end;
v0._DeepEquals = function(v8, v9) --[[ Line: 23 ]] --[[ Name: _DeepEquals ]]
    for v10, v11 in v9 do
        if v8._privateValues[v10] ~= v11 then
            return false;
        end;
    end;
    return true;
end;
return v0;