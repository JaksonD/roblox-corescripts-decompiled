local v0 = require(script.Parent.useWearTimeSelectedOptionViewModel);
local v1 = require(script.Parent.WearTimeSelectedOptionInListView);
return function(v2) --[[ Line: 17 ]] --[[ Name: WearTimeSelectedOptionContainer ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v3 = v0(v2);
    return v1(v3);
end;