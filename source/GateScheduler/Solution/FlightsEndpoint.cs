﻿using System;
using System.Collections.Generic;
using System.Linq;
using Nancy;
using Nancy.ModelBinding;

namespace GateScheduler.Solution
{
    /// <summary>
    /// Nancy module for serving /flights endpoint.
    /// See general comments in GatesModule.
    /// </summary>
    public class FlightsModule : NancyModule
    {
        private readonly SchedulerDatabase _db;
        private readonly Scheduler _scheduler;

        public FlightsModule(SchedulerDatabase db, Scheduler scheduler)
            : base("/flights")
        {
            _db = db;
            _scheduler = scheduler;

            // Get all flights
            Get["/"] = _ => _db.Flights
                .Select(f => new
                {
                    f.Flight,
                    f.Arrives
                });

            // Add flights
            Post["/"] = parameters =>
            {
                throw new NotImplementedException("Delete this line to complete the first stage");

                // This API POSTs a list of flights at a time instead of individual flights.
                var flights = this.Bind<IEnumerable<FlightModel>>().ToList();
                _db.AddFlights(flights);
                // An example of a flight scheduling call. This currently does nothing.
                foreach (var flight in flights)
                {
                    _scheduler.ScheduleFlight(flight);
                }
                return null;
            };
        }
    }
}
