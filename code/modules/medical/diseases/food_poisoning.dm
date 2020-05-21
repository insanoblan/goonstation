/datum/ailment/disease/food_poisoning
	name = "Food Poisoning"
	max_stages = 3
	spread = "Non-Contagious"
	cure = "Sleep"
	associated_reagent = "salmonella"
	affected_species = list("Human")
//
/datum/ailment/disease/food_poisoning/stage_act(var/mob/living/affected_mob,var/datum/ailment_data/D)
	if (..())
		return
	switch(D.stage)
		if(1)
			if(prob(5))
				boutput(affected_mob, "<span class='alert'>Your stomach feels weird.</span>")
			if(prob(5))
				boutput(affected_mob, "<span class='alert'>You feel queasy.</span>")
		if(2)
			if(affected_mob.sleeping && prob(40))
				boutput(affected_mob, "<span class='notice'>You feel better.</span>")
				affected_mob.ailments -= src
				return
			if(prob(1) && prob(10))
				boutput(affected_mob, "<span class='notice'>You feel better.</span>")
				affected_mob.ailments -= src
				return
			if(prob(10))
				affected_mob.emote("groan")
			if(prob(5))
				boutput(affected_mob, "<span class='alert'>Your stomach aches.</span>")
			if(prob(5))
				boutput(affected_mob, "<span class='alert'>You feel nauseous.</span>")
		if(3)
			if(affected_mob.sleeping && prob(25))
				boutput(affected_mob, "<span class='notice'>You feel better.</span>")
				affected_mob.ailments -= src
				return
			if(prob(1) && prob(10))
				boutput(affected_mob, "<span class='notice'>You feel better.</span>")
				affected_mob.ailments -= src
			if(prob(10))
				affected_mob.emote("moan")
			if(prob(10))
				affected_mob.emote("groan")
			if(prob(1))
				boutput(affected_mob, "<span class='alert'>Your stomach hurts.</span>")
			if(prob(1))
				boutput(affected_mob, "<span class='alert'>You feel sick.</span>")
			if(prob(5))
				if (affected_mob.nutrition > 10)
					for(var/mob/O in viewers(affected_mob, null))
						O.show_message(text("<span class='alert'>[] vomits on the floor profusely!</span>", affected_mob), 1)
					affected_mob.vomit(rand(3,5))
				else
					boutput(affected_mob, "<span class='alert'>Your stomach lurches painfully!</span>")
					for(var/mob/O in viewers(affected_mob, null))
						O.show_message(text("<span class='alert'>[] gags and retches!</span>", affected_mob), 1)
					affected_mob.changeStatus("stunned", 2 SECONDS)
					affected_mob.changeStatus("weakened", 2 SECONDS)
