import League from 0xTOPSHOTADDRESS

// This script reads the schedule of the specified match and returns it

// Parameters:
//
// matchID: The unique ID for the match whose data needs to be read

// Returns: UInt32
// unique ID of schedule

pub fun main(matchID: UInt32): UInt32 {

    let schedule = League.getMatchSeries(matchID: matchID)
        ?? panic("Could not find the specified match")

    return schedule
}