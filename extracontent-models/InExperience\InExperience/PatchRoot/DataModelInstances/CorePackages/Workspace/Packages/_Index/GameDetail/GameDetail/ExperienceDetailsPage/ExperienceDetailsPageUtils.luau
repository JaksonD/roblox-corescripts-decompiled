local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local _ = require(l_Parent_0.Navigation);
return {
    getFromPropsOrNavigationParams = function(v2, v3) --[[ Line: 12 ]] --[[ Name: getFromPropsOrNavigationParams ]]
        local v4 = v2.navigation and v2.navigation.getParam("extraProps");
        return v2[v3] or v4 and v4[v3];
    end, 
    getUniverseId = function(v5) --[[ Line: 18 ]] --[[ Name: getUniverseId ]]
        local v6 = v5.navigation and v5.navigation.getParam("extraProps");
        local v7 = v5.universeId or v6 and v6.universeId;
        if v7 then
            return v7;
        else
            return v5.navigation and v5.navigation.getParam("detail");
        end;
    end, 
    getAnalyticsSource = function(v8) --[[ Line: 26 ]] --[[ Name: getAnalyticsSource ]]
        local v9 = v8.navigation and v8.navigation.getParam("extraProps");
        return v8.source or v9 and v9.source or "None";
    end, 
    getTilePositionIndex = function(v10) --[[ Line: 30 ]] --[[ Name: getTilePositionIndex ]]
        local v11 = v10.navigation and v10.navigation.getParam("extraProps");
        local v12 = v10.index or v11 and v11.index;
        if type(v12) == "number" then
            return v12;
        else
            if type(v12) == "string" then
                v11 = tonumber(v12);
                if v11 then
                    return v11;
                end;
            end;
            return -1;
        end;
    end, 
    getResolvedIdentifier = function(v13, v14) --[[ Line: 45 ]] --[[ Name: getResolvedIdentifier ]]
        return v13 .. "_" .. v14;
    end
};