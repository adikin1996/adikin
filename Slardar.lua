local Slardar = {}

enemy = nil
me = nil
mana = nil


Slardar.Enable = Menu.AddOptionBool({ "Hero Specific", "Slardar" }, "Enable Combo?", false)
Slardar.Key = Menu.AddKeyOption({ "Hero Specific", "Slardar" }, "Combo Key", Enum.ButtonCode.BUTTON_CODE_NONE)
Slardar.AddGuardian Sprint = Menu.AddOptionBool({"Hero Specific", "Slardar", "Combo"}, "Guardian Sprint", false)
Slardar.AddUltimate = Menu.AddOptionBool({"Hero Specific", "Slardar", "Combo"}, "Ultimate", false)
Slardar.AddBKB = Menu.AddOptionBool({"Hero Specific", "Slardar", "Combo"}, "BKB", false)
Slardar.AddSatanic = Menu.AddOptionBool({"Hero Specific", "Slardar", "Auto Satanic"}, "Enable", false)
Slardar.AddBloodthorn = Menu.AddOptionBool({"Hero Specific", "Slardar", "Combo"}, "Bloodthorn", false)
Slardar.AddSlithereen Crush = Menu.AddOptionBool({"Hero Specific", "Slardar", "Combo"}, "Slithereen Crush", false)
Slardar.AddBlink = Menu.AddOptionBool({"Hero Specific", "Slardar", "Combo"}, "Blink Dagger", false)
Slardar.AddMOM = Menu.AddOptionBool({"Hero Specific", "Slardar", "Combo"}, "Mask Of Madn@ss", false)
Slardar.Satan = Menu.AddOptionSlider({"Hero Specific", "Slardar", "Auto Satanic"}, "hp for acrivation", 400, 2000, 1000)

function Slardar.OnUpdate()


  me = Heroes.GetLocal()
  mana = NPC.GetMana(me)
  hp = Menu.GetValue(Slardar.Satan)

    if not me or NPC.GetUnitName(me) ~= "npc_dota_hero_Slardar" then return end

    if Menu.IsKeyDown(Slardar.Key) and Menu.IsEnabled(Slardar.Enable) then Slardar.Combo(me, enemy) end

    satanic = NPC.GetItem(me, "item_satanic")
    if satanic and Entity.GetHealth(me) < hp and Menu.IsEnabled(Slardar.AddSatanic) and Ability.IsCastable(satanic, mana) and Ability.IsReady(satanic) then
              Ability.CastNoTarget(satanic)
            return
            end

end

function Slardar.Combo(me, enemy)

      enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY)
      Guardian Sprint = NPC.GetAbility(me, "Slardar_Guardian Sprint")
      Slithereen Crush = NPC.GetAbility(me, "Slardar_Slithereen Crush")
      ultimate = NPC.GetAbility(enemy, "Slardar_Corrosive Haze")
      bkb = NPC.GetItem(me, "item_black_king_bar")
      blink = NPC.GetItem(me, "item_blink")
      mom = NPC.GetItem(me, "item_mask_of_madness")
      bloodthorn = NPC.GetItem(me, "item_bloodthorn")



      if Entity.IsSameTeam(enemy,me) then return end
      if Entity.GetHealth(enemy) > 0 then




if Guardian Sprint and Menu.IsEnabled(Slardar.AddGuardian Sprint) and Ability.IsCastable(Guardian Sprint, mana) and Ability.IsReady(Guardian Sprint) then
  Ability.CastNoTarget(Guardian Sprint)
return
end

if bkb and Menu.IsEnabled(Slardar.AddBKB) and Ability.IsCastable(bkb, mana) and Ability.IsReady(bkb) then
  Ability.CastNoTarget(bkb)
 return
end

if ultimate and Menu.IsEnabled(Slardar.AddUltimate) and Ability.IsCastable(ultimate, mana) and Ability.IsReady(ultimate) then
  Ability.CastNoTarget(ultimate)
 return
end

if blink and Menu.IsEnabled(Slardar.AddBlink) and Ability.IsReady(blink) then
   Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
  return
end

if not NPC.IsLinkensProtected(enemy) and bloodthorn and Menu.IsEnabled(Slardar.AddBloodthorn) and Ability.IsReady(bloodthorn) then
   Ability.CastTarget(bloodthorn, enemy)
  return
end


over = Entity.GetHeroesInRadius(enemy, 255, Enum.TeamType.TEAM_FRIEND)


if NPC.IsLinkensProtected(enemy) then
  for _,hero in pairs(over) do
  if Slithereen Crush and Menu.IsEnabled(Slardar.AddSlithereen Crush) and Ability.IsCastable(Slithereen Crush, mana) and Ability.IsReady(Slithereen Crush) then
     Ability.CastTarget(Slithereen Crush, hero)
     return
   end
 end
end

   if not NPC.IsLinkensProtected(enemy) and Slithereen Crush and Menu.IsEnabled(Slardar.AddSlithereen Crush) and Ability.IsCastable(Slithereen Crush, mana) and Ability.IsReady(Slithereen Crush) then
   Ability.CastTarget(Slithereen Crush, enemy)
 return
end



if mom and Menu.IsEnabled(Slardar.AddMOM) and Ability.IsCastable(mom, mana) and Ability.IsReady(mom) then
   Ability.CastNoTarget(mom)
  return
end

        end

end

return Slardar
