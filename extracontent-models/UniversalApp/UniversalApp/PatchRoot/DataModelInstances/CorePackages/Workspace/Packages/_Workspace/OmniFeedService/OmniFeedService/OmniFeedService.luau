local v0 = {};
v0.__index = v0;
v0.get = function() --[[ Line: 18 ]] --[[ Name: get ]]
    -- upvalues: v0 (copy)
    if not v0.default then
        local v1 = {};
        setmetatable(v1, v0);
        v0.default = v1;
    end;
    return v0.default;
end;
v0.initialize = function(v2, v3) --[[ Line: 28 ]] --[[ Name: initialize ]]
    if not v2._omniFeedItemMap then
        v2._omniFeedItemMap = v3;
        return;
    else
        if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
            warn("OmniFeedService already initialized with an item map.  Ignoring.");
        end;
        return;
    end;
end;
v0.getOmniFeedItemMap = function(v4) --[[ Line: 38 ]] --[[ Name: getOmniFeedItemMap ]]
    if not v4._omniFeedItemMap then
        error("OmniFeedService was never initialized with a proper item map. Make sure that OmniFeedService:initialize is called before being accessed.");
    end;
    return v4._omniFeedItemMap;
end;
return v0;