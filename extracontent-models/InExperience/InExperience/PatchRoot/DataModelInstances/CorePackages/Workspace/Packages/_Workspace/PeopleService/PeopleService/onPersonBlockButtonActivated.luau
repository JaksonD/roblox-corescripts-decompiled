local l_Parent_0 = script:FindFirstAncestor("PeopleService").Parent;
local v1 = require(l_Parent_0.Promise);
return function(v2, v3, v4, v5, _, v7) --[[ Line: 36 ]] --[[ Name: onPersonBlockButtonActivated ]]
    -- upvalues: v1 (copy)
    v3:trackBlockUserButtonClick(v2.UserId, v4, v5);
    local v12 = {
        action = function(_, _, v10, _) --[[ Line: 46 ]] --[[ Name: action ]]
            -- upvalues: v3 (copy), v2 (copy), v4 (copy), v5 (copy)
            if v10 == "blockUser" then
                v3:trackBlockUser(v2.UserId, v4, v5);
                return;
            elseif v10 == "unblockUser" then
                v3:trackUnblockUser(v2.UserId, v4, v5);
                return;
            else
                if v10 == "blockUserButtonClick" then
                    v3:trackBlockUserButtonClick(v2.UserId, v4, v5);
                end;
                return;
            end;
        end
    };
    local v13 = {
        player = v2, 
        closeModal = function() --[[ Line: 61 ]] --[[ Name: closeModal ]]

        end, 
        analytics = v12, 
        source = v5, 
        onBlockingSuccess = v7 and v7.onBlockingSuccess or nil
    };
    local v14 = nil;
    local v16 = v1.new(function(v15) --[[ Line: 69 ]]
        -- upvalues: v14 (ref)
        v14 = v15;
    end);
    return {
        modalProps = v13, 
        promise = v16, 
        resolvePromise = v14, 
        useToastFlow = true
    };
end;