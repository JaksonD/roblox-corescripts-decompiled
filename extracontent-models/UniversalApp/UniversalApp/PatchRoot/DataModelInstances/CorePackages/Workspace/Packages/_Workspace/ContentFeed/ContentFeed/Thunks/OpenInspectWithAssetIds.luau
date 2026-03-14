local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.InspectOpened);
local v2 = require(l_Parent_0.App.Networking);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v2 (ref), v3 (copy), v1 (ref)
        v4:dispatch(v2.NetworkingCurrentlyWearing.GetItemDetails.API(v3)):andThen(function() --[[ Line: 10 ]]
            -- upvalues: v4 (copy), v1 (ref), v3 (ref)
            v4:dispatch(v1(v3));
        end):catch(function() --[[ Line: 13 ]]

        end);
    end;
end;