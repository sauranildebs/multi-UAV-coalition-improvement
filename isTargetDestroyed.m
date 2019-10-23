function targetDestroyed = isTargetDestroyed(target,targetResources)


if targetResources(target,1) == 0
    targetDestroyed = target;
else
    targetDestroyed = [];
end
