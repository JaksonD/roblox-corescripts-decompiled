local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local _ = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
local _ = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
return function() --[[ Line: 57 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v9, v10 = v2.createSignal(v3.Unspecified);
    local v11, v12 = v2.createSignal(nil);
    local v13, v14 = v2.createSignal(0);
    local v15, v16 = v2.createSignal(0);
    local v17, v18 = v2.createSignal(nil);
    local v19, v20 = v2.createSignal(nil);
    local v21, v22 = v2.createSignal(nil);
    local v23, v24 = v2.createSignal(nil);
    local v25, v26 = v2.createSignal(nil);
    local v27, v28 = v2.createSignal(nil);
    local v29, v30 = v2.createSignal(nil);
    local v31, v32 = v2.createSignal(nil);
    local v33, v34 = v2.createSignal(nil);
    local v35, v36 = v2.createSignal(nil);
    local v37, v38 = v2.createSignal(nil);
    local v39 = nil;
    local function v41(v40) --[[ Line: 77 ]] --[[ Name: setOnClose ]]
        -- upvalues: v39 (ref)
        v39 = v40;
    end;
    local function v42() --[[ Line: 81 ]] --[[ Name: triggerOnClose ]]
        -- upvalues: v39 (ref)
        if v39 then
            v39();
        end;
    end;
    return {
        getPromptState = v9, 
        setPromptState = v10, 
        getTransferRequestId = v11, 
        setTransferRequestId = v12, 
        getRecipientUserId = v13, 
        setRecipientUserId = v14, 
        getRobuxBalanceAmount = v15, 
        setRobuxBalanceAmount = v16, 
        getSelectedAmount = v17, 
        setSelectedAmount = v18, 
        getUserRelationshipDetail = v19, 
        setUserRelationshipDetail = v20, 
        getRecipient = v21, 
        setRecipient = v22, 
        getDirection = v23, 
        setDirection = v24, 
        getTransferOrigination = v25, 
        setTransferOrigination = v26, 
        getRobuxTransfer = v27, 
        setRobuxTransfer = v28, 
        getErrorTransferModel = v29, 
        setErrorTransferModel = v30, 
        getAmpRecourseActions = v31, 
        setAmpRecourseActions = v32, 
        getAmpFeatureCheck = v33, 
        setAmpFeatureCheck = v34, 
        getPreviousPromptState = v35, 
        setPreviousPromptState = v36, 
        getTransferRetryOrigin = v37, 
        setTransferRetryOrigin = v38, 
        setOnClose = v41, 
        triggerOnClose = v42
    };
end;