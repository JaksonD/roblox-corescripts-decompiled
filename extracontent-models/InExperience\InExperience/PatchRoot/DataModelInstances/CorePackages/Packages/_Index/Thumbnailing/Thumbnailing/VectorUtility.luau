local v3 = {
    Vector3FromXYRotPlusDistance = function(v0, v1, v2) --[[ Line: 5 ]]
        return CFrame.fromEulerAnglesXYZ(math.rad(v0), math.rad(v1), 0).LookVector * v2;
    end
};
v3.Vector3FromJson = function(v4) --[[ Line: 11 ]]
    -- upvalues: v3 (copy)
    local v5, v6, v7 = unpack(v4:split("/"));
    local v8 = tonumber(v5);
    local v9 = tonumber(v6);
    local v10 = tonumber(v7);
    if v8 and v9 and v10 then
        return v3.Vector3FromXYRotPlusDistance(v8, v9, v10);
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
return v3;