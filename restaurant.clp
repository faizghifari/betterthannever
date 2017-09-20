(defrule grade-smooke-value
	(user smooking true)
	(restaurant ?X smooke true)
	=>
	(assert (grade-restaurant ?X smooke)))

(defrule grade-nonsmooke-value
	(user smooking false|unknown)
	(restaurant ?X smooke false)
	=>
	(assert (grade-restaurant ?X smooke)))

// what is user min budget mean?
(defrule grade-budget-known
	(user minBudget ?UMin)
	(user maxBudget ?UMax)
	(restaurant ?X minBudget ?RMin)
	(restaurant ?X maxBudget ?RMax)
	(test (>= ?UMin ?RMin))
	(test (<= ?UMax ?RMax))
	=>
	(assert (grade-restaurant ?X budget)))

(defrule populate-restaurant
	?f <- (init restaurant)
	=>
	(retract ?f)
	(assert
		(restaurant A)
		(restaurant A smooke true)
		(restaurant A minBudget 1000)
		(restaurant A maxBudget 2000)
		(restaurant A dresscode casual)
		(restaurant A hasWifi true)
		(restaurant A lat -6.8922186)
		(restaurant A lng 107.5886173)

		(restaurant B)
		(restaurant B smooke false)
		(restaurant B minBudget 1200)
		(restaurant B maxBudget 2500)
		(restaurant B dresscode informal)
		(restaurant B hasWifi true)
		(restaurant B lat -6.224085)
		(restaurant B lng 106.7859815)

		(restaurant C)
		(restaurant C smooke true)
		(restaurant C minBudget 2000)
		(restaurant C maxBudget 4000)
		(restaurant C dresscode formal)
		(restaurant C hasWifi false)
		(restaurant C lat -6.2145285)
		(restaurant C lng 106.8642591)
	))

// just dummy data, use stdin to populate this
(defrule populate-user
	?f <- (init user)
	=>
	(retract ?f)
	(assert 
		(user smooking unknown)
		(user minBudget 1300)
		(user maxBudget 2250)
		(user dresscode formal)
		(user needWifi false)
		(user lat 0)
		(user lng 0)
	))

(defrule init
	?f <- (initial-fact)
	=>
	(retract ?f)
	(printout t "Initializing program" crlf)
	(assert
		(init restaurant)
		(init user)
	))