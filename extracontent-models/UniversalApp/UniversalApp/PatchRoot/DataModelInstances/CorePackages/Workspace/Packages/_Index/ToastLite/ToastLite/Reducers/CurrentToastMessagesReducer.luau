local l_Parent_0 = script:FindFirstAncestor("ToastLite").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.ToastRodux);
local function _(v4, v5) --[[ Line: 8 ]] --[[ Name: messagesAreEqual ]]
    local v6 = false;
    if v4.toastTitle == v5.toastTitle then
        v6 = false;
        if v4.toastSubtitle == v5.toastSubtitle then
            v6 = v4.toastType == v5.toastType;
        end;
    end;
    return v6;
end;
local _ = function(v8, v9) --[[ Line: 14 ]] --[[ Name: messageIsAlreadyPresent ]]
    for _, v11 in ipairs(v8) do
        local v12 = false;
        if v11.toastTitle == v9.toastTitle then
            v12 = false;
            if v11.toastSubtitle == v9.toastSubtitle then
                v12 = v11.toastType == v9.toastType;
            end;
        end;
        if v12 then
            return true;
        end;
    end;
    return false;
end;
local v14 = 0;
return v2.createReducer({}, {
    [v3.Actions.SetCurrentToastMessage.name] = function(v15, v16) --[[ Line: 26 ]]
        -- upvalues: v1 (copy), v14 (ref)
        local v17 = false;
        local v18 = v1.Dictionary.join(v16.toastMessage, {
            sequenceNumber = v14
        });
        v14 = v14 + 1;
        local v19;
        for _, v21 in ipairs(v15) do
            local v22 = false;
            if v21.toastTitle == v18.toastTitle then
                v22 = false;
                if v21.toastSubtitle == v18.toastSubtitle then
                    v22 = v21.toastType == v18.toastType;
                end;
            end;
            if v22 then
                v19 = true;
                v17 = true;
            end;
            if v17 then
                break;
            end;
        end;
        if not v17 then
            v19 = false;
        end;
        v17 = false;
        if v19 then
            return v15;
        else
            return v1.List.join(v15, {
                v18
            });
        end;
    end, 
    [v3.Actions.RemoveCurrentToastMessage.name] = function(v23, _) --[[ Line: 39 ]]
        -- upvalues: v1 (copy)
        if #v23 == 0 then
            return v23;
        else
            return v1.List.removeIndex(v23, 1);
        end;
    end, 
    [v3.Actions.RemoveAllToastMessages.name] = function(_, _) --[[ Line: 46 ]]
        return {};
    end
});