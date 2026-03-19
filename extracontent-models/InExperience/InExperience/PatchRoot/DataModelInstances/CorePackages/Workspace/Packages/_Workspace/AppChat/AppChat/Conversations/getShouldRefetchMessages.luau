return function(v0) --[[ Line: 1 ]]
    if not v0.existing then
        return false;
    elseif v0.new.lastUpdated and v0.existing.lastUpdated and math.floor((v0.existing.lastUpdated:GetUnixTimestamp())) < math.floor((v0.new.lastUpdated:GetUnixTimestamp())) then
        return true;
    elseif v0.new.hasUnreadMessages and not v0.existing.hasUnreadMessages then
        return true;
    else
        return false;
    end;
end;