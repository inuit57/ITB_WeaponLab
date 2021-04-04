Prime_SpinFist2 = Skill:new{  
	Name = "Test 1",
	Class = "Prime",
	Icon = "weapons/acid_laser.png",--"weapons/Prime_SpinFist.png",
	Rarity = 3,
	Explosion = "ExploAir2",
	LaunchSound = "/weapons/titan_fist",
	Range = 1, -- Tooltip?
	PathSize = 1,
	Damage = 2,
	Push = 1,
	PowerCost = 1,
	SelfDamage = 0,
	--Upgrades = 2,
	ZoneTargeting = ZONE_ALL,
--	UpgradeList = { "+1 Damage Each",  "+1 Damage"  },
	--UpgradeCost = { 1 , 3 },
	TipImage = StandardTips.Surrounded
}

function Prime_SpinFist2:GetTargetArea(point)
	local ret = PointList()
	ret:push_back(point)
	for i = DIR_START, DIR_END do
		ret:push_back(point + DIR_VECTORS[i])
	end
	
	return ret
end
				
function Prime_SpinFist2:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	
	local damage 
	-- = SpaceDamage(p1, self.SelfDamage)
	-- if self.SelfDamage == 1 then damage.sAnimation = "ExploAir1" end
	-- ret:AddDamage(damage)
	
	-- damage = SpaceDamage(p1 + DIR_VECTORS[0],self.Damage, 3)
	-- damage.sAnimation = "explopunch1_3"
	-- ret:AddDamage(damage)
		
	-- damage = SpaceDamage(p1 + DIR_VECTORS[2],self.Damage, 1)
	-- damage.sAnimation = "explopunch1_1"
	-- ret:AddDamage(damage)
	
	-- ret:AddDelay(0.2)
		
	-- damage = SpaceDamage(p1 + DIR_VECTORS[1],self.Damage, 0)
	-- damage.sAnimation = "explopunch1_0"
	-- ret:AddDamage(damage)
		
	-- damage = SpaceDamage(p1 + DIR_VECTORS[3],self.Damage, 2)
	-- damage.sAnimation = "explopunch1_2"
	-- ret:AddDamage(damage)


	local board_size = Board:GetSize()
	for i = 0, 7 do
		for j = 0, 7  do
			local point = Point(i,j) -- DIR_LEFT
			-- if dir == DIR_RIGHT then
			-- 	point = Point(7 - i, j)
			-- elseif dir == DIR_UP then
			-- 	point = Point(j,i)
			-- elseif dir == DIR_DOWN then
			-- 	point = Point(j,7-i)
			-- end
			
			if Board:IsPawnSpace(point) and Board:IsPawnTeam(point , TEAM_PLAYER) then
				--ret:AddDamage(SpaceDamage(point, 0, dir))

				damage = SpaceDamage(point + DIR_VECTORS[0],self.Damage, 3)
				damage.sAnimation = "explopunch1_3"
				ret:AddDamage(damage)
					
				damage = SpaceDamage(point + DIR_VECTORS[2],self.Damage, 1)
				damage.sAnimation = "explopunch1_1"
				ret:AddDamage(damage)
				
				ret:AddDelay(0.2)
					
				damage = SpaceDamage(point + DIR_VECTORS[1],self.Damage, 0)
				damage.sAnimation = "explopunch1_0"
				ret:AddDamage(damage)
					
				damage = SpaceDamage(point + DIR_VECTORS[3],self.Damage, 2)
				damage.sAnimation = "explopunch1_2"
				ret:AddDamage(damage)


				ret:AddDelay(0.2)
			end
		end
	end

	--[[
	if p1:Manhattan(p2) == 2 then
		ret:AddMove(Board:GetSimplePath(p1, p1 + DIR_VECTORS[direction]), FULL_DELAY)
		p1 = p1 + DIR_VECTORS[direction]
	end
	
	
	
	for i = DIR_START, DIR_END do
		damage = SpaceDamage(p1 + DIR_VECTORS[i],self.Damage, ((i-1)%4)*self.Push)
		--ret:AddMelee(p1,damage)
		damage.sAnimation = "explopunch1_"..((i-1)%4)
		ret:AddDamage(damage)
	end
	]]
	
	return ret
end	

-- Prime_SpinFist2_A = Prime_SpinFist2:new{
-- 		SelfDamage = 1,
-- }

-- Prime_SpinFist2_B = Prime_SpinFist2:new{	
-- 		Damage = 3, 
-- }

-- Prime_SpinFist2_AB = Prime_SpinFist2:new{
-- 		Damage = 3,
-- 		SelfDamage = 1,
-- }

