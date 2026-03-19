local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarSettings);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v5 = {
    ObtainedAvatarRules = false, 
    [v4.AvatarSettings.minDeltaBodyColorDifference] = 0, 
    [v4.AvatarSettings.scalesRules] = {
        height = {
            min = 0.9, 
            max = 1.05, 
            increment = 0.01
        }, 
        width = {
            min = 0.7, 
            max = 1, 
            increment = 0.01
        }, 
        head = {
            min = 0.95, 
            max = 1, 
            increment = 0.01
        }, 
        proportion = {
            min = 0, 
            max = 1, 
            increment = 0.01
        }, 
        bodyType = {
            min = 0, 
            max = 1, 
            increment = 0.01
        }
    }, 
    [v4.AvatarSettings.accessoryRefinementTypes] = {
        [1] = Enum.AssetType.Hat.Value, 
        [2] = Enum.AssetType.FaceAccessory.Value
    }, 
    [v4.AvatarSettings.accessoryRefinementLowerBounds] = {
        hat = {
            position = {
                xPosition = -0.25, 
                yPosition = -0.25, 
                zPosition = -0.25
            }, 
            rotation = {
                xRotation = -30, 
                yRotation = -30, 
                zRotation = -30
            }, 
            scale = {
                xScale = 0.8, 
                yScale = 0.8, 
                zScale = 0.8
            }
        }, 
        faceAccessory = {
            position = {
                xPosition = -0.25, 
                yPosition = -0.25, 
                zPosition = -0.25
            }, 
            rotation = {
                xRotation = -30, 
                yRotation = -30, 
                zRotation = -30
            }, 
            scale = {
                xScale = 0.8, 
                yScale = 0.8, 
                zScale = 0.8
            }
        }
    }, 
    [v4.AvatarSettings.accessoryRefinementUpperBounds] = {
        hat = {
            position = {
                xPosition = 0.25, 
                yPosition = 0.25, 
                zPosition = 0.25
            }, 
            rotation = {
                xRotation = 30, 
                yRotation = 30, 
                zRotation = 30
            }, 
            scale = {
                xScale = 1.2, 
                yScale = 1.2, 
                zScale = 1.2
            }
        }, 
        faceAccessory = {
            position = {
                xPosition = 0.25, 
                yPosition = 0.25, 
                zPosition = 0.25
            }, 
            rotation = {
                xRotation = 30, 
                yRotation = 30, 
                zRotation = 30
            }, 
            scale = {
                xScale = 1.2, 
                yScale = 1.2, 
                zScale = 1.2
            }
        }
    }
};
return v2.createReducer(v5, {
    [v3.name] = function(_, v7) --[[ Line: 173 ]]
        -- upvalues: v4 (copy)
        return {
            ObtainedAvatarRules = true, 
            [v4.AvatarSettings.scalesRules] = v7.scalesRules, 
            [v4.AvatarSettings.minDeltaBodyColorDifference] = v7.minimumDeltaEBodyColorDifference, 
            [v4.AvatarSettings.accessoryRefinementTypes] = v7.accessoryRefinementTypes, 
            [v4.AvatarSettings.accessoryRefinementLowerBounds] = v7.accessoryRefinementLowerBounds, 
            [v4.AvatarSettings.accessoryRefinementUpperBounds] = v7.accessoryRefinementUpperBounds
        };
    end
});