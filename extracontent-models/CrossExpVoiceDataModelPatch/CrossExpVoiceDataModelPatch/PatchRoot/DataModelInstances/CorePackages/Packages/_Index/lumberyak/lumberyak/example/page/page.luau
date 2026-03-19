local v0 = require(script.Parent.pageLogger);
local v1 = require(script.Parent.component);
return {
    init = function(v2) --[[ Line: 6 ]] --[[ Name: init ]]
        -- upvalues: v0 (copy)
        v0:setParent(v2);
    end, 
    doSomething = function() --[[ Line: 9 ]] --[[ Name: doSomething ]]
        -- upvalues: v0 (copy), v1 (copy)
        v0:info("calling {root} {foo}");
        return v1();
    end
};