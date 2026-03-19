return {
    getTileHeight = function(v0, v1) --[[ Line: 14 ]] --[[ Name: getTileHeight ]]
        local v2 = v1 * 0.5625;
        local l_Space_250_0 = v0.Global.Space_250;
        local l_Space_100_0 = v0.Global.Space_100;
        local l_Space_50_0 = v0.Global.Space_50;
        return v2 + (l_Space_250_0 + v0.Global.Space_250 + l_Space_100_0 + l_Space_50_0);
    end, 
    getFooterHeight = function(v6) --[[ Line: 7 ]] --[[ Name: getFooterHeight ]]
        local l_Space_250_1 = v6.Global.Space_250;
        local l_Space_100_1 = v6.Global.Space_100;
        local l_Space_50_1 = v6.Global.Space_50;
        return l_Space_250_1 + v6.Global.Space_250 + l_Space_100_1 + l_Space_50_1;
    end, 
    getMetadataHeight = function(v10) --[[ Line: 3 ]] --[[ Name: getMetadataHeight ]]
        return v10.Global.Space_250;
    end, 
    getPlayButtonHeight = function(v11) --[[ Line: 18 ]] --[[ Name: getPlayButtonHeight ]]
        return v11.Global.Size_450;
    end
};