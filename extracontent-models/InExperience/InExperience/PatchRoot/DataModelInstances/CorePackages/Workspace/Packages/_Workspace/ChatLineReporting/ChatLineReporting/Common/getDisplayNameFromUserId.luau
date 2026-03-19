local l_UserService_0 = game:GetService("UserService");
getDisplayNameFromUserId = function(v1) --[[ Line: 3 ]] --[[ Name: getDisplayNameFromUserId ]]
    -- upvalues: l_UserService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 4 ]]
        -- upvalues: l_UserService_0 (ref), v1 (copy)
        return l_UserService_0:GetUserInfosByUserIdsAsync({
            (tonumber(v1))
        })[1];
    end);
    if l_status_0 then
        return l_result_0.DisplayName;
    else
        return "";
    end;
end;
return getDisplayNameFromUserId;