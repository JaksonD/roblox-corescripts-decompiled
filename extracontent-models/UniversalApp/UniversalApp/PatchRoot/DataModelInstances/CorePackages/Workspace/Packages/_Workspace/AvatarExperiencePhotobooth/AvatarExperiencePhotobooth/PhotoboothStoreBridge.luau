local _ = require(script.Parent.Stores.createPhotoboothStore);
local v1 = nil;
return {
    setStore = function(v2) --[[ Line: 13 ]] --[[ Name: setStore ]]
        -- upvalues: v1 (ref)
        v1 = v2;
    end, 
    getStore = function() --[[ Line: 17 ]] --[[ Name: getStore ]]
        -- upvalues: v1 (ref)
        return v1;
    end, 
    clearStore = function() --[[ Line: 21 ]] --[[ Name: clearStore ]]
        -- upvalues: v1 (ref)
        v1 = nil;
    end
};