return function(v0) --[[ Line: 1 ]] --[[ Name: isValidStat ]]
    return v0:IsA("StringValue") or v0:IsA("IntValue") or v0:IsA("BoolValue") or v0:IsA("NumberValue") or v0:IsA("DoubleConstrainedValue") or v0:IsA("IntConstrainedValue");
end;