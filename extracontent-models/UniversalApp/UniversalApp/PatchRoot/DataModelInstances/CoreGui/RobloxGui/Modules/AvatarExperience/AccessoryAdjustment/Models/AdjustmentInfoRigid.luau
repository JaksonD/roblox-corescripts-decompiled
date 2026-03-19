return {
    mock = function() --[[ Line: 47 ]] --[[ Name: mock ]]
        return {};
    end, 
    fromDefaultInfo = function(v0) --[[ Line: 57 ]] --[[ Name: fromDefaultInfo ]]
        return {
            defaultInfo = {
                attachment = {
                    cframe = v0.attachmentCFrame
                }, 
                accessory = {
                    cframe = v0.accessoryCFrame, 
                    scale = v0.accessoryScale
                }
            }
        };
    end, 
    fromUserInfo = function(v1) --[[ Line: 77 ]] --[[ Name: fromUserInfo ]]
        return {
            userAdjustedInfo = {
                cframe = v1.adjustedCFrame, 
                scale = v1.adjustedScale
            }
        };
    end
};