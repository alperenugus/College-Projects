E = [0, 0, 0, 4, 3, 3, 8, -1, 6, 8]

def main():
    DP_max_events(E[len(E)-1], len(E))

class Coordinate:
    def __init__(self, total_events, movement):
        self.total_events = total_events
        self.movement = movement

def DP_max_events(p, t):
    # Generate the DP table (t x 2*total-number-of-events)
    table = [[Coordinate(-100e10, -100e10) for x in range(t)] for y in range(len(E)*2 + 1)]
    # Call recursive function
    num_events = DP_recursive(p, t, table)
    # Call traceback function
    events, movements = trace_back(p, t, table)
    # Print results
    print(num_events)
    print(events)
    print(movements)


def DP_recursive(p, t, table):
    p_index = p + (len(table) // 2)  # Scale position for table indexing
    t_index = t - 1  # Scale time for table indexing

    # If our entry is already in the table, just return it
    if table[p_index][t_index] is Coordinate(-100e10, -100e10):
        return table[p_index][t_index].total_events

    # BASE CASES:
    # If our position is farther away than we have time left --> invalid
    if abs(p) > t:
        table[p_index][t_index] = Coordinate(-100e10, 3)  # Add coordinate to table
        return -100e10
    if t == 0:
        # If we're at position 0 and time 0 --> valid
        if p == 0:
            table[p_index][t_index] = Coordinate(0, 2)  # Add coordinate to table
            return 0
        # If we're at time 0, but not at position 0 --> invalid
        else:
            table[p_index][t_index] = Coordinate(-100e10, 2)  # Add coordinate to table
            return -100e10

    # If telescope is viewing event at current time, then viewable is 1
    viewable = 0
    if p == E[t_index]:
        viewable = 1

    # Define three possible moves, recursively
    increase = DP_recursive(p + 1, t - 1, table)
    stay = DP_recursive(p, t - 1, table)
    decrease = DP_recursive(p - 1, t - 1, table)

    # Find maximum of those three moves
    maximum = max(increase, stay, decrease)

    # Enter maximum move into table, then return
    if maximum == increase:
        table[p_index][t_index] = Coordinate(maximum + viewable, 1)
        return maximum + viewable
    if maximum == stay:
        table[p_index][t_index] = Coordinate(maximum + viewable, 0)
        return maximum + viewable
    if maximum == decrease:
        table[p_index][t_index] = Coordinate(maximum + viewable, -1)
        return maximum + viewable


def trace_back(p, t, table):
    # initialize arrays for events and movements
    events = []
    movements = []
    # add the initial (ending) time, because we're viewing an event
    events.append(t)

    counter = 0
    # Indices
    p_index = p + (len(table) // 2)  # Scale position for table indexing
    t_index = t - 1  # Scale time for table indexing
    # Currents
    p_curr = p_index
    t_curr = t_index

    # Grab the first coordinate, and append movement
    current_coor = table[p_index][t_index]
    movements.append(current_coor.movement*-1)

    # Iterate over all times
    while counter < len(table[0]) - 1:
        # update the current position and time
        t_curr -= 1
        p_curr = p_curr + current_coor.movement

        # step backward in the table, based on the movement
        current_coor = table[p_curr][t_curr]

        # add the current movement to the list, multiplied by -1
        # because we need to know where we're going vs. where we've been
        movements.append(current_coor.movement*-1)

        # if we're viewing an event at the current time, add that
        # unscaled time to our events list
        if (p_curr - (len(table) // 2)) == E[t_curr]:
            events.append(t_curr + 1)
        counter += 1

    # reverse both lists to compensate for backwards nature of algorithm
    events.reverse()
    movements.reverse()
    return events, movements


if __name__ == "__main__":
    main()