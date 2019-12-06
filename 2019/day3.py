
f = open("day3.txt", "r")
wire_1, wire_2 = map(lambda x: x.split(","), f.read().splitlines())

def run_wire(wire):
    position = [0, 0]
    visited = []
    for move in wire:
        direction, distance = str(move[0]), int(move[1:])
        for d in range(distance):
            if direction == 'R':
                position[0] += 1
            if direction == 'U':
                position[1] += 1
            if direction == 'L':
                position[0] -= 1
            if direction == 'D':
                position[1] -= 1
            visited.append(tuple(position))
    return visited

visited_1 = run_wire(wire_1)
visited_2 = run_wire(wire_2)

overlaps = set(visited_1).intersection(visited_2)
closest = min([visited_1.index(ol) + visited_2.index(ol) for ol in overlaps]) + 2

print("part two: ", closest)
