return function(v0) --[[ Line: 1 ]]
    return {
        moderationDetail = v0.fromString("usermoderation:v1/not-approved"), 
        reactivate = v0.fromString("usermoderation:v1/not-approved/reactivate"), 
        reminder = v0.fromString("usermoderation:v1/reminder"), 
        dismissIntervention = v0.fromString("usermoderation:v1/dismiss-intervention"), 
        accessDetail = v0.fromString("usermoderation:v2/not-approved")
    };
end;