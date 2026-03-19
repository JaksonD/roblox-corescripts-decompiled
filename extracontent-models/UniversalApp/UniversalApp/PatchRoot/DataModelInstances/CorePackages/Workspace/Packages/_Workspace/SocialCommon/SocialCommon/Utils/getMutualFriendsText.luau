return function(v0) --[[ Line: 14 ]]
    if v0.mutualFriendsCount == 0 then
        return "";
    elseif v0.mutualFriendsCount == 1 then
        return v0.localized.singularMutualConnection;
    else
        return v0.localized.mutualConnections;
    end;
end;