local v2 = setmetatable({}, {
    __index = function(_, v1) --[[ Line: 2 ]] --[[ Name: __index ]]
        error(("Invalid TimeZone \"%s\""):format((tostring(v1))), 2);
    end
});
v2.UTC = -2;
v2.Current = -1;
return v2;