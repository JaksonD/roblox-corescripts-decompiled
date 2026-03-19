local v0 = require(script.Parent.Enums.EventNames);
return {
    [v0.EditProfileBackgroundOpened] = {
        name = game:DefineFastString("EditProfileBackgroundOpened", "EditProfileBackgroundOpened")
    }, 
    [v0.EditProfileBackgroundLoadingStage] = {
        name = game:DefineFastString("EditProfileBackgroundLoadingStage", "EditProfileBackgroundLoadingStage")
    }, 
    [v0.BackgroundSelected] = {
        name = game:DefineFastString("BackgroundSelected", "BackgroundSelected")
    }, 
    [v0.EditProfileBackgroundFailure] = {
        name = game:DefineFastString("EditProfileBackgroundFailure", "EditProfileBackgroundFailure")
    }
};