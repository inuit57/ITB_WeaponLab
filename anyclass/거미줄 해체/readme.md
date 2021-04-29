```
-- p1 is the location of the web egg or similar webbing enemy
local fx = SkillEffect()
-- let's say we only want to remove grapple direction = 0
local remove_dir = 0
-- mapdata is a pseudo-table representing all the tiles in the saved mapdata
-- 이 부분에서 어떻게 처리해야할지 아직 감이 오지 않는다. 
-- remove_dir 은 현재 아군의 위치를 받아서 처리할 수 있다고는 하지만 말입니다. 

local grapple_targets = mapdata[p1].grapple_targets
remove_element(remove_dir, grapple_targets)

-- double flip p1
-- TODO: add code to double flip p1

-- reapply grapple targets that shouldn't be removed
for _, dir in ipairs(grapple_targets) do
    local p2 = p1 + DIR_VECTORS[dir]
    fx:AddGrapple(p1, p2, "hold")
end
Board:AddEffect(fx)

```

- Lemonymous 씨께서 말씀해주신 부분. 
- 거미알/전갈 보스처럼 여러 적을 묶은 경우에 내 방식대로 진행한다면 <br>
 묶여있어야 하는 대상들 모두가 풀려버릴 수 있는 문제점이 존재한다. 
 
 - 그것을 해결하기 위한 방법이 이러한 방법이라고 합니다. 
 
 - 다른 문제점으로 떠오르는 것은 맵 가장자리 쪽에 위치하는 경우인데 <br>
 이는 사실 흔치 않은 상황인지라 크게 문제가 안되리라고 생각되긴 합니다. 
 
 ```
 I don't think there is a simple functions for this. However, there is data that you can use to create such a function.
The information you need is in the save data. So you can use your favorite method of requesting the save data, and look for something like: ["grapple_targets"] = {2, }
It is data associated with a tile, and it indicates in which directions the web is attached to.

```
- 짐작컨데 savefile를 탐색해서 확인하는 방법이 있다고 하는 듯 합니다. 
- 
