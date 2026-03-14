local v0 = game:DefineFastFlag("PPDebugLogging", false);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    if not v0 or not v1 then
        return;
    else
        print("[PurchasePrompt]" .. v1());
        return;
    end;
end;