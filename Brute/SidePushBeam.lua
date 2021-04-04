
function narD_PullBeam:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	local dir = GetDirection(p2 - p1)
	
	local targets = {}
	local curr = p1 + DIR_VECTORS[dir]
	while Board:GetTerrain(curr) ~= TERRAIN_MOUNTAIN and not Board:IsBuilding(curr) and Board:IsValid(curr) do
		targets[#targets+1] = curr
		curr = curr + DIR_VECTORS[dir]
	end
	targets[#targets+1] = curr 
	
	local dam = SpaceDamage(curr, 0) -- for effect 
		
	local temp_dmg = self.MinDamage	
	--local min_dmg = self.MinDamage

	local acid_Bonus = Board:GetPawn(p1):IsAcid()

	if acid_Bonus then 
		temp_dmg = self.Damage 
		
		ret:AddProjectile(dam,"effects/laser_acid")
	else
		ret:AddProjectile(dam,"effects/m_laser_acid") -- "effects/laser_acid"
				
	end
	
	-- if self.BackACID then
	-- 	local backDamage = SpaceDamage(p1 - DIR_VECTORS[dir] , 0)
	-- 	backDamage.iAcid = 1
	-- 	ret:AddDamage(backDamage) 
	-- end
	
	local curr = targets[1]
	local damage 
	local flag = false
	local check_damage = temp_dmg 

		for i = 1, #targets do
			curr = targets[i]
			damage = SpaceDamage(curr, 0 ) --, (dir-2)%4)
			
			local dir1 = (dir-1)%4 
			local push1 = SpaceDamage(curr  + DIR_VECTORS[dir1] , 0 , dir1) ; 
			push1.sAnimation = "airpush_"..dir1
			local dir2 = (dir+1)%4 
			local push2 = SpaceDamage(curr  + DIR_VECTORS[dir2] , 0 , dir2) ; 
			push2.sAnimation = "airpush_"..dir2
			--damage.iDamage = temp_dmg
			
			if Board:IsPawnSpace(curr) then
				ret:AddDelay(0.1)
				
		--		damage.iAcid = self.ACID
			end

			-- if not self.FriendlyDamage and Board:IsPawnTeam(curr,TEAM_PLAYER) then
			-- 	damage.iDamage = 0 
			-- end
			
			--damage.iAcid = self.ACID
			ret:AddDamage(damage)
			ret:AddDamage(push1)
			ret:AddDamage(push2) 

			-- temp_dmg = temp_dmg - 1 
			-- if temp_dmg < min_dmg then temp_dmg = min_dmg end
		end
