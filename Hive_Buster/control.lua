require "defines"
require "util"


local loaded
QC_Check = false

-------------------------------------------------------------------

script.on_event({defines.events.on_built_entity,}, function(event) On_Built(event) end)
script.on_event({defines.events.on_robot_built_entity,}, function(event) On_Built(event) end)

--script.on_event({defines.events.on_preplayer_mined_item,}, function(event) On_Remove(event) end)
--script.on_event({defines.events.on_robot_pre_mined,}, function(event) On_Remove(event) end)
--script.on_event({defines.events.on_entity_died,}, function(event) On_Death(event) end)

--------------------------------------------------------------------
script.on_load(function()
	if not loaded then
		loaded = true
		if global.HiveBusterTable ~= nil then
			script.on_event(defines.events.on_tick, ticker)
		end
	end
end)


script.on_init(function()
	loaded = true
	
	if global.HiveBusterTable ~= nil then
		script.on_event(defines.events.on_tick, ticker)
	end
end)
---------------------------------------------------------------------
function On_Built(event)
	local NewHiveBuster
	local NewHiveBusterI
	local NewHiveBusterR
	local entity = event.created_entity
	
	
	if entity.name == "Hive_Buster_Area" then

		local surface = entity.surface
		local force = entity.force
		local position = entity.position
	
		NewHiveBuster  = surface.create_entity({name = "Hive_Buster", position = position, direction = event.created_entity.direction, force = force})
		NewHiveBusterI = surface.create_entity({name = "Hive_Buster".."i", position = position, direction = event.created_entity.direction, force = force})
		NewHiveBusterR = surface.create_entity({name = "Hive_Buster".."r", position = position, direction = event.created_entity.direction, force = force})
		
		--NewHiveBuster.health = event.created_entity.health
		NewHiveBusterI.health = event.created_entity.health
		--NewHiveBusterR.health = event.created_entity.health
		
		event.created_entity.destroy()
		
		NewHiveBuster.destructible = false
		NewHiveBuster.operable = false
		NewHiveBuster.minable = false
		
		NewHiveBusterI.operable = true
		NewHiveBusterI.minable = true
		
		NewHiveBusterR.operable = false
		NewHiveBusterR.destructible = false
		NewHiveBusterR.minable = false
		
		
		
		if global.HiveBusterTable == nil then
			global.HiveBusterTable = {}
			script.on_event(defines.events.on_tick, ticker)
		end

		table.insert(global.HiveBusterTable, {NewHiveBuster,NewHiveBusterI,NewHiveBusterR,0})

		
	end
end

----------------------------------------------------------------
--[[
function On_Remove(event)
    local entity = event.entity
	if entity.name == "Hive_Buster" or entity.name == "Hive_Busteri" or entity.name == "Hive_Busterr" then  
		for ix, vx in ipairs(global.HiveBusterTable) do
			if vx[1].valid == false or vx[2].valid == false or vx[3].valid == false then
                
					vx[3].destroy()
					vx[2].destroy()
					vx[1].destroy()
                
				table.remove(global.HiveBusterTable, ix)
				if #global.HiveBusterTable == 0 then
					global.HiveBusterTable = nil
				end
            end
		end	
	end
end


function On_Remove(event)
    local entity = event.entity
	if entity.name == "Hive_Buster" or entity.name == "Hive_Busteri" or entity.name == "Hive_Busterr" then  
		for ix, vx in ipairs(global.HiveBusterTable) do
			if vx[1].valid == false or vx[2].valid == false or vx[3].valid == false then
                if vx[1].valid then
					vx[1].destroy()
                end
				if vx[2].valid then
					vx[2].destroy()
                end
				if vx[3].valid then
					vx[3].destroy()
                end
				table.remove(global.HiveBusterTable, ix)
				if #global.HiveBusterTable == 0 then
					global.HiveBusterTable = nil
				end
            end
		end	
	end
end


function On_Death(event)
    local entity = event.entity
	if entity.name == "Hive_Buster" or entity.name == "Hive_Busteri" or entity.name == "Hive_Busterr" then  
		for ix, vx in ipairs(global.HiveBusterTable) do
			if vx[1].valid == false or vx[2].valid == false or vx[3].valid == false then
                if vx[1].valid then
					vx[1].destroy()
                end
				if vx[2].valid then
					vx[2].destroy()
                end
				if vx[3].valid then
					vx[3].destroy()
                end
				table.remove(global.HiveBusterTable, ix)
				if #global.HiveBusterTable == 0 then
					global.HiveBusterTable = nil
				end
            end
		end	
	end
end

]]

function ticker()
	if global.HiveBusterTable ~= nil then
		if global.HiveBusterCounter == 0 or global.HiveBusterCounter == nil then
			global.HiveBusterCounter = 60		
			for ix, vx in pairs(global.HiveBusterTable) do
				if vx[1].valid and vx[2].valid and vx[3].valid then
				vx[4]=vx[4]-1
					if vx[4] <=0 then
						HiveBuster_Check(vx)
					end
				else
				if vx[1].valid then
					vx[1].destroy()
				end
				if vx[2].valid then
					vx[2].destroy()
				end	
				if vx[3].valid then
					vx[3].destroy()
				end	
				end
				
			end		
		else
			global.HiveBusterCounter = global.HiveBusterCounter - 1
		end
	else
		script.on_event(defines.events.on_tick, nil)
	end
end



function HiveBuster_Check(HiveBusterList)
	
	local HiveBuster=HiveBusterList[1]
	local HiveBusteri=HiveBusterList[2]
	local inventory = HiveBusteri.get_inventory(1)
	local inventoryContent = inventory.get_contents()
	local AmmoType
	local ammo = 0
	local spawner
	local target
	local delay

	
	if inventoryContent ~= nil then
		for n,a in pairs(inventoryContent) do
			AmmoType=n
			ammo=a
		end
	end
	
	if ammo > 0 and HiveBusterList[3].energy > 0 then	

			spawner = HiveBuster.surface.find_entities_filtered({area = {{x = HiveBuster.position.x - 75, y = HiveBuster.position.y - 75}, {x = HiveBuster.position.x + 75, y = HiveBuster.position.y + 75}}, type = "unit-spawner", force= "enemy"})
			writeDebug("The Number of Spawners are: " .. #spawner)
			--Find Spawner Target
			if #spawner > 0 and target == nil then
				for _,enemy in pairs(spawner) do
					local distance = math.sqrt(((HiveBuster.position.x - enemy.position.x)^2) +((HiveBuster.position.y - enemy.position.y)^2) )
					writeDebug("The Distance is: " .. distance)
					if (distance > 10) and (distance < 76) then
					
						if target == nil then
							target={enemy}
						end
					end
				end
			end


		--Fire at Spawner
		if target ~= nil then

			HiveBuster.surface.create_entity({name=AmmoType, position = {x = HiveBuster.position.x - 0.5, y = HiveBuster.position.y - 4.5}, force = HiveBuster.force, target = target[1], speed= 0.1})
			HiveBuster.surface.pollute(HiveBuster.position,100) -- The firing of the Hive Buster will causes Pollution
			HiveBuster.surface.set_multi_command{command = {type=defines.command.attack, target=HiveBuster, distraction=defines.distraction.by_enemy},unit_count = math.floor(100 * game.evolution_factor), unit_search_distance = 500}
			--event.created_entity.surface.set_multi_command{command = {type=defines.command.attack, target=event.created_entity, distraction=defines.distraction.by_enemy},unit_count = math.floor(100 * game.evolution_factor), unit_search_distance = 500}
			--Reduce Ammo
			ammo = ammo-1
			inventory.clear()
			if ammo > 0 then
				inventory.insert({name = AmmoType, count = ammo})
			end
			
			--Delay between shots
			if AmmoType == "Hive_Buster_Basic_Ammo" then 
				delay = 10
			elseif AmmoType == "Hive_Buster_Poison_Ammo" then 
				delay = 15
			else 
			delay = 20
			end
			
			HiveBusterList[4]=delay
			
		end
	end
end

---------------------------------------------------------------------


--- DeBug Messages 
function writeDebug(message)
	if QC_Check then 
	--if NEConfig.QCCode then 
		for i, player in ipairs(game.players) do
			player.print(tostring(message))
		end
	end
end






