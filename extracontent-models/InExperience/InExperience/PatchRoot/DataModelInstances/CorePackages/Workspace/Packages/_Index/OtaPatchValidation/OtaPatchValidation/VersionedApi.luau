local v0 = {};
v0.__index = v0;
v0.Interface = function(v1, v2, v3) --[[ Line: 16 ]] --[[ Name: Interface ]]
    if getmetatable(v2) ~= nil then
        error("table already has a metatable?");
    end;
    setmetatable(v2, {
        _otaPatchKey = v3, 
        _minAppVersion = v1
    });
    return v2;
end;
return v0;