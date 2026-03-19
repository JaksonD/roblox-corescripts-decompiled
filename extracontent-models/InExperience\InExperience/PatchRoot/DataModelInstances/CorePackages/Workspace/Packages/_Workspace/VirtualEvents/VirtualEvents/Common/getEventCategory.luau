local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
return function(v2) --[[ Line: 7 ]] --[[ Name: getEventCategory ]]
    local l_eventCategories_0 = v2.eventCategories;
    if l_eventCategories_0 == nil or #l_eventCategories_0 == 0 then
        return nil;
    else
        for _, v5 in ipairs(l_eventCategories_0) do
            if v5 ~= nil and v5.rank == 0 then
                return v5.category;
            end;
        end;
        return nil;
    end;
end;