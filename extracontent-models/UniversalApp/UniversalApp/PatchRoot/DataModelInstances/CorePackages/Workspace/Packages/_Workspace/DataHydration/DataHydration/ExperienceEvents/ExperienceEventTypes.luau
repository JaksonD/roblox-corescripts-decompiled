local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
return {
    EventRsvpTypes = {
        Going = "going", 
        NotGoing = "notGoing", 
        Maybe = "maybe"
    }
};