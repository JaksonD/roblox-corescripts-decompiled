local v0 = nil;
return {
    getUrl = function() --[[ Line: 4 ]] --[[ Name: getUrl ]]
        -- upvalues: v0 (ref)
        return v0;
    end, 
    setUrl = function(v1) --[[ Line: 8 ]] --[[ Name: setUrl ]]
        -- upvalues: v0 (ref)
        v0 = v1;
    end
};