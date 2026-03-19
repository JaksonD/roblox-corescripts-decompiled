local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local _ = require(l_Parent_0.UnifiedLogging);
local l_SduiErrors_0 = require(l_Parent_0.SduiCoreSystem).SduiErrors;
return function(v3, v4, v5, v6) --[[ Line: 13 ]] --[[ Name: getImpressionsTag ]]
    -- upvalues: l_SduiErrors_0 (copy)
    local v7 = nil;
    local v8 = nil;
    if v4 then
        v7 = v4.collectionId;
        v8 = v4.collectionComponentType;
        if not v8 then
            v5.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.GetImpressionsTagMissingCollectionComponentType, {
                name = v6
            }, v5.appPage);
        end;
        if not v7 then
            v5.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.GetImpressionsTagMissingCollectionId, {
                name = v6
            }, v5.appPage);
        end;
    else
        v5.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.GetImpressionsTagMissingCollectionData, {
            name = v6
        }, v5.appPage);
    end;
    v7 = v7 or -1;
    return (("%*_%*_%*_%*_%*"):format(v6, v8, v5.appPage, v7, v3));
end;