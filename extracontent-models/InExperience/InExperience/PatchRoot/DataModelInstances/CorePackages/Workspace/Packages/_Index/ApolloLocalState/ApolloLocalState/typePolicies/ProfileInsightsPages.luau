local v0 = require(script.Parent.utils.mergeLists);
return {
    fields = {
        profileInsights = {
            merge = function(_, v2, v3) --[[ Line: 6 ]] --[[ Name: merge ]]
                -- upvalues: v0 (copy)
                return v0(v2, v3);
            end
        }
    }
};