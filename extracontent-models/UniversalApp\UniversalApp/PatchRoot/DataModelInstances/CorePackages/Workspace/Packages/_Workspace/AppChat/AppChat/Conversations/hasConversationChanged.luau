local v0 = require(script.Parent.hasSameParticipants);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    if not v1.existing then
        return true;
    elseif v1.new.lastUpdated and v1.existing.lastUpdated and math.floor((v1.existing.lastUpdated:GetUnixTimestamp())) ~= math.floor((v1.new.lastUpdated:GetUnixTimestamp())) then
        return true;
    elseif v1.existing.title ~= v1.new.title then
        return true;
    elseif not v0({
        existing = v1.existing.participants, 
        new = v1.new.participants
    }) then
        return true;
    elseif v1.new.hasUnreadMessages and not v1.existing.hasUnreadMessages then
        return true;
    else
        return false;
    end;
end;