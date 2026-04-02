local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local l_Coachmark_0 = require(l_Parent_0.Foundation).Coachmark;
local l_CollectionService_0 = game:GetService("CollectionService");
return v1.memo(function(v4) --[[ Line: 28 ]] --[[ Name: SduiCoachmark ]]
    -- upvalues: v1 (copy), l_CollectionService_0 (copy), l_Coachmark_0 (copy)
    local v5 = v1.useRef(nil);
    local v6, v7 = v1.useState(false);
    local v8, v9 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v5 (copy), v9 (copy), l_CollectionService_0 (ref), v4 (copy)
        local function v11(v10) --[[ Line: 34 ]] --[[ Name: onTagAdded ]]
            -- upvalues: v5 (ref), v9 (ref)
            if not v10:IsA("GuiObject") then
                return;
            else
                v5.current = v10;
                v9(true);
                return;
            end;
        end;
        local function v13(_) --[[ Line: 42 ]] --[[ Name: onTagRemoved ]]
            -- upvalues: v5 (ref), v9 (ref)
            v5.current = nil;
            v9(false);
        end;
        for _, v15 in (l_CollectionService_0:GetTagged(v4.collectionServiceAnchorTag)) do
            if v15:IsA("GuiObject") then
                if v15:IsA("GuiObject") then
                    v5.current = v15;
                    v9(true);
                    break;
                else
                    break;
                end;
            end;
        end;
        local v16 = l_CollectionService_0:GetInstanceAddedSignal(v4.collectionServiceAnchorTag):Connect(v11);
        local v17 = l_CollectionService_0:GetInstanceRemovedSignal(v4.collectionServiceAnchorTag):Connect(v13);
        return function() --[[ Line: 59 ]]
            -- upvalues: v16 (copy), v17 (copy)
            v16:Disconnect();
            v17:Disconnect();
        end;
    end, {
        v4.collectionServiceAnchorTag
    });
    local v18 = v1.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v7 (copy), v4 (copy)
        v7(true);
        if v4.onClose then
            v4.onClose();
        end;
    end, {
        v4.onClose
    });
    if not v8 or v6 then
        return nil;
    else
        return v1.createElement(l_Coachmark_0, {
            title = v4.title, 
            text = v4.body, 
            isOpen = v8 and not v6, 
            side = v4.side, 
            align = v4.align, 
            anchorRef = v5, 
            onClose = v18, 
            actions = v4.actions, 
            media = v4.media, 
            testId = v4.testId
        });
    end;
end);