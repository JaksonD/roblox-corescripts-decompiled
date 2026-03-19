local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.HttpRequest);
local l_NavigateSideways_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateSideways;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v7 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v8 = require(l_script_FirstAncestor_0.Thunks.FetchDialog);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryIntervalSeconds);
local v10 = require(l_script_FirstAncestor_0.Flags.GetFIntLuaAppChallengeDialogEventReceiverRetryTimes);
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppChallengeDialogFetchDialogConditionally);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v13 = v4.config({
    requestFunction = v4.requestFunctions.RequestInternal, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("ChallengeDialogEventReceiverHttpRetryCount", 4) else nil
});
return v3.connect(function(_, _) --[[ Line: 125 ]]
    return {};
end, function(v16) --[[ Line: 127 ]]
    -- upvalues: l_NavigateSideways_0 (copy), v8 (copy)
    return {
        navigateToPage = function(v17, v18) --[[ Line: 131 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v16 (copy), l_NavigateSideways_0 (ref)
            return v16(l_NavigateSideways_0(v17, v18));
        end, 
        fetchDialog = function(v19) --[[ Line: 134 ]] --[[ Name: fetchDialog ]]
            -- upvalues: v16 (copy), v8 (ref)
            return v16(v8(v19));
        end
    };
end)(function(v20) --[[ Line: 35 ]]
    -- upvalues: v13 (copy), v7 (copy), l_AppPage_0 (copy), v2 (copy), v11 (copy), v9 (copy), v10 (copy)
    local l_RobloxEventReceiver_0 = v20.RobloxEventReceiver;
    local v22 = 0;
    local v23 = false;
    local function v28() --[[ Line: 40 ]]
        -- upvalues: v20 (copy), v13 (ref), v7 (ref), l_AppPage_0 (ref)
        v20.fetchDialog(v13):andThen(function(v24) --[[ Line: 43 ]]
            -- upvalues: v7 (ref), v20 (ref), l_AppPage_0 (ref)
            local v25 = v24.dialogs[1];
            if v25 ~= nil then
                local v26 = v25.isExpired and v7.ChallengeDialogExpired or v7.ChallengeDialogApproval;
                v20.navigateToPage({
                    name = l_AppPage_0.ChallengeDialogModalContainer, 
                    extraProps = {
                        modalState = v26, 
                        dialogItem = v25
                    }
                });
            end;
        end):catch(function(_) --[[ Line: 57 ]]

        end):await();
    end;
    v2.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: l_RobloxEventReceiver_0 (copy), v11 (ref), v28 (copy), v22 (ref), v23 (ref), v9 (ref), v10 (ref)
        local v37 = {
            l_RobloxEventReceiver_0:observeEvent("signalR", function(v29, _, v31) --[[ Line: 66 ]]
                -- upvalues: v11 (ref), v28 (ref), v22 (ref), v23 (ref)
                if v29 == Enum.ConnectionState.Connected then
                    if not v11() then
                        v28();
                        return;
                    elseif v31 and v31.ChallengeDialogNotification then
                        if v22 ~= v31.ChallengeDialogNotification and not v23 then
                            v28();
                        end;
                        v22 = v31.ChallengeDialogNotification;
                    end;
                end;
            end), 
            l_RobloxEventReceiver_0:observeEvent("ChallengeDialogNotification", function(v32) --[[ Line: 83 ]]
                -- upvalues: v22 (ref), v23 (ref), v28 (ref)
                v22 = v32.SequenceNumber;
                if not v23 then
                    v28();
                end;
            end), 
            l_RobloxEventReceiver_0:observeEvent("AppInput", function(_, v34) --[[ Line: 94 ]]
                -- upvalues: v23 (ref), v9 (ref), v10 (ref), v28 (ref)
                if v34 == "Focused" then
                    v23 = false;
                    local v35 = v9();
                    for v36 = 1, v10() + 1 do
                        task.delay(v36 * v35, v28);
                    end;
                    return;
                elseif v34 == "Unfocused" then
                    v23 = true;
                    return;
                else
                    v23 = false;
                    return;
                end;
            end)
        };
        return function() --[[ Line: 115 ]]
            -- upvalues: v37 (copy)
            for _, v39 in pairs(v37) do
                v39:disconnect();
            end;
        end;
    end, {});
    return nil;
end);