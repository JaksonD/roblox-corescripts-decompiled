local v0 = require(script.RoduxNetworking);
local v1 = require(script.NetworkStatus);
local v2 = require(script.mockRoduxNetworking);
local _ = require(script.Types);
return {
    config = function(v4) --[[ Line: 11 ]] --[[ Name: config ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v5 = v0(v4);
        local v6 = v1(v4);
        return {
            GET = function(v7, v8) --[[ Line: 16 ]] --[[ Name: GET ]]
                -- upvalues: v5 (copy)
                return v5.GET(v7, v8);
            end, 
            POST = function(v9, v10) --[[ Line: 19 ]] --[[ Name: POST ]]
                -- upvalues: v5 (copy)
                return v5.POST(v9, v10);
            end, 
            PATCH = function(v11, v12) --[[ Line: 22 ]] --[[ Name: PATCH ]]
                -- upvalues: v5 (copy)
                return v5.PATCH(v11, v12);
            end, 
            DELETE = function(v13, v14) --[[ Line: 25 ]] --[[ Name: DELETE ]]
                -- upvalues: v5 (copy)
                return v5.DELETE(v13, v14);
            end, 
            getNetworkImpl = function() --[[ Line: 28 ]] --[[ Name: getNetworkImpl ]]
                -- upvalues: v5 (copy)
                return v5.getNetworkImpl();
            end, 
            setNetworkImpl = function(...) --[[ Line: 31 ]] --[[ Name: setNetworkImpl ]]
                -- upvalues: v5 (copy)
                v5.setNetworkImpl(...);
            end, 
            installReducer = v6.installReducer, 
            Enum = {
                NetworkStatus = v6.Enum.Status
            }
        };
    end, 
    mock = v2
};