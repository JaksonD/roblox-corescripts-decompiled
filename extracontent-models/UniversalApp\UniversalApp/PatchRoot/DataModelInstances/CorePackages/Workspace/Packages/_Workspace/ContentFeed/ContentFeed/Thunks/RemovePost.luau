local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.App.Networking);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v2 (copy)
        v3:dispatch(v1.ContentSharingNetworking.DeletePost.API({
            postId = v2
        })):andThen(function() --[[ Line: 11 ]]

        end):catch(function() --[[ Line: 14 ]]

        end);
    end;
end;