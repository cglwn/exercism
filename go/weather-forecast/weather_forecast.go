// Package weather provides weather forecasting functionality.
package weather

var (
	// CurrentCondition holds the current weather condition.
	CurrentCondition string

	// CurrentLocation holds the location to be forecasted.
	CurrentLocation  string
)

// Forecast provides a weather forecast for a city's weather conditions.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
