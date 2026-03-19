local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
return function(v2, v3) --[[ Line: 8 ]]
    for v4, v5 in v2 do
        if v5 and v5.type == "one_to_one" and v5.participants then
            for _, v7 in v5.participants do
                if v7 == v3 then
                    return v4;
                end;
            end;
        end;
    end;
    return nil;
end;