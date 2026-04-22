return {
    substituteAmount = function(v0, v1) --[[ Line: 5 ]] --[[ Name: substituteAmount ]]
        local v2, _ = string.gsub(v0, "{amount}", (tostring(v1)));
        return v2;
    end, 
    substituteReceiverNotAllowed = function(v4, v5) --[[ Line: 10 ]] --[[ Name: substituteReceiverNotAllowed ]]
        local v6 = tostring(v5);
        local v7, _ = string.gsub(v4, "{userName}", v6);
        local v9, _ = string.gsub(v7, "{username}", v6);
        return v9;
    end, 
    substituteUsername = function(v11, v12) --[[ Line: 17 ]] --[[ Name: substituteUsername ]]
        local v13, _ = string.gsub(v11, "{username}", (tostring(v12)));
        return v13;
    end, 
    substituteMinAmount = function(v15, v16) --[[ Line: 22 ]] --[[ Name: substituteMinAmount ]]
        local v17, _ = string.gsub(v15, "{minAmount}", (tostring(v16)));
        return v17;
    end, 
    substituteMaxAmount = function(v19, v20) --[[ Line: 27 ]] --[[ Name: substituteMaxAmount ]]
        local v21, _ = string.gsub(v19, "{maxAmount}", (tostring(v20)));
        return v21;
    end
};