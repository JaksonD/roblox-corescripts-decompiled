local v0 = require(script.CurrentExperienceInviteUpdated);
local v1 = require(script.CurrentExperienceInviteDismissed);
local v2 = require(script.CurrentExperienceInviteReceived);
local v3 = require(script.CurrentExperienceInviteStatusUpdated);
local v4 = require(script.CurrentSquadUpdated);
local v5 = require(script.PartialSquadAdded);
local v6 = require(script.PartialSquadRemoved);
local v7 = require(script.SelfPermissionUpdated);
return {
    CurrentExperienceInviteUpdated = v0, 
    CurrentExperienceInviteDismissed = v1, 
    CurrentExperienceInviteReceived = v2, 
    CurrentExperienceInviteStatusUpdated = v3, 
    CurrentSquadUpdated = v4, 
    PartialSquadAdded = v5, 
    PartialSquadRemoved = v6, 
    SelfPermissionUpdated = v7
};