local v0 = require(script.Parent.Events);
local v1 = require(script.Parent.EventModes);
return {
    [v0.TestEvent] = {
        mode = v1.Default
    }, 
    [v0.TestStrictEvent] = {
        mode = v1.Strict
    }, 
    [v0.CaptureShared] = {
        mode = v1.Default
    }, 
    [v0.CaptureTaken] = {
        mode = v1.Default
    }, 
    [v0.EditProfileOpened] = {
        mode = v1.Default
    }, 
    [v0.ProfileOpened] = {
        mode = v1.Default
    }, 
    [v0.JoinGameCardOpened] = {
        mode = v1.Default
    }, 
    [v0.PYMKCarouselLoaded] = {
        mode = v1.Default
    }, 
    [v0.CustomizeNameOpened] = {
        mode = v1.Default
    }, 
    [v0.StaticShareLinkOpened] = {
        mode = v1.Default
    }, 
    [v0.ShareLinkOpened] = {
        mode = v1.Default
    }
};