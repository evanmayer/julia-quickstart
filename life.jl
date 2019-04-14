module Life

import Random

w = 37;
h = 37;
steps = 10
# Set up the board: one board for current state, one for next state
# Begin the game by populating the array cells with random bits.
status = Random.bitrand(Random.MersenneTwister(45565), w, h); 
nexts = falses(w, h); # Space-efficient Julia BitArray: of 0 or 1

# Mask the boundaries with "dead" cells
for ic=1:w, ir=1:h
    if ( 1==ic || w==ic || 1==ir || h==ir)
        status[ir, ic] = false
    end
end

# NB: In Julia, try to loop through arrays in a manner that takes advantage
# of how arrays are stored in memory (inner loops should loop over rows): 
# https://en.wikibooks.org/wiki/Introducing_Julia/Controlling_the_flow#Optimizing_nested_loops
for t=0:steps
    # Show state
    print("t = ", t, '\n')
    display(Int8.(status))
    print('\n')

    # Only update cells that are not on the border of the region for now
    # This avoids out of bounds errors
    for ic=2:w-1, ir=2:h-1
        # Neighborhood population:
        # ------------------------
        # 0 1 1
        # 0 X 1 ==> pop @ X is 4
        # 0 1 0
        # ------------------------
        pop = status[ir-1, ic-1] + status[ir-1, ic] + status[ir-1, ic+1]
            + status[ir, ic-1] + status[ir, ic+1]
            + status[ir+1, ic-1] + status[ir+1, ic] + status[ir+1, ic+1]
        # Rules:
        cell = status[ir, ic]
        # 1. If a cell is alive, and has 1 neighbor, or > 4 neighbors, it dies.
        if ( (cell) && (pop != 2) && (pop != 3) )
            nexts[ir, ic] = false
        # 2. If a cell is dead, and has 3 neighbors, it becomes alive.
        elseif ( !cell && (pop == 3) )
            nexts[ir, ic] = true
        # 3. Otherwise, no change.
        else
            nexts[ir, ic] = cell
        end
    end
    # Update the system state all at once
    for ic=1:w-1, ir=1:h-1
        status[ir, ic] = nexts[ir, ic]
    end

end

end