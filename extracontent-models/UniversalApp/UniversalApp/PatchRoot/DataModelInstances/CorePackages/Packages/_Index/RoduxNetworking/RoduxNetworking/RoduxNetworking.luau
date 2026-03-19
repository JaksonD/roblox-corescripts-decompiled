local v0 = require(script.Parent.GET);
local v1 = require(script.Parent.POST);
local v2 = require(script.Parent.PATCH);
local v3 = require(script.Parent.DELETE);
local _ = require(script.Parent.Types);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy), v3 (copy)
    assert(v5, "Expected options to be passed into RoduxNetworking");
    assert(v5.keyPath, "Expected options.keyPath to be passed into RoduxNetworking");
    assert(v5.networkImpl, "Expected options.networkImpl to be passed into RoduxNetworking");
    return {
        GET = function(v6, v7) --[[ Line: 14 ]] --[[ Name: GET ]]
            -- upvalues: v0 (ref), v5 (copy)
            assert(v6, "RoduxNetworking:GET expects moduleScript argument");
            assert(v6, "RoduxNetworking:GET expects constructBuilderFunction argument");
            return v0(v5)(v6, v7);
        end, 
        POST = function(v8, v9) --[[ Line: 19 ]] --[[ Name: POST ]]
            -- upvalues: v1 (ref), v5 (copy)
            return v1(v5)(v8, v9);
        end, 
        PATCH = function(v10, v11) --[[ Line: 22 ]] --[[ Name: PATCH ]]
            -- upvalues: v2 (ref), v5 (copy)
            return v2(v5)(v10, v11);
        end, 
        DELETE = function(v12, v13) --[[ Line: 25 ]] --[[ Name: DELETE ]]
            -- upvalues: v3 (ref), v5 (copy)
            return v3(v5)(v12, v13);
        end, 
        getNetworkImpl = function() --[[ Line: 28 ]] --[[ Name: getNetworkImpl ]]
            -- upvalues: v5 (copy)
            return v5.networkImpl;
        end, 
        setNetworkImpl = function(v14) --[[ Line: 31 ]] --[[ Name: setNetworkImpl ]]
            -- upvalues: v5 (copy)
            v5.networkImpl = v14;
        end
    };
end;