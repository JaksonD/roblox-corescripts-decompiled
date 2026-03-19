local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.HttpRequest);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local v7 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v8 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogAlreadyCompleted);
local v9 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogApproval);
local v10 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogDenied);
local v11 = require(l_script_FirstAncestor_0.Components.ModalChallengeDialogExpired);
local v12 = require(l_script_FirstAncestor_0.Thunks.FetchDialog);
local v13 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogPollingIntervalSeconds);
local v14 = require(l_script_FirstAncestor_0.Analytics.EventService);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v16 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("ChallengeDialogModalContainerHttpRetryCount", 4) else nil
});
local v17 = {
    [v7.ChallengeDialogApproval] = v9, 
    [v7.ChallengeDialogDenied] = v10, 
    [v7.ChallengeDialogExpired] = v11, 
    [v7.ChallengeDialogAlreadyCompleted] = v8
};
return v3.connect(function(_, _) --[[ Line: 124 ]]
    return {};
end, function(v20) --[[ Line: 126 ]]
    -- upvalues: l_NavigateBack_0 (copy), v12 (copy)
    return {
        navigateBack = function() --[[ Line: 128 ]] --[[ Name: navigateBack ]]
            -- upvalues: v20 (copy), l_NavigateBack_0 (ref)
            return v20(l_NavigateBack_0());
        end, 
        fetchDialog = function(v21) --[[ Line: 131 ]] --[[ Name: fetchDialog ]]
            -- upvalues: v20 (copy), v12 (ref)
            return v20(v12(v21));
        end
    };
end)(function(v22) --[[ Line: 37 ]]
    -- upvalues: v2 (copy), v7 (copy), v14 (copy), v16 (copy), v13 (copy), v17 (copy), v4 (copy)
    local v23, v24 = v2.useState(v22);
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v23 (copy), v7 (ref), v14 (ref), v22 (copy)
        if v23.modalState == v7.ChallengeDialogApproval or v23.modalState == v7.ChallengeDialogExpired then
            v14.sendDialogOpenedEvent(v22.dialogItem.type, v22.dialogItem.typeInternalId, v22.dialogItem.isExpired);
        end;
    end, {
        v23
    });
    v2.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v23 (copy), v7 (ref), v22 (copy), v16 (ref), v24 (copy), v13 (ref)
        local v29 = task.spawn(function() --[[ Line: 54 ]]
            -- upvalues: v23 (ref), v7 (ref), v22 (ref), v16 (ref), v24 (ref), v13 (ref)
            while v23.modalState == v7.ChallengeDialogApproval or v23.modalState == v7.ChallengeDialogExpired do
                v22.fetchDialog(v16):andThen(function(v25) --[[ Line: 61 ]]
                    -- upvalues: v23 (ref), v7 (ref), v24 (ref), v22 (ref)
                    local v26 = v25.dialogs[1];
                    if v26 ~= nil then
                        if v23.modalState == v7.ChallengeDialogApproval and v26.isExpired then
                            v24({
                                modalState = v7.ChallengeDialogExpired, 
                                dialogItem = v26
                            });
                            return;
                        end;
                    else
                        v22.navigateBack();
                    end;
                end):catch(function(_) --[[ Line: 77 ]]

                end):await();
                local v28 = v13();
                task.wait(v28);
            end;
        end);
        return function() --[[ Line: 86 ]]
            -- upvalues: v29 (copy)
            task.cancel(v29);
        end;
    end, {
        v23.modalState
    });
    local function v34() --[[ Line: 91 ]]
        -- upvalues: v22 (copy), v16 (ref), v7 (ref), v24 (copy)
        v22.fetchDialog(v16):andThen(function(v30) --[[ Line: 94 ]]
            -- upvalues: v7 (ref), v24 (ref), v22 (ref)
            local v31 = v30.dialogs[1];
            if v31 ~= nil then
                local v32 = v31.isExpired and v7.ChallengeDialogExpired or v7.ChallengeDialogApproval;
                v24({
                    modalState = v32, 
                    dialogItem = v31
                });
                return;
            else
                v22.navigateBack();
                return;
            end;
        end):catch(function(_) --[[ Line: 107 ]]
            -- upvalues: v22 (ref)
            v22.navigateBack();
        end):await();
    end;
    local v35 = v17[v23.modalState];
    return v35 and v2.createElement(v35, v4.Dictionary.join(v23, {
        navigateToModalState = v24, 
        closeModal = v34
    }));
end);