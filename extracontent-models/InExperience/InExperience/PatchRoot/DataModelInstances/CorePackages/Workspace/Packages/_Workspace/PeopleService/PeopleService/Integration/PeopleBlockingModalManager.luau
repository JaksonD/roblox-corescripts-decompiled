local l_Parent_0 = script:FindFirstAncestor("PeopleService").Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Signals);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v6 = require(script.Parent.Parent.onPersonBlockButtonActivated);
local v7 = require(script.Parent.Parent.Analytics.PeopleAnalyticsManager);
local v8 = require(script.Parent.Parent.FocusNavigationService);
return ((function() --[[ Line: 28 ]] --[[ Name: createPeopleBlockingModalManager ]]
    -- upvalues: l_Players_0 (copy), v4 (copy), v8 (copy), l_ContextActionService_0 (copy), v6 (copy), v7 (copy), l_useSignalState_0 (copy), v3 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v10, v11 = v4.createSignal(false);
    local v12, v13 = v4.createSignal(nil);
    local v14 = nil;
    local function v15() --[[ Line: 40 ]] --[[ Name: closeModal ]]
        -- upvalues: v8 (ref), v11 (copy), v13 (copy), l_ContextActionService_0 (ref)
        v8.setBlockingModalRestoreMode(true);
        v11(false);
        v13(nil);
        l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
    end;
    local function v20(v16, v17, v18) --[[ Line: 47 ]] --[[ Name: openModal ]]
        -- upvalues: v8 (ref), v6 (ref), v7 (ref), l_LocalPlayer_0 (copy), v14 (ref), v11 (copy), v13 (copy), l_ContextActionService_0 (ref)
        v8.saveScrollPosition();
        local v19 = v6(v16, v7, l_LocalPlayer_0.UserId, v17, v14, v18);
        v19.modalProps.closeModal = function() --[[ Line: 59 ]]
            -- upvalues: v19 (copy), v8 (ref), v11 (ref), v13 (ref), l_ContextActionService_0 (ref)
            v19.resolvePromise();
            v8.setBlockingModalRestoreMode(true);
            v11(false);
            v13(nil);
            l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
        end;
        v13(v19.modalProps);
        v11(true);
        return v19.promise;
    end;
    local function v25(v21, v22) --[[ Line: 70 ]] --[[ Name: getModalManager ]]
        -- upvalues: v14 (ref), l_useSignalState_0 (ref), v10 (copy), v3 (ref), v12 (copy), l_ContextActionService_0 (ref), v8 (ref), v11 (copy), v13 (copy)
        v14 = v22;
        return function() --[[ Line: 74 ]] --[[ Name: BlockingModalManager ]]
            -- upvalues: l_useSignalState_0 (ref), v10 (ref), v3 (ref), v12 (ref), l_ContextActionService_0 (ref), v8 (ref), v11 (ref), v13 (ref), v21 (copy)
            local v23 = l_useSignalState_0(v10);
            local v24 = v3.useMemo(function() --[[ Line: 77 ]]
                -- upvalues: v12 (ref)
                return v12(false);
            end, {
                v23
            });
            v3.useEffect(function() --[[ Line: 82 ]]
                -- upvalues: v23 (copy), l_ContextActionService_0 (ref), v8 (ref), v11 (ref), v13 (ref)
                if v23 then
                    l_ContextActionService_0:BindCoreAction("BlockingModalScreen", function() --[[ Line: 84 ]]
                        -- upvalues: v8 (ref), v11 (ref), v13 (ref), l_ContextActionService_0 (ref)
                        v8.setBlockingModalRestoreMode(true);
                        v11(false);
                        v13(nil);
                        l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
                    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
                else
                    l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
                end;
                return function() --[[ Line: 91 ]]
                    -- upvalues: l_ContextActionService_0 (ref)
                    l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
                end;
            end, {
                v23
            });
            if not v23 or not v24 then
                return nil;
            else
                return v3.createElement(v21, v24);
            end;
        end;
    end;
    return {
        closeModal = v15, 
        openModal = v20, 
        getModalManager = v25
    };
end)());