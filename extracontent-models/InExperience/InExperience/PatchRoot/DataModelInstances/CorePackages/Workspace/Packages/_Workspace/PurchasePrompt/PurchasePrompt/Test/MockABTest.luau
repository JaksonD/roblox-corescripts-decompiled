return {
    new = function(v0) --[[ Line: 9 ]] --[[ Name: new ]]
        local v1 = {};
        local v2 = v0 or {};
        v1.getLayerData = function(v3) --[[ Line: 14 ]] --[[ Name: getLayerData ]]
            -- upvalues: v2 (copy)
            return v2[v3];
        end;
        v1.logUserLayerExposure = function(v4) --[[ Line: 18 ]] --[[ Name: logUserLayerExposure ]]
            -- upvalues: v2 (copy)
            return v2[v4];
        end;
        return v1;
    end
};