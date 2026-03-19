return {
    transformTriangleToWorld = function(v0, v1, v2, v3, v4) --[[ Line: 10 ]] --[[ Name: transformTriangleToWorld ]]
        local v5 = v3 * (v0 * v4);
        local v6 = v3 * (v1 * v4);
        local v7 = v3 * (v2 * v4);
        return v5, v6, v7, (v6 - v5):Cross(v7 - v5).Unit;
    end
};