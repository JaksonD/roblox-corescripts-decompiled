return function(v0) --[[ Line: 1 ]]
    if not v0 then
        return false;
    else
        return (table.find(v0, "WhoCanChatWithMeInApp") or table.find(v0, "WhoCanGroupChatWithMeInApp") or table.find(v0, "WhoCanOneOnOnePartyWithMe") or table.find(v0, "WhoCanGroupPartyWithMe")) ~= nil;
    end;
end;