local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local v4 = require(script.Parent.IGMRespawnControllerBar);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Localization.withLocalization);
local v7 = require(l_Parent_0.Actions.SetRespawning);
local v8 = require(l_Parent_0.Thunks.RespawnPlayer);
local v9 = require(script.Parent.ConfirmationDialog);
local v10 = require(l_Parent_0.Utility.SendAnalytics);
local v11 = require(l_Parent_0.Resources.Constants);
return l_RoactRodux_0.UNSTABLE_connect2(function(v12, _) --[[ Line: 55 ]]
    return {
        isRespawning = v12.respawn.dialogOpen, 
        inputType = v12.displayOptions.inputType
    };
end, function(v14) --[[ Line: 60 ]]
    -- upvalues: v7 (copy), v10 (copy), v11 (copy), v8 (copy)
    return {
        onCancel = function() --[[ Line: 62 ]] --[[ Name: onCancel ]]
            -- upvalues: v14 (copy), v7 (ref), v10 (ref), v11 (ref)
            v14(v7(false));
            v10(v11.AnalyticsInGameMenuName, v11.AnalyticsRespawnCharacterName, {
                confirmed = v11.AnalyticsCancelledName
            });
        end, 
        onConfirm = function() --[[ Line: 70 ]] --[[ Name: onConfirm ]]
            -- upvalues: v14 (copy), v8 (ref)
            v14(v8);
        end
    };
end)(function(v15) --[[ Line: 22 ]] --[[ Name: RespawnDialog ]]
    -- upvalues: l_Roact_0 (copy), v4 (copy), v6 (copy), v9 (copy)
    local function _() --[[ Line: 23 ]] --[[ Name: renderRespawnDialogControllerBar ]]
        -- upvalues: l_Roact_0 (ref), v4 (ref), v15 (copy)
        return l_Roact_0.createElement(v4, {
            inputType = v15.inputType
        });
    end;
    return v6({
        titleText = "CoreScripts.InGameMenu.RespawnCharacterDialogTitle", 
        bodyText = "CoreScripts.InGameMenu.RespawnCharacterDialogBody", 
        confirmText = "CoreScripts.InGameMenu.RespawnCharacterDialogConfirm", 
        cancelText = "CoreScripts.InGameMenu.Cancel"
    })(function(v17) --[[ Line: 34 ]]
        -- upvalues: l_Roact_0 (ref), v15 (copy), v4 (ref), v9 (ref)
        return l_Roact_0.createFragment({
            RespawnDialogControllerBar = v15.isRespawning and l_Roact_0.createElement(v4, {
                inputType = v15.inputType
            }) or nil, 
            ConfirmationDialog = l_Roact_0.createElement(v9, {
                visible = v15.isRespawning, 
                titleText = v17.titleText, 
                bodyText = v17.bodyText, 
                confirmText = v17.confirmText, 
                cancelText = v17.cancelText, 
                bindReturnToConfirm = true, 
                onCancel = v15.onCancel, 
                onConfirm = v15.onConfirm, 
                inputType = v15.inputType
            })
        });
    end);
end);