return function(v0) --[[ Line: 1 ]] --[[ Name: getBadgeDetailsPageKey ]]
    if v0 == nil then
        return "BadgeDetails-Unknown";
    else
        return (("BadgeDetails-%*"):format(v0));
    end;
end;