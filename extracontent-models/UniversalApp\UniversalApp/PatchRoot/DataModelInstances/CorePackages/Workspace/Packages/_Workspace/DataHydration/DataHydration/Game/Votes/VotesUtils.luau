local _ = require(script.Parent.VotesStoreTypes);
return {
    calculateRating = function(v1, v2) --[[ Line: 11 ]] --[[ Name: calculateRating ]]
        local v3 = v1 + v2;
        if v3 == 0 then
            return 0;
        else
            return (math.floor(v1 / v3 * 100));
        end;
    end, 
    getRatingDisplayText = function(v4) --[[ Line: 25 ]] --[[ Name: getRatingDisplayText ]]
        if not v4 then
            return "--";
        elseif (v4.upVotes or 0) + (v4.downVotes or 0) <= 0 or not v4.rating then
            return "--";
        else
            return tostring(v4.rating) .. "%";
        end;
    end
};