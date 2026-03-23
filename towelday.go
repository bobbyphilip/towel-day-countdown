package main

import (
	"fmt"
	"time"
)

func main() {
	today := time.Now()
	//May 25th is international towel day
	towelDay := time.Date(today.Year(), time.May, 25, 0, 0, 0, 0, today.Location())

	if today.After(towelDay) && today.YearDay() != towelDay.YearDay() {
		towelDay = towelDay.AddDate(1, 0, 0)
	}

	if today.YearDay() == towelDay.YearDay() && today.Year() == towelDay.Year() {
		fmt.Println("Today is the day! Carry a towel—it's the most useful thing a hitchhiker can have.")
	} else {
		daysLeft := int(time.Until(towelDay).Hours() / 24)
		fmt.Printf("Towel Day is in %d days\n", daysLeft+1)
	}
}
