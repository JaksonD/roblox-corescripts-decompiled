local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Parent_0.Actions.OpenPublishAssetPrompt);
local v5 = require(l_Parent_0.Actions.OpenPublishAvatarPrompt);
local v6 = require(l_Parent_0.Actions.OpenPublishAvatarAssetPrompt);
local v7 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v8 = require(l_Parent_0.Actions.OpenResultModal);
local v9 = require(l_Parent_0.Actions.CloseResultModal);
local v10 = require(l_Parent_0.Actions.OpenValidationErrorModal);
local v11 = require(l_Parent_0.Actions.SetHumanoidModel);
local v12 = require(l_Parent_0.Actions.SetAccessoryInstance);
local v13 = require(l_Parent_0.Actions.SetPriceInRobux);
local v14 = require(l_Parent_0.Actions.SetPromptVisibility);
local v15 = {
    promptInfo = {}, 
    queue = {}
};
return (v2.createReducer(v15, {
    [v4.name] = function(v16, v17) --[[ Line: 34 ]]
        -- upvalues: v3 (copy)
        if v16.promptInfo.promptType == nil then
            return v3.Dictionary.join(v16, {
                promptInfo = v17.promptInfo
            });
        else
            return v3.Dictionary.join(v16, {
                queue = v3.List.join(v16.queue, {
                    v17.promptInfo
                })
            });
        end;
    end, 
    [v5.name] = function(v18, v19) --[[ Line: 46 ]]
        -- upvalues: v3 (copy)
        if v18.promptInfo.promptType == nil then
            return v3.Dictionary.join(v18, {
                promptInfo = v19.promptInfo
            });
        else
            return v3.Dictionary.join(v18, {
                queue = v3.List.join(v18.queue, {
                    v19.promptInfo
                })
            });
        end;
    end, 
    [v6.name] = function(v20, v21) --[[ Line: 58 ]]
        -- upvalues: v3 (copy)
        if v20.promptInfo.promptType == nil then
            return v3.Dictionary.join(v20, {
                promptInfo = v21.promptInfo
            });
        else
            return v3.Dictionary.join(v20, {
                queue = v3.List.join(v20.queue, {
                    v21.promptInfo
                })
            });
        end;
    end, 
    [v11.name] = function(v22, v23) --[[ Line: 70 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v22, {
            promptInfo = v3.Dictionary.join(v22.promptInfo, {
                humanoidModel = v23.humanoidModel
            })
        });
    end, 
    [v12.name] = function(v24, v25) --[[ Line: 78 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v24, {
            promptInfo = v3.Dictionary.join(v24.promptInfo, {
                accessoryInstance = v25.accessoryInstance
            })
        });
    end, 
    [v13.name] = function(v26, v27) --[[ Line: 86 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v26, {
            promptInfo = v3.Dictionary.join(v26.promptInfo, {
                priceInRobux = v27.priceInRobux
            })
        });
    end, 
    [v7.name] = function(v28, _) --[[ Line: 94 ]]
        -- upvalues: v3 (copy)
        if v3.isEmpty(v28.queue) then
            return {
                promptInfo = {}, 
                queue = v28.queue
            };
        else
            return v3.Dictionary.join(v28, {
                promptInfo = v28.queue[1], 
                queue = v3.List.removeIndex(v28.queue, 1)
            });
        end;
    end, 
    [v8.name] = function(v30, v31) --[[ Line: 107 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v30, {
            resultModalType = v31.resultType
        });
    end, 
    [v9.name] = function(v32, _) --[[ Line: 114 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v32, {
            resultModalType = v3.None
        });
    end, 
    [v10.name] = function(v34, v35) --[[ Line: 120 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v34, {
            promptInfo = v3.Dictionary.join(v34.promptInfo, {
                errorMessage = v35.errorMessage
            })
        });
    end, 
    [v14.name] = function(v36, v37) --[[ Line: 129 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v36, {
            promptInfo = v3.Dictionary.join(v36.promptInfo, {
                promptVisible = v37.promptVisible
            })
        });
    end
}));