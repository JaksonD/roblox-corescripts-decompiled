local _ = require(script.ReactInternalTypes);
local _ = require(script.ReactRootTags);
local _ = require(script.ReactFiberHostConfig);
local _ = require(script["ReactFiberHotReloading.new"]);
return function(v4) --[[ Line: 39 ]] --[[ Name: initialize ]]
    local v5 = require(script.ReactFiberHostConfig);
    for v6, v7 in v4 do
        v5[v6] = v7;
    end;
    return require(script.ReactFiberReconciler);
end;